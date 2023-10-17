onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+rom_vga -L blk_mem_gen_v8_4_4 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.rom_vga xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {rom_vga.udo}

run -all

endsim

quit -force
