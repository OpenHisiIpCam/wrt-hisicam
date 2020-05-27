m = Map("gohisicam", translate("GoHisiCam setttings"), translate("Please fill settings according your hardware"))

memory = m:section(TypedSection, "memory_settings", nil)
    ram_size = memory:option(Value, "ram_size", "Total RAM");                                                                
        ram_size.optional=false;                                                                                              
        ram_size.rmempty = false;                                                                                             
    ram_linux_size = memory:option(Value, "ram_linux_size", "Linux RAM");                                                         
        ram_linux_size.optional=false;                                                          
        ram_linux_size.rmempty = false;                                                         
    ram_mpp_size = memory:option(Value, "ram_mpp_size", "MPP RAM");                                 
        ram_mpp_size.optional=false;                                 
        ram_mpp_size.rmempty = false;                                
                                                                             
cmos =  m:section(TypedSection, "cmos_settings", nil)                
    cmos_driver = cmos:option(Value, "cmos_driver", "Driver name");                              
        cmos_driver.optional=false;         
        cmos_driver.rmempty = false;  
                                              
    cmos_data = cmos:option(Value, "cmos_data", "Data connection type");
        cmos_data.optional=false;     
        cmos_data.rmempty = false;    
                                              
    cmos_control = cmos:option(Value, "cmos_control", "Control connection type");
        cmos_control.optional=false;  
        cmos_control.rmempty = false; 
                                              
    cmos_bus = cmos:option(Value, "cmos_bus", "Control bus number");
        cmos_bus.optional=false;      
        cmos_bus.rmempty = false;     

deprecated =  m:section(TypedSection, "deprecated_settings", nil)
    chip = deprecated:option(Value, "chip", "Chip name");
        chip.optional=false;
        chip.rmempty = false;

return m       
