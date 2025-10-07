#include <stdbool.h>

bool get_16bit_mode() {
	return __builtin_cpu_supports("16bit-mode");
}

bool get_32bit_mode() {
	return __builtin_cpu_supports("32bit-mode");
}

bool get_64bit() {
	return __builtin_cpu_supports("64bit");
}

bool get_64bit_mode() {
	return __builtin_cpu_supports("64bit-mode");
}

bool get_adx() {
	return __builtin_cpu_supports("adx");
}

bool get_aes() {
	return __builtin_cpu_supports("aes");
}

bool get_allow_light_256_bit() {
	return __builtin_cpu_supports("allow-light-256-bit");
}

bool get_amx_avx512() {
	return __builtin_cpu_supports("amx-avx512");
}

bool get_amx_bf16() {
	return __builtin_cpu_supports("amx-bf16");
}

bool get_amx_complex() {
	return __builtin_cpu_supports("amx-complex");
}

bool get_amx_fp16() {
	return __builtin_cpu_supports("amx-fp16");
}

bool get_amx_fp8() {
	return __builtin_cpu_supports("amx-fp8");
}

bool get_amx_int8() {
	return __builtin_cpu_supports("amx-int8");
}

bool get_amx_movrs() {
	return __builtin_cpu_supports("amx-movrs");
}

bool get_amx_tf32() {
	return __builtin_cpu_supports("amx-tf32");
}

bool get_amx_tile() {
	return __builtin_cpu_supports("amx-tile");
}

bool get_amx_transpose() {
	return __builtin_cpu_supports("amx-transpose");
}

bool get_avx() {
	return __builtin_cpu_supports("avx");
}

bool get_avx10_1_256() {
	return __builtin_cpu_supports("avx10.1-256");
}

bool get_avx10_1_512() {
	return __builtin_cpu_supports("avx10.1-512");
}

bool get_avx10_2_256() {
	return __builtin_cpu_supports("avx10.2-256");
}

bool get_avx10_2_512() {
	return __builtin_cpu_supports("avx10.2-512");
}

bool get_avx2() {
	return __builtin_cpu_supports("avx2");
}

bool get_avx512bf16() {
	return __builtin_cpu_supports("avx512bf16");
}

bool get_avx512bitalg() {
	return __builtin_cpu_supports("avx512bitalg");
}

bool get_avx512bw() {
	return __builtin_cpu_supports("avx512bw");
}

bool get_avx512cd() {
	return __builtin_cpu_supports("avx512cd");
}

bool get_avx512dq() {
	return __builtin_cpu_supports("avx512dq");
}

bool get_avx512f() {
	return __builtin_cpu_supports("avx512f");
}

bool get_avx512fp16() {
	return __builtin_cpu_supports("avx512fp16");
}

bool get_avx512ifma() {
	return __builtin_cpu_supports("avx512ifma");
}

bool get_avx512vbmi() {
	return __builtin_cpu_supports("avx512vbmi");
}

bool get_avx512vbmi2() {
	return __builtin_cpu_supports("avx512vbmi2");
}

bool get_avx512vl() {
	return __builtin_cpu_supports("avx512vl");
}

bool get_avx512vnni() {
	return __builtin_cpu_supports("avx512vnni");
}

bool get_avx512vp2intersect() {
	return __builtin_cpu_supports("avx512vp2intersect");
}

bool get_avx512vpopcntdq() {
	return __builtin_cpu_supports("avx512vpopcntdq");
}

bool get_avxifma() {
	return __builtin_cpu_supports("avxifma");
}

bool get_avxneconvert() {
	return __builtin_cpu_supports("avxneconvert");
}

bool get_avxvnni() {
	return __builtin_cpu_supports("avxvnni");
}

bool get_avxvnniint16() {
	return __builtin_cpu_supports("avxvnniint16");
}

bool get_avxvnniint8() {
	return __builtin_cpu_supports("avxvnniint8");
}

bool get_bmi() {
	return __builtin_cpu_supports("bmi");
}

bool get_bmi2() {
	return __builtin_cpu_supports("bmi2");
}

bool get_branch_hint() {
	return __builtin_cpu_supports("branch-hint");
}

bool get_branchfusion() {
	return __builtin_cpu_supports("branchfusion");
}

bool get_ccmp() {
	return __builtin_cpu_supports("ccmp");
}

bool get_cf() {
	return __builtin_cpu_supports("cf");
}

bool get_cldemote() {
	return __builtin_cpu_supports("cldemote");
}

bool get_clflushopt() {
	return __builtin_cpu_supports("clflushopt");
}

bool get_clwb() {
	return __builtin_cpu_supports("clwb");
}

bool get_clzero() {
	return __builtin_cpu_supports("clzero");
}

bool get_cmov() {
	return __builtin_cpu_supports("cmov");
}

bool get_cmpccxadd() {
	return __builtin_cpu_supports("cmpccxadd");
}

bool get_crc32() {
	return __builtin_cpu_supports("crc32");
}

bool get_cx16() {
	return __builtin_cpu_supports("cx16");
}

bool get_cx8() {
	return __builtin_cpu_supports("cx8");
}

bool get_egpr() {
	return __builtin_cpu_supports("egpr");
}

bool get_enqcmd() {
	return __builtin_cpu_supports("enqcmd");
}

bool get_ermsb() {
	return __builtin_cpu_supports("ermsb");
}

bool get_evex512() {
	return __builtin_cpu_supports("evex512");
}

bool get_f16c() {
	return __builtin_cpu_supports("f16c");
}

bool get_false_deps_getmant() {
	return __builtin_cpu_supports("false-deps-getmant");
}

bool get_false_deps_lzcnt_tzcnt() {
	return __builtin_cpu_supports("false-deps-lzcnt-tzcnt");
}

bool get_false_deps_mulc() {
	return __builtin_cpu_supports("false-deps-mulc");
}

bool get_false_deps_mullq() {
	return __builtin_cpu_supports("false-deps-mullq");
}

bool get_false_deps_perm() {
	return __builtin_cpu_supports("false-deps-perm");
}

bool get_false_deps_popcnt() {
	return __builtin_cpu_supports("false-deps-popcnt");
}

bool get_false_deps_range() {
	return __builtin_cpu_supports("false-deps-range");
}

bool get_fast_11bytenop() {
	return __builtin_cpu_supports("fast-11bytenop");
}

bool get_fast_15bytenop() {
	return __builtin_cpu_supports("fast-15bytenop");
}

bool get_fast_7bytenop() {
	return __builtin_cpu_supports("fast-7bytenop");
}

bool get_fast_bextr() {
	return __builtin_cpu_supports("fast-bextr");
}

bool get_fast_dpwssd() {
	return __builtin_cpu_supports("fast-dpwssd");
}

bool get_fast_gather() {
	return __builtin_cpu_supports("fast-gather");
}

bool get_fast_hops() {
	return __builtin_cpu_supports("fast-hops");
}

bool get_fast_imm16() {
	return __builtin_cpu_supports("fast-imm16");
}

bool get_fast_lzcnt() {
	return __builtin_cpu_supports("fast-lzcnt");
}

bool get_fast_movbe() {
	return __builtin_cpu_supports("fast-movbe");
}

bool get_fast_scalar_fsqrt() {
	return __builtin_cpu_supports("fast-scalar-fsqrt");
}

bool get_fast_scalar_shift_masks() {
	return __builtin_cpu_supports("fast-scalar-shift-masks");
}

bool get_fast_shld_rotate() {
	return __builtin_cpu_supports("fast-shld-rotate");
}

bool get_fast_variable_crosslane_shuffle() {
	return __builtin_cpu_supports("fast-variable-crosslane-shuffle");
}

bool get_fast_variable_perlane_shuffle() {
	return __builtin_cpu_supports("fast-variable-perlane-shuffle");
}

bool get_fast_vector_fsqrt() {
	return __builtin_cpu_supports("fast-vector-fsqrt");
}

bool get_fast_vector_shift_masks() {
	return __builtin_cpu_supports("fast-vector-shift-masks");
}

bool get_faster_shift_than_shuffle() {
	return __builtin_cpu_supports("faster-shift-than-shuffle");
}

bool get_fma() {
	return __builtin_cpu_supports("fma");
}

bool get_fma4() {
	return __builtin_cpu_supports("fma4");
}

bool get_fsgsbase() {
	return __builtin_cpu_supports("fsgsbase");
}

bool get_fsrm() {
	return __builtin_cpu_supports("fsrm");
}

bool get_fxsr() {
	return __builtin_cpu_supports("fxsr");
}

bool get_gfni() {
	return __builtin_cpu_supports("gfni");
}

bool get_harden_sls_ijmp() {
	return __builtin_cpu_supports("harden-sls-ijmp");
}

bool get_harden_sls_ret() {
	return __builtin_cpu_supports("harden-sls-ret");
}

bool get_hreset() {
	return __builtin_cpu_supports("hreset");
}

bool get_idivl_to_divb() {
	return __builtin_cpu_supports("idivl-to-divb");
}

bool get_idivq_to_divl() {
	return __builtin_cpu_supports("idivq-to-divl");
}

bool get_inline_asm_use_gpr32() {
	return __builtin_cpu_supports("inline-asm-use-gpr32");
}

bool get_invpcid() {
	return __builtin_cpu_supports("invpcid");
}

bool get_kl() {
	return __builtin_cpu_supports("kl");
}

bool get_lea_sp() {
	return __builtin_cpu_supports("lea-sp");
}

bool get_lea_uses_ag() {
	return __builtin_cpu_supports("lea-uses-ag");
}

bool get_lvi_cfi() {
	return __builtin_cpu_supports("lvi-cfi");
}

bool get_lvi_load_hardening() {
	return __builtin_cpu_supports("lvi-load-hardening");
}

bool get_lwp() {
	return __builtin_cpu_supports("lwp");
}

bool get_lzcnt() {
	return __builtin_cpu_supports("lzcnt");
}

bool get_macrofusion() {
	return __builtin_cpu_supports("macrofusion");
}

bool get_mmx() {
	return __builtin_cpu_supports("mmx");
}

bool get_movbe() {
	return __builtin_cpu_supports("movbe");
}

bool get_movdir64b() {
	return __builtin_cpu_supports("movdir64b");
}

bool get_movdiri() {
	return __builtin_cpu_supports("movdiri");
}

bool get_movrs() {
	return __builtin_cpu_supports("movrs");
}

bool get_mwaitx() {
	return __builtin_cpu_supports("mwaitx");
}

bool get_ndd() {
	return __builtin_cpu_supports("ndd");
}

bool get_nf() {
	return __builtin_cpu_supports("nf");
}

bool get_no_bypass_delay() {
	return __builtin_cpu_supports("no-bypass-delay");
}

bool get_no_bypass_delay_blend() {
	return __builtin_cpu_supports("no-bypass-delay-blend");
}

bool get_no_bypass_delay_mov() {
	return __builtin_cpu_supports("no-bypass-delay-mov");
}

bool get_no_bypass_delay_shuffle() {
	return __builtin_cpu_supports("no-bypass-delay-shuffle");
}

bool get_nopl() {
	return __builtin_cpu_supports("nopl");
}

bool get_pad_short_functions() {
	return __builtin_cpu_supports("pad-short-functions");
}

bool get_pclmul() {
	return __builtin_cpu_supports("pclmul");
}

bool get_pconfig() {
	return __builtin_cpu_supports("pconfig");
}

bool get_pku() {
	return __builtin_cpu_supports("pku");
}

bool get_popcnt() {
	return __builtin_cpu_supports("popcnt");
}

bool get_ppx() {
	return __builtin_cpu_supports("ppx");
}

bool get_prefer_128_bit() {
	return __builtin_cpu_supports("prefer-128-bit");
}

bool get_prefer_256_bit() {
	return __builtin_cpu_supports("prefer-256-bit");
}

bool get_prefer_mask_registers() {
	return __builtin_cpu_supports("prefer-mask-registers");
}

bool get_prefer_movmsk_over_vtest() {
	return __builtin_cpu_supports("prefer-movmsk-over-vtest");
}

bool get_prefer_no_gather() {
	return __builtin_cpu_supports("prefer-no-gather");
}

bool get_prefer_no_scatter() {
	return __builtin_cpu_supports("prefer-no-scatter");
}

bool get_prefetchi() {
	return __builtin_cpu_supports("prefetchi");
}

bool get_prfchw() {
	return __builtin_cpu_supports("prfchw");
}

bool get_ptwrite() {
	return __builtin_cpu_supports("ptwrite");
}

bool get_push2pop2() {
	return __builtin_cpu_supports("push2pop2");
}

bool get_raoint() {
	return __builtin_cpu_supports("raoint");
}

bool get_rdpid() {
	return __builtin_cpu_supports("rdpid");
}

bool get_rdpru() {
	return __builtin_cpu_supports("rdpru");
}

bool get_rdrnd() {
	return __builtin_cpu_supports("rdrnd");
}

bool get_rdseed() {
	return __builtin_cpu_supports("rdseed");
}

bool get_retpoline() {
	return __builtin_cpu_supports("retpoline");
}

bool get_retpoline_external_thunk() {
	return __builtin_cpu_supports("retpoline-external-thunk");
}

bool get_retpoline_indirect_branches() {
	return __builtin_cpu_supports("retpoline-indirect-branches");
}

bool get_retpoline_indirect_calls() {
	return __builtin_cpu_supports("retpoline-indirect-calls");
}

bool get_rtm() {
	return __builtin_cpu_supports("rtm");
}

bool get_sahf() {
	return __builtin_cpu_supports("sahf");
}

bool get_sbb_dep_breaking() {
	return __builtin_cpu_supports("sbb-dep-breaking");
}

bool get_serialize() {
	return __builtin_cpu_supports("serialize");
}

bool get_seses() {
	return __builtin_cpu_supports("seses");
}

bool get_sgx() {
	return __builtin_cpu_supports("sgx");
}

bool get_sha() {
	return __builtin_cpu_supports("sha");
}

bool get_sha512() {
	return __builtin_cpu_supports("sha512");
}

bool get_shstk() {
	return __builtin_cpu_supports("shstk");
}

bool get_slow_3ops_lea() {
	return __builtin_cpu_supports("slow-3ops-lea");
}

bool get_slow_incdec() {
	return __builtin_cpu_supports("slow-incdec");
}

bool get_slow_lea() {
	return __builtin_cpu_supports("slow-lea");
}

bool get_slow_pmaddwd() {
	return __builtin_cpu_supports("slow-pmaddwd");
}

bool get_slow_pmulld() {
	return __builtin_cpu_supports("slow-pmulld");
}

bool get_slow_shld() {
	return __builtin_cpu_supports("slow-shld");
}

bool get_slow_two_mem_ops() {
	return __builtin_cpu_supports("slow-two-mem-ops");
}

bool get_slow_unaligned_mem_16() {
	return __builtin_cpu_supports("slow-unaligned-mem-16");
}

bool get_slow_unaligned_mem_32() {
	return __builtin_cpu_supports("slow-unaligned-mem-32");
}

bool get_sm3() {
	return __builtin_cpu_supports("sm3");
}

bool get_sm4() {
	return __builtin_cpu_supports("sm4");
}

bool get_soft_float() {
	return __builtin_cpu_supports("soft-float");
}

bool get_sse() {
	return __builtin_cpu_supports("sse");
}

bool get_sse_unaligned_mem() {
	return __builtin_cpu_supports("sse-unaligned-mem");
}

bool get_sse2() {
	return __builtin_cpu_supports("sse2");
}

bool get_sse3() {
	return __builtin_cpu_supports("sse3");
}

bool get_sse4_1() {
	return __builtin_cpu_supports("sse4.1");
}

bool get_sse4_2() {
	return __builtin_cpu_supports("sse4.2");
}

bool get_sse4a() {
	return __builtin_cpu_supports("sse4a");
}

bool get_ssse3() {
	return __builtin_cpu_supports("ssse3");
}

bool get_tagged_globals() {
	return __builtin_cpu_supports("tagged-globals");
}

bool get_tbm() {
	return __builtin_cpu_supports("tbm");
}

bool get_tsxldtrk() {
	return __builtin_cpu_supports("tsxldtrk");
}

bool get_tuning_fast_imm_vector_shift() {
	return __builtin_cpu_supports("tuning-fast-imm-vector-shift");
}

bool get_uintr() {
	return __builtin_cpu_supports("uintr");
}

bool get_use_glm_div_sqrt_costs() {
	return __builtin_cpu_supports("use-glm-div-sqrt-costs");
}

bool get_use_slm_arith_costs() {
	return __builtin_cpu_supports("use-slm-arith-costs");
}

bool get_usermsr() {
	return __builtin_cpu_supports("usermsr");
}

bool get_vaes() {
	return __builtin_cpu_supports("vaes");
}

bool get_vpclmulqdq() {
	return __builtin_cpu_supports("vpclmulqdq");
}

bool get_vzeroupper() {
	return __builtin_cpu_supports("vzeroupper");
}

bool get_waitpkg() {
	return __builtin_cpu_supports("waitpkg");
}

bool get_wbnoinvd() {
	return __builtin_cpu_supports("wbnoinvd");
}

bool get_widekl() {
	return __builtin_cpu_supports("widekl");
}

bool get_x87() {
	return __builtin_cpu_supports("x87");
}

bool get_xop() {
	return __builtin_cpu_supports("xop");
}

bool get_xsave() {
	return __builtin_cpu_supports("xsave");
}

bool get_xsavec() {
	return __builtin_cpu_supports("xsavec");
}

bool get_xsaveopt() {
	return __builtin_cpu_supports("xsaveopt");
}

bool get_xsaves() {
	return __builtin_cpu_supports("xsaves");
}

bool get_zu() {
	return __builtin_cpu_supports("zu");
}

