if status is-interactive
    fish_vi_key_bindings

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

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /Users/jrabe/.ghcup/bin $PATH # ghcup-env