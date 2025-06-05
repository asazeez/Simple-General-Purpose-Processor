transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/student2/asazeez/Desktop/COE 328 labs/Lab 6/decoder.vhd}

