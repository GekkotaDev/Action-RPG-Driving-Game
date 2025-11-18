# Sierra Verde Developer Documentation

For documentation on the code itself, refer to the source files. No tool that I'm aware of exists yet for converting GDScript documentation comments to either JSON or Markdown.

## File System Layout

This tree serves as a quick reference to how this is structured in the file system. Specific details can be found at the respective page.

```
res://
├─  .github
├─  .vscode
├─  addons
├─  assets
├─  docs
│   ├─  [page].md
│   ├─  blog
│   │   ├─  posts
│   │   ├─  .authors.yml
│   │   └─  index.md
│   │
│   ├─  images
│   ├─  javascripts
│   └─  stylesheets
│
├─  ggs
│   ├─  game_settings
│   └─  plugin_settings.tres
│
├─  globals
├─  models
│   ├─  dialog
│   └─  saves
│
├─  modules
├─  nodes
├─  resources
├─  scenes
├─  screens
├─  scripts
├─  tests
├─  tools
├─  views
├─  .editorconfig
├─  .gitignore
├─  addons.jsonc
├─  licenses.json
├─  project.godot
│   └─  export_presets.cfg
│
├─  pyproject.toml
│   └─ mkdocs.yml
├─  README.md
├─  Sierra Verde.csproj
└─  traudio_db.tres
```
