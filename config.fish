if status is-interactive
    fish_vi_key_bindings

    fish_add_path /opt/homebrew/bin
    fish_add_path $HOME/.rbenv/bin
    fish_add_path $HOME/.cargo/bin
    fish_add_path $HOME/.local/bin
    fish_add_path $HOME/.config/emacs/bin
    # tmp add $GOPATH or root later?
    fish_add_path $HOME/go/bin/

    eval "$(rbenv init -)"

    set -Ux EDITOR lvim

    # fzf keybindings
    fzf_configure_bindings --processes=\co  --directory=\cp --git_log=\cu

end
