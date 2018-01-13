RL in TORCS.

## Overview
This is the rl part of our Computer Vision course project. We use a car simulator TORCS to train our RL agent. Our experiments are based on the work done by Yurong You https://github.com/YurongYou/rlTORCS. He modified TORCS and built a highly-customized platform for RL training in TORCS. We use this platform to train our RL agent.

We customized the platform to get segmentation images and RGB or grey scale images from the TORCS simulator, and apply trained agent on different tracks.

## System Requirements

* ubuntu 14.04+
* [torch](http://torch.ch/)
	* luasocket
	* torchx
	* itorch (https://github.com/facebookarchive/iTorch)
	* nnlr
	* dpnn
	* luaposix
	* logroll
	* classic
	* tds

For more details(for example how to run on sever, and our customization approach), please refer to Yurong You's github.
We run this code on personal laptop. We don't have a server that satisfies its requirements. So we cannot tell how would it perform when running on a server.
## installation
First download torcs-1.3.6.zip from https://jbox.sjtu.edu.cn/l/SHwJum, and extract it under folder `TORCS-rl`, make it become `TORCS-rl/torcs-1.3.6`


run `install.sh` in the `TORCS-rl` folder with sudo:

	sudo ./install.sh
## training
Run `train_rl/run.sh`. Default is to train on the grey scale segmentation image on e-track. And you can modify the bash change the training environment.
## evaluation
Modify the `train/rl/run.sh` to change it to evluation mode.
