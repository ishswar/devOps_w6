# devOps_w6
Using shell script build Python (Jessie) 3.6 docker image , run it 

### Shell script in this repo does this :

1. pass in a command-line argument of the form repository:tag that will be used below.

2. If this command line argument is not present, exit the bash script with a usage message
create a directory named n5, cd into n5

3. download - python (Links to an external site.)Links to an external site./6 (Links to an external site.)Links to an external site./jessie (Links to an external site.)Links to an external site./Dockerfile (hint: as shown in class, use get it “Raw” from github to get the url to code into your script)

4. Build a docker image

5. Show the new docker image is on your system

6. Tag the new Docker image using repository:tag – jessie:python3.6 

7. the tag must be passed in as a command line argument to the script

8. Show that the Docker image is tagged

9. Run the Docker image from your script, non-interactively, verifying that Python 3.6 is installed  


### Demo of Error handling in step 2 

```
vagrant@DevOpsAs6:/vagrant$ ./buildDocker.sh 
No parameters were passed

In order to run this script you need to pass parameter (in format shown below)

usage: ./buildDocker.sh jessie:<tag>
 
vagrant@DevOpsAs6:/vagrant$ ./buildDocker.sh jessie
In order to run this script you need to pass parameter (in format shown below)

usage: ./buildDocker.sh jessie:<tag>
 
```
### Demo of Image building [Entire output](https://github.com/ishswar/devOps_w6/blob/master/output.txt)

```
vagrant@DevOpsAs6:/vagrant$ ./buildDocker.sh jessie:python3.6
Building image with tag jessie:python3.6
+ rm -rf n5
+ mkdir n5
+ cd n5
+ cat

"##########################################"
"Downloading Docker Build file FOR Jessie "
"##########################################"

+ wget https://raw.githubusercontent.com/docker-library/python/cf179e4a7b442b29d85f521c2b172b89ef04beef/3.6/jessie/Dockerfile
--2019-06-14 20:50:39--  https://raw.githubusercontent.com/docker-library/python/cf179e4a7b442b29d85f521c2b172b89ef04beef/3.6/jessie/Dockerfile
Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 151.101.0.133, 151.101.64.133, 151.101.128.133, ...
Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|151.101.0.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 2699 (2.6K) [text/plain]
Saving to: ‘Dockerfile’

Dockerfile                                     100%[==================================================================================================>]   2.64K  --.-KB/s    in 0.002s  

2019-06-14 20:50:40 (1.27 MB/s) - ‘Dockerfile’ saved [2699/2699]

+ cat

"############################################"
"Done downloading Docker Build file FOR Jessie "
"############################################"

+ ls -la
total 4
drwxr-xr-x 1 vagrant vagrant   96 Jun 14  2019 .
drwxr-xr-x 1 vagrant vagrant  384 Jun 14  2019 ..
-rw-r--r-- 1 vagrant vagrant 2699 Jun 14  2019 Dockerfile
+ cat

"##########################################"
"Deleting Old Docker Jessie image "
"##########################################"

+ set +x
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
buildpack-deps      jessie              1bcc87c0bd3c        5 weeks ago         616MB
hello-world         latest              fce289e99eb9        5 months ago        1.84kB

Deleting jessie docker image
Error: No such image: jessie

"##########################################"
"Building Docker image FOR Jessie "
"##########################################"

+ docker build -t jessie:python3.6 .
Sending build context to Docker daemon  4.608kB
Step 1/11 : FROM buildpack-deps:jessie
 ---> 1bcc87c0bd3c
Step 2/11 : ENV PATH /usr/local/bin:$PATH
 ---> Running in 7af2fcf47469
Removing intermediate container 7af2fcf47469
 ---> ce2a929d7d83
Step 3/11 : ENV LANG C.UTF-8
 ---> Running in 8fee73a36c4b
Removing intermediate container 8fee73a36c4b
 ---> e891165240e7
Step 4/11 : RUN apt-get update && apt-get install -y --no-install-recommends 		tcl 		tk 	&& rm -rf /var/lib/apt/lists/*
 ---> Running in 66abd8c393ee
Get:1 http://security.debian.org jessie/updates InRelease [44.9 kB]
Ign http://deb.debian.org jessie InRelease
Get:2 http://deb.debian.org jessie Release.gpg [2420 B]
Get:3 http://deb.debian.org jessie Release [148 kB]
Get:4 http://deb.debian.org jessie/main amd64 Packages [9098 kB]
Get:5 http://security.debian.org jessie/updates/main amd64 Packages [851 kB]
Fetched 10.1 MB in 43s (234 kB/s)
Reading package lists...
Reading package lists...
Building dependency tree...
Reading state information...
The following extra packages will be installed:
  libtcl8.6 libtk8.6 libxft2 libxss1 tcl8.6 tk8.6
Suggested packages:
  tcl-tclreadline
Recommended packages:
  xterm x-terminal-emulator
The following NEW packages will be installed:
  libtcl8.6 libtk8.6 libxft2 libxss1 tcl tcl8.6 tk tk8.6
0 upgraded, 8 newly installed, 0 to remove and 22 not upgraded.
Need to get 2026 kB of archives.
After this operation, 6716 kB of additional disk space will be used.
Get:1 http://deb.debian.org/debian/ jessie/main libtcl8.6 amd64 8.6.2+dfsg-2 [978 kB]
Get:2 http://deb.debian.org/debian/ jessie/main libxft2 amd64 2.3.2-1 [55.4 kB]
Get:3 http://deb.debian.org/debian/ jessie/main libxss1 amd64 1:1.2.2-1 [17.5 kB]
Get:4 http://deb.debian.org/debian/ jessie/main libtk8.6 amd64 8.6.2-1 [771 kB]
Get:5 http://deb.debian.org/debian/ jessie/main tcl8.6 amd64 8.6.2+dfsg-2 [122 kB]
Get:6 http://deb.debian.org/debian/ jessie/main tcl amd64 8.6.0+8 [5366 B]
Get:7 http://deb.debian.org/debian/ jessie/main tk8.6 amd64 8.6.2-1 [71.1 kB]
Get:8 http://deb.debian.org/debian/ jessie/main tk amd64 8.6.0+8 [5388 B]
debconf: delaying package configuration, since apt-utils is not installed
Fetched 2026 kB in 3s (635 kB/s)
Selecting previously unselected package libtcl8.6:amd64.
(Reading database ... 21694 files and directories currently installed.)
Preparing to unpack .../libtcl8.6_8.6.2+dfsg-2_amd64.deb ...
Unpacking libtcl8.6:amd64 (8.6.2+dfsg-2) ...
Selecting previously unselected package libxft2:amd64.
Preparing to unpack .../libxft2_2.3.2-1_amd64.deb ...
Unpacking libxft2:amd64 (2.3.2-1) ...
Selecting previously unselected package libxss1:amd64.
Preparing to unpack .../libxss1_1%3a1.2.2-1_amd64.deb ...
Unpacking libxss1:amd64 (1:1.2.2-1) ...
Selecting previously unselected package libtk8.6:amd64.
Preparing to unpack .../libtk8.6_8.6.2-1_amd64.deb ...
Unpacking libtk8.6:amd64 (8.6.2-1) ...
Selecting previously unselected package tcl8.6.
Preparing to unpack .../tcl8.6_8.6.2+dfsg-2_amd64.deb ...
Unpacking tcl8.6 (8.6.2+dfsg-2) ...
Selecting previously unselected package tcl.
Preparing to unpack .../archives/tcl_8.6.0+8_amd64.deb ...
Unpacking tcl (8.6.0+8) ...
Selecting previously unselected package tk8.6.
Preparing to unpack .../tk8.6_8.6.2-1_amd64.deb ...
Unpacking tk8.6 (8.6.2-1) ...
Selecting previously unselected package tk.
Preparing to unpack .../archives/tk_8.6.0+8_amd64.deb ...
Unpacking tk (8.6.0+8) ...
Setting up libtcl8.6:amd64 (8.6.2+dfsg-2) ...
Setting up libxft2:amd64 (2.3.2-1) ...
Setting up libxss1:amd64 (1:1.2.2-1) ...
Setting up libtk8.6:amd64 (8.6.2-1) ...
Setting up tcl8.6 (8.6.2+dfsg-2) ...
Setting up tcl (8.6.0+8) ...
Setting up tk8.6 (8.6.2-1) ...
Setting up tk (8.6.0+8) ...

....

....
......

.....

SNIP 

..
copying build/lib.linux-x86_64-3.6/_sha512.cpython-36m-x86_64-linux-gnu.so -> /usr/local/lib/python3.6/lib-dynload
copying build/lib.linux-x86_64-3.6/select.cpython-36m-x86_64-linux-gnu.so -> /usr/local/lib/python3.6/lib-dynload
copying build/lib.linux-x86_64-3.6/_sha1.cpython-36m-x86_64-linux-gnu.so -> /usr/local/lib/python3.6/lib-dynload
copying build/lib.linux-x86_64-3.6/_testimportmultiple.cpython-36m-x86_64-linux-gnu.so -> /usr/local/lib/python3.6/lib-dynload
copying build/lib.linux-x86_64-3.6/_curses_panel.cpython-36m-x86_64-linux-gnu.so -> /usr/local/lib/python3.6/lib-dynload
copying build/lib.linux-x86_64-3.6/array.cpython-36m-x86_64-linux-gnu.so -> /usr/local/lib/python3.6/lib-dynload
copying build/lib.linux-x86_64-3.6/_crypt.cpython-36m-x86_64-linux-gnu.so -> /usr/local/lib/python3.6/lib-dynload
copying build/lib.linux-x86_64-3.6/_codecs_cn.cpython-36m-x86_64-linux-gnu.so -> /usr/local/lib/python3.6/lib-dynload
copying build/lib.linux-x86_64-3.6/mmap.cpython-36m-x86_64-linux-gnu.so -> /usr/local/lib/python3.6/lib-dynload
copying build/lib.linux-x86_64-3.6/grp.cpython-36m-x86_64-linux-gnu.so -> /usr/local/lib/python3.6/lib-dynload
copying build/lib.linux-x86_64-3.6/syslog.cpython-36m-x86_64-linux-gnu.so -> /usr/local/lib/python3.6/lib-dynload
copying build/lib.linux-x86_64-3.6/_random.cpython-36m-x86_64-linux-gnu.so -> /usr/local/lib/python3.6/lib-dynload
copying build/lib.linux-x86_64-3.6/_socket.cpython-36m-x86_64-linux-gnu.so -> /usr/local/lib/python3.6/lib-dynload
copying build/lib.linux-x86_64-3.6/nis.cpython-36m-x86_64-linux-gnu.so -> /usr/local/lib/python3.6/lib-dynload
copying build/lib.linux-x86_64-3.6/_dbm.cpython-36m-x86_64-linux-gnu.so -> /usr/local/lib/python3.6/lib-dynload
copying build/lib.linux-x86_64-3.6/_testmultiphase.cpython-36m-x86_64-linux-gnu.so -> /usr/local/lib/python3.6/lib-dynload
copying build/lib.linux-x86_64-3.6/_ctypes_test.cpython-36m-x86_64-linux-gnu.so -> /usr/local/lib/python3.6/lib-dynload
copying build/lib.linux-x86_64-3.6/_bz2.cpython-36m-x86_64-linux-gnu.so -> /usr/local/lib/python3.6/lib-dynload
copying build/lib.linux-x86_64-3.6/_opcode.cpython-36m-x86_64-linux-gnu.so -> /usr/local/lib/python3.6/lib-dynload
changing mode of /usr/local/lib/python3.6/lib-dynload/_hashlib.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/binascii.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_codecs_iso2022.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/cmath.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/math.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_codecs_hk.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/audioop.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/spwd.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_ctypes.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_blake2.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/resource.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_sha256.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/fcntl.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_sqlite3.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/pyexpat.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_lsprof.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_lzma.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_sha3.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_posixsubprocess.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_codecs_jp.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_testbuffer.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_datetime.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_codecs_kr.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_heapq.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_pickle.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_sysconfigdata_m_linux_x86_64-linux-gnu.py to 644
changing mode of /usr/local/lib/python3.6/lib-dynload/_csv.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_decimal.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_testcapi.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_bisect.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_ssl.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/readline.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/__pycache__/_sysconfigdata_m_linux_x86_64-linux-gnu.cpython-36.opt-2.pyc to 644
changing mode of /usr/local/lib/python3.6/lib-dynload/__pycache__/_sysconfigdata_m_linux_x86_64-linux-gnu.cpython-36.pyc to 644
changing mode of /usr/local/lib/python3.6/lib-dynload/__pycache__/_sysconfigdata_m_linux_x86_64-linux-gnu.cpython-36.opt-1.pyc to 644
changing mode of /usr/local/lib/python3.6/lib-dynload/_codecs_tw.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/zlib.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_elementtree.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/termios.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_multiprocessing.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_tkinter.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/parser.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/unicodedata.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_json.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_multibytecodec.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_md5.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_asyncio.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/xxlimited.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_struct.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_curses.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_gdbm.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/ossaudiodev.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_sha512.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/select.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_sha1.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_testimportmultiple.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_curses_panel.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/array.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_crypt.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_codecs_cn.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/mmap.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/grp.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/syslog.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_random.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_socket.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/nis.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_dbm.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_testmultiphase.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_ctypes_test.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_bz2.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/_opcode.cpython-36m-x86_64-linux-gnu.so to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/ to 755
changing mode of /usr/local/lib/python3.6/lib-dynload/__pycache__ to 755
running install_scripts
copying build/scripts-3.6/2to3-3.6 -> /usr/local/bin
copying build/scripts-3.6/idle3.6 -> /usr/local/bin
copying build/scripts-3.6/pydoc3.6 -> /usr/local/bin
copying build/scripts-3.6/pyvenv-3.6 -> /usr/local/bin
changing mode of /usr/local/bin/2to3-3.6 to 755
changing mode of /usr/local/bin/idle3.6 to 755
changing mode of /usr/local/bin/pydoc3.6 to 755
changing mode of /usr/local/bin/pyvenv-3.6 to 755
rm /usr/local/lib/python3.6/lib-dynload/_sysconfigdata_m_linux_x86_64-linux-gnu.py
rm -r /usr/local/lib/python3.6/lib-dynload/__pycache__
Creating directory /usr/local/share/man/man1
/usr/bin/install -c -m 644 ./Misc/python.man \
	/usr/local/share/man/man1/python3.6.1
if test ! -d /usr/local/lib/pkgconfig; then \
	echo "Creating directory /usr/local/lib/pkgconfig"; \
	/usr/bin/install -c -d -m 755 /usr/local/lib/pkgconfig; \
fi
if test -f /usr/local/bin/python3 -o -h /usr/local/bin/python3; \
then rm -f /usr/local/bin/python3; \
else true; \
fi
(cd /usr/local/bin; ln -s python3.6 python3)
if test "3.6" != "3.6m"; then \
	rm -f /usr/local/bin/python3.6-config; \
	(cd /usr/local/bin; ln -s python3.6m-config python3.6-config); \
	rm -f /usr/local/lib/pkgconfig/python-3.6m.pc; \
	(cd /usr/local/lib/pkgconfig; ln -s python-3.6.pc python-3.6m.pc); \
fi
rm -f /usr/local/bin/python3-config
(cd /usr/local/bin; ln -s python3.6-config python3-config)
rm -f /usr/local/lib/pkgconfig/python3.pc
(cd /usr/local/lib/pkgconfig; ln -s python-3.6.pc python3.pc)
rm -f /usr/local/bin/idle3
(cd /usr/local/bin; ln -s idle3.6 idle3)
rm -f /usr/local/bin/pydoc3
(cd /usr/local/bin; ln -s pydoc3.6 pydoc3)
rm -f /usr/local/bin/2to3
(cd /usr/local/bin; ln -s 2to3-3.6 2to3)
rm -f /usr/local/bin/pyvenv
(cd /usr/local/bin; ln -s pyvenv-3.6 pyvenv)
if test "x" != "x" ; then \
	rm -f /usr/local/bin/python3-32; \
	(cd /usr/local/bin; ln -s python3.6-32 python3-32) \
fi
rm -f /usr/local/share/man/man1/python3.1
(cd /usr/local/share/man/man1; ln -s python3.6.1 python3.1)
if test "xno" != "xno"  ; then \
	case no in \
		upgrade) ensurepip="--upgrade" ;; \
		install|*) ensurepip="" ;; \
	esac; \
	LD_LIBRARY_PATH=/usr/src/python ./python -E -m ensurepip \
		$ensurepip --root=/ ; \
fi
+ ldconfig
+ apt-get purge -y --auto-remove dpkg-dev tcl-dev tk-dev
Reading package lists...
Building dependency tree...
Reading state information...
The following packages will be REMOVED:
  dpkg-dev* libdpkg-perl* libtimedate-perl* libxft-dev* libxss-dev* tcl-dev*
  tcl8.6-dev* tk-dev* tk8.6-dev* x11proto-scrnsaver-dev*
0 upgraded, 0 newly installed, 10 to remove and 0 not upgraded.
After this operation, 12.5 MB disk space will be freed.
(Reading database ... 22264 files and directories currently installed.)
Removing tk-dev:amd64 (8.6.0+8) ...
Removing tcl-dev:amd64 (8.6.0+8) ...
Removing tk8.6-dev:amd64 (8.6.2-1) ...
Removing tcl8.6-dev:amd64 (8.6.2+dfsg-2) ...
Removing dpkg-dev (1.17.27) ...
Purging configuration files for dpkg-dev (1.17.27) ...
Removing libdpkg-perl (1.17.27) ...
Removing libtimedate-perl (2.3000-2) ...
Removing libxft-dev (2.3.2-1) ...
Removing libxss-dev:amd64 (1:1.2.2-1) ...
Removing x11proto-scrnsaver-dev (1.2.2-1) ...
+ find /usr/local -depth ( ( -type d -a ( -name test -o -name tests ) ) -o ( -type f -a ( -name *.pyc -o -name *.pyo ) ) ) -exec rm -rf {} +
+ rm -rf /usr/src/python
Removing intermediate container f8b873cb9645
 ---> 2dd3a7fa532e
Step 8/11 : RUN cd /usr/local/bin 	&& ln -s idle3 idle 	&& ln -s pydoc3 pydoc 	&& ln -s python3 python 	&& ln -s python3-config python-config
 ---> Running in 4ef10b9f75d3
Removing intermediate container 4ef10b9f75d3
 ---> f63071aae3cb
Step 9/11 : ENV PYTHON_PIP_VERSION 9.0.1
 ---> Running in 6a134f12b1d1
Removing intermediate container 6a134f12b1d1
 ---> 561f83a232da
Step 10/11 : RUN set -ex; 		wget -O get-pip.py 'https://bootstrap.pypa.io/get-pip.py'; 		python get-pip.py 		--disable-pip-version-check 		--no-cache-dir 		"pip==$PYTHON_PIP_VERSION" 	; 	pip --version; 		find /usr/local -depth 		\( 			\( -type d -a \( -name test -o -name tests \) \) 			-o 			\( -type f -a \( -name '*.pyc' -o -name '*.pyo' \) \) 		\) -exec rm -rf '{}' +; 	rm -f get-pip.py
 ---> Running in 2f7361d37fef
+ wget -O get-pip.py https://bootstrap.pypa.io/get-pip.py
--2019-06-14 20:54:09--  https://bootstrap.pypa.io/get-pip.py
Resolving bootstrap.pypa.io (bootstrap.pypa.io)... 151.101.0.175, 151.101.64.175, 151.101.128.175, ...
Connecting to bootstrap.pypa.io (bootstrap.pypa.io)|151.101.0.175|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1709825 (1.6M) [text/x-python]
Saving to: ‘get-pip.py’

     0K .......... .......... .......... .......... ..........  2%  733K 2s
    50K .......... .......... .......... .......... ..........  5% 1.20M 2s
   100K .......... .......... .......... .......... ..........  8% 2.09M 1s
   150K .......... .......... .......... .......... .......... 11% 1.20M 1s
   200K .......... .......... .......... .......... .......... 14% 2.28M 1s
   250K .......... .......... .......... .......... .......... 17% 1.34M 1s
   300K .......... .......... .......... .......... .......... 20% 2.20M 1s
   350K .......... .......... .......... .......... .......... 23%  808K 1s
   400K .......... .......... .......... .......... .......... 26% 1.61M 1s
   450K .......... .......... .......... .......... .......... 29% 1.56M 1s
   500K .......... .......... .......... .......... .......... 32% 3.15M 1s
   550K .......... .......... .......... .......... .......... 35%  986K 1s
   600K .......... .......... .......... .......... .......... 38% 3.41M 1s
   650K .......... .......... .......... .......... .......... 41% 1.70M 1s
   700K .......... .......... .......... .......... .......... 44% 1.24M 1s
   750K .......... .......... .......... .......... .......... 47% 1.64M 1s
   800K .......... .......... .......... .......... .......... 50% 2.24M 1s
   850K .......... .......... .......... .......... .......... 53% 2.97M 1s
   900K .......... .......... .......... .......... .......... 56%  784K 0s
   950K .......... .......... .......... .......... .......... 59%  604K 0s
  1000K .......... .......... .......... .......... .......... 62% 82.0M 0s
  1050K .......... .......... .......... .......... .......... 65%  103M 0s
  1100K .......... .......... .......... .......... .......... 68% 3.12M 0s
  1150K .......... .......... .......... .......... .......... 71%  810K 0s
  1200K .......... .......... .......... .......... .......... 74% 1.14M 0s
  1250K .......... .......... .......... .......... .......... 77%  711K 0s
  1300K .......... .......... .......... .......... .......... 80%  431K 0s
  1350K .......... .......... .......... .......... .......... 83% 36.6M 0s
  1400K .......... .......... .......... .......... .......... 86% 1.44M 0s
  1450K .......... .......... .......... .......... .......... 89% 1.57M 0s
  1500K .......... .......... .......... .......... .......... 92% 1003K 0s
  1550K .......... .......... .......... .......... .......... 95%  835K 0s
  1600K .......... .......... .......... .......... .......... 98%  693K 0s
  1650K .......... .........                                  100% 17.1M=1.3s

2019-06-14 20:54:11 (1.26 MB/s) - ‘get-pip.py’ saved [1709825/1709825]

+ python get-pip.py --disable-pip-version-check --no-cache-dir pip==9.0.1
Collecting pip==9.0.1
  Downloading https://files.pythonhosted.org/packages/b6/ac/7015eb97dc749283ffdec1c3a88ddb8ae03b8fad0f0e611408f196358da3/pip-9.0.1-py2.py3-none-any.whl (1.3MB)
Collecting setuptools
  Downloading https://files.pythonhosted.org/packages/ec/51/f45cea425fd5cb0b0380f5b0f048ebc1da5b417e48d304838c02d6288a1e/setuptools-41.0.1-py2.py3-none-any.whl (575kB)
Collecting wheel
  Downloading https://files.pythonhosted.org/packages/bb/10/44230dd6bf3563b8f227dbf344c908d412ad2ff48066476672f3a72e174e/wheel-0.33.4-py2.py3-none-any.whl
Installing collected packages: pip, setuptools, wheel
Successfully installed pip-9.0.1 setuptools-41.0.1 wheel-0.33.4
+ pip --version
pip 9.0.1 from /usr/local/lib/python3.6/site-packages (python 3.6)
+ find /usr/local -depth ( ( -type d -a ( -name test -o -name tests ) ) -o ( -type f -a ( -name *.pyc -o -name *.pyo ) ) ) -exec rm -rf {} +
+ rm -f get-pip.py
Removing intermediate container 2f7361d37fef
 ---> ce5c262f17dc
Step 11/11 : CMD ["python3"]
 ---> Running in 50ebaeb8f3c5
Removing intermediate container 50ebaeb8f3c5
 ---> bb91a0196137
Successfully built bb91a0196137
Successfully tagged jessie:python3.6
+ set +x

"##########################################"
"Docker build for jessie was sucessfull"
"##########################################"

REPOSITORY          TAG                 IMAGE ID            CREATED                  SIZE
jessie              python3.6           bb91a0196137        Less than a second ago   693MB
buildpack-deps      jessie              1bcc87c0bd3c        5 weeks ago              616MB
hello-world         latest              fce289e99eb9        5 months ago             1.84kB

"##########################################"
"Running Docker container FOR Jessie image"
"##########################################"

+ docker run --rm -it jessie:python3.6 python -V
Python 3.6.3
vagrant@DevOpsAs6:/vagrant$ 

```
