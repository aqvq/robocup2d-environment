# 安装必要的依赖
echo "Update"
sudo apt-get update -y
echo "Install rcssserver requirements"
sudo apt-get install -y build-essential git python3 automake autoconf libtool flex bison libboost-all-dev
echo "Install rcssmonitor requirements"
sudo apt-get install -y build-essential qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools libfontconfig1-dev libaudio-dev libxt-dev libglib2.0-dev libxi-dev libxrender-dev
echo "Install autotest requirements" # optional
sudo apt-get install -y python3 net-tools
sudo apt-get install -y gnuplot-nox
sudo apt-get install -y gnuplot-qt
sudo apt-get install -y gnuplot-x11
