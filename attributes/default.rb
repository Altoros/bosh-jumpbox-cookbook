#
# Cookbook Name:: bosh-jumpbox
# Attributes:: default
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

default['bosh-init']['path'] = '/usr/local/bin/bosh-init'
default['cf']['path'] = '/usr/local/bin/'
default['fly']['path'] = '/usr/local/bin/fly'
default['spiff']['path'] = '/usr/local/bin/spiff'
default['spruce']['path'] = '/usr/local/bin/spruce'
default['terraform']['path'] = '/usr/local/bin/'
