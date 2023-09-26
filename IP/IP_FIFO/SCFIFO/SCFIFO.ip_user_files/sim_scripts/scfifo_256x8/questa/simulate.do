onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib scfifo_256x8_opt

do {wave.do}

view wave
view structure
view signals

do {scfifo_256x8.udo}

run -all

quit -force
