# Neovim is COOKING 🔥🔥🔥

This repo is a minimalistic yet capable configuration for Neovim.

> If you are updating from an earlier version of this config,
> reinstall `treesitter` in case it gives an error! Type `:Lazy`, press <kbd>x</kbd>
> on `nvim-treesitter` to remove it, and then press <kbd>I</kbd> to install it again.

## Who is it for?

If you program in **C++** or **Python**, you are going to enjoy the advanced debugging
support provided by this configuration. Especially if you do competitive programming.

However, this configuration provides LSP support for **many languages**.

## How to install

1. Install one of these fonts: https://www.nerdfonts.com/font-downloads. That
   is, put the font files into a new subdirectory of
`/usr/share/fonts/truetype/` and run `fc-cache`.
2. Install `ripgrep`, `xclip`, `tar`, `curl`, `python3-venv`, and `unzip`.
3. Install `tree-sitter-cli` of version 0.26.1 or later. If you use Ubuntu or
   another distro where this package is outdated, install it with `crates`:
```bash
# Install Rust - skip next 2 lines if already installed
wget --timeout=5 https://sh.rustup.rs -O rustup.sh  # get the rust installer
sh rustup.sh  # install Rust
cargo install tree-sitter-cli
```
4. Change directory into `~/.config/nvim`. Clear the directory if it contains files or subdirectories.
5. Clone this repo: `git clone https://github.com/Error10556/nvim-config.git . --depth=1`
6. Optionally, install language servers, formatters, linters, or debug adapters:
open up `nvim`, type `:Mason`, and pick what you like. For a smooth experience, use
    - `clangd` for C/C++ (installed by default)
    - `debugpy` for Python debugging (but installed as a system-wide package `python3-debugpy`)
    - `codelldb` for C/C++ debugging
    - `lua-language-server` for Lua
    - `basedpyright` for Python (installed by default)
    - `gopls` for Golang

## How to use

The configuration makes several remaps (custom bindings) and creates a few user commands.

### General

- <kbd>Ctrl</kbd> + <kbd>E</kbd>: open Neovim's default file explorer, `netrw`.
- <kbd>Space</kbd>, <kbd>S</kbd>: replace all occurrences of the word under the caret.
- <kbd>Space</kbd>, <kbd>O</kbd>: when used on an empty line, insert two empty lines (one above, one below) and start editing the middle one.
- <kbd>Space</kbd>, <kbd>[</kbd>: insert a pair of square brackets and start editing an empty line between them.
- <kbd>Space</kbd>, <kbd>{</kbd> (which is <kbd>Space</kbd>, <kbd>Shift</kbd> + <kbd>[</kbd>):
insert a pair of curly braces and start editing an empty line between them.
- <kbd>Space</kbd>, <kbd>Space</kbd>, <kbd>[</kbd>: insert a pair of square brackets **with a space before the left
bracket** and start editing an empty line between them.
- <kbd>Space</kbd>, <kbd>Space</kbd>, <kbd>{</kbd> (which is <kbd>Space</kbd>, <kbd>Space</kbd>, <kbd>Shift</kbd> + <kbd>[</kbd>):
insert a pair of curly braces **with a space before the left brace** and start editing an empty line between them.
- <kbd>Space</kbd>, <kbd>A</kbd>: copy all the text in the file into the clipboard.
- (In visual mode) <kbd>Shift</kbd> + <kbd>J</kbd>: move the selected lines down.
- (In visual mode) <kbd>Shift</kbd> + <kbd>K</kbd>: move the selected lines up.
- (In visual mode) <kbd>Space</kbd>, <kbd>D</kbd>: delete the selected text without copying it into the default buffer.
- `:Theme`: quickly switch between light and dark themes.

### Language Server Settings
- <kbd>Shift</kbd> + <kbd>K</kbd>: see information about the object under the caret.
- <kbd>G</kbd>, <kbd>D</kbd>: go to the definition.
- <kbd>G</kbd>, <kbd>Shift</kbd> + <kbd>D</kbd>: go to the declaration.
- <kbd>G</kbd>, <kbd>I</kbd>: go to the implementation.
- <kbd>G</kbd>, <kbd>O</kbd>: go to the type definition.
- <kbd>G</kbd>, <kbd>R</kbd>: see all references.
- <kbd>G</kbd>, <kbd>S</kbd>: get help on the function signature.
- <kbd>G</kbd>, <kbd>L</kbd>: see the diagnostic messages (errors, warnings, hints, and information) on this line.
- <kbd>F2</kbd>: rename the object under the caret.
- <kbd>F4</kbd>: choose one of the suggested code actions (e.g. to resolve an error).
- <kbd>[</kbd>, <kbd>d</kbd>: go to the previous problematic line.
- <kbd>]</kbd>, <kbd>d</kbd>: go to the next problematic line.
- <kbd>Space</kbd>, <kbd>=</kbd>: format the file using the LSP.
- `:Clangfmt`: add a `.clang-format` file to the current working directory that
contains Microsoft-style C++ formatting settings.
- <kbd>Ctrl</kbd> + <kbd>Space</kbd>: bring up the autocompletion menu if it is not already open.

**In the autocompletion menu:**
- <kbd>↑</kbd>: select the previous option.
- <kbd>↓</kbd>: select the next option.
- <kbd>Ctrl</kbd> + <kbd>U</kbd>: scroll the documentation upwards.
- <kbd>Ctrl</kbd> + <kbd>D</kbd>: scroll the documentation downwards.
- <kbd>Tab</kbd> or <kbd>Enter</kbd>: select the current option. If no option is selected,
<kbd>Tab</kbd> selects the first one, and <kbd>Enter</kbd> inserts a newline.

**After selecting a snippet:**
- <kbd>Ctrl</kbd> + <kbd>L</kbd>: edit the next placeholder.
- <kbd>Ctrl</kbd> + <kbd>K</kbd>: edit the previous placeholder.

### Running simple non-interactive programs
- <kbd>Space</kbd>, <kbd>Z</kbd>: execute `./run-current-program.sh "(your file)"`
in Neovim's terminal

My quick-and-dirty `run-current-program.sh` for Haskell:
```bash
#!/bin/env bash
set -e
if [ ! -f prog ] || [ "$(date --reference=prog +%s)" -lt "$(date --reference="$1" +%s)" ]; then
    ghc -o prog "$1"
fi
echo
./prog
```
For C++ you could have:
```bash
#!/bin/env bash
set -e
if [ ! -f prog ] || [ "$(date --reference=prog +%s)" -lt "$(date --reference="$1" +%s)" ]; then
    g++ "$1" -o prog
fi
echo
./prog
```
For Python:
```bash
#!/bin/env bash
echo
python "$1"
```

### Debugging
- <kbd>Space</kbd>, <kbd>D</kbd>: open or close the debugging interface.
- <kbd>Space</kbd>, <kbd>T</kbd>: open or close the task log (possible tasks
are `Build`, `Build with a different compiler`, `Clean`, etc.).
- <kbd>Space</kbd>, <kbd>R</kbd>: run a task (possible tasks
are `Build`, `Build with a different compiler`, `Clean`, etc.).
- <kbd>F5</kbd>: compile and launch the program.
- <kbd>F9</kbd>: add or remove a breakpoint.
- <kbd>Shift</kbd> + <kbd>F9</kbd>: add a conditional breakpoint.
- `:Codeforces`: add a `.vscode` settings directory to the current working directory
with debugger settings convenient to use with competitive programming problems.

**When a program is running:**
- <kbd>F1</kbd>: see the value of a variable under the caret.
- <kbd>F5</kbd>: resume running.
- <kbd>F6</kbd>: run the program to the cursor.
- <kbd>F7</kbd>: terminate the program execution.
- <kbd>F10</kbd>: step over (execute the current line and move to the next one).
- <kbd>F11</kbd>: step into (descend into the function called on this line).
- <kbd>F12</kbd>: step out (run the program until the current function returns).
- <kbd>Space</kbd>, <kbd>P</kbd>, <kbd>S</kbd>: see all variables in all scopes.

### Searching
- <kbd>Space</kbd>, <kbd>F</kbd>, <kbd>F</kbd>: search file names.
- <kbd>Space</kbd>, <kbd>F</kbd>, <kbd>G</kbd>: search file names in the Git repository, if it is initialized.
- `:RG`: search file contents.

### Custom colorscheme
Do not like `melange`? Want to add custom keybindings? Write your own options
to `~/.config/nvim/lua/conf/custom.lua`. This file will be loaded last. If it
does not exist, the `melange` colorscheme gets applied.

Example of `custom.lua`:

```
vim.cmd[[colorscheme koehler]]
```

## Credits

- [ThePrimeagen](https://www.youtube.com/@ThePrimeagen) for the video [0 to
LSP](https://youtu.be/w7i4amO_zaE);
- [IgorLFS](https://github.com/igorlfs) for [an awesome
article](https://igorlfs.github.io/neovim-cpp-dbg) that explains setting up a
debugger;
- [VonHeikemen](https://github.com/VonHeikemen) for [another amazing
article](https://dev.to/vonheikemen/neovim-lsp-setup-nvim-lspconfig-nvim-cmp-4k8e)
that explains LSP server integration.
