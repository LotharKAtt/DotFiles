# tmux cheatsheet

## General Key Bindings

| **Key Combination**       | **Action**                                                 |
|----------------------------|-----------------------------------------------------------|
| `Ctrl-a`                  | Send prefix key (new prefix)                               |
| `Ctrl-a -`                | Rename the current window                                  |
| `Ctrl-a c`                | Create a new window                                        |
| `Ctrl-a <number>`         | Switch to window `<number>`                                |
| `Ctrl-a r`                | Reload tmux configuration (`~/.tmux.conf`)                 |
| `Ctrl-a \|`                | Split window vertically                                    |
| `Ctrl-a -`                | Split window horizontally                                  |
| `Ctrl-a n`                | Move to the next window                                    |
| `Ctrl-a p`                | Move to the previous window                                |
| `Ctrl-a t`                | Display a clock in the current window                     |

## Pane Management Key Bindings

| **Key Combination**       | **Action**                                                 |
|----------------------------|-----------------------------------------------------------|
| `j`                       | Resize pane down by 5                                      |
| `k`                       | Resize pane up by 5                                        |
| `l`                       | Resize pane right by 5                                     |
| `h`                       | Resize pane left by 5                                      |
| `m`                       | Toggle zoom for the active pane                            |

## Copy Mode Key Bindings

| **Key Combination**       | **Action**                                                 |
|----------------------------|-----------------------------------------------------------|
| `Ctrl-a [`                | Enter copy mode                                            |
| `v` (in copy mode)        | Start text selection (vi-style)                            |
| `y` (in copy mode)        | Copy selected text (vi-style)                              |
| `k`                       | Scroll up one line                                         |
| `j`                       | Scroll down one line                                       |
| `Shift-k`                 | Scroll up faster                                           |
| `Shift-j`                 | Scroll down faster                                         |
| `Ctrl-u`                  | Scroll up half a page                                      |
| `Ctrl-d`                  | Scroll down half a page                                    |
| `Ctrl-b`                  | Scroll up a full page                                      |
| `Ctrl-f`                  | Scroll down a full page                                    |

## Plugins

| **Plugin**                                      | **Description**                                          |
|------------------------------------------------|---------------------------------------------------------|
| `tmux-plugins/tpm`                             | TMUX Plugin Manager                                      |
| `christoomey/vim-tmux-navigator`               | Navigate between tmux panes and vim splits seamlessly   |
| `tmux-plugins/tmux-resurrect`                  | Persist tmux sessions after a restart                   |
| `tmux-plugins/tmux-continuum`                  | Automatically save sessions every 15 minutes            |

## Notes
- To install plugins, run the TPM command: `Ctrl-a I`
