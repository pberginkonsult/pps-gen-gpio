#!/bin/bash

if [ "x$SDKTARGETSYSROOT" = "x" ]; then
    echo "*******************************************************************************"
    echo "Could not find kernel sources."
    echo "Have you sourced the script environment-setup-armv7ahf-neon-poky-linux-gnueabi?"
    echo "*******************************************************************************"
    exit -1
fi

KERNEL_SRC=$SDKTARGETSYSROOT/usr/src/kernel CONFIG_PPS_DEBUG=y CONFIG_PPS_GENERATOR_GPIO=m make modules
