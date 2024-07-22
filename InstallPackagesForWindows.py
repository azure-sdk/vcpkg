#!/usr/bin/env python

import inspect
import os
import subprocess
import sys

x64OnlyPackageList = [
  'crashpad', 'eathread', 'folly[bzip2,zlib,zstd]', 'foonathan-lexy', 'qt[default-features]', 'qtspeech', 'qwt', 'yasm-tool', 'yasm-tool-helper'
]

x86OnlyPackageList = [
]

packageList = [
  ([
    'boost-asio[core,ssl]',
    'boost-locale[core,icu]',
    'boost-mpi[core,python3]',
    'boost-odeint[core,mpi]',
    'boost-regex[core,icu]',
    'boost[core,mpi]',
    'icu[core,tools]',
    'imgui[core,win32-binding]',
    'mp3lame',
    'mpi',
    'ms-gsl',
    'openal-soft',
    'portaudio',
    'python3',
    'sdl2-gfx',
    'sdl2-image[core,libjpeg-turbo,libwebp,tiff]',
    'sdl2-mixer[core,mpg123]',
    'sdl2-net',
    'sdl2-ttf',
    'sdl2',
    'sdl2pp',
    'sqlite3[core,json1,tool,zlib]',
    'sqlitecpp',
    'strtk',
    'tiff[core,cxx,jpeg,lzma,tools,zip]',
    'wil',
    'wtl',
    'wxwidgets[core,example,fonts,media,sound,webview]'
  ], False)
]

def GetScriptFile() -> str:
  """Obtains the full path and file name of the Python script."""
  if (hasattr(GetScriptFile, "file")):
    return GetScriptFile.file
  ret: str = ""
  try:
    # The easy way. Just use __file__.
    # Unfortunately, __file__ is not available when cx_freeze is used or in IDLE.
    ret = os.path.realpath(__file__)
  except NameError:
    # The hard way.
    if (len(sys.argv) > 0 and len(sys.argv[0]) > 0 and os.path.isabs(sys.argv[0])):
      ret = os.path.realpath(sys.argv[0])
    else:
      ret = os.path.realpath(inspect.getfile(GetScriptFile))
      if (not os.path.exists(ret)):
        # If cx_freeze is used the value of the ret variable at this point is in
        # the following format: {PathToExeFile}\{NameOfPythonSourceFile}. This
        # makes it necessary to strip off the file name to get the correct path.
        ret = os.path.dirname(ret)
  GetScriptFile.file: str = ret
  return GetScriptFile.file

def GetScriptDirectory() -> str:
  """Obtains the path to the directory containing the script."""
  if (hasattr(GetScriptDirectory, "dir")):
    return GetScriptDirectory.dir
  module_path: str = GetScriptFile()
  GetScriptDirectory.dir: str = os.path.dirname(module_path)
  return GetScriptDirectory.dir

def common_member(a, b):
  a_set = set(a)
  b_set = set(b)
  if len(a_set.intersection(b_set)) > 0:
    return(True)
  return(False)

def InstallPackagesWorker(packages, triplet, recurse):
  args = []
  args.append("vcpkg")
  args.append("install")
  args.extend(packages)
  args.append("--triplet")
  args.append(triplet)
  args.append("--x-buildtrees-root=%s/bt" % GetScriptDirectory())
  if (recurse):
    args.append("--recurse")
  try:
    separator = ' '
    print("Calling '%s'." % separator.join(args))
    subprocess.check_call(args)
    return True
  except subprocess.CalledProcessError:
    return False
  except OSError:
    return False

def InstallPackages(packages, recurse):
  print()
  print("################################################################################")
  print("Installing packages: %s" % packages)
  print("################################################################################")
  print()
  if (not common_member(x86OnlyPackageList, packages)):
    print("+++++++++++++++++")
    print("++ x64-windows ++")
    print("+++++++++++++++++")
    print()
    ret = InstallPackagesWorker(packages, "x64-windows", recurse)
    if (not ret):
      return False
    if (common_member(x64OnlyPackageList, packages)):
      return ret
  print()
  print("+++++++++++++++++")
  print("++ x86-windows ++")
  print("+++++++++++++++++")
  print()
  ret = InstallPackagesWorker(packages, "x86-windows", recurse)
  print()
  return ret

def InstallPackagesInPackageList():
  for package in packageList:
    ret = InstallPackages(package[0], package[1])
    if ret == False:
      return False
  return True

InstallPackagesInPackageList()
