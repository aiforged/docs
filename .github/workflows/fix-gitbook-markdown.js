const fs = require('fs');
const path = require('path');
const glob = require('glob');

let totalFiles = 0;
let totalImageTags = 0;
let totalFigureBlocks = 0;
let totalFigcaptionBlocks = 0;
let totalDivBlocks = 0;
let totalBackslashes = 0;
let totalFilesChanged = 0;

glob.sync('**/*.md', { ignore: 'node_modules/**' }).forEach(file => {
  totalFiles++;
  let content = fs.readFileSync(file, 'utf-8');
  let originalContent = content;
  let fileChanged = false;
  let logLines = [];
  let imageTagCount = 0, figureCount = 0, figcaptionCount = 0, divCount = 0, backslashCount = 0;

  // Fix image tags: ![](<path>) -> ![](path)
  content = content.replace(/!\[\]\(<([^>]+)>\)/g, (match, p1) => {
    imageTagCount++;
    logLines.push(`  [image tag] Before: ${match}\n               After: ![](${p1})`);
    return `![](${p1})`;
  });

  // Aggressively remove <figure>...</figure> blocks
  content = content.replace(/<figure[\s\S]*?<\/figure>/gi, match => {
    figureCount++;
    logLines.push(`  [figure block] Removed: ${match.replace(/\n/g, ' ')}`);
    return '';
  });
  // Remove <figcaption>...</figcaption>
  content = content.replace(/<figcaption[\s\S]*?<\/figcaption>/gi, match => {
    figcaptionCount++;
    logLines.push(`  [figcaption block] Removed: ${match.replace(/\n/g, ' ')}`);
    return '';
  });
  // Remove <div ...>...</div>
  content = content.replace(/<div[\s\S]*?<\/div>/gi, match => {
    divCount++;
    logLines.push(`  [div block] Removed: ${match.replace(/\n/g, ' ')}`);
    return '';
  });

  // Remove trailing backslashes from list items
  content = content.split('\n').map(line => {
    let changed = false;
    // Ordered (e.g., 1. ...), unordered (-, *, +)
    if (/^(\s*(?:-|\*|\+|\d+\.)\s.*)\\$/.test(line)) {
      let newLine = line.replace(/\\$/, '');
      backslashCount++;
      logLines.push(`  [list backslash] Before: ${line}\n                      After: ${newLine}`);
      changed = true;
      return newLine;
    }
    return line;
  }).join('\n');

  // Track overall stats
  totalImageTags += imageTagCount;
  totalFigureBlocks += figureCount;
  totalFigcaptionBlocks += figcaptionCount;
  totalDivBlocks += divCount;
  totalBackslashes += backslashCount;

  if (content !== originalContent) {
    totalFilesChanged++;
    fs.writeFileSync(file, content, 'utf-8');
    console.log(`\n[fix-gitbook-markdown] Processed file: ${file}`);
    if (logLines.length) {
      logLines.forEach(log => console.log(log));
    } else {
      console.log('  No changes needed.');
    }
  }
});

// Print summary
console.log('\n[fix-gitbook-markdown] ---- SUMMARY ----');
console.log(`  Files processed:        ${totalFiles}`);
console.log(`  Files changed:          ${totalFilesChanged}`);
console.log(`  Image tags fixed:       ${totalImageTags}`);
console.log(`  <figure> blocks removed:${totalFigureBlocks}`);
console.log(`  <figcaption> removed:   ${totalFigcaptionBlocks}`);
console.log(`  <div> blocks removed:   ${totalDivBlocks}`);
console.log(`  List backslashes fixed: ${totalBackslashes}`);
console.log('[fix-gitbook-markdown] ------------------\n');
