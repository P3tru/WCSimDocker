# The WCSim Docker app

This repository contains a docker image based on CERN/SL6 distribution with root 5.34.36 and Geant4.10.1.p3 precompiled libraries.

All the nuclear data files necessary for Geant4 are installed and the WCSim repository is checked out at branch **ODTesting** of my fork.

## Instructions to install and run the image

### Install the Docker Client
1. Install docker on your machine.

To run containers and use docker you **must** have root access to you local machine. So be sure you can.
The best way install docker is to check directly the docker website, [here](https://www.docker.com/). However there is some info for the common used system :

#### For Ubuntu/Mint/Debian based system
```bash
sudo apt-get update
sudo apt-get install docker.io
sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker
```
#### For Arch based system
```bash
sudo pacman -S docker
```
#### For MacOSX
FYI, I am no mac user so I'd recommend to follow any other docs or tutorial you may find, for example you can get the .dmg [here](https://docs.docker.com/docker-for-mac/install/#download-docker-for-mac)
#### Windows
Again I'd recommand to follow docker docs  [here](https://docs.docker.com/docker-for-windows/install/)

### Start the Docker Client service
2. It depends which daemons manages your process :
#### Systemd-Based Linux (Arch for example)
```bash
sudo systemctl enable docker
```
#### Upstart-Based Linux (Ubuntu)
```bash
service docker.io start
```
#### init.d-Based Linux (Red Hat)
```bash
$ service docker start
```

### Install WCSim app
3. Get this image.

```bash
git clone && cd
```

4. You will need the first time to build the image by running this command :

```bash
sudo docker build -t WCSim .
```
Anytime you pull new commit from this repository you **must** rebuild the docker image by using this command. Docker is clever and works with layers, so the first time you will build the image it might take a while to recover all the dependancies, but after only the new or modified layers would be build and will take less much time.

5. Run your image by using this command :
```bash
sudo docker run -ti WCSim
```
You will reach a prompt inside your container and you can now use it as a normal terminal.

6. Source the environment file setting up root and geant4 :
```bash
cd $HYPERKDIR
source env-WCSim.sh
```

6. You can now produce your WCSim files :
```bash
cd $WCSIMDIR
```
Then compile WCSim :
```bash
make clean
make rootcint
make
```
And execute WCSim with :
```bash
WCSim macros/OD.mac
```
Or whatever macros you want. Please check the [WCSim](https://github.com/WCSim/WCSim) repository for any information you need on compiling and generating simulation files.
