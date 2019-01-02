set_global_assignment -entity "altpll0" -library "lib_altpll0" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "altpll0" -library "lib_altpll0" -name IP_TOOL_VERSION "18.0"
set_global_assignment -entity "altpll0" -library "lib_altpll0" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_altpll0" -name SPD_FILE [file join $::quartus(sip_path) "altpll0.spd"]

set_global_assignment -library "lib_altpll0" -name MISC_FILE [file join $::quartus(sip_path) "altpll0_sim/altpll0.vo"]
