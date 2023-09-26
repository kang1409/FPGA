-makelib xcelium_lib/xpm -sv \
  "F:/vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "F:/vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../colorbar.srcs/sources_1/ip/pll_108/pll_108_clk_wiz.v" \
  "../../../../colorbar.srcs/sources_1/ip/pll_108/pll_108.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

