# install rust
if ! command -v rustup &>/dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
else
    echo "rustup already installed, skipping"
fi

type -p gcc &>/dev/null || sudo apt install -y gcc
type -p cmake &>/dev/null || sudo apt install -y cmake

cargo_install() {
    if ! cargo install --list | grep -q "^$1 "; then
        cargo install "$1"
    else
        echo "Already installed: $1"
    fi
}

cargo_install exa
cargo_install zoxide
cargo_install tealdeer
cargo_install bottom
cargo_install fd-find
cargo_install lsd
cargo_install stylua
cargo_install bob-nvim
