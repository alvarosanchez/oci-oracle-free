#!/bin/bash
# Since: September, 2023
# Author: gvenzl
# Name: build_Dockerfile_233.sh
# Description: Build test scripts for Oracle DB Free 23.3
#
# Copyright 2023 Gerald Venzl
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

# Exit on errors
# Great explanation on https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -Eeuo pipefail

CURRENT_DIR=${PWD}

cd ../

echo "TEST: Building 23.2 FULL image"
./buildContainerImage.sh -i -v 23.3 -f
echo "DONE: Building 23.2 FULL image"

echo "TEST: Building 23.2 FULL FASTSTART image"
./buildContainerImage.sh -i -v 23.3 -f -x -i
echo "DONE: Building 23.2 FULL FASTSTART image"

echo "TEST: Building 23.2 REGULAR image"
./buildContainerImage.sh -i -v 23.3
echo "DONE: Building 23.2 REGULAR image"

echo "TEST: Building 23.2 REGULAR FASTSTART image"
./buildContainerImage.sh -i -v 23.3 -x -i
echo "DONE: Building 23.2 REGULAR FASTSTART image"

echo "TEST: Building 23.2 SLIM image"
./buildContainerImage.sh -i -v 23.3 -s
echo "DONE: Building 23.2 SLIM image"

echo "TEST: Building 23.2 SLIM FASTSTART image"
./buildContainerImage.sh -i -v 23.3 -s -x -i
echo "DONE: Building 23.2 SLIM FASTSTART image"

cd "${CURRENT_DIR}"
