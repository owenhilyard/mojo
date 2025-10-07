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

# Generates cpuid.c from the output of llc

llc -march=x86-64 -mattr=help 2>&1 | awk '
BEGIN { 
  output=0;
  printf "#include <stdbool.h>\n\n";
} 

/Available features for this target/ { output=1; next }

/feature to enable a feature/ { output=0 }

/^$/ { next; }

{ 
  if (output) {
    tmp=$1;
    gsub(/-/, "_", tmp);
    gsub(/\./, "_", tmp);
    printf ("bool get_%s() {\n\treturn __builtin_cpu_supports(\"%s\");\n}\n\n", tmp, $1);
  } 
}'