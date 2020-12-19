#
#  Docker build and run
#
#  Alex Shvid
#

FROM shvid/cuda:10.2-runtime-cp36-ubuntu18.04

# CUDNN 7
RUN wget -O libcudnn7.deb -nv http://172.17.0.1:8080/libcudnn7_7.6.5.32-1+cuda10.2_amd64.deb && \
    dpkg -i libcudnn7.deb && \
    rm -rf libcudnn7.deb

# TensorRT 7
RUN wget -O tensorrt.deb -nv http://172.17.0.1:8080/nv-tensorrt-repo-ubuntu1804-cuda10.2-trt7.0.0.11-ga-20191216_1-1_amd64.deb && \
    dpkg -i tensorrt.deb && \
    rm -rf tensorrt.deb

COPY *.txt /
RUN pip3 install -r requirements.txt --trusted-host pypi.org --trusted-host files.pythonhosted.org
