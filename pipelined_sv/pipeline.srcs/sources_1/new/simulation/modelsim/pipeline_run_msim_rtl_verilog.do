transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+D:/ACA\ semester\ 5/Digital\ System\ Design/Pipeline\ processor\ design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new {D:/ACA semester 5/Digital System Design/Pipeline processor design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new/register.sv}
vlog -sv -work work +incdir+D:/ACA\ semester\ 5/Digital\ System\ Design/Pipeline\ processor\ design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new {D:/ACA semester 5/Digital System Design/Pipeline processor design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new/program_count.sv}
vlog -sv -work work +incdir+D:/ACA\ semester\ 5/Digital\ System\ Design/Pipeline\ processor\ design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new {D:/ACA semester 5/Digital System Design/Pipeline processor design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new/Mux.sv}
vlog -sv -work work +incdir+D:/ACA\ semester\ 5/Digital\ System\ Design/Pipeline\ processor\ design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new {D:/ACA semester 5/Digital System Design/Pipeline processor design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new/Microprograming.sv}
vlog -sv -work work +incdir+D:/ACA\ semester\ 5/Digital\ System\ Design/Pipeline\ processor\ design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new {D:/ACA semester 5/Digital System Design/Pipeline processor design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new/mem_pipe.sv}
vlog -sv -work work +incdir+D:/ACA\ semester\ 5/Digital\ System\ Design/Pipeline\ processor\ design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new {D:/ACA semester 5/Digital System Design/Pipeline processor design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new/Instruction_mem.sv}
vlog -sv -work work +incdir+D:/ACA\ semester\ 5/Digital\ System\ Design/Pipeline\ processor\ design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new {D:/ACA semester 5/Digital System Design/Pipeline processor design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new/Imm_gen.sv}
vlog -sv -work work +incdir+D:/ACA\ semester\ 5/Digital\ System\ Design/Pipeline\ processor\ design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new {D:/ACA semester 5/Digital System Design/Pipeline processor design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new/IF_pipe.sv}
vlog -sv -work work +incdir+D:/ACA\ semester\ 5/Digital\ System\ Design/Pipeline\ processor\ design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new {D:/ACA semester 5/Digital System Design/Pipeline processor design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new/ID_pipe.sv}
vlog -sv -work work +incdir+D:/ACA\ semester\ 5/Digital\ System\ Design/Pipeline\ processor\ design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new {D:/ACA semester 5/Digital System Design/Pipeline processor design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new/EX_pipe.sv}
vlog -sv -work work +incdir+D:/ACA\ semester\ 5/Digital\ System\ Design/Pipeline\ processor\ design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new {D:/ACA semester 5/Digital System Design/Pipeline processor design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new/Data_mem.sv}
vlog -sv -work work +incdir+D:/ACA\ semester\ 5/Digital\ System\ Design/Pipeline\ processor\ design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new {D:/ACA semester 5/Digital System Design/Pipeline processor design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new/datapath.sv}
vlog -sv -work work +incdir+D:/ACA\ semester\ 5/Digital\ System\ Design/Pipeline\ processor\ design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new {D:/ACA semester 5/Digital System Design/Pipeline processor design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new/branch_pre.sv}
vlog -sv -work work +incdir+D:/ACA\ semester\ 5/Digital\ System\ Design/Pipeline\ processor\ design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new {D:/ACA semester 5/Digital System Design/Pipeline processor design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new/ALU.sv}
vlog -sv -work work +incdir+D:/ACA\ semester\ 5/Digital\ System\ Design/Pipeline\ processor\ design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new {D:/ACA semester 5/Digital System Design/Pipeline processor design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new/Adder.sv}

vlog -sv -work work +incdir+D:/ACA\ semester\ 5/Digital\ System\ Design/Pipeline\ processor\ design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new/../../sim_1/new {D:/ACA semester 5/Digital System Design/Pipeline processor design/pipeline_without_forwarding/pipeline/pipeline.srcs/sources_1/new/../../sim_1/new/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
