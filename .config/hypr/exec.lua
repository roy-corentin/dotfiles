hl.exec_cmd("swaync")
hl.exec_cmd("uwsm app -- discord --enable-features=UseOzonePlatform --ozone-platform=wayland")
hl.exec_cmd("uwsm app -- slack --enable-features=UseOzonePlatform --ozone-platform=wayland")
hl.exec_cmd("uwsm app -- zen-browser")

hl.exec_cmd("uwsm app -- elephant")
hl.exec_cmd("uwsm app -- walker --gapplication-service")
