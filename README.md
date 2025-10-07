# untitled game

## TODO

- Setup CI/CD. Considering this [Docker image](https://github.com/marketplace/actions/godot-ci)
- Documentation + dev log page. Covered by [MkDocs Material](https://squidfunk.github.io/mkdocs-material/), may help with [rubber duck debugging](https://rubberduckdebugging.com)
- Constant reminders banning the use of Generative AI. More effort to deal with slop that only wastes everyone's time, just ask [Daniel Stenberg](https://youtu.be/6n2eDcRjSsk).
  - [Who?](https://xkcd.com/2347/) 
  - For the love of all things that is sane, please DO NOT use Grok explicitly. We do not need a special surprise from the self-proclaimed "MechaHitler".

## Development Environment

### Required

- [Godot 4.5 .NET](https://downloads.godotengine.org/?version=4.5&flavor=stable&slug=mono_win64.zip&platform=windows.64)
- [.NET SDK](https://dotnet.microsoft.com/en-us/download)
- [uv](https://docs.astral.sh/uv/getting-started/installation/) and [Python](https://docs.astral.sh/uv/guides/install-python/)

Note that `uv` is used to install the dependencies required by the project's own Python scripts.

#### `dotnet tool install --global`

- [GodotEnv](https://github.com/chickensoft-games/GodotEnv)

#### For VSCode

- [.NET Install Tool](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.vscode-dotnet-runtime)
- [C# Extension](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csharp)
- [EditorConfig](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)
- [godot-tools](https://marketplace.visualstudio.com/items?itemName=geequlim.godot-tools)

### Recommended

#### For VSCode

- [Better Comments](https://marketplace.visualstudio.com/items?itemName=aaron-bond.better-comments)
- [Error Lens](https://marketplace.visualstudio.com/items?itemName=usernamehw.errorlens)
- [Github Markdown Preview](https://marketplace.visualstudio.com/items?itemName=bierner.github-markdown-preview)
- [Path Intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.path-intellisense)

Don't forget you'll **NEED** to install [Git](https://rogerdudler.github.io/git-guide/). You may use tools such as [Lazygit](https://github.com/jesseduffield/lazygit) and the [Github Desktop](https://desktop.github.com/download/)/[Mobile](https://github.com/mobile) to simplify its use.
