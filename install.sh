echo "Stowing..."

stow .

echo "Done."

echo "Install Lib"
yay -S cmake libgccjit

echo "Install apps"
yay -S ghostty alacritty kitty steam gamescope zig vim discord slake-desktop teams-for-linux gimp beeper-v4-bin k9s cobang dropbox

echo "Install latex"
yay -S extra/texlive-latex extra/texlive-latexextra extra/texlive-plaingeneric

echo "Install packages"
yay -S hyprland waybar rofi-wayland dunst dolphin xdg-desktop-portal-hyprland qt5-wayland qt6-wayland \
    hyprpaper hyprlock hypridle hyprshade hyprcursor waypaper cliphist grim slurp tesseract swappy gowall cava \
    mako wget unzip rsync figlet git network-manager-applet python-pywal16 power-profile-daemon \
    ripgrep eza bat btop tldr calcurse tree-sitter imagemagick pavucontrol \
    zsh zsh-syntax-highlighting zsh-history-substring-search zsh-autosuggestions \
    postgresql-libs platformio libvips compiledb \
    emacs-lsp-booster zls \
    v4l2loopback-dkms intel-ipu6-dkms intel-npu-driver

gum confirm 'Would you like to install kanata?' && ./install-kanata.sh
gum confirm "Would you like to install fonts" && echo "Install fonts" && yay -S ttc-iosevka ttc-iosevka-etoile ttc-iosevka-term ttf-iosevka-nerd

echo "Intall ruby"
yay -S ruby
gem install --user erb irb ruby-lsp

gum confirm "Have you fingerprint reader?" && ./install-fprint.sh

gum confirm "Install docker?" && ./install-docker.sh
