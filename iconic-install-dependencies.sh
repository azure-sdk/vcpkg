#!/bin/sh -e
./vcpkg install --triplet x64-linux --binarysource=clear wxwidgets[webview]
./vcpkg install --triplet x64-linux --binarysource=clear glew glfw3 eigen3 proj libgeotiff clfft boost opencl pcl liblas cuda ffmpeg[opencl,nvcodec,webp,zlib,vorbis,lzma,openh264] openimageio[gif,libraw] cryptopp libtess2 
