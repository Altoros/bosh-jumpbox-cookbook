#!/usr/local/bin/dumb-init /bin/bash

set -e

chef generate repo ~/.chef-repo
mkdir -p ~/.chef-repo/cookbooks/bosh-jumpbox
cp -R cookbook-develop/* ~/.chef-repo/cookbooks/bosh-jumpbox
cd ~/.chef-repo/cookbooks/bosh-jumpbox && berks vendor ../
cd ~/.chef-repo/cookbooks/ && chef-client -z -o bosh-jumpbox
