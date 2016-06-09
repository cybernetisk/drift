#!/bin/bash

cd
git clone https://github.com/course-hero/slacktee.git
./slacktee/install.sh

ln -s /usr/local/bin/slacktee.sh /usr/bin/slacktee.sh
