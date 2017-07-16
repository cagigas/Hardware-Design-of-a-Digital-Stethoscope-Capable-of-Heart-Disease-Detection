if {[file exist [project env]] > 0} {project close}
if {[file exist "FirCM.mpf"] == 0} {
	project new . FirCM FirCM
} else {
project open FirCM
}
if {[file exist work] ==0} 	{
  exec vlib work
  exec vmap work work
}
vlog -work work c:/altera/12.1/quartus//eda/sim_lib/220model.v
vlog -work work c:/altera/12.1/quartus//eda/sim_lib/sgate.v
vlog -work work c:/altera/12.1/quartus//eda/sim_lib/altera_mf.v
vlog -work work FirCM.vo
vlog -work work tb_FirCM.v
vsim tb_FirCM +nowarnTSCALE +nowarnTFMPC 
do FirCM_wave.do 
run 0ns
