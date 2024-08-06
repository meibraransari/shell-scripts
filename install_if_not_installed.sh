  # Function to add dependency if missing
  install_if_missing() {
    if ! command -v "$1" >/dev/null; then
      sudo apt-get -y install $1
    else
      echo_task "$1 is already installed"
    fi
  }

  # Check and add dependencies
  install_if_missing zsh
  install_if_missing git
  install_if_missing wget
  install_if_missing curl
