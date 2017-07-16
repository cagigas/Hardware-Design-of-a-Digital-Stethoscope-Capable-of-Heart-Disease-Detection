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
if {[file exist lpm] ==0} 	{ 
  exec vlib lpm 
  exec vmap lpm lpm}
vcom -93 -work lpm c:/altera/12.1/quartus//eda/sim_lib/220pack.vhd 
vcom -93 -work lpm c:/altera/12.1/quartus//eda/sim_lib/220model.vhd 
if {[file exist altera_mf] ==0} 	{ 
  exec vlib altera_mf 
  exec vmap altera_mf altera_mf}
vcom -93 -work altera_mf c:/altera/12.1/quartus//eda/sim_lib/altera_mf_components.vhd 
vcom -93 -work altera_mf c:/altera/12.1/quartus//eda/sim_lib/altera_mf.vhd 
if {[file exist sgate] ==0} 	{ 
  exec vlib sgate 
  exec vmap sgate sgate} 
vcom -93 -work sgate c:/altera/12.1/quartus//eda/sim_lib/sgate_pack.vhd  
vcom -93 -work sgate c:/altera/12.1/quartus//eda/sim_lib/sgate.vhd 
vcom -93 FirCM.vho 
vlog -work work tb_FirCM.v
vsim  tb_FirCM -t 1ps 
do FirCM_wave.do 
run 0ns
