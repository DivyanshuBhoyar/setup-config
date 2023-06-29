install_nala() {
  echo "Installing nala package manager..."
  sudo apt update
  sudo apt install nala
  echo ""
  echo "Nala installation complete."
}


install_packages() {
  echo "Installing packages from 'pkglist.txt'..."

  while IFS= read -r package || [[ -n "$package" ]]; do
    sudo nala install "$package" -y  < /dev/null
  done < pkglist.txt
  
  echo "Package installation complete."
}


install_starship_with_fish_shell() {
if [ ! -f ~/.config/fish/config.fish ]; then
    mkdir -p ~/.config/fish && touch ~/.config/fish/config.fish
fi

    curl -fsSL https://starship.rs/install.sh | bash
    echo "starship init fish | source" >> ~/.config/fish/config.fish
    starship preset bracketed-segments > ~/.config/starship.toml
}


function remove_libreoffice_install_onlyoffice() {
    sudo apt-get remove --purge 'libreoffice*'
    sudo apt-get clean
    sudo apt-get autoremove
}


install_extras() {
  echo "Installing Ubuntu restricted extras..."
  sudo nala install -y ubuntu-restricted-extras
  
  echo "Installing Microsoft TrueType fonts..."
  sudo nala install -y ttf-mscorefonts-installer
  sudo dpkg -i ttf-mscorefonts-installer_3.8_all.deb
  
  echo "Installing GNOME Tweaks..."
  sudo nala install -y gnome-tweaks
  
  echo "Installation complete."
}

copy_fonts() {
    cp -a ./fonts/. ~/.fonts/
}

copy_config() {
    cp -a ./config/. ~/.config/
}


# remove_libreoffice_install_onlyoffice
# install_starship_with_fish_shell
# install_nala
# install_packages
# copy_fonts
# copy_config