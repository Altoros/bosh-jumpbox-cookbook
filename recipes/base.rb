#
# Cookbook Name:: bosh-jumpbox
# Recipe:: base
#
# Author:: Andrei Krasnitski <andrei.krasnitski@altoros.com>
#
# Copyright 2016, Andrei Krasnitski
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

include_recipe 'apt'

packages = %w(vim-nox zip unzip curl wget git cmake make libreadline6-dev
              zlib1g-dev libssl-dev libgmp3-dev python-pip libnss-myhostname
              ruby-dev pwgen jq)

packages.each do |pkg|
  package pkg do
    action :install
  end
end

include_recipe 'ark'

ark 'terraform' do
  url node['terraform']['release']
  creates 'terraform'
  path node['terraform']['path']
  mode 0755
  checksum node['terraform']['checksum']
  action :cherry_pick
end

include_recipe 'golang'
