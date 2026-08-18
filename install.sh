# Exit immediately if a command exits with a non-zero status
set -e

echo "Stowing..."
stow .
echo "Done."

# Give people a chance to retry running the installation
trap 'echo "installation failed! You can retry"' ERR

yay -S --needed gum

echo "Install Lib"
yay -S cmake libgccjit

echo "Install apps"
yay -S ghostty kitty steam gamescope zig vim discord slack-desktop gimp beeper-v5-bin k9s cobang dropbox deezer

echo "Install latex"
yay -S extra/texlive-latex extra/texlive-latexextra extra/texlive-plaingeneric texlive-langfrench

echo "Install packages"
yay -S hyprland waybar rofi-wayland dolphin xdg-desktop-portal-hyprland xdg-desktop-portal-wlr wtype \
    hyprpaper hyprpicker hyprlock hypridle hyprcursor hyprshot waypaper cliphist grim slurp tesseract swappy satty gowall cava uwsm \
    brightnessctl wget unzip rsync figlet git power-profile-daemon \
    pulsemixer ripgrep eza bat btop fd tldr delta dust calcurse tree-sitter imagemagick pavucontrol wiremix bluetui \
    zsh zsh-syntax-highlighting zsh-history-substring-search zsh-autosuggestions \
    zls localsend-bin impala playerctl wl-clipboard \
    mise zoxide starship vicinae \
    libmupdf enchant libgccjit # emacs necessary lib

gum confirm 'Would you like to install lsp servers ?' && yay -S typescript-language-server

gum confirm 'Do you use Intel?' && yay -S v4l2loopback-dkms intel-ipu6-dkms intel-npu-driver
gum confirm 'Would you like to install dictionnaries?' && yay -S hunspell-fr hunspell-en_us
gum confirm 'Would you like to install kanata?' && ./install-kanata.sh
gum confirm "Would you like to install fonts" && echo "Install fonts" && yay -S ttc-iosevka ttc-iosevka-etoile ttf-iosevka-nerd

echo "Intall ruby"
yay -S ruby
gem install --user erb irb ruby-lsp

gum confirm "Have you fingerprint reader?" && ./install-fprint.sh

gum confirm "Install docker?" && ./install-docker.sh

echo "Done."

exit 0
