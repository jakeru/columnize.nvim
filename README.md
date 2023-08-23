# columnize.nvim

Format selected lines of text into columns of equal width.

I wrote this plugin in order to keep my
[Kmonad](https://github.com/kmonad/kmonad) configuration in shape. Time will
tell if there are any other use cases for it. At least I now have written my
first plugin for Neovim :tada:.

## Installation and configuration

### lazy.nvim

Add the following to the list of your plugins:

```lua
    {
        'jakeru/columnize.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        config = true,
    }
```

If you also want to be able to invoke this tool by pressing a few keys, add
something like this to your configuration:

```lua
vim.keymap.set("v", "<Leader>c", require('columnize').columnize,
    { desc = "Columnize selected lines" })
```

## Usage

Select the lines you want to columnize and run the command `Columnize`. You can
also invoke this tool by assigning it a key combination, as explained earlier.
