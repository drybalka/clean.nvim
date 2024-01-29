# clean.nvim

Plugin for cleaning up the default key mappings and plugins in Neovim leaving only the bare essentials.

It provides only 2 functions: 
- `clean_plugins()`: disables most nonessential builtin Neovim providers and plugins, such as, netrw, zipPlugin, matchit, etc. (see the full list in the code)
- `clean_keymap()`: maps most of Neovim builtin keymaps to `<Nop>` leaving (subjectively) only essential functionality:
    - any text typed in insert/cmdline modes
    - char movements `hjkl`, as well as word movements `webWEB`
    - line movements `^$`, as well as top `gg` and bottom `G` movements
    - visual mode enter `vV<C-v>`, as well as Ex command mode `:`
    - insert mode enter `aioAIO`
    - buffer search `/` with next/previous jumps `nN`
    - yank `yY` (together with line yank `yy`) and paste `pP`
    - char deletions `xX`, text deletions `dD` (together with line delete `dd`)
    - text changes `cC` (together with line change `cc`), as well as char replace `r` and text replace `R`
    - undo `u` and redo `<C-r>`, as well as next/previous jumplist movements `<C-o><C-i>`

### Motivation

Neovim is a powerful text editor with a lot of functionality - the index consists of several hundred of commands.
This plugin narrows it down to a few dozen most used commands, which may be beneficial for the following reasons:
- avoids unpredictable results after accidental clicks, like `q:` instead of `:q`
- avoids accidental clashes for keymaps defined only in certain filetypes/buffers
- allows you to have a dedicated keymap file in dotfiles containing the self-picked functionality, which provides a better overview
- makes you think about how you use the editor, choose keymaps that are natural for you
- some builtin functionality is simply too specific and should probably be extracted into a plugin in the future (Rot13 encoding? Hebrew language support?)
- disables builtin plugins that you don't use and saves on startup time and completion clutter
- some people simply prefer a bottom-up approach


### Installation

Load 'clean.nvim' as any other Neovim plugin using your favourite package manager.

The plugin provides only 2 functions, which can called together towards the start of your init file (in order not to overwrite any previous keymaps or global options):
```
require('clean').clean_keymap()
require('clean').clean_plugins()
```

In order to re-enable a command either delete the keymap or map it to something else (including itself) explicitly:
```
vim.keymap.del('', 'f')
vim.keymap.set('', 't', 't')
```
Note, that re-enabling multi-key commands may require re-enabling their prefixes as well, i.e., to use `zz` you should have:
```
vim.keymap.del('n', 'z')
vim.keymap.del('n', 'zz')
```

In order to re-enable a plugin simply reset the corresponding variable to `nil` afterwards, for example,
```
vim.g.editorconfig = nil
```
