#!/bin/bash
if [ ! -d "/home/${USER}/data" ]; then
        mkdir ~/data
        mkdir ~/data/mariadb
        mkdir ~/data/wordpress
	# sudo chmod -R 777 ~/data/wordpress
	# sudo chmod -R 777 ~/data/mariadb
        # sudo chmod -R 777 ~/data/wordpress/*
        # sudo chmod -R 777 ~/data/mariadb/*
fi