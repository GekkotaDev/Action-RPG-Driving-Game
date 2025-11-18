```
res://
├─  .github
├─  .vscode
├─  addons
├─  assets
├─  data
│   ├─  dialog
│   └─  saves
│
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
└─  pyproject.toml
    └─ mkdocs.yml
```

- `.github` stores data used by Github's services — notably, Github Actions used to automate any unit + integration tests written for this game, and to automate creating release + debug builds.
- `.vscode` sets up VSCode specific configuration
- `addons` is the designated directory where Godot scans for any add-ons either bespokely developed for this game or as third party libraries.
- `assets` are for in-game objects, not just for data such as images and audio.
- `data` acts as the game's internal database; Godot resources are used for native integration with the engine rather than to use a SQLite database which adds an additional dependency and is not native to the engine itself.
- `docs`; documentation, powered by MkDocs Material.
  - `blog` is a special directory designated by MkDocs Material where blog posts are written in.
    - `posts`; blog posts.
    - `.authors.yml` is a special file containing metadata for blog authors.
    - `index.md` maps to the blog index page.
- `ggs` is the default directory designated to storing settings by [Godot Game Settings].
- `globals` is a project convention for [autoload]ed code that otherwise does not fit in any of the other directories specified.
- `modules` contain just code; not everything needs to be a [node] which is where using mere reference counted classes can be a simpler and lighter option.
- `nodes` are where custom nodes are defined; these are the building blocks of things that exist within the game, and are what `assets` are built upon.
- `resources` are data ranging from mere files (e.g: 3D models, images, audio) to custom resources all the way to audio buses and themes.
- `scenes` here are the "levels" so to speak. For Game Maker Studio users, this is what had been assigned the convention of rooms.
- `screens` contain fullscreen user interfaces.
- `scripts` are for external scripts, think shell and Python scripts.
- `tests`; unit and integration testing.
- `tools` contain [`EditorScript`]s.
- `views` are for UI components.
- `.editorconfig` is a standard set by Microsoft to hint IDEs on text formatting settings.
- `mkdocs.yml` configures the documentation site.
