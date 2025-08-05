const fs = require('fs');
const glob = require('glob');

// Find all .md files (recursively, excluding node_modules)
glob.sync('**/*.md', { ignore: 'node_modules/**' }).forEach(file => {
  let content = fs.readFileSync(file, 'utf-8');

  // Fix image tags: ![](<path>) -> ![](path)
  content = content.replace(/!\[\]\(<([^>]+)>\)/g, '![]($1)');

  // Aggressively remove <figure>...</figure> blocks
  content = content.replace(/<figure[\s\S]*?<\/figure>/gi, '');
  // Remove <figcaption>...</figcaption>
  content = content.replace(/<figcaption[\s\S]*?<\/figcaption>/gi, '');
  // Remove <div ...>...</div>
  content = content.replace(/<div[\s\S]*?<\/div>/gi, '');

  fs.writeFileSync(file, content, 'utf-8');
});
