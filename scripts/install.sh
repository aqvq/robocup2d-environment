# 准备操作
rm -rf ${rcssserver} ${rcssmonitor} ${librcsc} ${soccerwindow} ${fedit}

# 编译安装环境

echo "Install ${rcssserver}"
sleep 1s
tar zxfp ${rcssserver}.tar.gz -C assets
cd ${rcssserver} && mkdir build
cd ${rcssserver}/build && cmake .. -DCMAKE_INSTALL_PREFIX=/usr/local
cd ${rcssserver}/build && make -j$(nproc)
cd ${rcssserver}/build && sudo make install

echo "Install ${rcssmonitor}"
sleep 1s
tar zxfp ${rcssmonitor}.tar.gz -C assets
cd ${rcssmonitor} && mkdir build
cd ${rcssmonitor}/build && cmake .. -DCMAKE_INSTALL_PREFIX=/usr/local
cd ${rcssmonitor}/build && make -j$(nproc)
cd ${rcssmonitor}/build && sudo make install

echo "Install ${librcsc}"
sleep 1s
tar zxfp ${librcsc}.tar.gz -C assets
cd ${librcsc} && ./bootstrap
cd ${librcsc} && ./configure
cd ${librcsc} && make -j$(nproc)
cd ${librcsc} && sudo make install

echo "Install ${soccerwindow}"
sleep 1s
tar zxfp ${soccerwindow}.tar.gz -C assets
cd ${soccerwindow} && ./bootstrap
cd ${soccerwindow} && ./configure --with-librcsc=/usr/local
cd ${soccerwindow} && make -j$(nproc)
cd ${soccerwindow} && sudo make install

echo "Install ${fedit}"
sleep 1s
tar zxfp ${fedit}.tar.gz -C assets
cd ${fedit} && ./bootstrap
cd ${fedit} && ./configure --with-librcsc=/usr/local
cd ${fedit} && make -j$(nproc)
cd ${fedit} && sudo make install

echo "ReInstall ${librcsc}"
sleep 1s
tar zxfp ${librcsc}.tar.gz -C assets
cd ${librcsc} && mkdir build
cd ${librcsc}/build && cmake .. -DCMAKE_INSTALL_PREFIX=/usr/local
cd ${librcsc}/build && make -j$(nproc)
cd ${librcsc}/build && sudo make install

# 一些配置工作
touch ${soccerwindow}.conf
echo /usr/local/lib >> ${soccerwindow}.conf
sudo mv ${soccerwindow}.conf /etc/ld.so.conf.d
sudo ldconfig
echo "Done"
