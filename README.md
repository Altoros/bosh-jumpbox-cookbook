Bosh-Jumpbox Cookbook
=============================
[![Build Status](https://travis-ci.org/Infra-Red/bosh-jumpbox.svg?branch=master)](https://travis-ci.org/Infra-Red/bosh-jumpbox)

Set of recipes for provisioning BOSH [Jumpbox](https://bosh.io/docs/terminology.html#jumpbox).

## Requirements
### Platform
- Ubuntu (16.04+)

### Chef
- **[ChefDK 0.10.0](https://github.com/chef/chef-dk) or higher**

```bash
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -c current -P chefdk
```

### Cookbooks
- [apt](https://github.com/chef-cookbooks/apt)
- [ark](https://github.com/burtlo/ark)
- [golang](https://github.com/NOX73/chef-golang)

Packages included
------------
- bosh_cli
- bosh-init
- cf-cli
- ruby
- spiff
- spruce
- terraform
- uaac

Usage
------------
How to provision VM using Chef-Zero:

```bash
chef generate repo ~/.chef-repo
git clone https://github.com/Infra-Red/bosh-jumpbox.git ~/.chef-repo/cookbooks/bosh-jumpbox
cd ~/.chef-repo/cookbooks/bosh-jumpbox && berks vendor ../
cd ~/.chef-repo/cookbooks/ && sudo chef-client -z -o bosh-jumpbox
```
