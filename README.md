Python 3.7 Decompiler Docker Image
==================================

This repo contains specific versions of [pycdc](https://github.com/zrax/pycdc/tree/2e76e56420493bfc0807da06a87dfdda5217a5aa)
and [unpyc3](https://github.com/andrew-tavera/unpyc37/blob/d7dc609e8c63086dc58fc749835f7aed2482543f/unpyc3.py).

On docker build, [uncompyle6](https://pypi.org/project/uncompyle6/) and
[decompyle3](https://pypi.org/project/decompyle3/) will also be installed from pip.

The entrypoint is a shell command that will decompile command line arguments
to output 3 files:

* <file>.pycdc.py
* <file>.unpyc3.py
* <file>.decompyle3.py

We install uncompyle6 in case it is needed, but decompyle3 should be a strictly
superior choice, so it is not included in the output.

Building
--------

`docker build . -t python3-decompile`

Usage
-----

This is intended to be used from the command line. Example:

`docker run --rm -v $(pwd):/work python37-decompile *.pyc`

The entrypoint is a shell script that will run all three decompilers on the
passed in arguments
