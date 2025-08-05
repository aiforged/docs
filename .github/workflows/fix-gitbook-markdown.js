const fs = require('fs');
const path = require('path');
const glob = require('glob');

let totalFilesProcessed = 0;
let totalImageTagsFixed = 0;
let totalFigureTagsStripped = 0;
let totalDivTagsStripped = 0;
let totalFigcaptionBlocksRemoved = 0;
let totalBackslashesRemoved = 0;
let totalFilesChanged = 0;

glob.sync('**/*.md', { ignore: '**/node_modules/**' }).forEach(file => {
    totalFilesProcessed++;
    let content = fs.readFileSync(file, 'utf8');
    let originalContent = content;
    let fileChanged = false;
    let logLines = [];

    // 1. Fix image tags: ![](<path>) -> ![](path)
    content = content.replace(/!\[\]\(<([^>]+)>\)/g, (match, p1) => {
        totalImageTagsFixed++;
        logLines.push(`[image tag] Before: ${match}\n            After: ![](${p1})`);
        fileChanged = true;
        return `![](${p1})`;
    });

    // 2. Remove <figure ...> and </figure> tags, keep content
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

    // 3. Remove <div ...> and </div> tags, keep content
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

    // 4. Remove <figcaption ...>...</figcaption> including content
    content = content.replace(/<figcaption[^>]*>[\s\S]*?<\/figcaption>/gi, match => {
        totalFigcaptionBlocksRemoved++;
        logLines.push(`[figcaption block] Removed: ${match.replace(/\n/g, ' ')}`);
        fileChanged = true;
        return '';
    });

    // 5. Remove trailing backslashes from list items
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
console.log(`  Image tags fixed:               ${totalImageTagsFixed}`);
console.log(`  <figure> tags stripped:         ${totalFigureTagsStripped}`);
console.log(`  <div> tags stripped:            ${totalDivTagsStripped}`);
console.log(`  <figcaption> blocks removed:    ${totalFigcaptionBlocksRemoved}`);
console.log(`  List backslashes fixed:         ${totalBackslashesRemoved}`);
console.log('[fix-gitbook-markdown] --------------------------\n');
