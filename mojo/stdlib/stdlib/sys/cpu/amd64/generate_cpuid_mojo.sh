#!/usr/bin/env bash
# ===----------------------------------------------------------------------=== #
# Copyright (c) 2025, Modular Inc. All rights reserved.
#
# Licensed under the Apache License v2.0 with LLVM Exceptions:
# https://llvm.org/LICENSE.txt
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ===----------------------------------------------------------------------=== #

# Generates cpuid.mojo from the output of llc

llc -march=x86-64 -mattr=help 2>&1 | awk '
BEGIN { 
  output=0;
  printf "from sys import external_call\n\n";
} 

/Available features for this target/ { output=1; next }

/feature to enable a feature/ { output=0 }

/^$/ { next; }

{ 
  if (output) {
    gsub(/-/, "_", $1);
    gsub(/\./, "_", $1);
    printf ("fn runtime_check_%s() -> Bool:\n\treturn external_call[\"get_%s\", Bool]()\n\n\n", $1, $1);
  }
}'