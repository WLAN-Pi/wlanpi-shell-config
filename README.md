# wlanpi-shell-config

Opinionated shell configuration for WLAN Pi devices.

## Overview

This package provides optimized vim, tmux, and bash configurations.

## Features

- **tmux changes**
  - 25,000 line scrollback buffer
  - Vi copy mode with clipboard integration
  - Vim-style navigation and resize mode

- **vim changes**
  - Space as leader key
  - Advanced split/buffer/tab management
  - Persistent undo
  - Optimized for network config files

- **Bash changes**
  - 10,000 line history with timestamps
  - Custom aliases
  - Raspberry Pi specific aliases
  - System monitoring shortcuts
  - fzf integration bundled

## Installation

### From PackageCloud

```bash
sudo apt update
sudo apt install wlanpi-shell-config
```

### From .deb File

```bash
sudo apt install ./wlanpi-shell-config_1.0.0_all.deb
```

### On existing systems

Configurations are installed to `/etc/skel/` and automatically copied to `/home/wlanpi/` if they don't exist.

Existing user configurations are not overwritten.

To manually adopt new configurations:

```bash
cp /etc/skel/.vimrc ~/
cp /etc/skel/.tmux.conf ~/
cp /etc/skel/.bash_aliases ~/
mkdir -p ~/.bashrc.d
cp /etc/skel/.bashrc.d/wlanpi-shell ~/.bashrc.d/
```

## Quick reference

See `man wlanpi-shell` for additional documentation.

### Vim

- **Leader key:** Space
- `Space+w` - Save
- `Space+v` - Vertical split
- `Space+wh/j/k/l` - Navigate windows

### Tmux

- **Prefix key:** Ctrl+b
- `Prefix+r` - Enter resize mode
- `Prefix+S` - Synchronize panes
- `Prefix+[` - Enter copy mode (vi keybindings)
- `Prefix+Ctrl+s` - Save session
- `Prefix+Ctrl+r` - Restore session

**Status bar:** Shows network interface, Wi-Fi info (when connected), CPU/RAM usage, and time

### Bash Aliases

- `journal` - Follow system journal
- `running` - List running services
- `ports` - List open ports (ss)
- `temps` - Show Pi temperature and voltage

## Customization

### Change default editor

To use nano instead of vim, add to `~/.bashrc`:

```bash
export EDITOR=nano
export VISUAL=nano
```

### Override configurations

User configs in `~/` take precedence over `/etc/skel/`. Edit your copies freely.

## Dependencies

- **Required:** vim, tmux, bash-completion, fzf
- **Optional:** xclip (clipboard support for tmux/vim)

**Note:** fzf shell integration (ctrl-r, ctrl-t, alt-c) is bundled with this package to ensure functionality on systems where documentation files may be stripped to save space.

## Files

- `/etc/skel/.vimrc`
- `/etc/skel/.tmux.conf`
- `/etc/skel/.bash_aliases`
- `/etc/skel/.bashrc.d/wlanpi-shell`
- `/etc/skel/.bashrc.d/fzf/key-bindings.bash`
- `/etc/skel/.bashrc.d/fzf/completion.bash`
- `/usr/lib/wlanpi-shell-config/tmux-status-network` - Network interface status
- `/usr/lib/wlanpi-shell-config/tmux-status-wifi` - Wi-Fi connection status
- `/usr/lib/wlanpi-shell-config/tmux-status-system` - CPU and RAM usage

## Tmux plugins

This project vendors the `tmux-resurrect` plugin using Git submodules to provide manual session saving and restoring. This allows users to persist their tmux environment across reboots or disconnects without relying on an internet connection. The workflow is fully manual to be deterministic and minimize SD card wear on SBCs.

The plugins are located in `install/etc/skel/.tmux/plugins/`.

### Updating plugins

To update a plugin to a newer version, you must update its submodule pointer. This ensures the build is reproducible and uses a specific, tested version of the code.

1.  Navigate to the submodule's directory:
    ```sh
    cd install/etc/skel/.tmux/plugins/<plugin-name>
    ```
    *(Replace `<plugin-name>` with `tpm` or `tmux-resurrect`)*

2.  Fetch the latest changes from the remote repository:
    ```sh
    git fetch
    ```

3.  Check out the desired version (e.g., the `master` branch or a specific tag like `v3.1.0`):
    ```sh
    git checkout master # Or git checkout v3.1.0
    ```

4.  Return to the project's root directory:
    ```sh
    cd ../../../../../..
    ```

5.  Stage the updated submodule in the parent repository. This records the new commit hash.
    ```sh
    git add install/etc/skel/.tmux/plugins/<plugin-name>
    ```

6.  Commit the change to save the updated submodule pointer.
    ```sh
    git commit -m "chore(tmux): Update <plugin-name> submodule to new version"
    ```

## Building from source

```bash
# Clone repository
git clone https://github.com/WLAN-Pi/wlanpi-shell-config.git
cd wlanpi-shell-config

# Build package
dpkg-buildpackage -us -uc -b

# Or use sbuild for clean builds
sbuild
```

## Troubleshooting

### Shell enhancements not loading in SSH sessions

**Symptom:** FZF keybindings (Ctrl-R), custom aliases, and other shell enhancements don't work when connecting via SSH.

**Cause:** Missing `~/.profile` file. SSH creates login shells, which source `~/.profile` (not `~/.bashrc` directly). Without `~/.profile`, your `~/.bashrc` and `~/.bashrc.d/` enhancements are never loaded.

**Fix:** Copy the standard `.profile` from `/etc/skel/`:

```bash
cp /etc/skel/.profile ~/
```

Then reconnect your SSH session or run: `source ~/.profile`

## Contributing

Please submit pull requests to the main branch.

## Support

- Documentation: `man wlanpi-shell`
- Issues: https://github.com/WLAN-Pi/wlanpi-shell-config/issues
