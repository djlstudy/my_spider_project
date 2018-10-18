import sys
import os
import shutil
from os.path import join, isfile
from shutil import copytree
from shutil import copystat
from shutil import copy2
# from shutil import OSError
import errno

def mycopytree(src, dst, symlinks=False, ignore=None):
    names = os.listdir(src)
    if ignore is not None:
        ignored_names = ignore(src, names)
    else:
        ignored_names = set()
 
      
    if(not os.path.exists(dst)):
        os.makedirs(dst)
    errors = []
    for name in names:
        if name in ignored_names:
            continue
        srcname = os.path.join(src, name)
        dstname = os.path.join(dst, name)
        try:
            if symlinks and os.path.islink(srcname):
                linkto = os.readlink(srcname)
                os.symlink(linkto, dstname)
            elif os.path.isdir(srcname) and not os.path.exists(dstname):
                copytree(srcname, dstname, symlinks, ignore)
            elif os.path.isdir(srcname) and os.path.exists(dstname):
                mycopytree(srcname, dstname, symlinks, ignore)
            else:
                # Will raise a SpecialFileError for unsupported file types
                copy2(srcname, dstname)
        except shutil.Error, err:
            errors.extend(err.args[0])
        except EnvironmentError, why:
            errors.append((srcname, dstname, str(why)))
    try:
        if(not os.path.exists(dst)):
            copystat(src, dst)
    except OSError, why:
        if shutil.WindowsError is not None and isinstance(why, WindowsError):
            # Copying file access times may fail on Windows
            pass
        else:
            errors.append((src, dst, str(why)))
    if errors:
        raise Error, errors


