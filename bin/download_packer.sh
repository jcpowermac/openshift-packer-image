#!/bin/bash

wget -nv $(python -c 'import requests;version = requests.get("https://api.github.com/repos/mitchellh/packer/tags").json()[0]["name"].replace("v","");print "https://releases.hashicorp.com/packer/%s/packer_%s_linux_amd64.zip" % (version,version)') -O /tmp/packer.zip

unzip /tmp/packer.zip -d ${APP_ROOT}/bin/
