This project is dedicated to daily tools that can make a difference in software engineer's life!

Stuff like vim, tmux, eclipse mastering configs, and etc that come in handy when you are developing a top notch project but don't have much fancy tools at hand.

Eclipse formatting: Eclipse>Window>Preferences>Java>Coed Style>Formatter



================


Create a machine with 16 cores / 20Gb ram, 2 tesla k80 gpus, 1000GB SSD disk and a Linux Ubuntu 16.04.
At this time tensroflow only supports upto cuda 9.0

Useful references: 

https://www.tensorflow.org/install/
```
    Software requirements

    The following NVIDIA® software must be installed on your system:

    NVIDIA® GPU drivers —CUDA 9.0 requires 384.x or higher.
    CUDA® Toolkit —TensorFlow supports CUDA 9.0.
    CUPTI ships with the CUDA Toolkit.
    cuDNN SDK (>= 7.2)
    (Optional) NCCL 2.2 for multiple GPU support.
    (Optional) TensorRT 4.0 to improve latency and throughput for inference on some models.
```

https://www.tensorflow.org/install/gpu

### $ history
```
    1  wget http://us.download.nvidia.com/tesla/384.145/NVIDIA-Linux-x86_64-384.145.run
    2  ls
    3  chmod +x NVIDIA-Linux-x86_64-384.145.run
    4  ./NVIDIA-Linux-x86_64-384.145.run
    5  sudo ./NVIDIA-Linux-x86_64-384.145.run
    6  sudo apt update && sudo apt dist-upgrade
    7  sudo apt install build-essential
    8  sudo ./NVIDIA-Linux-x86_64-384.145.run
    9  wget https://developer.download.nvidia.com/compute/cuda/10.0/secure/Prod/local_installers/cuda-repo-ubuntu1604-10-0-local-10.0.130-410.48_1.0-1_amd64.deb?Sy_kg1zoV551eevdI4W-oISQrYf5fNRvnuKgfQvyKwtBtTaOVsqbpOznaMriM7-DOFGF9SsndBjkNWxcvxaL5S0AsHQxLhjwlSXu8IFSCO0v76XROT3fTLazq9DMMIgV7bAwHj6t9vOqddfkFBEkiV8MiVItcrdKMm0Xem31PvhBxYsvAcdV8r79dXIXqPsR5GPJ5KbrJpm6B43SToD_tSwhB423bZ7QMxCi5pk
   10  ls
   11  rm cuda-repo-ubuntu1604-10-0-local-10.0.130-410.48_1.0-1_amd64.deb\?Sy_kg1zoV551eevdI4W-oISQrYf5fNRvnuKgfQvyKwtBtTaOVsqbpOznaMriM7-DOFGF9SsndBjkNWxcvxaL5S0AsHQxLhjwlSXu8IFSCO0v76XROT3fTLazq9DMMIgV7bAwHj6t9vOqddfkFBEkiV8MiVItcrdKMm0Xem31PvhB
   12  ls
   13  wget https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64-deb
   14  sudo dpkg -i cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64.deb
   15  ls
   16  sudo dpkg -i  cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64-deb
   17  sudo apt-key add /var/cuda-repo-<version>/7fa2af80.pub
   18  sudo apt-key add /var/cuda-repo-9-0-local/7fa2af80.pub
   19  sudo apt-get update
   20  sudo apt-get install cuda
   21  wget https://developer.download.nvidia.com/compute/machine-learning/cudnn/secure/v7.4.1.5/prod/9.0_20181108/cudnn-9.0-linux-x64-v7.4.1.5.tgz?sdkzzvuiFuy7wXAPpT9qG3Vi8FcwxP41oUalJP_D7OzQlF-1nLs1_k0ut-AgGZHCo_Y-VDMb-h1KlXfYHDpTtsBl5fhSOtrkKfNLNa-88BupDXsCC_cxO-KEyRcgL43p2fZi26VPihEuz9O0Vx26SdArcC9q-nn9f7XJ40C_tFO37X5Q3uk1LwDi4Z7LeMh_HX0ucIgVH2Euja0B3E1Yaw
   22  mv cudnn-9.0-linux-x64-v7.4.1.5.tgz\?sdkzzvuiFuy7wXAPpT9qG3Vi8FcwxP41oUalJP_D7OzQlF-1nLs1_k0ut-AgGZHCo_Y-VDMb-h1KlXfYHDpTtsBl5fhSOtrkKfNLNa-88BupDXsCC_cxO-KEyRcgL43p2fZi26VPihEuz9O0Vx26SdArcC9q-nn9f7XJ40C_tFO37X5Q3uk1LwDi4Z7LeMh_HX0ucIgVH2E cudnn-9.0-linux-x64-v7.4.1.5.tgz
   23  ls
   24  tar -xzvf cudnn-9.0-linux-x64-v7.4.1.5.tgz
   25  sudo cp cuda/include/cudnn.h /usr/local/cuda/include
   26  sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
   27  sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
   28  cp -r /usr/src/cudnn_samples_v7/ $HOME
   29  wget https://developer.download.nvidia.com/compute/machine-learning/cudnn/secure/v7.4.1.5/prod/9.0_20181108/Ubuntu14_04-x64/libcudnn7-doc_7.4.1.5-1%2Bcuda9.0_amd64.deb?_TwWCbLmW-_A6a4x-QRHY-o981XN7vpLtmRSk9eEiyLZcLWeK5a2U6nhuBbf587XwgM2605uVmxKUxf2RZtEZncp2FzI5E-Gji1U1FRv3pUaaFP0s0NXP1wSPQRlv9qhyKqvuhnkW4poEH9lyDb44SqtRcTGyRlMYVHHqe4rKaX1o0XY3jrEIfWga7kh0Le3lD9gAsiO8kpCD_s70j1h5a_x0Vsy8ytZQGTCCccBcjvwPefkZxYL9mTuBQ
   30  ls
   31  mv libcudnn7-doc_7.4.1.5-1+cuda9.0_amd64.deb\?_TwWCbLmW-_A6a4x-QRHY-o981XN7vpLtmRSk9eEiyLZcLWeK5a2U6nhuBbf587XwgM2605uVmxKUxf2RZtEZncp2FzI5E-Gji1U1FRv3pUaaFP0s0NXP1wSPQRlv9qhyKqvuhnkW4poEH9lyDb44SqtRcTGyRlMYVHHqe4rKaX1o0XY3jrEIfWga7kh0Le3lD libcudnn7-doc_7.4.1.5-1+cuda9.0_amd64.deb
   32  sudo dpkg -i libcudnn7-doc_7.4.1.5-1+cuda9.0_amd64.deb
   33  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/extras/CUPTI/lib64
   34  ls /usr/local/cuda/extras/CUPTI
   35  sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
   36  wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.1.85-1_amd64.deb
   37  sudo apt install ./cuda-repo-ubuntu1604_9.1.85-1_amd64.deb
   38  apt-get -f install
   39  sudo apt-get -f install
   40  sudo apt install ./cuda-repo-ubuntu1604_9.1.85-1_amd64.deb
   41  wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/nvidia-machine-learning-repo-ubuntu1604_1.0.0-1_amd64.deb
   42  sudo apt install ./nvidia-machine-learning-repo-ubuntu1604_1.0.0-1_amd64.deb
   43  sudo apt update
   44  sudo apt install cuda9.0 cuda-cublas-9-0 cuda-cufft-9-0 cuda-curand-9-0     cuda-cusolver-9-0 cuda-cusparse-9-0 libcudnn7=7.2.1.38-1+cuda9.0     libnccl2=2.2.13-1+cuda9.0 cuda-command-line-tools-9-0
   45  sudo apt update
   46  sudo apt install libnvinfer4=4.1.2-1+cuda9.0
   47  virtualenv .env
   48  sudo apt-get install libncurses5-dev
   49  sudo apt-get install python-dev
   50  sudo apt-get install python-pip
   51  sudo pip install virtualenv
   52  virtualenv .env
   53  source .env/bin/activate
   54  pip install jupyter
   55  pip install tensorflow-gpu
   56  nvidia-smi
   57  tmux
   58  history
   $ python
   from tensorflow.python.client import device_lib
   print(device_lib.list_local_devices())  # shows gpu devices
```   

setup git params and id_rsa on machine

git clone cheetsheet 

copy .tmux.conf and .vimrc to ~/

setup gsutil https://cloud.google.com/storage/docs/gsutil_install#linux



