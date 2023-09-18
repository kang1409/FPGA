-makelib xcelium_lib/xpm -sv \
  "F:/vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "F:/vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/blk_mem_gen_v8_4_4 \
  "../../../ipstatic/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../RAM.srcs/sources_1/ip/ram_256x8/sim/ram_256x8.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

