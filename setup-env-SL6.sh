#!/bin/bash -x

### Setup environment
mkdir $HOME/HyperK
export HYPERKDIR=$HOME/HyperK

### Downloading ROOT
cd $HYPERKDIR \
&& wget https://root.cern.ch/download/root_v5.34.36.Linux-slc6-x86_64-gcc4.4.tar.gz \
&& tar -xvzf root_v5.34.36.Linux-slc6-x86_64-gcc4.4.tar.gz \
&& rm -f root_v5.34.36.Linux-slc6-x86_64-gcc4.4.tar.gz

### Downloading Geant4
cd $HYPERKDIR \
&& wget http://geant4.web.cern.ch/geant4/support/source/lib4.10.1.p03/Linux-g++4.4.7-SLC6.tar.gz \
&& tar -xvzf Linux-g++4.4.7-SLC6.tar.gz \
&& rm -f Linux-g++4.4.7-SLC6.tar.gz

### Data files for Geant4
export G4DATA=$HYPERKDIR/Geant4-10.1.3-Linux/share/Geant4-10.1.3/data
cd $G4DATA \
&& wget http://geant4.web.cern.ch/geant4/support/source/G4ABLA.3.0.tar.gz \
&& tar -xvzf G4ABLA.3.0.tar.gz \
&& rm -f G4ABLA.3.0.tar.gz
cd $G4DATA \
&& wget http://geant4.web.cern.ch/geant4/support/source/G4NDL.4.5.tar.gz \
&& tar -xvzf G4NDL.4.5.tar.gz \
&& rm -f G4NDL.4.5.tar.gz
cd $G4DATA \
&& wget http://geant4.web.cern.ch/geant4/support/source/G4EMLOW.6.41.tar.gz \
&& tar -xvzf G4EMLOW.6.41.tar.gz \
&& rm -f G4EMLOW.6.41.tar.gz
cd $G4DATA \
&& wget http://geant4.web.cern.ch/geant4/support/source/G4PhotonEvaporation.3.1.tar.gz \
&& tar -xvzf G4PhotonEvaporation.3.1.tar.gz \
&& rm -f G4PhotonEvaporation.3.1.tar.gz
cd $G4DATA \
&& wget http://geant4.web.cern.ch/geant4/support/source/G4RadioactiveDecay.4.2.tar.gz \
&& tar -xvzf G4RadioactiveDecay.4.2.tar.gz \
&& rm -f G4RadioactiveDecay.4.2.tar.gz
cd $G4DATA \
&& wget http://geant4.web.cern.ch/geant4/support/source/G4SAIDDATA.1.1.tar.gz \
&& tar -xvzf G4SAIDDATA.1.1.tar.gz \
&& rm -f G4SAIDDATA.1.1.tar.gz
cd $G4DATA \
&& wget http://geant4.web.cern.ch/geant4/support/source/G4NEUTRONXS.1.4.tar.gz \
&& tar -xvzf G4NEUTRONXS.1.4.tar.gz \
&& rm -f G4NEUTRONXS.1.4.tar.gz
cd $G4DATA \
&& wget http://geant4.web.cern.ch/geant4/support/source/G4PII.1.3.tar.gz \
&& tar -xvzf G4PII.1.3.tar.gz \
&& rm -f G4PII.1.3.tar.gz
cd $G4DATA \
&& wget http://geant4.web.cern.ch/geant4/support/source/RealSurface.1.0.tar.gz \
&& tar -xvzf RealSurface.1.0.tar.gz \
&& rm -f RealSurface.1.0.tar.gz
cd $G4DATA \
&& wget http://geant4.web.cern.ch/geant4/support/source/G4ENSDFSTATE.1.0.tar.gz \
&& tar -xvzf G4ENSDFSTATE.1.0.tar.gz \
&& rm -f G4ENSDFSTATE.1.0.tar.gz

### ENV Geant4
export G4WORKDIR=$HYPERKDIR/WCSim/exe
export WCSIMDIR=$HYPERKDIR/WCSim
export G4INSTALL=$HYPERKDIR/Geant4-10.1.3-Linux
export G4LIB=$G4INSTALL/lib

### Source ROOT and Geant4-10
### ****** INFO ****** ###
### this is the bit you might want to edit if you need to source your own personal ROOT
### ****** ---- ****** ###
source $HYPERKDIR/root/bin/thisroot.sh

source $G4INSTALL/bin/geant4.sh
source $G4INSTALL/share/Geant4-10.1.3/geant4make/geant4make.sh

### Get WCSim fork with the OD
cd $HYPERKDIR \
&& git clone https://github.com/P3tru/WCSim \
&& cd $WCSIMDIR \
&& git checkout -b prod/OD \
&& git pull origin prod/OD

cd $WCSIMDIR \
&& make clean \
&& make rootcint \
&& make
