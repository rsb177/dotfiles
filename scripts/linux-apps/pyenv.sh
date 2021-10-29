# clone/install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# Install python build deps
sudo apt-get update; sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# Install latest version of python
LATEST_PYTHON=$(pyenv install -l | grep -v "[a-z]" | tail -n 1)

pyenv install $LATEST_PYTHON
pyenv global $LATEST_PYTHON
pip install -r ~/dotfiles/python/requirements.txt
