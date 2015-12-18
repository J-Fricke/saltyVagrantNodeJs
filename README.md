# saltyVagrantNodeJs
Quick setup of a NodeJs server running on localhost:3000 using Vagrant + Saltstack. You can use this to quickly start up a node server and get editing an Express NodeJs app without worrying about having conflicting libraries or apps on your host machine.

#Setup
 1. Make sure you have Vagrant+Virtualbox installed. Vagrant v1.7.4, Virtualbox v5.0.10
 2. Clone this repo. `git clone https://github.com/J-Fricke/saltyVagrantNodeJs.git`
 3. `cd` into directory you cloned into.
 4. `mkdir /web` on your host or edit Vagrantfile to point to where you wish to share file with the host.
 5. Edit configVars.yaml with the name of your app and the directory you want to host your node apps. Can leave either of these as is.
 6. `vagrant up` in your terminal
 7. You're ready to load http://localhost:3000 and edit your files from your host machine.
