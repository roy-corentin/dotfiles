echo "Stowing..."

stow .

echo "Done."

# Exit immediately if a command exits with a non-zero status
set -e

# Give people a chance to retry running the installation
trap 'echo "Omarchy installation failed! You can retry by running: source ~/.local/share/omarchy/install.sh"' ERR

echo "Install Lib"
yay -S cmake libgccjit

echo "Install apps"
yay -S ghostty alacritty kitty steam gamescope zig vim discord slake-desktop teams-for-linux gimp beeper-v4-bin k9s cobang dropbox

echo "Install latex"
yay -S extra/texlive-latex extra/texlive-latexextra extra/texlive-plaingeneric texlive-langfrench

echo "Install packages"
yay -S hyprland waybar rofi-wayland dunst dolphin xdg-desktop-portal-hyprland qt5-wayland qt6-wayland \
    hyprpaper hyprpicker hyprlock hypridle hyprshade hyprcursor hyprshot waypaper cliphist grim slurp tesseract swappy gowall cava \
    brightnessctl mako wget unzip rsync figlet git network-manager-applet python-pywal16 power-profile-daemon \
    pulsemixer ripgrep eza bat btop fd tldr calcurse tree-sitter imagemagick pavucontrol \
    zsh zsh-syntax-highlighting zsh-history-substring-search zsh-autosuggestions \
    postgresql-libs platformio libvips compiledb \
    emacs-lsp-booster zls \
    v4l2loopback-dkms intel-ipu6-dkms intel-npu-driver \
    localsend-bin impala

gum confirm 'Would you like to install kanata?' && ./install-kanata.sh
gum confirm "Would you like to install fonts" && echo "Install fonts" && yay -S ttc-iosevka ttc-iosevka-etoile ttc-iosevka-term ttf-iosevka-nerd

echo "Intall ruby"
yay -S ruby
gem install --user erb irb ruby-lsp

gum confirm "Have you fingerprint reader?" && ./install-fprint.sh

gum confirm "Install docker?" && ./install-docker.sh

echo "Linking binaries"
sudo ln -s ~/.config/hypr/scripts/status_bar /usr/local/bin/status_bar

echo "Done."

exit 0
