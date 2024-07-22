#!/usr/bin/env python

import os
import subprocess

packageList = [
  ([
    'boost-asio[core,ssl]',
    'boost-locale[core,icu]',
    'boost-mpi[core]',
    'boost-odeint[core,mpi]',
    'boost-regex[core,icu]',
    'boost[core,mpi]',
    'icu[core,tools]',
    'mp3lame',
    'mpi',
    'sqlite3[core,json1,tool,zlib]',
    'sqlitecpp',
    'strtk'
  ], False),
]

def InstallPackagesWorker(packages, triplet, recurse):
  args = []
  args.append("./vcpkg")
  args.append("install")
  args.extend(packages)
  args.append("--triplet")
  args.append(triplet)
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

def InstallPackages(packages, recurse):
  print()
  print("################################################################################")
  print("Installing packages: %s" % packages)
  print("################################################################################")
  print()
  ret = InstallPackagesWorker(packages, "x64-linux", recurse)
  print()
  return ret

def InstallPackagesInPackageList():
  for package in packageList:
    ret = InstallPackages(package[0], package[1])
    if ret == False:
      return False
  return True

InstallPackagesInPackageList()
