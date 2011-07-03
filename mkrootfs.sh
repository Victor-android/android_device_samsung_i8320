#!/bin/bash

function check_variant()
{
    if [ "$ANDROID" = "" ]; then
        echo "define \$ANDROID first."
        exit 0
    fi
    
    if [ "$KERNELDIR" = "" ]; then
        echo "define \$KERNELDIR first."
        exit 0
    fi
    
    DEVICEDIR=$ANDROID/device/samsung/i8320
    OUTDIR=$DEVICEDIR/out
    mkdir -p $OUTDIR
}

function copy_modules()
{
    echo "copying kernel modules."
    
    rm -rf $ANDROID/out/target/product/i8320/system/lib/modules/
    mkdir -p $ANDROID/out/target/product/i8320/system/lib/modules/
#    find $KERNELDIR/modules -name '*.ko' -exec cp {} $ANDROID/out/target/product/i8320/system/lib/modules/  \;
#    find $ANDROID/TI_Android_SGX_SDK/gfx_rel_es3.x_android -name '*.ko' -exec cp {} $ANDROID/out/target/product/i8320/system/lib/modules/  \;
}

function create_rootfs()
{
    echo "creating rootfs."
    
    ANDROIDROOTFS=$OUTDIR/rootfs
    
    copy_modules
    
    mkdir -p $ANDROIDROOTFS
    cp -Rdpf $ANDROID/out/target/product/i8320/root/* $ANDROIDROOTFS/
    cp -Rdpf $ANDROID/out/target/product/i8320/system/* $ANDROIDROOTFS/system/
    cp -Rdpf $ANDROID/out/target/product/i8320/data/* $ANDROIDROOTFS/data/
    cp -Rdpf $ANDROID/device/samsung/i8320/system/* $ANDROIDROOTFS/system/
    cp -Rdpf $ANDROID/device/samsung/i8320/lib/* $ANDROIDROOTFS/lib/
    cp -Rdpf $ANDROID/device/samsung/i8320/*.rc $ANDROIDROOTFS/
   
    echo "done."
    #chmod 777 -R ./android/system/usr/keychars
    #chmod 777 -R ./android/system/usr/keylayout
    #chown -R root.root ./android/
    #chmod -R 777 ./android/
}

function create_img()
{
    echo "creating image."
    
    ANDROIDIMG=$OUTDIR/img

    copy_modules
    
    #patch init.rc
    mkdir -p $ANDROIDIMG
    mkcramfs $ANDROID/out/target/product/i8320/root/ $ANDROIDIMG/initrd.cramfs
    mkcramfs $ANDROID/out/target/product/i8320/system/ $ANDROIDIMG/factoryfs.cramfs
    #undo patch init.rc
    
    echo "done."
}

check_variant
create_rootfs
create_img

