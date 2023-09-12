######################################################################
#
# File name : tb_simple_fsm_simulate.do
# Created on: Thu Sep 07 17:10:01 +0800 2023
#
# Auto generated by Vivado for 'behavioral' simulation
#
######################################################################
vsim -voptargs="+acc" -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.tb_simple_fsm xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {tb_simple_fsm_wave.do}

view wave
view structure
view signals

do {tb_simple_fsm.udo}

run 1000ns
