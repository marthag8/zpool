[![Build Status](https://secure.travis-ci.org/marthag8/zpool.png)](http://travis-ci.org/marthag8/zpool)

Description
===========

Lightweight resource and provider to manage Solaris zpools. 

Currently, just creates or destroys simple zpools.


Requirements
============

Solaris, zpool.

Attributes
==========

- name - Name of the zpool.
- action - Create or destroy.
- ashift - Set sector size, support by the OS is not verified.
- disks - Array of disks to put in the pool.
- force - Force the use of vdevs, even if they appear to be in use.
- info -  Shellout information about the zpool.
- mountpoint - Mountpoint for the top-level file system, absolute path or 'none'.
- recursive - Add a -r to the command.
- state - Shellout information about the zpool.

Usage
=====

    zpool "test" do
      disks [ "c0t2d0s0", "c0t3d0s0" ]
    end
  
  
    zpool "test2" do
      action :destroy
    end
  
