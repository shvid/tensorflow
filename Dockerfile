#
#  Docker build and run
#
#  Alex Shvid
#

FROM shvid/cuda:11.0-cudnn8-devel-cp36-ubuntu18.04

COPY *.txt /
RUN pip3 install -r requirements.txt --trusted-host pypi.org --trusted-host files.pythonhosted.org
