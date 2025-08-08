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

    // 1. Convert ![](<path>) and ![](path) to <img src="encoded_path">
    content = content.replace(/!\[\]\(\s*(<)?([\w\d\/\(\)\.\s]*)(>)?\s*\)/gi, (match, open, p1, close) => {
        let pathToEncode = p1.trim();
        let encodedPath = encodePath(pathToEncode);
        if (encodedPath !== pathToEncode || open || close) {
            totalImageTagsFixed++;
            logLines.push(`[image tag] Before: ${match}\n            After: <img src="${pathToEncode}">`);
            //logLines.push(`[image tag] Before: ${match}\n            After: ![](<${encodedPath}>)`);
            fileChanged = true;
        }
        return `<img src="${pathToEncode}">`;
        //return `![](<${encodedPath}>)`;
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
    //content = content.replace(/<figure[^>]*>/gi, match => {
    //    totalFigureTagsStripped++;
    //    logLines.push(`[figure open tag] Removed: ${match}`);
    //    fileChanged = true;
    //    return '';
    //});
    //content = content.replace(/<\/figure>/gi, match => {
    //    totalFigureTagsStripped++;
    //    logLines.push(`[figure close tag] Removed: ${match}`);
    //    fileChanged = true;
    //    return '';
    //});

    // 4. Remove <div ...> and </div> tags, keep content
    //content = content.replace(/<div[^>]*>/gi, match => {
    //    totalDivTagsStripped++;
    //    logLines.push(`[div open tag] Removed: ${match}`);
    //    fileChanged = true;
    //    return '';
    //});
    //content = content.replace(/<\/div>/gi, match => {
    //    totalDivTagsStripped++;
    //    logLines.push(`[div close tag] Removed: ${match}`);
    //    fileChanged = true;
    //    return '';
    //});

    // 4. Strip attributes from <div ...> tags, keep <div> and </div>
    content = content.replace(/<div[^>]*>/gi, match => {
        totalDivTagsStripped++;
        logLines.push(`[div open tag] Stripped attributes: ${match} -> <div>`);
        fileChanged = true;
        return '<div>';
    });
    content = content.replace(/<\/div>/gi, match => {
        logLines.push(`[div close tag] Kept: ${match}`);
        return '</div>';
    });

    // 5. Remove <figcaption ...>...</figcaption> including content
    //content = content.replace(/<figcaption[^>]*>[\s\S]*?<\/figcaption>/gi, match => {
    //    totalFigcaptionBlocksRemoved++;
    //    logLines.push(`[figcaption block] Removed: ${match.replace(/\n/g, ' ')}`);
    //    fileChanged = true;
    //    return '';
    //});

    // 6. Remove trailing backslashes from list items
    content = content.split('\n').map((line, idx) => {
        const listRegex = /^(\s*(?:.*)\s.*?)(\\+)\s*$/gi;
        if (listRegex.test(line)) {
            const before = line;
            line = line.replace(/(\\+)\s*$/, '');
            totalBackslashesRemoved++;
            logLines.push(`[list backslash] Line ${idx + 1} Before: ${before}\n                   After:  ${line}`);
            fileChanged = true;
        }
        return line;
    }).join('\n');

    // 7. Inline <img> and <div> tags in lists (remove leading/trailing newlines and whitespace)
    // Inline <img> tags after list text
    content = content.replace(
        /(^\s*([-*+]|\d+\.)[^\n\S]*[^\n]*?)(\n+\s*<img\b[^>]*>\s*\n+)/gm,
        (match, listPrefix, bullet, imgBlock) => {
            const imgTag = imgBlock.replace(/^\s*|\s*$/g, '');
            return `${listPrefix} ${imgTag}\n`;
        }
    );
    // Inline <div> tags after list text
    content = content.replace(
        /(^\s*([-*+]|\d+\.)[^\n\S]*[^\n]*?)(\n+\s*<div>\s*\n*)/gm,
        (match, listPrefix, bullet, divBlock) => {
            return `${listPrefix} <div>`;
        }
    );
    // Inline <figure> tags after list text
    content = content.replace(
        /(^\s*([-*+]|\d+\.)[^\n\S]*[^\n]*?)(\n+\s*<figure>\s*\n*)/gm,
        (match, listPrefix, bullet, figureBlock) => {
            return `${listPrefix} <figure>`;
        }
    );
    
    // Remove newlines just after <div> and just before </div>
    content = content.replace(/<div>\s+/g, '<div>');
    content = content.replace(/\s+<\/div>/g, '</div>');

    // Remove newlines and spaces before <div> and after </div> globally (not just in lists)
    content = content.replace(/[\r\n]+\s*<div>/g, ' <div>');
    content = content.replace(/<\/div>\s*[\r\n]+/g, '</div> ');

    // Remove newlines just after <figure> and just before </figure>
    content = content.replace(/<figure>\s+/g, '<figure>');
    content = content.replace(/\s+<\/figure>/g, '</figure>');

    // Remove newlines and spaces before <figure> and after </figure> globally (not just in lists)
    content = content.replace(/[\r\n]+\s*<figure>/g, ' <figure>');
    content = content.replace(/<\/figure>\s*[\r\n]+/g, '</figure> ');

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
