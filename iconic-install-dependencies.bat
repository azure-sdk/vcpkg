@echo off
.\vcpkg.exe install --triplet x64-windows --binarysource=clear wxwidgets[webview]
.\vcpkg.exe install --triplet x64-windows --binarysource=clear glew glfw3 eigen3 proj libgeotiff clfft boost opencl pcl liblas cuda ffmpeg[opencl,nvcodec,webp,zlib,vorbis,lzma,openh264] openimageio[gif,libraw] cryptopp libtess2
