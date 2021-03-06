# Copyright 2018 Google, Inc. All rights reserved.
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

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# you can pass your github token with --token here if you run out of requests
go run ${DIR}/release_notes/listpullreqs.go

echo "Huge thank you for this release towards our contributors: "
git log "$(git describe  --abbrev=0)".. --format="%aN" --reverse | sort | uniq | awk '{printf "- %s\n", $0 }'
