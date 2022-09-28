# 安装必要的依赖
echo "Update"
# sudo pacman -Syu --noconfirm
echo "Install rcssserver requirements"
sudo pacman -S --noconfirm --needed base-devel
sudo pacman -S --noconfirm --needed git
sudo pacman -S --noconfirm --needed python
# base-devel will install:
# 1) autoconf  2) automake  3) binutils  4) bison  5) fakeroot  6) file  7) findutils  8) flex  9) gawk  10) gcc  11) gettext  12) grep  13) groff
# 14) gzip  15) libtool  16) m4  17) make  18) pacman  19) patch  20) pkgconf  21) sed  22) sudo  23) texinfo  24) which
sudo pacman -S --noconfirm --needed boost
echo "Install rcssmonitor requirements"
sudo pacman -S --noconfirm --needed qt5-base
sudo pacman -S --noconfirm --needed fontconfig
sudo pacman -S --noconfirm --needed libxt
sudo pacman -S --noconfirm --needed glib2
sudo pacman -S --noconfirm --needed libxi
sudo pacman -S --noconfirm --needed libxrender
echo "Install autotest requirements" # optional
sudo pacman -S --noconfirm --needed python
sudo pacman -S --noconfirm --needed net-tools
sudo pacman -S --noconfirm --needed gnuplot
