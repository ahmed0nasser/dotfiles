if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Enable Vi mode
fish_vi_key_bindings
# Cursor shapes for Vi modes
set -g fish_cursor_insert    line     # Insert mode → line cursor (like Neovim)
set -g fish_cursor_default   block    # Normal mode → block cursor
set -g fish_cursor_visual    block    # Visual → block
set -g fish_cursor_replace   underscore
set -g fish_cursor_unknown   block

# Aliasses
alias sudo='sudo '
alias vim='nvim '
alias pn=pnpm
# prayer-times Alexandria, Egypt
alias salah='prayer-times --latitude 31.200092 --longitude 29.918739 --method Egyptian '


# pnpm
set -gx PNPM_HOME "/home/ahmed/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
