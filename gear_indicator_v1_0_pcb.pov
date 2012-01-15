//POVRay-File created by 3d41.ulp v20110101
//Z:/Projects/simulator/Gear_Indicator/gear_indicator_v1_0.brd
//1/14/2012 9:56:59 PM

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 1;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

#declare global_use_radiosity = on;

#declare global_ambient_mul = 1;
#declare global_ambient_mul_emit = 0;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 2;
#declare pin_short = on;

#declare e3d_environment = off;

#local cam_x = 0;
#local cam_y = 273;
#local cam_z = -146;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -6;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 0;
#local pcb_rotate_z = 0;

#local pcb_board = on;
#local pcb_parts = on;
#local pcb_wire_bridges = off;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 21;
#local lgt1_pos_y = 36;
#local lgt1_pos_z = 33;
#local lgt1_intense = 0.750384;
#local lgt2_pos_x = -21;
#local lgt2_pos_y = 36;
#local lgt2_pos_z = 33;
#local lgt2_intense = 0.750384;
#local lgt3_pos_x = 21;
#local lgt3_pos_y = 36;
#local lgt3_pos_z = -22;
#local lgt3_intense = 0.750384;
#local lgt4_pos_x = -21;
#local lgt4_pos_y = 36;
#local lgt4_pos_z = -22;
#local lgt4_intense = 0.750384;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 55.550000;
#declare pcb_y_size = 63.490000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(670);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.535000,
}
#declare global_pcb_real_hole = 2.000000;

#include "e3d_tools.inc"
#include "e3d_user.inc"

global_settings{charset utf8}

#if(e3d_environment=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Animation data
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_flight=0;
#warning "No/not enough Animation Data available (min. 3 points) (Flight path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_view=0;
#warning "No/not enough Animation Data available (min. 3 points) (View path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//translates the camera that <0,0,0> is over the Eagle <0,0>
	//translate<-27.775000,0,-31.745000>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro GEAR_INDICATOR_V1_0(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<0.000000,0.000000><55.550000,0.000000>
<55.550000,0.000000><55.550000,63.490000>
<55.550000,63.490000><0.000000,63.490000>
<0.000000,63.490000><0.000000,0.000000>
texture{col_brd}}
}//End union(PCB)
//Holes(real)/Parts
cylinder{<52.070000,1,3.810000><52.070000,-5,3.810000>1.651000 texture{col_hls}}
cylinder{<3.810000,1,3.810000><3.810000,-5,3.810000>1.651000 texture{col_hls}}
cylinder{<3.810000,1,59.690000><3.810000,-5,59.690000>1.651000 texture{col_hls}}
cylinder{<52.070000,1,59.690000><52.070000,-5,59.690000>1.651000 texture{col_hls}}
//Holes(real)/Board
//Holes(real)/Vias
cylinder{<33.020000,0.095000,3.890000><33.020000,-1.595000,3.890000>1.498600 texture{col_hls}}
cylinder{<33.020000,0.095000,9.890000><33.020000,-1.595000,9.890000>1.498600 texture{col_hls}}
cylinder{<37.720000,0.095000,6.890000><37.720000,-1.595000,6.890000>1.498600 texture{col_hls}}
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_DIS_ELKO_2MM5_6MM3("0.33",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<17.780000,0.000000,8.890000>}#end		//Elko 2,5mm Pitch, 6mm  Diameter, 11,2mm High C1 0.33 E2,5-6
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_DIS_CERAMIC_25MM_50MM("0.1",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<12.700000,0.000000,8.890000>}#end		//ceramic disc capacitator C2 0.1 C025-025X050
#ifndef(pack_C3) #declare global_pack_C3=yes; object {CAP_DIS_ELKO_2MM5_6MM3("1000",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<49.530000,0.000000,26.670000>}#end		//Elko 2,5mm Pitch, 6mm  Diameter, 11,2mm High C3 1000 E2,5-6
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_DIS_CERAMIC_25MM_50MM("0.1",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<45.720000,0.000000,10.160000>}#end		//ceramic disc capacitator C4 0.1 C025-025X050
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_DIS_CERAMIC_25MM_50MM("0.1",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<33.020000,0.000000,16.510000>}#end		//ceramic disc capacitator C5 0.1 C025-025X050
#ifndef(pack_C6) #declare global_pack_C6=yes; object {CAP_DIS_CERAMIC_25MM_50MM("0.1",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<11.430000,0.000000,12.700000>}#end		//ceramic disc capacitator C6 0.1 C025-025X050
#ifndef(pack_C7) #declare global_pack_C7=yes; object {CAP_DIS_CERAMIC_25MM_50MM("0.1",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<25.400000,0.000000,12.700000>}#end		//ceramic disc capacitator C7 0.1 C025-025X050
#ifndef(pack_IC2) #declare global_pack_IC2=yes; object {IC_DIS_DIP14("74ALS08N","ST",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<11.430000,0.000000,22.860000>translate<0,3.000000,0> }#end		//DIP14 IC2 74ALS08N DIL14
#ifndef(pack_IC2) object{SOCKET_DIP14()rotate<0,-270.000000,0> rotate<0,0,0> translate<11.430000,0.000000,22.860000>}#end					//IC-Sockel 14Pin IC2 74ALS08N
#ifndef(pack_IC3) #declare global_pack_IC3=yes; object {IC_DIS_DIP14("74ALS04N","ST",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<25.400000,0.000000,22.860000>translate<0,3.000000,0> }#end		//DIP14 IC3 74ALS04N DIL14
#ifndef(pack_IC3) object{SOCKET_DIP14()rotate<0,-270.000000,0> rotate<0,0,0> translate<25.400000,0.000000,22.860000>}#end					//IC-Sockel 14Pin IC3 74ALS04N
#ifndef(pack_IC4) #declare global_pack_IC4=yes; object {TR_TO220_3_V("7805TV",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<15.240000,0.000000,1.270000>}#end		//TO220 vertical straight leads IC4 7805TV TO220V
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<33.020000,0.000000,25.400000>}#end		//Discrete Resistor 0,3W 10MM Grid R1 10K 0207/10
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<43.180000,0.000000,30.480000>}#end		//Discrete Resistor 0,3W 10MM Grid R3 1K 0207/10
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<38.100000,0.000000,22.860000>}#end		//Discrete Resistor 0,3W 10MM Grid R4 10K 0207/10
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<7.620000,0.000000,40.640000>}#end		//Discrete Resistor 0,3W 10MM Grid R5 10K 0207/10
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_DIS_0207_10MM(texture{pigment{Yellow}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Violet*1.2}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<31.750000,0.000000,40.640000>}#end		//Discrete Resistor 0,3W 10MM Grid R6 4K7 0207/10
#ifndef(pack_R7) #declare global_pack_R7=yes; object {RES_DIS_0207_10MM(texture{pigment{Yellow}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Violet*1.2}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<11.430000,0.000000,40.640000>}#end		//Discrete Resistor 0,3W 10MM Grid R7 4K7 0207/10
#ifndef(pack_R8) #declare global_pack_R8=yes; object {RES_DIS_0207_10MM(texture{pigment{Yellow}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Violet*1.2}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<21.590000,0.000000,40.640000>}#end		//Discrete Resistor 0,3W 10MM Grid R8 4K7 0207/10
#ifndef(pack_T1) #declare global_pack_T1=yes; object {TR_TO92_G("2N3904",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<26.670000,0.000000,45.720000>}#end		//TO92 bend vertical T1 2N3904 TO92
#ifndef(pack_T2) #declare global_pack_T2=yes; object {TR_TO92_G("2N3904",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<36.830000,0.000000,45.720000>}#end		//TO92 bend vertical T2 2N3904 TO92
#ifndef(pack_T3) #declare global_pack_T3=yes; object {TR_TO92_G("2N3904",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<16.510000,0.000000,45.720000>}#end		//TO92 bend vertical T3 2N3904 TO92
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<19.050000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<16.510000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<12.700000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<12.700000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<48.260000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<50.800000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_C4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<46.990000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_C4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<44.450000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_C5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<33.020000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_C5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<33.020000,0,17.780000> texture{col_thl}}
#ifndef(global_pack_C6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<10.160000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_C6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<12.700000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_C7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<24.130000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_C7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<26.670000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<41.910000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<41.910000,0,19.050000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<41.910000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<41.910000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<49.530000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<49.530000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<49.530000,0,19.050000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<49.530000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<7.620000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<7.620000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<7.620000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<7.620000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<7.620000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<7.620000,0,17.780000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<7.620000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<15.240000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<15.240000,0,17.780000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<15.240000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<15.240000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<15.240000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<15.240000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<15.240000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<21.590000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<21.590000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<21.590000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<21.590000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<21.590000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<21.590000,0,17.780000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<21.590000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<29.210000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<29.210000,0,17.780000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<29.210000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<29.210000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<29.210000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<29.210000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<29.210000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_IC4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<17.780000,0,3.810000> texture{col_thl}}
#ifndef(global_pack_IC4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<15.240000,0,3.810000> texture{col_thl}}
#ifndef(global_pack_IC4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<12.700000,0,3.810000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(4.013200,2.997200,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<33.020000,0,3.890000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(4.013200,2.997200,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<37.720000,0,6.890000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(4.013200,2.997200,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<33.020000,0,9.890000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.200000,0.800000,1,16,0+global_tmp,0) rotate<0,-270.000000,0>translate<45.720000,0,54.610000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.200000,0.800000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<40.640000,0,54.610000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.200000,0.800000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<35.560000,0,54.610000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.200000,0.800000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<30.480000,0,54.610000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.200000,0.800000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<25.400000,0,54.610000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.200000,0.800000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<20.320000,0,54.610000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.200000,0.800000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<15.240000,0,54.610000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.200000,0.800000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<10.160000,0,54.610000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<33.020000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<33.020000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<49.530000,0,39.370000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<44.450000,0,39.370000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<46.990000,0,36.830000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<48.260000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<38.100000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<38.100000,0,17.780000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<38.100000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<7.620000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<7.620000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<31.750000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<31.750000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<11.430000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<11.430000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<21.590000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<21.590000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<26.670000,0,46.990000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<24.765000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<26.670000,0,44.450000> texture{col_thl}}
#ifndef(global_pack_T2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<36.830000,0,46.990000> texture{col_thl}}
#ifndef(global_pack_T2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<34.925000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_T2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<36.830000,0,44.450000> texture{col_thl}}
#ifndef(global_pack_T3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<16.510000,0,46.990000> texture{col_thl}}
#ifndef(global_pack_T3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<14.605000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_T3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<16.510000,0,44.450000> texture{col_thl}}
//Pads/Vias
#end
#if(pcb_wires=on)
union{
}
#end
#if(pcb_polygons=on)
union{
//Polygons
texture{col_pol}
}
#end
union{
cylinder{<19.050000,0.038000,8.890000><19.050000,-1.538000,8.890000>0.406400}
cylinder{<16.510000,0.038000,8.890000><16.510000,-1.538000,8.890000>0.406400}
cylinder{<12.700000,0.038000,7.620000><12.700000,-1.538000,7.620000>0.406400}
cylinder{<12.700000,0.038000,10.160000><12.700000,-1.538000,10.160000>0.406400}
cylinder{<48.260000,0.038000,26.670000><48.260000,-1.538000,26.670000>0.406400}
cylinder{<50.800000,0.038000,26.670000><50.800000,-1.538000,26.670000>0.406400}
cylinder{<46.990000,0.038000,10.160000><46.990000,-1.538000,10.160000>0.406400}
cylinder{<44.450000,0.038000,10.160000><44.450000,-1.538000,10.160000>0.406400}
cylinder{<33.020000,0.038000,15.240000><33.020000,-1.538000,15.240000>0.406400}
cylinder{<33.020000,0.038000,17.780000><33.020000,-1.538000,17.780000>0.406400}
cylinder{<10.160000,0.038000,12.700000><10.160000,-1.538000,12.700000>0.406400}
cylinder{<12.700000,0.038000,12.700000><12.700000,-1.538000,12.700000>0.406400}
cylinder{<24.130000,0.038000,12.700000><24.130000,-1.538000,12.700000>0.406400}
cylinder{<26.670000,0.038000,12.700000><26.670000,-1.538000,12.700000>0.406400}
cylinder{<41.910000,0.038000,21.590000><41.910000,-1.538000,21.590000>0.406400}
cylinder{<41.910000,0.038000,19.050000><41.910000,-1.538000,19.050000>0.406400}
cylinder{<41.910000,0.038000,16.510000><41.910000,-1.538000,16.510000>0.406400}
cylinder{<41.910000,0.038000,13.970000><41.910000,-1.538000,13.970000>0.406400}
cylinder{<49.530000,0.038000,13.970000><49.530000,-1.538000,13.970000>0.406400}
cylinder{<49.530000,0.038000,16.510000><49.530000,-1.538000,16.510000>0.406400}
cylinder{<49.530000,0.038000,19.050000><49.530000,-1.538000,19.050000>0.406400}
cylinder{<49.530000,0.038000,21.590000><49.530000,-1.538000,21.590000>0.406400}
cylinder{<7.620000,0.038000,30.480000><7.620000,-1.538000,30.480000>0.406400}
cylinder{<7.620000,0.038000,27.940000><7.620000,-1.538000,27.940000>0.406400}
cylinder{<7.620000,0.038000,25.400000><7.620000,-1.538000,25.400000>0.406400}
cylinder{<7.620000,0.038000,22.860000><7.620000,-1.538000,22.860000>0.406400}
cylinder{<7.620000,0.038000,20.320000><7.620000,-1.538000,20.320000>0.406400}
cylinder{<7.620000,0.038000,17.780000><7.620000,-1.538000,17.780000>0.406400}
cylinder{<7.620000,0.038000,15.240000><7.620000,-1.538000,15.240000>0.406400}
cylinder{<15.240000,0.038000,15.240000><15.240000,-1.538000,15.240000>0.406400}
cylinder{<15.240000,0.038000,17.780000><15.240000,-1.538000,17.780000>0.406400}
cylinder{<15.240000,0.038000,20.320000><15.240000,-1.538000,20.320000>0.406400}
cylinder{<15.240000,0.038000,22.860000><15.240000,-1.538000,22.860000>0.406400}
cylinder{<15.240000,0.038000,25.400000><15.240000,-1.538000,25.400000>0.406400}
cylinder{<15.240000,0.038000,27.940000><15.240000,-1.538000,27.940000>0.406400}
cylinder{<15.240000,0.038000,30.480000><15.240000,-1.538000,30.480000>0.406400}
cylinder{<21.590000,0.038000,30.480000><21.590000,-1.538000,30.480000>0.406400}
cylinder{<21.590000,0.038000,27.940000><21.590000,-1.538000,27.940000>0.406400}
cylinder{<21.590000,0.038000,25.400000><21.590000,-1.538000,25.400000>0.406400}
cylinder{<21.590000,0.038000,22.860000><21.590000,-1.538000,22.860000>0.406400}
cylinder{<21.590000,0.038000,20.320000><21.590000,-1.538000,20.320000>0.406400}
cylinder{<21.590000,0.038000,17.780000><21.590000,-1.538000,17.780000>0.406400}
cylinder{<21.590000,0.038000,15.240000><21.590000,-1.538000,15.240000>0.406400}
cylinder{<29.210000,0.038000,15.240000><29.210000,-1.538000,15.240000>0.406400}
cylinder{<29.210000,0.038000,17.780000><29.210000,-1.538000,17.780000>0.406400}
cylinder{<29.210000,0.038000,20.320000><29.210000,-1.538000,20.320000>0.406400}
cylinder{<29.210000,0.038000,22.860000><29.210000,-1.538000,22.860000>0.406400}
cylinder{<29.210000,0.038000,25.400000><29.210000,-1.538000,25.400000>0.406400}
cylinder{<29.210000,0.038000,27.940000><29.210000,-1.538000,27.940000>0.406400}
cylinder{<29.210000,0.038000,30.480000><29.210000,-1.538000,30.480000>0.406400}
cylinder{<17.780000,0.038000,3.810000><17.780000,-1.538000,3.810000>0.508000}
cylinder{<15.240000,0.038000,3.810000><15.240000,-1.538000,3.810000>0.508000}
cylinder{<12.700000,0.038000,3.810000><12.700000,-1.538000,3.810000>0.508000}
cylinder{<45.720000,0.038000,54.610000><45.720000,-1.538000,54.610000>0.400000}
cylinder{<40.640000,0.038000,54.610000><40.640000,-1.538000,54.610000>0.400000}
cylinder{<35.560000,0.038000,54.610000><35.560000,-1.538000,54.610000>0.400000}
cylinder{<30.480000,0.038000,54.610000><30.480000,-1.538000,54.610000>0.400000}
cylinder{<25.400000,0.038000,54.610000><25.400000,-1.538000,54.610000>0.400000}
cylinder{<20.320000,0.038000,54.610000><20.320000,-1.538000,54.610000>0.400000}
cylinder{<15.240000,0.038000,54.610000><15.240000,-1.538000,54.610000>0.400000}
cylinder{<10.160000,0.038000,54.610000><10.160000,-1.538000,54.610000>0.400000}
cylinder{<33.020000,0.038000,30.480000><33.020000,-1.538000,30.480000>0.406400}
cylinder{<33.020000,0.038000,20.320000><33.020000,-1.538000,20.320000>0.406400}
cylinder{<49.530000,0.038000,39.370000><49.530000,-1.538000,39.370000>0.406400}
cylinder{<44.450000,0.038000,39.370000><44.450000,-1.538000,39.370000>0.406400}
cylinder{<46.990000,0.038000,36.830000><46.990000,-1.538000,36.830000>0.406400}
cylinder{<48.260000,0.038000,30.480000><48.260000,-1.538000,30.480000>0.406400}
cylinder{<38.100000,0.038000,30.480000><38.100000,-1.538000,30.480000>0.406400}
cylinder{<38.100000,0.038000,17.780000><38.100000,-1.538000,17.780000>0.406400}
cylinder{<38.100000,0.038000,27.940000><38.100000,-1.538000,27.940000>0.406400}
cylinder{<7.620000,0.038000,35.560000><7.620000,-1.538000,35.560000>0.406400}
cylinder{<7.620000,0.038000,45.720000><7.620000,-1.538000,45.720000>0.406400}
cylinder{<31.750000,0.038000,35.560000><31.750000,-1.538000,35.560000>0.406400}
cylinder{<31.750000,0.038000,45.720000><31.750000,-1.538000,45.720000>0.406400}
cylinder{<11.430000,0.038000,35.560000><11.430000,-1.538000,35.560000>0.406400}
cylinder{<11.430000,0.038000,45.720000><11.430000,-1.538000,45.720000>0.406400}
cylinder{<21.590000,0.038000,35.560000><21.590000,-1.538000,35.560000>0.406400}
cylinder{<21.590000,0.038000,45.720000><21.590000,-1.538000,45.720000>0.406400}
cylinder{<26.670000,0.038000,46.990000><26.670000,-1.538000,46.990000>0.406400}
cylinder{<24.765000,0.038000,45.720000><24.765000,-1.538000,45.720000>0.406400}
cylinder{<26.670000,0.038000,44.450000><26.670000,-1.538000,44.450000>0.406400}
cylinder{<36.830000,0.038000,46.990000><36.830000,-1.538000,46.990000>0.406400}
cylinder{<34.925000,0.038000,45.720000><34.925000,-1.538000,45.720000>0.406400}
cylinder{<36.830000,0.038000,44.450000><36.830000,-1.538000,44.450000>0.406400}
cylinder{<16.510000,0.038000,46.990000><16.510000,-1.538000,46.990000>0.406400}
cylinder{<14.605000,0.038000,45.720000><14.605000,-1.538000,45.720000>0.406400}
cylinder{<16.510000,0.038000,44.450000><16.510000,-1.538000,44.450000>0.406400}
//Holes(fast)/Vias
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.922975,0.000000,60.850859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.651813,0.000000,60.579694>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.997360,0> translate<44.651813,0.000000,60.579694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.651813,0.000000,60.579694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.651813,0.000000,60.037363>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.651813,0.000000,60.037363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.651813,0.000000,60.037363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.922975,0.000000,59.766200>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<44.651813,0.000000,60.037363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.922975,0.000000,59.766200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.194141,0.000000,59.766200>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,0.000000,0> translate<44.922975,0.000000,59.766200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.194141,0.000000,59.766200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.465306,0.000000,60.037363>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<45.194141,0.000000,59.766200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.465306,0.000000,60.037363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.465306,0.000000,60.579694>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,90.000000,0> translate<45.465306,0.000000,60.579694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.465306,0.000000,60.579694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.736472,0.000000,60.850859>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,-44.997030,0> translate<45.465306,0.000000,60.579694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.736472,0.000000,60.850859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.007638,0.000000,60.850859>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,0.000000,0> translate<45.736472,0.000000,60.850859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.007638,0.000000,60.850859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.278800,0.000000,60.579694>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.997360,0> translate<46.007638,0.000000,60.850859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.278800,0.000000,60.579694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.278800,0.000000,60.037363>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.278800,0.000000,60.037363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.278800,0.000000,60.037363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.007638,0.000000,59.766200>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.007638,0.000000,59.766200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.651813,0.000000,61.403356>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.278800,0.000000,61.403356>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,0.000000,0> translate<44.651813,0.000000,61.403356> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.278800,0.000000,61.403356>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.736472,0.000000,61.945684>}
box{<0,0,-0.076200><0.766968,0.036000,0.076200> rotate<0,44.997030,0> translate<45.736472,0.000000,61.945684> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.736472,0.000000,61.945684>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.278800,0.000000,62.488016>}
box{<0,0,-0.076200><0.766970,0.036000,0.076200> rotate<0,-44.997195,0> translate<45.736472,0.000000,61.945684> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.278800,0.000000,62.488016>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.651813,0.000000,62.488016>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,0.000000,0> translate<44.651813,0.000000,62.488016> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.842975,0.000000,60.850859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.571813,0.000000,60.579694>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.997360,0> translate<39.571813,0.000000,60.579694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.571813,0.000000,60.579694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.571813,0.000000,60.037363>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.571813,0.000000,60.037363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.571813,0.000000,60.037363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.842975,0.000000,59.766200>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<39.571813,0.000000,60.037363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.842975,0.000000,59.766200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.927638,0.000000,59.766200>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,0.000000,0> translate<39.842975,0.000000,59.766200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.927638,0.000000,59.766200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.198800,0.000000,60.037363>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<40.927638,0.000000,59.766200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.198800,0.000000,60.037363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.198800,0.000000,60.579694>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,90.000000,0> translate<41.198800,0.000000,60.579694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.198800,0.000000,60.579694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.927638,0.000000,60.850859>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.997360,0> translate<40.927638,0.000000,60.850859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.927638,0.000000,60.850859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.385306,0.000000,60.850859>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<40.385306,0.000000,60.850859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.385306,0.000000,60.850859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.385306,0.000000,60.308528>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.385306,0.000000,60.308528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.571813,0.000000,61.403356>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.198800,0.000000,61.403356>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,0.000000,0> translate<39.571813,0.000000,61.403356> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.198800,0.000000,61.403356>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.198800,0.000000,62.216850>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,90.000000,0> translate<41.198800,0.000000,62.216850> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.198800,0.000000,62.216850>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.927638,0.000000,62.488016>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.997360,0> translate<40.927638,0.000000,62.488016> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.927638,0.000000,62.488016>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.842975,0.000000,62.488016>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,0.000000,0> translate<39.842975,0.000000,62.488016> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.842975,0.000000,62.488016>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.571813,0.000000,62.216850>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.997360,0> translate<39.571813,0.000000,62.216850> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.571813,0.000000,62.216850>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.571813,0.000000,61.403356>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.571813,0.000000,61.403356> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.491813,0.000000,59.766200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.847638,0.000000,59.766200>}
box{<0,0,-0.076200><1.355825,0.036000,0.076200> rotate<0,0.000000,0> translate<34.491813,0.000000,59.766200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.847638,0.000000,59.766200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.118800,0.000000,60.037363>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<35.847638,0.000000,59.766200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.118800,0.000000,60.037363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.118800,0.000000,60.579694>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,90.000000,0> translate<36.118800,0.000000,60.579694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.118800,0.000000,60.579694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.847638,0.000000,60.850859>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.997360,0> translate<35.847638,0.000000,60.850859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.847638,0.000000,60.850859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.491813,0.000000,60.850859>}
box{<0,0,-0.076200><1.355825,0.036000,0.076200> rotate<0,0.000000,0> translate<34.491813,0.000000,60.850859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.118800,0.000000,61.403356>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.491813,0.000000,61.403356>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,0.000000,0> translate<34.491813,0.000000,61.403356> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.491813,0.000000,61.403356>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.491813,0.000000,62.216850>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,90.000000,0> translate<34.491813,0.000000,62.216850> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.491813,0.000000,62.216850>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.762975,0.000000,62.488016>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.997360,0> translate<34.491813,0.000000,62.216850> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.762975,0.000000,62.488016>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.305306,0.000000,62.488016>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<34.762975,0.000000,62.488016> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.305306,0.000000,62.488016>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.576472,0.000000,62.216850>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,44.997030,0> translate<35.305306,0.000000,62.488016> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.576472,0.000000,62.216850>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.576472,0.000000,61.403356>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.576472,0.000000,61.403356> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.065306,0.000000,59.766200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.065306,0.000000,60.850859>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,90.000000,0> translate<20.065306,0.000000,60.850859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.522975,0.000000,60.308528>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.607638,0.000000,60.308528>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,0.000000,0> translate<19.522975,0.000000,60.308528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.251812,0.000000,62.488016>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.251812,0.000000,61.403356>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.251812,0.000000,61.403356> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.251812,0.000000,61.403356>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.065306,0.000000,61.403356>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<19.251812,0.000000,61.403356> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.065306,0.000000,61.403356>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.794141,0.000000,61.945684>}
box{<0,0,-0.076200><0.606342,0.036000,0.076200> rotate<0,63.430630,0> translate<19.794141,0.000000,61.945684> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.794141,0.000000,61.945684>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.794141,0.000000,62.216850>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,90.000000,0> translate<19.794141,0.000000,62.216850> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.794141,0.000000,62.216850>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.065306,0.000000,62.488016>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,-44.997030,0> translate<19.794141,0.000000,62.216850> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.065306,0.000000,62.488016>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.607638,0.000000,62.488016>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<20.065306,0.000000,62.488016> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.607638,0.000000,62.488016>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.878800,0.000000,62.216850>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.997360,0> translate<20.607638,0.000000,62.488016> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.878800,0.000000,62.216850>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.878800,0.000000,61.674519>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.878800,0.000000,61.674519> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.878800,0.000000,61.674519>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.607638,0.000000,61.403356>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.607638,0.000000,61.403356> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.225306,0.000000,59.766200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.225306,0.000000,60.850859>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,90.000000,0> translate<30.225306,0.000000,60.850859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.682975,0.000000,60.308528>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.767638,0.000000,60.308528>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,0.000000,0> translate<29.682975,0.000000,60.308528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.411812,0.000000,62.488016>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.411812,0.000000,61.403356>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.411812,0.000000,61.403356> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.411812,0.000000,61.403356>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.225306,0.000000,61.403356>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<29.411812,0.000000,61.403356> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.225306,0.000000,61.403356>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.954141,0.000000,61.945684>}
box{<0,0,-0.076200><0.606342,0.036000,0.076200> rotate<0,63.430630,0> translate<29.954141,0.000000,61.945684> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.954141,0.000000,61.945684>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.954141,0.000000,62.216850>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,90.000000,0> translate<29.954141,0.000000,62.216850> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.954141,0.000000,62.216850>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.225306,0.000000,62.488016>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.954141,0.000000,62.216850> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.225306,0.000000,62.488016>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.767638,0.000000,62.488016>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<30.225306,0.000000,62.488016> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.767638,0.000000,62.488016>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.038800,0.000000,62.216850>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.997360,0> translate<30.767638,0.000000,62.488016> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.038800,0.000000,62.216850>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.038800,0.000000,61.674519>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.038800,0.000000,61.674519> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.038800,0.000000,61.674519>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.767638,0.000000,61.403356>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<30.767638,0.000000,61.403356> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.905306,0.000000,59.766200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.905306,0.000000,60.850859>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,90.000000,0> translate<9.905306,0.000000,60.850859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.362975,0.000000,60.308528>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.447638,0.000000,60.308528>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,0.000000,0> translate<9.362975,0.000000,60.308528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.091812,0.000000,62.488016>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.091812,0.000000,61.403356>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.091812,0.000000,61.403356> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.091812,0.000000,61.403356>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.905306,0.000000,61.403356>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<9.091812,0.000000,61.403356> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.905306,0.000000,61.403356>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.634141,0.000000,61.945684>}
box{<0,0,-0.076200><0.606342,0.036000,0.076200> rotate<0,63.430630,0> translate<9.634141,0.000000,61.945684> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.634141,0.000000,61.945684>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.634141,0.000000,62.216850>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,90.000000,0> translate<9.634141,0.000000,62.216850> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.634141,0.000000,62.216850>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.905306,0.000000,62.488016>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,-44.997030,0> translate<9.634141,0.000000,62.216850> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.905306,0.000000,62.488016>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.447638,0.000000,62.488016>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<9.905306,0.000000,62.488016> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.447638,0.000000,62.488016>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.718800,0.000000,62.216850>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.997360,0> translate<10.447638,0.000000,62.488016> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.718800,0.000000,62.216850>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.718800,0.000000,61.674519>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.718800,0.000000,61.674519> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.718800,0.000000,61.674519>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.447638,0.000000,61.403356>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,-44.997030,0> translate<10.447638,0.000000,61.403356> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.958800,0.000000,60.308528>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.331813,0.000000,60.308528>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,0.000000,0> translate<24.331813,0.000000,60.308528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.331813,0.000000,59.766200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.331813,0.000000,60.850859>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,90.000000,0> translate<24.331813,0.000000,60.850859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.958800,0.000000,61.403356>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.331813,0.000000,61.403356>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,0.000000,0> translate<24.331813,0.000000,61.403356> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.331813,0.000000,61.403356>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.331813,0.000000,62.216850>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,90.000000,0> translate<24.331813,0.000000,62.216850> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.331813,0.000000,62.216850>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.602975,0.000000,62.488016>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.997360,0> translate<24.331813,0.000000,62.216850> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.602975,0.000000,62.488016>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.145306,0.000000,62.488016>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<24.602975,0.000000,62.488016> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.145306,0.000000,62.488016>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.416472,0.000000,62.216850>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,44.997030,0> translate<25.145306,0.000000,62.488016> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.416472,0.000000,62.216850>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.416472,0.000000,61.403356>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.416472,0.000000,61.403356> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.416472,0.000000,61.945684>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.958800,0.000000,62.488016>}
box{<0,0,-0.076200><0.766970,0.036000,0.076200> rotate<0,-44.997195,0> translate<25.416472,0.000000,61.945684> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.171813,0.000000,59.766200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.798800,0.000000,59.766200>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,0.000000,0> translate<14.171813,0.000000,59.766200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.798800,0.000000,59.766200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.798800,0.000000,60.579694>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,90.000000,0> translate<15.798800,0.000000,60.579694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.798800,0.000000,60.579694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.527638,0.000000,60.850859>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.997360,0> translate<15.527638,0.000000,60.850859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.527638,0.000000,60.850859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.442975,0.000000,60.850859>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,0.000000,0> translate<14.442975,0.000000,60.850859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.442975,0.000000,60.850859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.171813,0.000000,60.579694>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.997360,0> translate<14.171813,0.000000,60.579694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.171813,0.000000,60.579694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.171813,0.000000,59.766200>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.171813,0.000000,59.766200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.798800,0.000000,61.403356>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.171813,0.000000,61.403356>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,0.000000,0> translate<14.171813,0.000000,61.403356> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.171813,0.000000,61.403356>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.798800,0.000000,62.488016>}
box{<0,0,-0.076200><1.955396,0.036000,0.076200> rotate<0,-33.687870,0> translate<14.171813,0.000000,61.403356> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.798800,0.000000,62.488016>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.171813,0.000000,62.488016>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,0.000000,0> translate<14.171813,0.000000,62.488016> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.716200,0.000000,46.153188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.716200,0.000000,44.526200>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.716200,0.000000,44.526200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.716200,0.000000,44.526200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.529694,0.000000,44.526200>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<40.716200,0.000000,44.526200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.529694,0.000000,44.526200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.800859,0.000000,44.797363>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<41.529694,0.000000,44.526200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.800859,0.000000,44.797363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.800859,0.000000,45.882025>}
box{<0,0,-0.076200><1.084662,0.036000,0.076200> rotate<0,90.000000,0> translate<41.800859,0.000000,45.882025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.800859,0.000000,45.882025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.529694,0.000000,46.153188>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<41.529694,0.000000,46.153188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.529694,0.000000,46.153188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.716200,0.000000,46.153188>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<40.716200,0.000000,46.153188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.166850,0.000000,44.526200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.624519,0.000000,44.526200>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<42.624519,0.000000,44.526200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.624519,0.000000,44.526200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.353356,0.000000,44.797363>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<42.353356,0.000000,44.797363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.353356,0.000000,44.797363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.353356,0.000000,45.339694>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,90.000000,0> translate<42.353356,0.000000,45.339694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.353356,0.000000,45.339694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.624519,0.000000,45.610859>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.997360,0> translate<42.353356,0.000000,45.339694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.624519,0.000000,45.610859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.166850,0.000000,45.610859>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<42.624519,0.000000,45.610859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.166850,0.000000,45.610859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.438016,0.000000,45.339694>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,44.997030,0> translate<43.166850,0.000000,45.610859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.438016,0.000000,45.339694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.438016,0.000000,45.068528>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.438016,0.000000,45.068528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.438016,0.000000,45.068528>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.353356,0.000000,45.068528>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,0.000000,0> translate<42.353356,0.000000,45.068528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.990513,0.000000,46.153188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.261675,0.000000,46.153188>}
box{<0,0,-0.076200><0.271163,0.036000,0.076200> rotate<0,0.000000,0> translate<43.990513,0.000000,46.153188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.261675,0.000000,46.153188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.261675,0.000000,44.526200>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.261675,0.000000,44.526200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.990513,0.000000,44.526200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.532841,0.000000,44.526200>}
box{<0,0,-0.076200><0.542328,0.036000,0.076200> rotate<0,0.000000,0> translate<43.990513,0.000000,44.526200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.353113,0.000000,45.610859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.895444,0.000000,45.610859>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<45.353113,0.000000,45.610859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.895444,0.000000,45.610859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.166609,0.000000,45.339694>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,44.997030,0> translate<45.895444,0.000000,45.610859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.166609,0.000000,45.339694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.166609,0.000000,44.526200>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.166609,0.000000,44.526200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.166609,0.000000,44.526200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.353113,0.000000,44.526200>}
box{<0,0,-0.076200><0.813497,0.036000,0.076200> rotate<0,0.000000,0> translate<45.353113,0.000000,44.526200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.353113,0.000000,44.526200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.081950,0.000000,44.797363>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<45.081950,0.000000,44.797363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.081950,0.000000,44.797363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.353113,0.000000,45.068528>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.997360,0> translate<45.081950,0.000000,44.797363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.353113,0.000000,45.068528>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.166609,0.000000,45.068528>}
box{<0,0,-0.076200><0.813497,0.036000,0.076200> rotate<0,0.000000,0> translate<45.353113,0.000000,45.068528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.719106,0.000000,45.610859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.719106,0.000000,44.797363>}
box{<0,0,-0.076200><0.813497,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.719106,0.000000,44.797363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.719106,0.000000,44.797363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990269,0.000000,44.526200>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<46.719106,0.000000,44.797363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990269,0.000000,44.526200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.803766,0.000000,44.526200>}
box{<0,0,-0.076200><0.813497,0.036000,0.076200> rotate<0,0.000000,0> translate<46.990269,0.000000,44.526200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.803766,0.000000,45.610859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.803766,0.000000,44.255038>}
box{<0,0,-0.076200><1.355822,0.036000,0.076200> rotate<0,-90.000000,0> translate<47.803766,0.000000,44.255038> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.803766,0.000000,44.255038>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.532600,0.000000,43.983872>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,-44.997030,0> translate<47.532600,0.000000,43.983872> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.532600,0.000000,43.983872>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.261434,0.000000,43.983872>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,0.000000,0> translate<47.261434,0.000000,43.983872> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.993419,0.000000,44.526200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.993419,0.000000,45.610859>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,90.000000,0> translate<49.993419,0.000000,45.610859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.993419,0.000000,45.610859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.535747,0.000000,46.153188>}
box{<0,0,-0.076200><0.766968,0.036000,0.076200> rotate<0,-44.997030,0> translate<49.993419,0.000000,45.610859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.535747,0.000000,46.153188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.078078,0.000000,45.610859>}
box{<0,0,-0.076200><0.766970,0.036000,0.076200> rotate<0,44.996865,0> translate<50.535747,0.000000,46.153188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.078078,0.000000,45.610859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.078078,0.000000,44.526200>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.078078,0.000000,44.526200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.993419,0.000000,45.339694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.078078,0.000000,45.339694>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,0.000000,0> translate<49.993419,0.000000,45.339694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.715234,0.000000,46.153188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.715234,0.000000,44.526200>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.715234,0.000000,44.526200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.715234,0.000000,44.526200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.901738,0.000000,44.526200>}
box{<0,0,-0.076200><0.813497,0.036000,0.076200> rotate<0,0.000000,0> translate<51.901738,0.000000,44.526200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.901738,0.000000,44.526200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.630575,0.000000,44.797363>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<51.630575,0.000000,44.797363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.630575,0.000000,44.797363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.630575,0.000000,45.339694>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,90.000000,0> translate<51.630575,0.000000,45.339694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.630575,0.000000,45.339694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.901738,0.000000,45.610859>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.997360,0> translate<51.630575,0.000000,45.339694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.901738,0.000000,45.610859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.715234,0.000000,45.610859>}
box{<0,0,-0.076200><0.813497,0.036000,0.076200> rotate<0,0.000000,0> translate<51.901738,0.000000,45.610859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.267731,0.000000,43.983872>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.538894,0.000000,43.983872>}
box{<0,0,-0.076200><0.271162,0.036000,0.076200> rotate<0,0.000000,0> translate<53.267731,0.000000,43.983872> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.538894,0.000000,43.983872>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.810059,0.000000,44.255038>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,-44.997030,0> translate<53.538894,0.000000,43.983872> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.810059,0.000000,44.255038>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.810059,0.000000,45.610859>}
box{<0,0,-0.076200><1.355822,0.036000,0.076200> rotate<0,90.000000,0> translate<53.810059,0.000000,45.610859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.810059,0.000000,46.424353>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.810059,0.000000,46.153188>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.810059,0.000000,46.153188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.446200,0.000000,1.346200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.446200,0.000000,2.973188>}
box{<0,0,-0.076200><1.626988,0.036000,0.076200> rotate<0,90.000000,0> translate<39.446200,0.000000,2.973188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.446200,0.000000,2.973188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.259694,0.000000,2.973188>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<39.446200,0.000000,2.973188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.259694,0.000000,2.973188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.530859,0.000000,2.702025>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<40.259694,0.000000,2.973188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.530859,0.000000,2.702025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.530859,0.000000,2.159694>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.530859,0.000000,2.159694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.530859,0.000000,2.159694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.259694,0.000000,1.888528>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,-44.997030,0> translate<40.259694,0.000000,1.888528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.259694,0.000000,1.888528>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.446200,0.000000,1.888528>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<39.446200,0.000000,1.888528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.083356,0.000000,2.973188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.083356,0.000000,1.346200>}
box{<0,0,-0.076200><1.626988,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.083356,0.000000,1.346200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.083356,0.000000,1.346200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.625684,0.000000,1.888528>}
box{<0,0,-0.076200><0.766968,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.083356,0.000000,1.346200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.625684,0.000000,1.888528>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.168016,0.000000,1.346200>}
box{<0,0,-0.076200><0.766970,0.036000,0.076200> rotate<0,44.996865,0> translate<41.625684,0.000000,1.888528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.168016,0.000000,1.346200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.168016,0.000000,2.973188>}
box{<0,0,-0.076200><1.626988,0.036000,0.076200> rotate<0,90.000000,0> translate<42.168016,0.000000,2.973188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.720513,0.000000,1.346200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.720513,0.000000,2.973188>}
box{<0,0,-0.076200><1.626988,0.036000,0.076200> rotate<0,90.000000,0> translate<42.720513,0.000000,2.973188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.720513,0.000000,2.973188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.534006,0.000000,2.973188>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<42.720513,0.000000,2.973188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.534006,0.000000,2.973188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.805172,0.000000,2.702025>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<43.534006,0.000000,2.973188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.805172,0.000000,2.702025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.805172,0.000000,2.159694>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.805172,0.000000,2.159694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.805172,0.000000,2.159694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.534006,0.000000,1.888528>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,-44.997030,0> translate<43.534006,0.000000,1.888528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.534006,0.000000,1.888528>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.720513,0.000000,1.888528>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<42.720513,0.000000,1.888528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.262841,0.000000,1.888528>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.805172,0.000000,1.346200>}
box{<0,0,-0.076200><0.766970,0.036000,0.076200> rotate<0,44.996865,0> translate<43.262841,0.000000,1.888528> }
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.812000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,7.620000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.431000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,8.001000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,7.620000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.431000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,7.620000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.050000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,7.239000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.431000,0.000000,7.239000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.542000,0.000000,8.890000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.542000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.542000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.542000,0.000000,10.160000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<18.542000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.542000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.034000,0.000000,10.160000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.034000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.034000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.034000,0.000000,7.620000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.034000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.034000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.542000,0.000000,7.620000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.034000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.542000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.542000,0.000000,8.890000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<18.542000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.129000,0.000000,8.890000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.129000,0.000000,8.890000> }
difference{
cylinder{<17.780000,0,8.890000><17.780000,0.036000,8.890000>2.870200 translate<0,0.000000,0>}
cylinder{<17.780000,-0.1,8.890000><17.780000,0.135000,8.890000>2.717800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-180.000000,0> translate<17.272000,0.000000,8.890000>}
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.430000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.430000,0.000000,11.049000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,90.000000,0> translate<11.430000,0.000000,11.049000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,11.049000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,6.731000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.970000,0.000000,6.731000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.684000,0.000000,11.303000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,11.303000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.684000,0.000000,11.303000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.684000,0.000000,6.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,6.477000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.684000,0.000000,6.477000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<11.684000,0.000000,11.049000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<11.684000,0.000000,6.731000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<13.716000,0.000000,11.049000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<13.716000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,9.652000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,9.271000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.700000,0.000000,9.271000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,9.271000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,9.144000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.700000,0.000000,9.144000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.700000,0.000000,9.144000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.938000,0.000000,9.144000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<11.938000,0.000000,9.144000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.700000,0.000000,9.144000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.462000,0.000000,9.144000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<12.700000,0.000000,9.144000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.938000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.700000,0.000000,8.636000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<11.938000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.700000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.462000,0.000000,8.636000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<12.700000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,8.509000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.700000,0.000000,8.509000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,8.509000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,8.128000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.700000,0.000000,8.128000> }
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.498000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.879000,0.000000,27.940000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.498000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.879000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.879000,0.000000,27.940000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<47.879000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.879000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,27.940000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.879000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.879000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.879000,0.000000,28.321000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<47.879000,0.000000,28.321000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.879000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.768000,0.000000,26.670000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.879000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.768000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.768000,0.000000,25.400000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.768000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.768000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.276000,0.000000,25.400000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.768000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.276000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.276000,0.000000,27.940000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<49.276000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.276000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.768000,0.000000,27.940000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.768000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.768000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.768000,0.000000,26.670000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.768000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.181000,0.000000,26.670000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.165000,0.000000,26.670000> }
difference{
cylinder{<49.530000,0,26.670000><49.530000,0.036000,26.670000>2.870200 translate<0,0.000000,0>}
cylinder{<49.530000,-0.1,26.670000><49.530000,0.135000,26.670000>2.717800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-0.000000,0> translate<50.038000,0.000000,26.670000>}
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.879000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.561000,0.000000,8.890000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.561000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.561000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.879000,0.000000,11.430000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.561000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,9.144000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.307000,0.000000,11.176000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<43.307000,0.000000,11.176000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,9.144000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.133000,0.000000,11.176000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<48.133000,0.000000,11.176000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<43.561000,0.000000,9.144000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<47.879000,0.000000,9.144000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<43.561000,0.000000,11.176000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<47.879000,0.000000,11.176000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.958000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.339000,0.000000,10.160000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.958000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.339000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.466000,0.000000,10.160000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.339000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.466000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.466000,0.000000,9.398000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,-90.000000,0> translate<45.466000,0.000000,9.398000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.466000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.466000,0.000000,10.922000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,90.000000,0> translate<45.466000,0.000000,10.922000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.974000,0.000000,9.398000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.974000,0.000000,10.160000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,90.000000,0> translate<45.974000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.974000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.974000,0.000000,10.922000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,90.000000,0> translate<45.974000,0.000000,10.922000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.974000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,10.160000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.974000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.482000,0.000000,10.160000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.101000,0.000000,10.160000> }
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,14.351000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,18.669000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,90.000000,0> translate<31.750000,0.000000,18.669000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,18.669000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,14.351000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.290000,0.000000,14.351000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.004000,0.000000,18.923000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.036000,0.000000,18.923000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.004000,0.000000,18.923000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.004000,0.000000,14.097000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.036000,0.000000,14.097000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.004000,0.000000,14.097000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<32.004000,0.000000,18.669000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<32.004000,0.000000,14.351000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<34.036000,0.000000,18.669000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<34.036000,0.000000,14.351000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,17.272000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,16.891000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.020000,0.000000,16.891000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,16.891000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,16.764000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.020000,0.000000,16.764000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.020000,0.000000,16.764000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<32.258000,0.000000,16.764000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<32.258000,0.000000,16.764000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.020000,0.000000,16.764000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.782000,0.000000,16.764000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<33.020000,0.000000,16.764000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<32.258000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.020000,0.000000,16.256000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<32.258000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.020000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.782000,0.000000,16.256000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<33.020000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,16.129000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.020000,0.000000,16.129000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,16.129000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.020000,0.000000,15.748000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.020000,0.000000,15.748000> }
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.271000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.589000,0.000000,13.970000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.271000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.589000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.271000,0.000000,11.430000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.271000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.843000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.843000,0.000000,11.684000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.843000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,0.000000,11.684000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.017000,0.000000,11.684000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<13.589000,0.000000,13.716000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<9.271000,0.000000,13.716000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<13.589000,0.000000,11.684000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<9.271000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.192000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.811000,0.000000,12.700000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.811000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.811000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.684000,0.000000,12.700000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.684000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.684000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.684000,0.000000,13.462000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,90.000000,0> translate<11.684000,0.000000,13.462000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.684000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.684000,0.000000,11.938000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,-90.000000,0> translate<11.684000,0.000000,11.938000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.176000,0.000000,13.462000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.176000,0.000000,12.700000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,-90.000000,0> translate<11.176000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.176000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.176000,0.000000,11.938000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,-90.000000,0> translate<11.176000,0.000000,11.938000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.049000,0.000000,12.700000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.049000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.049000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.668000,0.000000,12.700000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.668000,0.000000,12.700000> }
//C7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,13.970000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.241000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,11.430000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.241000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,11.684000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.813000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.987000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.987000,0.000000,11.684000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.987000,0.000000,11.684000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<27.559000,0.000000,13.716000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<23.241000,0.000000,13.716000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<27.559000,0.000000,11.684000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<23.241000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.162000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,12.700000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.781000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.654000,0.000000,12.700000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.654000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.654000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.654000,0.000000,13.462000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,90.000000,0> translate<25.654000,0.000000,13.462000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.654000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.654000,0.000000,11.938000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,-90.000000,0> translate<25.654000,0.000000,11.938000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.146000,0.000000,13.462000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.146000,0.000000,12.700000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,-90.000000,0> translate<25.146000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.146000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.146000,0.000000,11.938000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,-90.000000,0> translate<25.146000,0.000000,11.938000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.019000,0.000000,12.700000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.019000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.019000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.638000,0.000000,12.700000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.638000,0.000000,12.700000> }
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,22.860000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,90.000000,0> translate<48.641000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,12.700000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.799000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,12.700000>}
box{<0,0,-0.076200><5.842000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.641000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.736000,0.000000,22.860000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.736000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.704000,0.000000,22.860000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,22.860000> }
object{ARC(1.016000,0.152400,180.000000,360.000000,0.036000) translate<45.720000,0.000000,22.860000>}
//IC2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.351000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.351000,0.000000,31.750000>}
box{<0,0,-0.076200><17.780000,0.036000,0.076200> rotate<0,90.000000,0> translate<14.351000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.509000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.509000,0.000000,13.970000>}
box{<0,0,-0.076200><17.780000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.509000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.351000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.509000,0.000000,13.970000>}
box{<0,0,-0.076200><5.842000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.509000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.351000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,0.000000,31.750000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.446000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.509000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,31.750000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.509000,0.000000,31.750000> }
object{ARC(1.016000,0.152400,180.000000,360.000000,0.036000) translate<11.430000,0.000000,31.750000>}
//IC3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.321000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.321000,0.000000,31.750000>}
box{<0,0,-0.076200><17.780000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.321000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.479000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.479000,0.000000,13.970000>}
box{<0,0,-0.076200><17.780000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.479000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.321000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.479000,0.000000,13.970000>}
box{<0,0,-0.076200><5.842000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.479000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.321000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.416000,0.000000,31.750000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.416000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.479000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.384000,0.000000,31.750000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.479000,0.000000,31.750000> }
object{ARC(1.016000,0.152400,180.000000,360.000000,0.036000) translate<25.400000,0.000000,31.750000>}
//IC4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.160000,0.000000,2.413000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.287000,0.000000,5.334000>}
box{<0,0,-0.063500><2.923760,0.036000,0.063500> rotate<0,-87.504672,0> translate<10.160000,0.000000,2.413000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.541000,0.000000,5.588000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.287000,0.000000,5.334000>}
box{<0,0,-0.063500><0.359210,0.036000,0.063500> rotate<0,-44.997030,0> translate<10.287000,0.000000,5.334000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.541000,0.000000,5.588000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.939000,0.000000,5.588000>}
box{<0,0,-0.063500><9.398000,0.036000,0.063500> rotate<0,0.000000,0> translate<10.541000,0.000000,5.588000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.193000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.939000,0.000000,5.588000>}
box{<0,0,-0.063500><0.359210,0.036000,0.063500> rotate<0,44.997030,0> translate<19.939000,0.000000,5.588000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.193000,0.000000,5.334000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.320000,0.000000,2.413000>}
box{<0,0,-0.063500><2.923760,0.036000,0.063500> rotate<0,87.504672,0> translate<20.193000,0.000000,5.334000> }
difference{
cylinder{<19.735800,0,4.978400><19.735800,0.036000,4.978400>0.317500 translate<0,0.000000,0>}
cylinder{<19.735800,-0.1,4.978400><19.735800,0.135000,4.978400>0.190500 translate<0,0.000000,0>}}
box{<-5.334000,0,-0.381000><5.334000,0.036000,0.381000> rotate<0,-180.000000,0> translate<15.240000,0.000000,1.651000>}
box{<-0.952500,0,-0.254000><0.952500,0.036000,0.254000> rotate<0,-180.000000,0> translate<19.621500,0.000000,2.286000>}
box{<-0.381000,0,-0.254000><0.381000,0.036000,0.254000> rotate<0,-180.000000,0> translate<16.510000,0.000000,2.286000>}
box{<-0.889000,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-180.000000,0> translate<17.780000,0.000000,2.286000>}
box{<-0.381000,0,-0.254000><0.381000,0.036000,0.254000> rotate<0,-180.000000,0> translate<13.970000,0.000000,2.286000>}
box{<-0.952500,0,-0.254000><0.952500,0.036000,0.254000> rotate<0,-180.000000,0> translate<10.858500,0.000000,2.286000>}
box{<-0.889000,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-180.000000,0> translate<15.240000,0.000000,2.286000>}
box{<-0.889000,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-180.000000,0> translate<12.700000,0.000000,2.286000>}
//J1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.520000,0.000000,9.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.420000,0.000000,9.890000>}
box{<0,0,-0.101600><2.100000,0.036000,0.101600> rotate<0,0.000000,0> translate<35.420000,0.000000,9.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.520000,0.000000,9.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.520000,0.000000,9.190000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<37.520000,0.000000,9.190000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.520000,0.000000,9.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.620000,0.000000,9.890000>}
box{<0,0,-0.101600><2.100000,0.036000,0.101600> rotate<0,0.000000,0> translate<28.520000,0.000000,9.890000> }
//J2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.260000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.260000,0.000000,49.530000>}
box{<0,0,-0.063500><8.890000,0.036000,0.063500> rotate<0,-90.000000,0> translate<48.260000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.260000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.620000,0.000000,49.530000>}
box{<0,0,-0.063500><40.640000,0.036000,0.063500> rotate<0,0.000000,0> translate<7.620000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.620000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.620000,0.000000,58.420000>}
box{<0,0,-0.063500><8.890000,0.036000,0.063500> rotate<0,90.000000,0> translate<7.620000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.620000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.890000,0.000000,58.420000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<7.620000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.890000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.430000,0.000000,58.420000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<8.890000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.430000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.970000,0.000000,58.420000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<11.430000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.970000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.510000,0.000000,58.420000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<13.970000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.510000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.050000,0.000000,58.420000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<16.510000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.050000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.590000,0.000000,58.420000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<19.050000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.590000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.130000,0.000000,58.420000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<21.590000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.130000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.670000,0.000000,58.420000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<24.130000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.670000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.210000,0.000000,58.420000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<26.670000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.210000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.750000,0.000000,58.420000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<29.210000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.750000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.290000,0.000000,58.420000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<31.750000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.290000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.830000,0.000000,58.420000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<34.290000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.830000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.370000,0.000000,58.420000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<36.830000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.370000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.910000,0.000000,58.420000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<39.370000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.910000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.450000,0.000000,58.420000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<41.910000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.450000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.990000,0.000000,58.420000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<44.450000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.990000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.260000,0.000000,58.420000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<46.990000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.990000,0.000000,50.800000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.890000,0.000000,50.800000>}
box{<0,0,-0.063500><38.100000,0.036000,0.063500> rotate<0,0.000000,0> translate<8.890000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.990000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.450000,0.000000,57.150000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<44.450000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.910000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.370000,0.000000,57.150000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<39.370000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.830000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.290000,0.000000,57.150000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<34.290000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.750000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.210000,0.000000,57.150000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<29.210000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.670000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.130000,0.000000,57.150000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<24.130000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.590000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.050000,0.000000,57.150000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<19.050000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.510000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.970000,0.000000,57.150000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<13.970000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.430000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.890000,0.000000,57.150000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<8.890000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.990000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.990000,0.000000,58.420000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<46.990000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.450000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.450000,0.000000,58.420000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<44.450000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.910000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.910000,0.000000,58.420000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<41.910000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.370000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.370000,0.000000,58.420000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<39.370000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.830000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.830000,0.000000,58.420000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<36.830000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.290000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.290000,0.000000,58.420000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<34.290000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.750000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.750000,0.000000,58.420000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<31.750000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.210000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.210000,0.000000,58.420000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<29.210000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.670000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.670000,0.000000,58.420000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<26.670000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.130000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.130000,0.000000,58.420000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<24.130000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.590000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.590000,0.000000,58.420000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<21.590000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.050000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.050000,0.000000,58.420000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<19.050000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.510000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.510000,0.000000,58.420000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<16.510000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.970000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.970000,0.000000,58.420000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<13.970000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.430000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.430000,0.000000,58.420000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<11.430000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.890000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.890000,0.000000,58.420000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<8.890000,0.000000,58.420000> }
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.020000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.020000,0.000000,21.336000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<33.020000,0.000000,21.336000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.020000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.020000,0.000000,29.464000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<33.020000,0.000000,29.464000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<33.909000,0.000000,28.321000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<32.131000,0.000000,28.321000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<32.131000,0.000000,22.479000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<33.909000,0.000000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.131000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.909000,0.000000,28.575000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.131000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,28.321000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,27.940000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.163000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.036000,0.000000,27.813000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,27.940000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.036000,0.000000,27.813000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.877000,0.000000,28.321000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.877000,0.000000,27.940000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.877000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.004000,0.000000,27.813000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.877000,0.000000,27.940000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<31.877000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.036000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,22.860000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<34.036000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.036000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.036000,0.000000,27.813000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.036000,0.000000,27.813000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.004000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.877000,0.000000,22.860000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.877000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.004000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.004000,0.000000,27.813000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<32.004000,0.000000,27.813000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,22.860000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.163000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.877000,0.000000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.877000,0.000000,22.860000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<31.877000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.131000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.909000,0.000000,22.225000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.131000,0.000000,22.225000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<33.020000,0.000000,21.793200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<33.020000,0.000000,29.006800>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.815000,0.000000,35.941000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,35.941000>}
box{<0,0,-0.076200><6.350000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.815000,0.000000,35.941000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,42.799000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,42.799000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<49.530000,0.000000,42.799000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.815000,0.000000,35.941000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.561000,0.000000,36.195000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<43.561000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.815000,0.000000,42.799000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.561000,0.000000,42.545000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<43.561000,0.000000,42.545000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.561000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.561000,0.000000,40.894000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.561000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.561000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.561000,0.000000,39.624000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.561000,0.000000,39.624000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.561000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.561000,0.000000,36.195000>}
box{<0,0,-0.076200><3.429000,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.561000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,42.799000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,42.545000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<50.165000,0.000000,42.799000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,35.941000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,36.195000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<50.165000,0.000000,35.941000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,39.624000>}
box{<0,0,-0.076200><3.429000,0.036000,0.076200> rotate<0,90.000000,0> translate<50.419000,0.000000,39.624000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,40.894000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<50.419000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,42.545000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,90.000000,0> translate<50.419000,0.000000,42.545000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.228000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.466000,0.000000,39.370000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.466000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.466000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.466000,0.000000,38.608000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<45.466000,0.000000,38.608000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.466000,0.000000,38.608000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.228000,0.000000,38.608000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.466000,0.000000,38.608000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.228000,0.000000,38.608000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,38.227000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,44.997030,0> translate<46.228000,0.000000,38.608000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,38.227000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,37.846000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.609000,0.000000,37.846000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,37.084000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.371000,0.000000,37.084000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.609000,0.000000,37.084000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.371000,0.000000,37.084000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.371000,0.000000,37.846000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<47.371000,0.000000,37.846000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.371000,0.000000,38.227000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.752000,0.000000,38.608000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<47.371000,0.000000,38.227000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.752000,0.000000,38.608000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,38.608000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.752000,0.000000,38.608000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,38.608000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,39.370000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<48.514000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.752000,0.000000,39.370000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.752000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.371000,0.000000,39.751000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.752000,0.000000,39.370000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,44.997030,0> translate<47.371000,0.000000,39.751000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.371000,0.000000,39.751000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.371000,0.000000,40.132000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<47.371000,0.000000,40.132000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.371000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,40.894000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.609000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,40.132000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.609000,0.000000,40.132000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,39.751000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.228000,0.000000,39.370000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.228000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<48.768000,0.000000,40.767000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<49.022000,0.000000,41.021000>}
box{<0,0,-0.152400><0.359210,0.036000,0.152400> rotate<0,-44.997030,0> translate<48.768000,0.000000,40.767000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<45.212000,0.000000,40.767000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<44.958000,0.000000,41.021000>}
box{<0,0,-0.152400><0.359210,0.036000,0.152400> rotate<0,44.997030,0> translate<44.958000,0.000000,41.021000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<44.602400,0.000000,38.989000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<44.221400,0.000000,38.989000>}
box{<0,0,-0.152400><0.381000,0.036000,0.152400> rotate<0,0.000000,0> translate<44.221400,0.000000,38.989000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<45.212000,0.000000,37.338000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<44.958000,0.000000,37.084000>}
box{<0,0,-0.152400><0.359210,0.036000,0.152400> rotate<0,-44.997030,0> translate<44.958000,0.000000,37.084000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<46.990000,0.000000,36.652200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<46.990000,0.000000,36.271200>}
box{<0,0,-0.152400><0.381000,0.036000,0.152400> rotate<0,-90.000000,0> translate<46.990000,0.000000,36.271200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<48.895000,0.000000,37.338000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<49.149000,0.000000,37.084000>}
box{<0,0,-0.152400><0.359210,0.036000,0.152400> rotate<0,44.997030,0> translate<48.895000,0.000000,37.338000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<49.377600,0.000000,38.989000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<49.758600,0.000000,38.989000>}
box{<0,0,-0.152400><0.381000,0.036000,0.152400> rotate<0,0.000000,0> translate<49.377600,0.000000,38.989000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.371000,0.000000,37.846000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.609000,0.000000,37.846000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,37.084000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.609000,0.000000,37.084000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.371000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.371000,0.000000,38.227000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<47.371000,0.000000,38.227000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,40.132000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.371000,0.000000,40.132000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.609000,0.000000,40.132000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,40.132000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,39.751000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.609000,0.000000,39.751000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.371000,0.000000,40.132000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.371000,0.000000,40.894000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<47.371000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,42.418000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,42.799000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<49.530000,0.000000,42.799000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.006000,0.000000,42.418000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.974000,0.000000,42.418000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.974000,0.000000,42.418000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,42.799000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,42.418000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.450000,0.000000,42.418000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,42.799000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.625000,0.000000,42.799000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.625000,0.000000,42.799000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.625000,0.000000,42.799000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,42.799000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.355000,0.000000,42.799000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,42.799000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,42.799000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.450000,0.000000,42.799000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,42.799000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.815000,0.000000,42.799000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<43.815000,0.000000,42.799000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,42.418000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.006000,0.000000,42.418000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.006000,0.000000,42.418000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.974000,0.000000,42.418000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,42.418000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.450000,0.000000,42.418000> }
difference{
cylinder{<46.990000,0,38.989000><46.990000,0.036000,38.989000>2.108200 translate<0,0.000000,0>}
cylinder{<46.990000,-0.1,38.989000><46.990000,0.135000,38.989000>1.955800 translate<0,0.000000,0>}}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<38.100000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.116000,0.000000,30.480000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<38.100000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<48.260000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<47.244000,0.000000,30.480000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<47.244000,0.000000,30.480000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<46.101000,0.000000,29.591000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<46.101000,0.000000,31.369000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<40.259000,0.000000,31.369000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<40.259000,0.000000,29.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,31.369000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,29.591000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.355000,0.000000,29.591000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.720000,0.000000,29.337000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.720000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.593000,0.000000,29.464000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.720000,0.000000,29.337000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<45.593000,0.000000,29.464000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.720000,0.000000,31.623000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.720000,0.000000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.593000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.720000,0.000000,31.623000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<45.593000,0.000000,31.496000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,29.464000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,29.337000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<40.640000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,29.464000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.593000,0.000000,29.464000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.767000,0.000000,29.464000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,31.623000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<40.640000,0.000000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.593000,0.000000,31.496000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.767000,0.000000,31.496000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.259000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,29.337000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.259000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.259000,0.000000,31.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.640000,0.000000,31.623000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.259000,0.000000,31.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,31.369000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,29.591000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.005000,0.000000,29.591000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<39.573200,0.000000,30.480000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<46.786800,0.000000,30.480000>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<38.100000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<38.100000,0.000000,26.924000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<38.100000,0.000000,26.924000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<38.100000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<38.100000,0.000000,18.796000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<38.100000,0.000000,18.796000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<37.211000,0.000000,19.939000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<38.989000,0.000000,19.939000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<38.989000,0.000000,25.781000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<37.211000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.989000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.211000,0.000000,19.685000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.211000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,20.320000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<36.957000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,20.447000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,20.320000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.957000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,20.320000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<39.243000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.116000,0.000000,20.447000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,20.320000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<39.116000,0.000000,20.447000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,25.273000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,25.400000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<36.957000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,25.273000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.084000,0.000000,20.447000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.084000,0.000000,20.447000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.116000,0.000000,25.273000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,25.400000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.116000,0.000000,25.273000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.116000,0.000000,25.273000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.116000,0.000000,20.447000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.116000,0.000000,20.447000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,25.400000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.957000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,25.400000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.243000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.989000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.211000,0.000000,26.035000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.211000,0.000000,26.035000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<38.100000,0.000000,26.466800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<38.100000,0.000000,19.253200>}
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<7.620000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<7.620000,0.000000,44.704000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<7.620000,0.000000,44.704000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<7.620000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<7.620000,0.000000,36.576000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<7.620000,0.000000,36.576000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<6.731000,0.000000,37.719000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<8.509000,0.000000,37.719000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<8.509000,0.000000,43.561000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<6.731000,0.000000,43.561000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.509000,0.000000,37.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.731000,0.000000,37.465000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.731000,0.000000,37.465000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,0.000000,37.719000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,0.000000,38.100000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.477000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,38.227000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,0.000000,38.100000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<6.477000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,0.000000,37.719000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,0.000000,38.100000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<8.763000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.636000,0.000000,38.227000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,0.000000,38.100000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<8.636000,0.000000,38.227000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,43.053000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,0.000000,43.180000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<6.477000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,43.053000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,38.227000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.604000,0.000000,38.227000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.636000,0.000000,43.053000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,0.000000,43.180000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<8.636000,0.000000,43.053000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.636000,0.000000,43.053000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.636000,0.000000,38.227000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.636000,0.000000,38.227000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,0.000000,43.561000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,0.000000,43.180000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.477000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,0.000000,43.561000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,0.000000,43.180000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.763000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.509000,0.000000,43.815000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.731000,0.000000,43.815000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.731000,0.000000,43.815000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<7.620000,0.000000,44.246800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<7.620000,0.000000,37.033200>}
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<31.750000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<31.750000,0.000000,44.704000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<31.750000,0.000000,44.704000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<31.750000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<31.750000,0.000000,36.576000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<31.750000,0.000000,36.576000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<30.861000,0.000000,37.719000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<32.639000,0.000000,37.719000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<32.639000,0.000000,43.561000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<30.861000,0.000000,43.561000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.639000,0.000000,37.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.861000,0.000000,37.465000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.861000,0.000000,37.465000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.607000,0.000000,37.719000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.607000,0.000000,38.100000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<30.607000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.734000,0.000000,38.227000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.607000,0.000000,38.100000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<30.607000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,37.719000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,38.100000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<32.893000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,38.227000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,38.100000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<32.766000,0.000000,38.227000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.734000,0.000000,43.053000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.607000,0.000000,43.180000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<30.607000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.734000,0.000000,43.053000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.734000,0.000000,38.227000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.734000,0.000000,38.227000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,43.053000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,43.180000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<32.766000,0.000000,43.053000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,43.053000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,38.227000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.766000,0.000000,38.227000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.607000,0.000000,43.561000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.607000,0.000000,43.180000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.607000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,43.561000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,43.180000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.893000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.639000,0.000000,43.815000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.861000,0.000000,43.815000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.861000,0.000000,43.815000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<31.750000,0.000000,44.246800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<31.750000,0.000000,37.033200>}
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<11.430000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<11.430000,0.000000,44.704000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<11.430000,0.000000,44.704000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<11.430000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<11.430000,0.000000,36.576000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<11.430000,0.000000,36.576000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<10.541000,0.000000,37.719000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<12.319000,0.000000,37.719000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<12.319000,0.000000,43.561000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<10.541000,0.000000,43.561000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,37.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.541000,0.000000,37.465000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.541000,0.000000,37.465000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,0.000000,37.719000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,0.000000,38.100000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<10.287000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,38.227000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,0.000000,38.100000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<10.287000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,0.000000,37.719000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,0.000000,38.100000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.573000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,0.000000,38.227000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,0.000000,38.100000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<12.446000,0.000000,38.227000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,43.053000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,0.000000,43.180000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<10.287000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,43.053000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,38.227000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.414000,0.000000,38.227000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,0.000000,43.053000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,0.000000,43.180000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<12.446000,0.000000,43.053000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,0.000000,43.053000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,0.000000,38.227000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.446000,0.000000,38.227000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,0.000000,43.561000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,0.000000,43.180000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.287000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,0.000000,43.561000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,0.000000,43.180000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.573000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,43.815000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.541000,0.000000,43.815000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.541000,0.000000,43.815000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<11.430000,0.000000,44.246800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<11.430000,0.000000,37.033200>}
//R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.590000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.590000,0.000000,44.704000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<21.590000,0.000000,44.704000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.590000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.590000,0.000000,36.576000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<21.590000,0.000000,36.576000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<20.701000,0.000000,37.719000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<22.479000,0.000000,37.719000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<22.479000,0.000000,43.561000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<20.701000,0.000000,43.561000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.479000,0.000000,37.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,37.465000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.701000,0.000000,37.465000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,0.000000,37.719000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,0.000000,38.100000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.447000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.574000,0.000000,38.227000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,0.000000,38.100000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.447000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,37.719000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,38.100000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.733000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,38.227000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,38.100000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<22.606000,0.000000,38.227000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.574000,0.000000,43.053000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,0.000000,43.180000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<20.447000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.574000,0.000000,43.053000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.574000,0.000000,38.227000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.574000,0.000000,38.227000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,43.053000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,43.180000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.606000,0.000000,43.053000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,43.053000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,38.227000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.606000,0.000000,38.227000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,0.000000,43.561000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,0.000000,43.180000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.447000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,43.561000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,43.180000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.733000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.479000,0.000000,43.815000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,43.815000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.701000,0.000000,43.815000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<21.590000,0.000000,44.246800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<21.590000,0.000000,37.033200>}
//T1 silk screen
object{ARC(2.667022,0.127000,275.463924,308.244924,0.036000) translate<26.670050,0.000000,45.720003>}
object{ARC(2.667025,0.127000,197.146908,275.465408,0.036000) translate<26.669981,0.000000,45.720000>}
object{ARC(2.666953,0.127000,51.752892,162.852892,0.036000) translate<26.670009,0.000000,45.720013>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.321000,0.000000,43.625500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.321000,0.000000,47.814500>}
box{<0,0,-0.063500><4.189000,0.036000,0.063500> rotate<0,90.000000,0> translate<28.321000,0.000000,47.814500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.924000,0.000000,43.466300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.924000,0.000000,45.433700>}
box{<0,0,-0.063500><1.967400,0.036000,0.063500> rotate<0,90.000000,0> translate<26.924000,0.000000,45.433700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.924000,0.000000,43.065100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.924000,0.000000,43.466300>}
box{<0,0,-0.063500><0.401200,0.036000,0.063500> rotate<0,90.000000,0> translate<26.924000,0.000000,43.466300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.924000,0.000000,45.433700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.924000,0.000000,46.006300>}
box{<0,0,-0.063500><0.572600,0.036000,0.063500> rotate<0,90.000000,0> translate<26.924000,0.000000,46.006300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.924000,0.000000,47.973700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.924000,0.000000,48.374900>}
box{<0,0,-0.063500><0.401200,0.036000,0.063500> rotate<0,90.000000,0> translate<26.924000,0.000000,48.374900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.924000,0.000000,46.006300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.924000,0.000000,47.973700>}
box{<0,0,-0.063500><1.967400,0.036000,0.063500> rotate<0,90.000000,0> translate<26.924000,0.000000,47.973700> }
object{ARC(2.667044,0.127000,162.853200,197.146800,0.036000) translate<26.670000,0.000000,45.720000>}
//T2 silk screen
object{ARC(2.667022,0.127000,275.463924,308.244924,0.036000) translate<36.830050,0.000000,45.720003>}
object{ARC(2.667025,0.127000,197.146908,275.465408,0.036000) translate<36.829981,0.000000,45.720000>}
object{ARC(2.666953,0.127000,51.752892,162.852892,0.036000) translate<36.830009,0.000000,45.720013>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.481000,0.000000,43.625500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.481000,0.000000,47.814500>}
box{<0,0,-0.063500><4.189000,0.036000,0.063500> rotate<0,90.000000,0> translate<38.481000,0.000000,47.814500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.084000,0.000000,43.466300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.084000,0.000000,45.433700>}
box{<0,0,-0.063500><1.967400,0.036000,0.063500> rotate<0,90.000000,0> translate<37.084000,0.000000,45.433700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.084000,0.000000,43.065100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.084000,0.000000,43.466300>}
box{<0,0,-0.063500><0.401200,0.036000,0.063500> rotate<0,90.000000,0> translate<37.084000,0.000000,43.466300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.084000,0.000000,45.433700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.084000,0.000000,46.006300>}
box{<0,0,-0.063500><0.572600,0.036000,0.063500> rotate<0,90.000000,0> translate<37.084000,0.000000,46.006300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.084000,0.000000,47.973700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.084000,0.000000,48.374900>}
box{<0,0,-0.063500><0.401200,0.036000,0.063500> rotate<0,90.000000,0> translate<37.084000,0.000000,48.374900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.084000,0.000000,46.006300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.084000,0.000000,47.973700>}
box{<0,0,-0.063500><1.967400,0.036000,0.063500> rotate<0,90.000000,0> translate<37.084000,0.000000,47.973700> }
object{ARC(2.667044,0.127000,162.853200,197.146800,0.036000) translate<36.830000,0.000000,45.720000>}
//T3 silk screen
object{ARC(2.667022,0.127000,275.463924,308.244924,0.036000) translate<16.510050,0.000000,45.720003>}
object{ARC(2.667025,0.127000,197.146908,275.465408,0.036000) translate<16.509981,0.000000,45.720000>}
object{ARC(2.666953,0.127000,51.752892,162.852892,0.036000) translate<16.510009,0.000000,45.720013>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.161000,0.000000,43.625500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.161000,0.000000,47.814500>}
box{<0,0,-0.063500><4.189000,0.036000,0.063500> rotate<0,90.000000,0> translate<18.161000,0.000000,47.814500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.764000,0.000000,43.466300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.764000,0.000000,45.433700>}
box{<0,0,-0.063500><1.967400,0.036000,0.063500> rotate<0,90.000000,0> translate<16.764000,0.000000,45.433700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.764000,0.000000,43.065100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.764000,0.000000,43.466300>}
box{<0,0,-0.063500><0.401200,0.036000,0.063500> rotate<0,90.000000,0> translate<16.764000,0.000000,43.466300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.764000,0.000000,45.433700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.764000,0.000000,46.006300>}
box{<0,0,-0.063500><0.572600,0.036000,0.063500> rotate<0,90.000000,0> translate<16.764000,0.000000,46.006300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.764000,0.000000,47.973700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.764000,0.000000,48.374900>}
box{<0,0,-0.063500><0.401200,0.036000,0.063500> rotate<0,90.000000,0> translate<16.764000,0.000000,48.374900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.764000,0.000000,46.006300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.764000,0.000000,47.973700>}
box{<0,0,-0.063500><1.967400,0.036000,0.063500> rotate<0,90.000000,0> translate<16.764000,0.000000,47.973700> }
object{ARC(2.667044,0.127000,162.853200,197.146800,0.036000) translate<16.510000,0.000000,45.720000>}
//U$1 silk screen
//U$2 silk screen
//U$3 silk screen
//U$4 silk screen
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  GEAR_INDICATOR_V1_0(-27.775000,0,-31.745000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//IC1	NE555	DIL-08
//J1		POWER_JACK_PTH
//J2		TERMBLOCKX8
//R2	15K	B25P
//U$1		STAND-OFF
//U$2		STAND-OFF
//U$3		STAND-OFF
//U$4		STAND-OFF
