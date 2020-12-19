#
#  Docker build and run
#
#  Alex Shvid
#

FROM shvid/cuda:10.2-runtime-cp36-ubuntu18.04

RUN pip3 install http://cache:8080/tensorflow-2.3.1-cp36-cp36m-linux_x86_64.whl
