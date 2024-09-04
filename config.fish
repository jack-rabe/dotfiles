if status is-interactive
    set fish_cursor_insert line
    fish_vi_key_bindings --no-erase default
    # This binds "jk" to switch to normal mode in vi-mode.
    # If you kept it like that, every time you press "j",
    # fish would wait for a "k" or other key to disambiguate
    bind -M insert -m default jj cancel repaint-mode
    # After setting this, fish only waits 200ms for the "k",
    # or decides to treat the "j" as a separate sequence, inserting it.
    set -g fish_sequence_key_delay_ms 200

    fish_add_path /opt/homebrew/bin
    fish_add_path $HOME/.rbenv/bin
    fish_add_path $HOME/.cargo/bin
    fish_add_path $HOME/.local/bin
    fish_add_path $HOME/.config/emacs/bin
    fish_add_path $HOME/go/bin/
    # add $GOPATH or root?
    # fish_add_path /usr/local/go/bin/go

    eval "$(rbenv init -)"

    set -Ux EDITOR nvim

    # fzf keybindings
    fzf_configure_bindings --processes=\co  --directory=\cp --git_log=\cu

end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# haskell
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /Users/jrabe/.ghcup/bin $PATH # ghcup-env

# ocaml
source $HOME/.opam/opam-init/init.fish

# starship init fish | source
