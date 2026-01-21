# wlanpi-shell-config

Opinionated shell configuration for WLAN Pi devices.

## Overview

Provides opinionated and optimized vim, tmux, and bash configurations designed for network professionals. Includes enhanced tmux vim setup, and useful sysadmin aliases.

## Features

- **Enhanced tmux**
  - 102,400 line scrollback buffer
  - Vi copy mode with clipboard integration
  - Vim-style navigation and resize mode

- **Improved vim**
  - Space as leader key
  - Advanced split/buffer/tab management
  - Persistent undo
  - Optimized for network config files

- **Bash enhancements**
  - 10,000 line history with timestamps
  - Modern aliases
  - Raspberry Pi specific aliases
  - System monitoring shortcuts
  - fzf integration (if installed)

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

Configurations are installed to `/etc/skel/` and automatically copied to `/home/wlanpi/` if they don't exist. Existing user configurations are never overwritten.

To manually adopt new configurations:

```bash
cp /etc/skel/.vimrc ~/
cp /etc/skel/.tmux.conf ~/
cp /etc/skel/.bash_aliases ~/
mkdir -p ~/.bashrc.d
cp /etc/skel/.bashrc.d/wlanpi-shell ~/.bashrc.d/
```

## Quick reference

See `man wlanpi-shell` for complete documentation.

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

- **Required:** vim, tmux, bash-completion
- **Recommended:** fzf (fuzzy finder), xclip (clipboard support)

## Files

- `/etc/skel/.vimrc`
- `/etc/skel/.tmux.conf`
- `/etc/skel/.bash_aliases`
- `/etc/skel/.bashrc.d/wlanpi-shell`

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

## Contributing

Contributions welcome! Please submit pull requests to the main branch.

## License

BSD-3-Clause - See LICENSE file for details.

## Support

- Documentation: `man wlanpi-shell`
- Issues: https://github.com/WLAN-Pi/wlanpi-shell-config/issues
