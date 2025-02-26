#!/bin/bash

sudo ln -sf $(pwd)/package-list/package-list /etc/package-list 
sudo cp package-list/update-package-list.hook /usr/share/libalpm/hooks/
