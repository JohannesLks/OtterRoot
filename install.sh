LIBMNL_DIR=$PWD/libmnl_build
LIBNFTNL_DIR=$PWD/libnftnl_build

# Install libmnl
mkdir -p $LIBMNL_DIR
wget -P $LIBMNL_DIR https://netfilter.org/projects/libmnl/files/libmnl-1.0.5.tar.bz2 
tar -C $LIBMNL_DIR -xvf $LIBMNL_DIR/libmnl-1.0.5.tar.bz2
cd $LIBMNL_DIR/libmnl-1.0.5 && ./configure --enable-static
cd $LIBMNL_DIR/libmnl-1.0.5 && make -j`nproc`
cd $LIBMNL_DIR/libmnl-1.0.5 && mkdir ../install && make DESTDIR=`realpath ../install` install

# Install libnftnl
mkdir -p $LIBNFTNL_DIR
wget -P $LIBNFTNL_DIR https://netfilter.org/projects/libnftnl/files/libnftnl-1.2.1.tar.bz2
tar -C $LIBNFTNL_DIR -xvf $LIBNFTNL_DIR/libnftnl-1.2.1.tar.bz2
cd $LIBNFTNL_DIR/libnftnl-1.2.1 && PKG_CONFIG_PATH=$LIBMNL_DIR/install/usr/local/lib/pkgconfig ./configure --enable-static
cd $LIBNFTNL_DIR/libnftnl-1.2.1 && C_INCLUDE_PATH=$C_INCLUDE_PATH:$LIBMNL_DIR/install/usr/local/include LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LIBMNL_DIR/install/usr/local/lib make -j`nproc`
cd $LIBNFTNL_DIR/libnftnl-1.2.1 && mkdir ../install && make DESTDIR=`realpath ../install` install