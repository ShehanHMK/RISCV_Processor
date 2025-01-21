transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+D:/ACA\ semester\ 5/Digital\ System\ Design/Processor\ Design {D:/ACA semester 5/Digital System Design/Processor Design/Reg_file.sv}
vlog -sv -work work +incdir+D:/ACA\ semester\ 5/Digital\ System\ Design/Processor\ Design {D:/ACA semester 5/Digital System Design/Processor Design/Sign_extender.sv}
vlog -sv -work work +incdir+D:/ACA\ semester\ 5/Digital\ System\ Design/Processor\ Design {D:/ACA semester 5/Digital System Design/Processor Design/alu.sv}
vlog -sv -work work +incdir+D:/ACA\ semester\ 5/Digital\ System\ Design/Processor\ Design {D:/ACA semester 5/Digital System Design/Processor Design/testbenches1.sv}

vlog -sv -work work +incdir+D:/ACA\ semester\ 5/Digital\ System\ Design/Processor\ Design/Final\ Design\ files/.. {D:/ACA semester 5/Digital System Design/Processor Design/Final Design files/../testbenches1.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  alu_tb

add wave *
view structure
view signals
run -all
