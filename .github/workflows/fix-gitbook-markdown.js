const fs = require('fs');
const glob = require('glob');
const path = require('path');

// Helper: encode URI path, but not the whole URL (so ../ and / remain)
function encodePath(str) {
    return str.split('/').map(encodeURIComponent).join('/');
}

let totalFilesProcessed = 0;
let totalImageTagsFixed = 0;
let totalFigureTagsStripped = 0;
let totalDivTagsStripped = 0;
let totalFigcaptionBlocksRemoved = 0;
let totalBackslashesRemoved = 0;
let totalImgSrcFixed = 0;
let totalFilesChanged = 0;

glob.sync('**/*.md', { ignore: '**/node_modules/**' }).forEach(file => {
    totalFilesProcessed++;
    let content = fs.readFileSync(file, 'utf8');
    let originalContent = content;
    let fileChanged = false;
    let logLines = [];

    // 1. Fix image tags: ![](<path>) -> ![](path), then encode path
    content = content.replace(/!\[\]\(\s*(<)?([\w\d\/\(\)\.\s]*)(>)?\s*\)/gi, (match, open, p1, close) => {
        let pathToEncode = p1.trim();
        let encodedPath = encodePath(pathToEncode);
        if (encodedPath !== pathToEncode || open || close) {
            totalImageTagsFixed++;
            logLines.push(`[image tag] Before: ${match}\n            After: ![](${encodedPath})`);
            fileChanged = true;
        }
        return `![](${encodedPath})`;
    });

    // 2. Fix raw <img src="..."> tags to encode the src attribute path
    content = content.replace(/(<img\b[^>]*\bsrc\s*=\s*)(["'])([^"']+)\2/gi, (match, pre, quote, src) => {
        let encodedSrc = encodePath(src);
        if (encodedSrc !== src) {
            totalImgSrcFixed++;
            const before = match;
            const after = `${pre}${quote}${encodedSrc}${quote}`;
            logLines.push(`[img tag] Before: ${before}\n         After:  ${after}`);
            fileChanged = true;
            return after;
        }
        return match;
    });

    // 3. Remove <figure ...> and </figure> tags, keep content
    content = content.replace(/<figure[^>]*>/gi, match => {
        totalFigureTagsStripped++;
        logLines.push(`[figure open tag] Removed: ${match}`);
        fileChanged = true;
        return '';
    });
    content = content.replace(/<\/figure>/gi, match => {
        totalFigureTagsStripped++;
        logLines.push(`[figure close tag] Removed: ${match}`);
        fileChanged = true;
        return '';
    });

    // 4. Remove <div ...> and </div> tags, keep content
    content = content.replace(/<div[^>]*>/gi, match => {
        totalDivTagsStripped++;
        logLines.push(`[div open tag] Removed: ${match}`);
        fileChanged = true;
        return '';
    });
    content = content.replace(/<\/div>/gi, match => {
        totalDivTagsStripped++;
        logLines.push(`[div close tag] Removed: ${match}`);
        fileChanged = true;
        return '';
    });

    // 5. Remove <figcaption ...>...</figcaption> including content
    content = content.replace(/<figcaption[^>]*>[\s\S]*?<\/figcaption>/gi, match => {
        totalFigcaptionBlocksRemoved++;
        logLines.push(`[figcaption block] Removed: ${match.replace(/\n/g, ' ')}`);
        fileChanged = true;
        return '';
    });

    // 6. Remove trailing backslashes from list items
    content = content.split('\n').map((line, idx) => {
        const listRegex = /^(\s*(?:-|\*|\+|\d+\.)\s.*?)(\\+)\s*$/;
        if (listRegex.test(line)) {
            const before = line;
            line = line.replace(/(\\+)\s*$/, '');
            totalBackslashesRemoved++;
            logLines.push(`[list backslash] Line ${idx + 1} Before: ${before}\n                   After:  ${line}`);
            fileChanged = true;
        }
        return line;
    }).join('\n');

    // Write file if changed and log details
    if (fileChanged) {
        totalFilesChanged++;
        fs.writeFileSync(file, content, 'utf8');
        console.log(`\n[fix-gitbook-markdown] Processed file: ${file}`);
        if (logLines.length) {
            logLines.forEach(log => console.log(log));
        }
    }
});

// Print summary
console.log('\n[fix-gitbook-markdown] ---- SUMMARY ----');
console.log(`  Files processed:                ${totalFilesProcessed}`);
console.log(`  Files changed:                  ${totalFilesChanged}`);
console.log(`  Image tags fixed/encoded:       ${totalImageTagsFixed}`);
console.log(`  <img src> paths encoded:        ${totalImgSrcFixed}`);
console.log(`  <figure> tags stripped:         ${totalFigureTagsStripped}`);
console.log(`  <div> tags stripped:            ${totalDivTagsStripped}`);
console.log(`  <figcaption> blocks removed:    ${totalFigcaptionBlocksRemoved}`);
console.log(`  List backslashes fixed:         ${totalBackslashesRemoved}`);
console.log('[fix-gitbook-markdown] --------------------------\n');
