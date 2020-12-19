# cuda

Docker images with Tensorflow

Available versions:
```
FROM shvid/tensorflow:2.3.1-cuda10.2-cp36-ubuntu18.04
```

# Run

```
docker run -it --rm --runtime=nvidia shvid/tensorflow:2.3.1-cuda10.2-cp36-ubuntu18.04 python3 -c 'python3 -c "from tensorflow.python.client import device_lib; print(device_lib.list_local_devices())"'
```
