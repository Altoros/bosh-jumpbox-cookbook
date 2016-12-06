#
# Cookbook Name:: bosh-jumpbox
# Attributes:: default
#
# Author:: Andrei Krasnitski <xaaabk@gmail.com>
#
# Copyright 2015, Andrei Krasnitski
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['bosh-init']['checksum'] = '1800652511bcad3864d3062b19d1ac194f4176e1f9a1d3b136499e4aef15db34'
default['bosh-init']['path'] = '/usr/local/bin/bosh-init'
default['bosh-init']['release'] = 'https://s3.amazonaws.com/bosh-init-artifacts/bosh-init-0.0.98-linux-amd64'
default['cf-cli']['checksum'] = 'b8aa8f42ebdbf41d911136905144b3a380a72b8d651f4e127185f4d49b67b89e'
default['cf-cli']['release'] = 'http://go-cli.s3-website-us-east-1.amazonaws.com/releases/v6.21.1/cf-cli-installer_6.21.1_x86-64.deb'
default['cf-cli']['version'] = '6.21.1'
default['direnv']['checksum'] = '9c221407b2fa5d86a9bd75b6c715e67f10989d9b6ffc3bbd001ee9ca8d32ce77'
default['direnv']['path'] = '/usr/local/bin/direnv'
default['direnv']['release'] = 'https://github.com/direnv/direnv/releases/download/v2.8.1/direnv.linux-amd64'
default['ruby-ng']['ruby_version'] = '2.3'
default['spiff']['checksum'] = 'a34ee47a75dee89b5195d5901a4230105a5e8249b57b1c63e1c982afacfbc627'
default['spiff']['path'] = '/usr/local/bin/'
default['spiff']['release'] = 'https://github.com/cloudfoundry-incubator/spiff/releases/download/v1.0.7/spiff_linux_amd64.zip'
default['spruce']['checksum'] = 'd51c75ae3d2d0d8166374a1e2c34c0c19f646abfb8c8115853d8d74d0ede67e7'
default['spruce']['path'] = '/usr/local/bin/spruce'
default['spruce']['release'] = 'https://github.com/geofffranks/spruce/releases/download/v1.6.0/spruce-linux-amd64'
default['terraform']['path'] = '/usr/local/bin/'
