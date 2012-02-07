#!/bin/bash

TESTS=1
TMPDIR=$TEST_TMPDIR

cat <<EOF > $TMPDIR/expected
  Processors | physical = 1, cores = 2, virtual = 2, hyperthreading = no
      Speeds | 2x1300.000
      Models | 2xGenuine Intel(R) CPU U7300 @ 1.30GHz
      Caches | 2x3072 KB
EOF

cat <<EOF > $TMPDIR/in
processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 23
model name	: Genuine Intel(R) CPU           U7300  @ 1.30GHz
stepping	: 10
cpu MHz		: 1300.000
cache size	: 3072 KB
physical id	: 0
siblings	: 2
core id		: 0
cpu cores	: 2
apicid		: 0
initial apicid	: 0
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 13
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx lm constant_tsc arch_perfmon pebs bts aperfmperf pni dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm sse4_1 xsave lahf_lm tpr_shadow vnmi flexpriority
bogomips	: 2678.10
clflush size	: 64
cache_alignment	: 64
address sizes	: 36 bits physical, 48 bits virtual
power management:

processor	: 1
vendor_id	: GenuineIntel
cpu family	: 6
model		: 23
model name	: Genuine Intel(R) CPU           U7300  @ 1.30GHz
stepping	: 10
cpu MHz		: 1300.000
cache size	: 3072 KB
physical id	: 0
siblings	: 2
core id		: 1
cpu cores	: 2
apicid		: 1
initial apicid	: 1
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 13
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx lm constant_tsc arch_perfmon pebs bts aperfmperf pni dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm sse4_1 xsave lahf_lm tpr_shadow vnmi flexpriority
bogomips	: 2677.92
clflush size	: 64
cache_alignment	: 64
address sizes	: 36 bits physical, 48 bits virtual
power management:

EOF
parse_proc_cpuinfo $TMPDIR/in > $TMPDIR/got
no_diff $TMPDIR/got $TMPDIR/expected
