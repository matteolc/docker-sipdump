#!/bin/bash

# Copyright 2017 Voxbox.io
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
APP=sipdump
echo "---------------------------------------------------------------------"
echo "Cleanup"
docker rm ${APP} -f
echo "---------------------------------------------------------------------"
echo "---------------------------------------------------------------------"
echo "Running"
echo "---------------------------------------------------------------------"
docker run -d \
    --name ${APP} \
    --net host \
    --privileged \
    --restart=always \
    voxbox/${APP}  