#
# Cookbook Name:: bosh-jumpbox
# Recipe:: bosh
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

remote_file node['bosh-init']['path'] do
  source node['bosh-init']['release']
  owner 'root'
  group 'root'
  mode '0755'
  checksum node['bosh-init']['checksum']
  action :create
end

remote_file node['spiff']['path'] do
  source node['spiff']['release']
  owner 'root'
  group 'root'
  mode '0755'
  checksum node['spiff']['checksum']
  action :create
end

ark 'cf' do
  url node['cf']['release']
  path node['cf']['path']
  mode 0755
  creates 'cf'
  strip_components 0
  checksum node['cf']['checksum']
  action :cherry_pick
end

remote_file node['spruce']['path'] do
  source node['spruce']['release']
  owner 'root'
  group 'root'
  mode '0755'
  checksum node['spruce']['checksum']
  action :create
end

remote_file node['fly']['path'] do
  source node['fly']['release']
  owner 'root'
  group 'root'
  mode '0755'
  checksum node['fly']['checksum']
  action :create
end

gems = [
  'rubygems-update', 'bundler', 'bosh_cli', 'cf-uaac'
]

gems.each do |gem|
  gem_package gem do
    action :upgrade
  end
end
