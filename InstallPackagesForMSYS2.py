#!/usr/bin/env python

import os
import subprocess
import sys

packageList = [
  ([
    'wil'
  ], False),
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
    seperator = ' '
    print("Calling '%s'." % seperator.join(args))
    subprocess.check_call(args)
    return True
  except subprocess.CalledProcessError as err:
    return False
  except OSError as err:
    return False

def GetTriplet():
  system = os.environ.get('MSYSTEM', "")
  if (system == "MINGW64"):
    return "x64-mingw-dynamic"
  if (system == "MINGW32"):
    return "x86-mingw-dynamic"
  return ""

def InstallPackages(packages, recurse):
  triplet = GetTriplet()
  if (len(triplet) == 0):
    return False
  print()
  print("################################################################################")
  print("Installing packages: %s" % packages)
  print("################################################################################")
  print()
  ret = InstallPackagesWorker(packages, "x64-windows", recurse)
  return ret

def InstallPackagesInPackageList():
  for package in packageList:
    ret = InstallPackages(package[0], package[1])
    if ret == False:
      return False
  return True

InstallPackagesInPackageList()
