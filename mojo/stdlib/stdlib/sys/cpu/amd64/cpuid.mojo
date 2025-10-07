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

from sys import external_call


fn runtime_check_16bit_mode() -> Bool:
    return external_call["get_16bit_mode", Bool]()


fn runtime_check_32bit_mode() -> Bool:
    return external_call["get_32bit_mode", Bool]()


fn runtime_check_64bit() -> Bool:
    return external_call["get_64bit", Bool]()


fn runtime_check_64bit_mode() -> Bool:
    return external_call["get_64bit_mode", Bool]()


fn runtime_check_adx() -> Bool:
    return external_call["get_adx", Bool]()


fn runtime_check_aes() -> Bool:
    return external_call["get_aes", Bool]()


fn runtime_check_allow_light_256_bit() -> Bool:
    return external_call["get_allow_light_256_bit", Bool]()


fn runtime_check_amx_avx512() -> Bool:
    return external_call["get_amx_avx512", Bool]()


fn runtime_check_amx_bf16() -> Bool:
    return external_call["get_amx_bf16", Bool]()


fn runtime_check_amx_complex() -> Bool:
    return external_call["get_amx_complex", Bool]()


fn runtime_check_amx_fp16() -> Bool:
    return external_call["get_amx_fp16", Bool]()


fn runtime_check_amx_fp8() -> Bool:
    return external_call["get_amx_fp8", Bool]()


fn runtime_check_amx_int8() -> Bool:
    return external_call["get_amx_int8", Bool]()


fn runtime_check_amx_movrs() -> Bool:
    return external_call["get_amx_movrs", Bool]()


fn runtime_check_amx_tf32() -> Bool:
    return external_call["get_amx_tf32", Bool]()


fn runtime_check_amx_tile() -> Bool:
    return external_call["get_amx_tile", Bool]()


fn runtime_check_amx_transpose() -> Bool:
    return external_call["get_amx_transpose", Bool]()


fn runtime_check_avx() -> Bool:
    return external_call["get_avx", Bool]()


fn runtime_check_avx10_1_256() -> Bool:
    return external_call["get_avx10_1_256", Bool]()


fn runtime_check_avx10_1_512() -> Bool:
    return external_call["get_avx10_1_512", Bool]()


fn runtime_check_avx10_2_256() -> Bool:
    return external_call["get_avx10_2_256", Bool]()


fn runtime_check_avx10_2_512() -> Bool:
    return external_call["get_avx10_2_512", Bool]()


fn runtime_check_avx2() -> Bool:
    return external_call["get_avx2", Bool]()


fn runtime_check_avx512bf16() -> Bool:
    return external_call["get_avx512bf16", Bool]()


fn runtime_check_avx512bitalg() -> Bool:
    return external_call["get_avx512bitalg", Bool]()


fn runtime_check_avx512bw() -> Bool:
    return external_call["get_avx512bw", Bool]()


fn runtime_check_avx512cd() -> Bool:
    return external_call["get_avx512cd", Bool]()


fn runtime_check_avx512dq() -> Bool:
    return external_call["get_avx512dq", Bool]()


fn runtime_check_avx512f() -> Bool:
    return external_call["get_avx512f", Bool]()


fn runtime_check_avx512fp16() -> Bool:
    return external_call["get_avx512fp16", Bool]()


fn runtime_check_avx512ifma() -> Bool:
    return external_call["get_avx512ifma", Bool]()


fn runtime_check_avx512vbmi() -> Bool:
    return external_call["get_avx512vbmi", Bool]()


fn runtime_check_avx512vbmi2() -> Bool:
    return external_call["get_avx512vbmi2", Bool]()


fn runtime_check_avx512vl() -> Bool:
    return external_call["get_avx512vl", Bool]()


fn runtime_check_avx512vnni() -> Bool:
    return external_call["get_avx512vnni", Bool]()


fn runtime_check_avx512vp2intersect() -> Bool:
    return external_call["get_avx512vp2intersect", Bool]()


fn runtime_check_avx512vpopcntdq() -> Bool:
    return external_call["get_avx512vpopcntdq", Bool]()


fn runtime_check_avxifma() -> Bool:
    return external_call["get_avxifma", Bool]()


fn runtime_check_avxneconvert() -> Bool:
    return external_call["get_avxneconvert", Bool]()


fn runtime_check_avxvnni() -> Bool:
    return external_call["get_avxvnni", Bool]()


fn runtime_check_avxvnniint16() -> Bool:
    return external_call["get_avxvnniint16", Bool]()


fn runtime_check_avxvnniint8() -> Bool:
    return external_call["get_avxvnniint8", Bool]()


fn runtime_check_bmi() -> Bool:
    return external_call["get_bmi", Bool]()


fn runtime_check_bmi2() -> Bool:
    return external_call["get_bmi2", Bool]()


fn runtime_check_branch_hint() -> Bool:
    return external_call["get_branch_hint", Bool]()


fn runtime_check_branchfusion() -> Bool:
    return external_call["get_branchfusion", Bool]()


fn runtime_check_ccmp() -> Bool:
    return external_call["get_ccmp", Bool]()


fn runtime_check_cf() -> Bool:
    return external_call["get_cf", Bool]()


fn runtime_check_cldemote() -> Bool:
    return external_call["get_cldemote", Bool]()


fn runtime_check_clflushopt() -> Bool:
    return external_call["get_clflushopt", Bool]()


fn runtime_check_clwb() -> Bool:
    return external_call["get_clwb", Bool]()


fn runtime_check_clzero() -> Bool:
    return external_call["get_clzero", Bool]()


fn runtime_check_cmov() -> Bool:
    return external_call["get_cmov", Bool]()


fn runtime_check_cmpccxadd() -> Bool:
    return external_call["get_cmpccxadd", Bool]()


fn runtime_check_crc32() -> Bool:
    return external_call["get_crc32", Bool]()


fn runtime_check_cx16() -> Bool:
    return external_call["get_cx16", Bool]()


fn runtime_check_cx8() -> Bool:
    return external_call["get_cx8", Bool]()


fn runtime_check_egpr() -> Bool:
    return external_call["get_egpr", Bool]()


fn runtime_check_enqcmd() -> Bool:
    return external_call["get_enqcmd", Bool]()


fn runtime_check_ermsb() -> Bool:
    return external_call["get_ermsb", Bool]()


fn runtime_check_evex512() -> Bool:
    return external_call["get_evex512", Bool]()


fn runtime_check_f16c() -> Bool:
    return external_call["get_f16c", Bool]()


fn runtime_check_false_deps_getmant() -> Bool:
    return external_call["get_false_deps_getmant", Bool]()


fn runtime_check_false_deps_lzcnt_tzcnt() -> Bool:
    return external_call["get_false_deps_lzcnt_tzcnt", Bool]()


fn runtime_check_false_deps_mulc() -> Bool:
    return external_call["get_false_deps_mulc", Bool]()


fn runtime_check_false_deps_mullq() -> Bool:
    return external_call["get_false_deps_mullq", Bool]()


fn runtime_check_false_deps_perm() -> Bool:
    return external_call["get_false_deps_perm", Bool]()


fn runtime_check_false_deps_popcnt() -> Bool:
    return external_call["get_false_deps_popcnt", Bool]()


fn runtime_check_false_deps_range() -> Bool:
    return external_call["get_false_deps_range", Bool]()


fn runtime_check_fast_11bytenop() -> Bool:
    return external_call["get_fast_11bytenop", Bool]()


fn runtime_check_fast_15bytenop() -> Bool:
    return external_call["get_fast_15bytenop", Bool]()


fn runtime_check_fast_7bytenop() -> Bool:
    return external_call["get_fast_7bytenop", Bool]()


fn runtime_check_fast_bextr() -> Bool:
    return external_call["get_fast_bextr", Bool]()


fn runtime_check_fast_dpwssd() -> Bool:
    return external_call["get_fast_dpwssd", Bool]()


fn runtime_check_fast_gather() -> Bool:
    return external_call["get_fast_gather", Bool]()


fn runtime_check_fast_hops() -> Bool:
    return external_call["get_fast_hops", Bool]()


fn runtime_check_fast_imm16() -> Bool:
    return external_call["get_fast_imm16", Bool]()


fn runtime_check_fast_lzcnt() -> Bool:
    return external_call["get_fast_lzcnt", Bool]()


fn runtime_check_fast_movbe() -> Bool:
    return external_call["get_fast_movbe", Bool]()


fn runtime_check_fast_scalar_fsqrt() -> Bool:
    return external_call["get_fast_scalar_fsqrt", Bool]()


fn runtime_check_fast_scalar_shift_masks() -> Bool:
    return external_call["get_fast_scalar_shift_masks", Bool]()


fn runtime_check_fast_shld_rotate() -> Bool:
    return external_call["get_fast_shld_rotate", Bool]()


fn runtime_check_fast_variable_crosslane_shuffle() -> Bool:
    return external_call["get_fast_variable_crosslane_shuffle", Bool]()


fn runtime_check_fast_variable_perlane_shuffle() -> Bool:
    return external_call["get_fast_variable_perlane_shuffle", Bool]()


fn runtime_check_fast_vector_fsqrt() -> Bool:
    return external_call["get_fast_vector_fsqrt", Bool]()


fn runtime_check_fast_vector_shift_masks() -> Bool:
    return external_call["get_fast_vector_shift_masks", Bool]()


fn runtime_check_faster_shift_than_shuffle() -> Bool:
    return external_call["get_faster_shift_than_shuffle", Bool]()


fn runtime_check_fma() -> Bool:
    return external_call["get_fma", Bool]()


fn runtime_check_fma4() -> Bool:
    return external_call["get_fma4", Bool]()


fn runtime_check_fsgsbase() -> Bool:
    return external_call["get_fsgsbase", Bool]()


fn runtime_check_fsrm() -> Bool:
    return external_call["get_fsrm", Bool]()


fn runtime_check_fxsr() -> Bool:
    return external_call["get_fxsr", Bool]()


fn runtime_check_gfni() -> Bool:
    return external_call["get_gfni", Bool]()


fn runtime_check_harden_sls_ijmp() -> Bool:
    return external_call["get_harden_sls_ijmp", Bool]()


fn runtime_check_harden_sls_ret() -> Bool:
    return external_call["get_harden_sls_ret", Bool]()


fn runtime_check_hreset() -> Bool:
    return external_call["get_hreset", Bool]()


fn runtime_check_idivl_to_divb() -> Bool:
    return external_call["get_idivl_to_divb", Bool]()


fn runtime_check_idivq_to_divl() -> Bool:
    return external_call["get_idivq_to_divl", Bool]()


fn runtime_check_inline_asm_use_gpr32() -> Bool:
    return external_call["get_inline_asm_use_gpr32", Bool]()


fn runtime_check_invpcid() -> Bool:
    return external_call["get_invpcid", Bool]()


fn runtime_check_kl() -> Bool:
    return external_call["get_kl", Bool]()


fn runtime_check_lea_sp() -> Bool:
    return external_call["get_lea_sp", Bool]()


fn runtime_check_lea_uses_ag() -> Bool:
    return external_call["get_lea_uses_ag", Bool]()


fn runtime_check_lvi_cfi() -> Bool:
    return external_call["get_lvi_cfi", Bool]()


fn runtime_check_lvi_load_hardening() -> Bool:
    return external_call["get_lvi_load_hardening", Bool]()


fn runtime_check_lwp() -> Bool:
    return external_call["get_lwp", Bool]()


fn runtime_check_lzcnt() -> Bool:
    return external_call["get_lzcnt", Bool]()


fn runtime_check_macrofusion() -> Bool:
    return external_call["get_macrofusion", Bool]()


fn runtime_check_mmx() -> Bool:
    return external_call["get_mmx", Bool]()


fn runtime_check_movbe() -> Bool:
    return external_call["get_movbe", Bool]()


fn runtime_check_movdir64b() -> Bool:
    return external_call["get_movdir64b", Bool]()


fn runtime_check_movdiri() -> Bool:
    return external_call["get_movdiri", Bool]()


fn runtime_check_movrs() -> Bool:
    return external_call["get_movrs", Bool]()


fn runtime_check_mwaitx() -> Bool:
    return external_call["get_mwaitx", Bool]()


fn runtime_check_ndd() -> Bool:
    return external_call["get_ndd", Bool]()


fn runtime_check_nf() -> Bool:
    return external_call["get_nf", Bool]()


fn runtime_check_no_bypass_delay() -> Bool:
    return external_call["get_no_bypass_delay", Bool]()


fn runtime_check_no_bypass_delay_blend() -> Bool:
    return external_call["get_no_bypass_delay_blend", Bool]()


fn runtime_check_no_bypass_delay_mov() -> Bool:
    return external_call["get_no_bypass_delay_mov", Bool]()


fn runtime_check_no_bypass_delay_shuffle() -> Bool:
    return external_call["get_no_bypass_delay_shuffle", Bool]()


fn runtime_check_nopl() -> Bool:
    return external_call["get_nopl", Bool]()


fn runtime_check_pad_short_functions() -> Bool:
    return external_call["get_pad_short_functions", Bool]()


fn runtime_check_pclmul() -> Bool:
    return external_call["get_pclmul", Bool]()


fn runtime_check_pconfig() -> Bool:
    return external_call["get_pconfig", Bool]()


fn runtime_check_pku() -> Bool:
    return external_call["get_pku", Bool]()


fn runtime_check_popcnt() -> Bool:
    return external_call["get_popcnt", Bool]()


fn runtime_check_ppx() -> Bool:
    return external_call["get_ppx", Bool]()


fn runtime_check_prefer_128_bit() -> Bool:
    return external_call["get_prefer_128_bit", Bool]()


fn runtime_check_prefer_256_bit() -> Bool:
    return external_call["get_prefer_256_bit", Bool]()


fn runtime_check_prefer_mask_registers() -> Bool:
    return external_call["get_prefer_mask_registers", Bool]()


fn runtime_check_prefer_movmsk_over_vtest() -> Bool:
    return external_call["get_prefer_movmsk_over_vtest", Bool]()


fn runtime_check_prefer_no_gather() -> Bool:
    return external_call["get_prefer_no_gather", Bool]()


fn runtime_check_prefer_no_scatter() -> Bool:
    return external_call["get_prefer_no_scatter", Bool]()


fn runtime_check_prefetchi() -> Bool:
    return external_call["get_prefetchi", Bool]()


fn runtime_check_prfchw() -> Bool:
    return external_call["get_prfchw", Bool]()


fn runtime_check_ptwrite() -> Bool:
    return external_call["get_ptwrite", Bool]()


fn runtime_check_push2pop2() -> Bool:
    return external_call["get_push2pop2", Bool]()


fn runtime_check_raoint() -> Bool:
    return external_call["get_raoint", Bool]()


fn runtime_check_rdpid() -> Bool:
    return external_call["get_rdpid", Bool]()


fn runtime_check_rdpru() -> Bool:
    return external_call["get_rdpru", Bool]()


fn runtime_check_rdrnd() -> Bool:
    return external_call["get_rdrnd", Bool]()


fn runtime_check_rdseed() -> Bool:
    return external_call["get_rdseed", Bool]()


fn runtime_check_retpoline() -> Bool:
    return external_call["get_retpoline", Bool]()


fn runtime_check_retpoline_external_thunk() -> Bool:
    return external_call["get_retpoline_external_thunk", Bool]()


fn runtime_check_retpoline_indirect_branches() -> Bool:
    return external_call["get_retpoline_indirect_branches", Bool]()


fn runtime_check_retpoline_indirect_calls() -> Bool:
    return external_call["get_retpoline_indirect_calls", Bool]()


fn runtime_check_rtm() -> Bool:
    return external_call["get_rtm", Bool]()


fn runtime_check_sahf() -> Bool:
    return external_call["get_sahf", Bool]()


fn runtime_check_sbb_dep_breaking() -> Bool:
    return external_call["get_sbb_dep_breaking", Bool]()


fn runtime_check_serialize() -> Bool:
    return external_call["get_serialize", Bool]()


fn runtime_check_seses() -> Bool:
    return external_call["get_seses", Bool]()


fn runtime_check_sgx() -> Bool:
    return external_call["get_sgx", Bool]()


fn runtime_check_sha() -> Bool:
    return external_call["get_sha", Bool]()


fn runtime_check_sha512() -> Bool:
    return external_call["get_sha512", Bool]()


fn runtime_check_shstk() -> Bool:
    return external_call["get_shstk", Bool]()


fn runtime_check_slow_3ops_lea() -> Bool:
    return external_call["get_slow_3ops_lea", Bool]()


fn runtime_check_slow_incdec() -> Bool:
    return external_call["get_slow_incdec", Bool]()


fn runtime_check_slow_lea() -> Bool:
    return external_call["get_slow_lea", Bool]()


fn runtime_check_slow_pmaddwd() -> Bool:
    return external_call["get_slow_pmaddwd", Bool]()


fn runtime_check_slow_pmulld() -> Bool:
    return external_call["get_slow_pmulld", Bool]()


fn runtime_check_slow_shld() -> Bool:
    return external_call["get_slow_shld", Bool]()


fn runtime_check_slow_two_mem_ops() -> Bool:
    return external_call["get_slow_two_mem_ops", Bool]()


fn runtime_check_slow_unaligned_mem_16() -> Bool:
    return external_call["get_slow_unaligned_mem_16", Bool]()


fn runtime_check_slow_unaligned_mem_32() -> Bool:
    return external_call["get_slow_unaligned_mem_32", Bool]()


fn runtime_check_sm3() -> Bool:
    return external_call["get_sm3", Bool]()


fn runtime_check_sm4() -> Bool:
    return external_call["get_sm4", Bool]()


fn runtime_check_soft_float() -> Bool:
    return external_call["get_soft_float", Bool]()


fn runtime_check_sse() -> Bool:
    return external_call["get_sse", Bool]()


fn runtime_check_sse_unaligned_mem() -> Bool:
    return external_call["get_sse_unaligned_mem", Bool]()


fn runtime_check_sse2() -> Bool:
    return external_call["get_sse2", Bool]()


fn runtime_check_sse3() -> Bool:
    return external_call["get_sse3", Bool]()


fn runtime_check_sse4_1() -> Bool:
    return external_call["get_sse4_1", Bool]()


fn runtime_check_sse4_2() -> Bool:
    return external_call["get_sse4_2", Bool]()


fn runtime_check_sse4a() -> Bool:
    return external_call["get_sse4a", Bool]()


fn runtime_check_ssse3() -> Bool:
    return external_call["get_ssse3", Bool]()


fn runtime_check_tagged_globals() -> Bool:
    return external_call["get_tagged_globals", Bool]()


fn runtime_check_tbm() -> Bool:
    return external_call["get_tbm", Bool]()


fn runtime_check_tsxldtrk() -> Bool:
    return external_call["get_tsxldtrk", Bool]()


fn runtime_check_tuning_fast_imm_vector_shift() -> Bool:
    return external_call["get_tuning_fast_imm_vector_shift", Bool]()


fn runtime_check_uintr() -> Bool:
    return external_call["get_uintr", Bool]()


fn runtime_check_use_glm_div_sqrt_costs() -> Bool:
    return external_call["get_use_glm_div_sqrt_costs", Bool]()


fn runtime_check_use_slm_arith_costs() -> Bool:
    return external_call["get_use_slm_arith_costs", Bool]()


fn runtime_check_usermsr() -> Bool:
    return external_call["get_usermsr", Bool]()


fn runtime_check_vaes() -> Bool:
    return external_call["get_vaes", Bool]()


fn runtime_check_vpclmulqdq() -> Bool:
    return external_call["get_vpclmulqdq", Bool]()


fn runtime_check_vzeroupper() -> Bool:
    return external_call["get_vzeroupper", Bool]()


fn runtime_check_waitpkg() -> Bool:
    return external_call["get_waitpkg", Bool]()


fn runtime_check_wbnoinvd() -> Bool:
    return external_call["get_wbnoinvd", Bool]()


fn runtime_check_widekl() -> Bool:
    return external_call["get_widekl", Bool]()


fn runtime_check_x87() -> Bool:
    return external_call["get_x87", Bool]()


fn runtime_check_xop() -> Bool:
    return external_call["get_xop", Bool]()


fn runtime_check_xsave() -> Bool:
    return external_call["get_xsave", Bool]()


fn runtime_check_xsavec() -> Bool:
    return external_call["get_xsavec", Bool]()


fn runtime_check_xsaveopt() -> Bool:
    return external_call["get_xsaveopt", Bool]()


fn runtime_check_xsaves() -> Bool:
    return external_call["get_xsaves", Bool]()


fn runtime_check_zu() -> Bool:
    return external_call["get_zu", Bool]()
