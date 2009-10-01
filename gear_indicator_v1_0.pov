//POVRay-File created by 3d41.ulp v1.05
//C:/Documents and Settings/wriley/My Documents/Projects/Gear_Indicator/gear_indicator_v1_0.brd
//01/10/2009 15:20:20

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

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 2;
#declare pin_short = on;

#declare environment = off;

#local cam_x = 0;
#local cam_y = 283;
#local cam_z = -151;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -6;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 0;
#local pcb_rotate_z = 0;

#local pcb_board = on;
#local pcb_parts = on;
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

#local lgt1_pos_x = 24;
#local lgt1_pos_y = 37;
#local lgt1_pos_z = 34;
#local lgt1_intense = 0.761983;
#local lgt2_pos_x = -24;
#local lgt2_pos_y = 37;
#local lgt2_pos_z = 34;
#local lgt2_intense = 0.761983;
#local lgt3_pos_x = 24;
#local lgt3_pos_y = 37;
#local lgt3_pos_z = -23;
#local lgt3_intense = 0.761983;
#local lgt4_pos_x = -24;
#local lgt4_pos_y = 37;
#local lgt4_pos_z = -23;
#local lgt4_intense = 0.761983;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 65.710000;
#declare pcb_y_size = 66.030000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(789);
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

#include "tools.inc"
#include "user.inc"

global_settings{charset utf8}

#if(environment=on)
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
	//translate<-32.855000,0,-33.015000>
}
#end

background{col_bgr}


//Axis uncomment to activate
//object{TOOLS_AXIS_XYZ(100,100,100 //texture{ pigment{rgb<1,0,0>} finish{diffuse 0.8 phong 1}}, //texture{ pigment{rgb<1,1,1>} finish{diffuse 0.8 phong 1}})}

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
<0.000000,0.000000><65.710000,0.000000>
<65.710000,0.000000><65.710000,66.030000>
<65.710000,66.030000><0.000000,66.030000>
<0.000000,66.030000><0.000000,0.000000>
texture{col_brd}}
}//End union(Platine)
//Holes(real)/Parts
cylinder{<62.230000,1,3.810000><62.230000,-5,3.810000>1.651000 texture{col_hls}}
cylinder{<3.810000,1,3.810000><3.810000,-5,3.810000>1.651000 texture{col_hls}}
cylinder{<3.810000,1,62.230000><3.810000,-5,62.230000>1.651000 texture{col_hls}}
cylinder{<62.230000,1,62.230000><62.230000,-5,62.230000>1.651000 texture{col_hls}}
//Holes(real)/Board
//Holes(real)/Vias
cylinder{<33.020000,0.095000,5.160000><33.020000,-1.595000,5.160000>1.498600 texture{col_hls}}
cylinder{<33.020000,0.095000,11.160000><33.020000,-1.595000,11.160000>1.498600 texture{col_hls}}
cylinder{<37.720000,0.095000,8.160000><37.720000,-1.595000,8.160000>1.498600 texture{col_hls}}
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_DIS_CERAMIC_25MM_50MM("0.1",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<25.400000,0.000000,3.810000>}#end		//ceramic disc capacitator C1 0.1 C025-025X050
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_DIS_ELKO_2MM5_6MM3("10uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<13.970000,0.000000,11.430000>}#end		//Elko 2,5mm Pitch, 6mm  Diameter, 11,2mm High C2 10uF E2,5-6
#ifndef(pack_C3) #declare global_pack_C3=yes; object {CAP_DIS_ELKO_3MM5_8MM("1000uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<60.960000,0.000000,13.970000>}#end		//Elko 3,5mm Pitch, 8mm  Diameter, 11,5mm High C3 1000uF E3,5-8
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_DIS_CERAMIC_25MM_50MM("0.1",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<54.610000,0.000000,3.810000>}#end		//ceramic disc capacitator C4 0.1 C025-025X050
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_DIS_CERAMIC_25MM_50MM("0.1",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<34.290000,0.000000,13.970000>}#end		//ceramic disc capacitator C5 0.1 C025-025X050
#ifndef(pack_IC2) #declare global_pack_IC2=yes; object {IC_DIS_DIP14("74ALS08N","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<13.970000,0.000000,25.400000>translate<0,3.000000,0> }#end		//DIP14 IC2 74ALS08N DIL14
#ifndef(pack_IC2) object{SOCKET_DIP14()rotate<0,-270.000000,0> rotate<0,0,0> translate<13.970000,0.000000,25.400000>}#end					//IC-Sockel 14Pin IC2 74ALS08N
#ifndef(pack_IC3) #declare global_pack_IC3=yes; object {IC_DIS_DIP14("74ALS04N","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<31.750000,0.000000,25.400000>translate<0,3.000000,0> }#end		//DIP14 IC3 74ALS04N DIL14
#ifndef(pack_IC3) object{SOCKET_DIP14()rotate<0,-270.000000,0> rotate<0,0,0> translate<31.750000,0.000000,25.400000>}#end					//IC-Sockel 14Pin IC3 74ALS04N
#ifndef(pack_IC4) #declare global_pack_IC4=yes; object {TR_TO220_S("7805TV",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<15.240000,0.000000,1.270000>}#end		//TO220 Vertical IC4 7805TV TO220V
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<39.370000,0.000000,27.940000>}#end		//Discrete Resistor 0,3W 10MM Grid R1 10K 0207/10
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<49.530000,0.000000,20.320000>}#end		//Discrete Resistor 0,3W 10MM Grid R3 1K 0207/10
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<41.910000,0.000000,12.700000>}#end		//Discrete Resistor 0,3W 10MM Grid R4 10K 0207/10
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Orange}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<6.350000,0.000000,35.560000>}#end		//Discrete Resistor 0,3W 10MM Grid R5 10K 0207/10
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<6.350000,0.000000,22.860000>}#end		//Discrete Resistor 0,3W 10MM Grid R6 1K 0207/10
#ifndef(pack_R7) #declare global_pack_R7=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<15.240000,0.000000,38.100000>}#end		//Discrete Resistor 0,3W 10MM Grid R7 1K 0207/10
#ifndef(pack_R8) #declare global_pack_R8=yes; object {RES_DIS_0207_10MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<24.130000,0.000000,38.100000>}#end		//Discrete Resistor 0,3W 10MM Grid R8 1K 0207/10
#ifndef(pack_T1) #declare global_pack_T1=yes; object {TR_TO18("2N2222",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<29.210000,0.000000,43.180000>}#end		//TO18 T1 2N2222 TO18
#ifndef(pack_T2) #declare global_pack_T2=yes; object {TR_TO18("2N2222",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<39.370000,0.000000,43.180000>}#end		//TO18 T2 2N2222 TO18
#ifndef(pack_T3) #declare global_pack_T3=yes; object {TR_TO18("2N2222",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<19.050000,0.000000,43.180000>}#end		//TO18 T3 2N2222 TO18
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<26.670000,0,3.810000> texture{col_thl}}
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<24.130000,0,3.810000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<12.700000,0,11.430000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<15.240000,0,11.430000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<60.960000,0,15.748000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<60.960000,0,12.192000> texture{col_thl}}
#ifndef(global_pack_C4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<53.340000,0,3.810000> texture{col_thl}}
#ifndef(global_pack_C4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<55.880000,0,3.810000> texture{col_thl}}
#ifndef(global_pack_C5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<35.560000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_C5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<33.020000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<46.990000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<46.990000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<46.990000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<46.990000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<54.610000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<54.610000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<54.610000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<54.610000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<10.160000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<10.160000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<10.160000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<10.160000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<10.160000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<10.160000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<10.160000,0,17.780000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<17.780000,0,17.780000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<17.780000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<17.780000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<17.780000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<17.780000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<17.780000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<17.780000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.940000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.940000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.940000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.940000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.940000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.940000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.940000,0,17.780000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<35.560000,0,17.780000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<35.560000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<35.560000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<35.560000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<35.560000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<35.560000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_IC3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<35.560000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_IC4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<17.780000,0,3.810000> texture{col_thl}}
#ifndef(global_pack_IC4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<15.240000,0,3.810000> texture{col_thl}}
#ifndef(global_pack_IC4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<12.700000,0,3.810000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(4.013200,2.997200,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<33.020000,0,5.160000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(4.013200,2.997200,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<37.720000,0,8.160000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(4.013200,2.997200,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<33.020000,0,11.160000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,0+global_tmp,0) rotate<0,-270.000000,0>translate<50.800000,0,52.070000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<45.720000,0,52.070000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<40.640000,0,52.070000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<35.560000,0,52.070000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<30.480000,0,52.070000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<25.400000,0,52.070000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<20.320000,0,52.070000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.308000,0.800000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<15.240000,0,52.070000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<39.370000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<39.370000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<57.150000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<52.070000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<54.610000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<54.610000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<44.450000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<41.910000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<41.910000,0,17.780000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<6.350000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<6.350000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<6.350000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<6.350000,0,17.780000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<10.160000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<20.320000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<24.130000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<24.130000,0,43.180000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<27.940000,0,41.910000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<30.480000,0,41.910000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<30.480000,0,44.450000> texture{col_thl}}
#ifndef(global_pack_T2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<38.100000,0,41.910000> texture{col_thl}}
#ifndef(global_pack_T2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<40.640000,0,41.910000> texture{col_thl}}
#ifndef(global_pack_T2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<40.640000,0,44.450000> texture{col_thl}}
#ifndef(global_pack_T3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<17.780000,0,41.910000> texture{col_thl}}
#ifndef(global_pack_T3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<20.320000,0,41.910000> texture{col_thl}}
#ifndef(global_pack_T3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<20.320000,0,44.450000> texture{col_thl}}
//Pads/Vias
object{TOOLS_PCB_VIA(0.558800,0.254000,1,16,1,0) translate<24.892000,0,19.304000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.558800,0.254000,1,16,1,0) translate<37.846000,0,20.828000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<33.020000,0.000000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<33.020000,0.000000,11.160000>}
box{<0,0,-0.076200><0.238000,0.035000,0.076200> rotate<0,90.000000,0> translate<33.020000,0.000000,11.160000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.924000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<33.020000,0.000000,10.922000>}
box{<0,0,-0.076200><8.621046,0.035000,0.076200> rotate<0,-44.997030,0> translate<26.924000,0.000000,4.826000> }
}cylinder{<33.020000,1,11.160000><33.020000,-2.500000,11.160000>1.498600 texture{col_thl}}}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.318000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.318000,0.000000,42.418000>}
box{<0,0,-0.076200><16.256000,0.035000,0.076200> rotate<0,90.000000,0> translate<4.318000,0.000000,42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.826000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.826000,0.000000,32.766000>}
box{<0,0,-0.076200><6.604000,0.035000,0.076200> rotate<0,90.000000,0> translate<4.826000,0.000000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.334000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.334000,0.000000,30.734000>}
box{<0,0,-0.076200><3.048000,0.035000,0.076200> rotate<0,90.000000,0> translate<5.334000,0.000000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.334000,0.000000,30.734000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.096000,0.000000,31.496000>}
box{<0,0,-0.076200><1.077631,0.035000,0.076200> rotate<0,-44.997030,0> translate<5.334000,0.000000,30.734000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.318000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.350000,0.000000,24.130000>}
box{<0,0,-0.076200><2.873682,0.035000,0.076200> rotate<0,44.997030,0> translate<4.318000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.350000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.350000,0.000000,24.130000>}
box{<0,0,-0.076200><6.350000,0.035000,0.076200> rotate<0,90.000000,0> translate<6.350000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.334000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.620000,0.000000,25.400000>}
box{<0,0,-0.076200><3.232892,0.035000,0.076200> rotate<0,44.997030,0> translate<5.334000,0.000000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.350000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.128000,0.000000,42.418000>}
box{<0,0,-0.076200><2.514472,0.035000,0.076200> rotate<0,-44.997030,0> translate<6.350000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.128000,0.000000,42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.382000,0.000000,42.418000>}
box{<0,0,-0.076200><0.254000,0.035000,0.076200> rotate<0,0.000000,0> translate<8.128000,0.000000,42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.160000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.160000,0.000000,20.320000>}
box{<0,0,-0.076200><0.508000,0.035000,0.076200> rotate<0,-90.000000,0> translate<10.160000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.826000,0.000000,26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.160000,0.000000,20.828000>}
box{<0,0,-0.076200><7.543415,0.035000,0.076200> rotate<0,44.997030,0> translate<4.826000,0.000000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.620000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.160000,0.000000,25.400000>}
box{<0,0,-0.076200><2.540000,0.035000,0.076200> rotate<0,0.000000,0> translate<7.620000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.350000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.160000,0.000000,27.940000>}
box{<0,0,-0.076200><3.810000,0.035000,0.076200> rotate<0,0.000000,0> translate<6.350000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.350000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.160000,0.000000,30.480000>}
box{<0,0,-0.076200><3.810000,0.035000,0.076200> rotate<0,0.000000,0> translate<6.350000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.826000,0.000000,32.766000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.160000,0.000000,38.100000>}
box{<0,0,-0.076200><7.543415,0.035000,0.076200> rotate<0,-44.997030,0> translate<4.826000,0.000000,32.766000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.938000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.938000,0.000000,26.670000>}
box{<0,0,-0.076200><2.032000,0.035000,0.076200> rotate<0,-90.000000,0> translate<11.938000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.160000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.938000,0.000000,28.702000>}
box{<0,0,-0.076200><2.514472,0.035000,0.076200> rotate<0,44.997030,0> translate<10.160000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.700000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.700000,0.000000,10.160000>}
box{<0,0,-0.076200><6.350000,0.035000,0.076200> rotate<0,90.000000,0> translate<12.700000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.700000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.700000,0.000000,11.430000>}
box{<0,0,-0.076200><1.270000,0.035000,0.076200> rotate<0,90.000000,0> translate<12.700000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.160000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.208000,0.000000,22.860000>}
box{<0,0,-0.076200><3.048000,0.035000,0.076200> rotate<0,0.000000,0> translate<10.160000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.128000,0.000000,42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.240000,0.000000,49.530000>}
box{<0,0,-0.076200><10.057887,0.035000,0.076200> rotate<0,-44.997030,0> translate<8.128000,0.000000,42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.240000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.240000,0.000000,52.070000>}
box{<0,0,-0.076200><2.540000,0.035000,0.076200> rotate<0,90.000000,0> translate<15.240000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.318000,0.000000,42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.494000,0.000000,53.594000>}
box{<0,0,-0.076200><15.805251,0.035000,0.076200> rotate<0,-44.997030,0> translate<4.318000,0.000000,42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.938000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.748000,0.000000,22.860000>}
box{<0,0,-0.076200><5.388154,0.035000,0.076200> rotate<0,44.997030,0> translate<11.938000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.160000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.748000,0.000000,33.020000>}
box{<0,0,-0.076200><5.588000,0.035000,0.076200> rotate<0,0.000000,0> translate<10.160000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.382000,0.000000,42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.256000,0.000000,34.544000>}
box{<0,0,-0.076200><11.135518,0.035000,0.076200> rotate<0,44.997030,0> translate<8.382000,0.000000,42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.240000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.256000,0.000000,53.086000>}
box{<0,0,-0.076200><1.436841,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.240000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.208000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.764000,0.000000,19.304000>}
box{<0,0,-0.076200><5.028943,0.035000,0.076200> rotate<0,44.997030,0> translate<13.208000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.748000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.764000,0.000000,23.876000>}
box{<0,0,-0.076200><1.436841,0.035000,0.076200> rotate<0,-44.997030,0> translate<15.748000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.748000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.764000,0.000000,32.004000>}
box{<0,0,-0.076200><1.436841,0.035000,0.076200> rotate<0,44.997030,0> translate<15.748000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,20.320000>}
box{<0,0,-0.076200><0.508000,0.035000,0.076200> rotate<0,-90.000000,0> translate<17.780000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.748000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,20.828000>}
box{<0,0,-0.076200><2.873682,0.035000,0.076200> rotate<0,44.997030,0> translate<15.748000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.256000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,33.020000>}
box{<0,0,-0.076200><2.155261,0.035000,0.076200> rotate<0,44.997030,0> translate<16.256000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.812000,-1.535000,17.780000>}
box{<0,0,-0.076200><2.032000,0.035000,0.076200> rotate<0,0.000000,0> translate<17.780000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.320000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.320000,0.000000,41.910000>}
box{<0,0,-0.076200><3.810000,0.035000,0.076200> rotate<0,90.000000,0> translate<20.320000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.320000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.320000,0.000000,52.070000>}
box{<0,0,-0.076200><7.620000,0.035000,0.076200> rotate<0,90.000000,0> translate<20.320000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.256000,0.000000,53.086000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.574000,0.000000,53.086000>}
box{<0,0,-0.076200><4.318000,0.035000,0.076200> rotate<0,0.000000,0> translate<16.256000,0.000000,53.086000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.574000,0.000000,53.086000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.590000,0.000000,52.070000>}
box{<0,0,-0.076200><1.436841,0.035000,0.076200> rotate<0,44.997030,0> translate<20.574000,0.000000,53.086000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.096000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.844000,0.000000,31.496000>}
box{<0,0,-0.076200><15.748000,0.035000,0.076200> rotate<0,0.000000,0> translate<6.096000,0.000000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.764000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.844000,0.000000,32.004000>}
box{<0,0,-0.076200><5.080000,0.035000,0.076200> rotate<0,0.000000,0> translate<16.764000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.860000,0.000000,3.810000>}
box{<0,0,-0.076200><5.080000,0.035000,0.076200> rotate<0,0.000000,0> translate<17.780000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.780000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.368000,0.000000,22.860000>}
box{<0,0,-0.076200><5.588000,0.035000,0.076200> rotate<0,0.000000,0> translate<17.780000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.860000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.876000,0.000000,4.826000>}
box{<0,0,-0.076200><1.436841,0.035000,0.076200> rotate<0,-44.997030,0> translate<22.860000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.844000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.876000,0.000000,34.036000>}
box{<0,0,-0.076200><2.873682,0.035000,0.076200> rotate<0,-44.997030,0> translate<21.844000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.764000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.892000,0.000000,19.304000>}
box{<0,0,-0.076200><8.128000,0.035000,0.076200> rotate<0,0.000000,0> translate<16.764000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.590000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.400000,0.000000,52.070000>}
box{<0,0,-0.076200><3.810000,0.035000,0.076200> rotate<0,0.000000,0> translate<21.590000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.892000,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.908000,-1.535000,20.320000>}
box{<0,0,-0.076200><1.436841,0.035000,0.076200> rotate<0,-44.997030,0> translate<24.892000,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.130000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.162000,0.000000,33.020000>}
box{<0,0,-0.076200><2.032000,0.035000,0.076200> rotate<0,0.000000,0> translate<24.130000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.162000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.162000,0.000000,33.020000>}
box{<0,0,-0.076200><2.794000,0.035000,0.076200> rotate<0,90.000000,0> translate<26.162000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.812000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.416000,-1.535000,24.384000>}
box{<0,0,-0.076200><9.339466,0.035000,0.076200> rotate<0,-44.997030,0> translate<19.812000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.670000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.670000,0.000000,3.810000>}
box{<0,0,-0.076200><0.762000,0.035000,0.076200> rotate<0,-90.000000,0> translate<26.670000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.876000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.924000,0.000000,4.826000>}
box{<0,0,-0.076200><3.048000,0.035000,0.076200> rotate<0,0.000000,0> translate<23.876000,0.000000,4.826000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.670000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.924000,0.000000,4.826000>}
box{<0,0,-0.076200><0.359210,0.035000,0.076200> rotate<0,-44.997030,0> translate<26.670000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.764000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.924000,0.000000,23.876000>}
box{<0,0,-0.076200><10.160000,0.035000,0.076200> rotate<0,0.000000,0> translate<16.764000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.368000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.432000,0.000000,18.796000>}
box{<0,0,-0.076200><5.747364,0.035000,0.076200> rotate<0,44.997030,0> translate<23.368000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.700000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.940000,0.000000,10.160000>}
box{<0,0,-0.076200><15.240000,0.035000,0.076200> rotate<0,0.000000,0> translate<12.700000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.908000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.940000,-1.535000,20.320000>}
box{<0,0,-0.076200><2.032000,0.035000,0.076200> rotate<0,0.000000,0> translate<25.908000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.924000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.940000,0.000000,22.860000>}
box{<0,0,-0.076200><1.436841,0.035000,0.076200> rotate<0,44.997030,0> translate<26.924000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.844000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.940000,0.000000,25.400000>}
box{<0,0,-0.076200><8.621046,0.035000,0.076200> rotate<0,44.997030,0> translate<21.844000,0.000000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.940000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.940000,0.000000,27.940000>}
box{<0,0,-0.076200><0.254000,0.035000,0.076200> rotate<0,-90.000000,0> translate<27.940000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.940000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.940000,0.000000,27.940000>}
box{<0,0,-0.076200><0.254000,0.035000,0.076200> rotate<0,-90.000000,0> translate<27.940000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.162000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.940000,0.000000,28.448000>}
box{<0,0,-0.076200><2.514472,0.035000,0.076200> rotate<0,44.997030,0> translate<26.162000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.940000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.940000,0.000000,28.448000>}
box{<0,0,-0.076200><0.254000,0.035000,0.076200> rotate<0,90.000000,0> translate<27.940000,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.162000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.940000,0.000000,33.020000>}
box{<0,0,-0.076200><1.778000,0.035000,0.076200> rotate<0,0.000000,0> translate<26.162000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.876000,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<28.956000,0.000000,34.036000>}
box{<0,0,-0.076200><5.080000,0.035000,0.076200> rotate<0,0.000000,0> translate<23.876000,0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.130000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.210000,0.000000,43.180000>}
box{<0,0,-0.076200><5.080000,0.035000,0.076200> rotate<0,0.000000,0> translate<24.130000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.940000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.718000,0.000000,32.258000>}
box{<0,0,-0.076200><2.514472,0.035000,0.076200> rotate<0,-44.997030,0> translate<27.940000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.718000,0.000000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.718000,0.000000,32.258000>}
box{<0,0,-0.076200><1.016000,0.035000,0.076200> rotate<0,-90.000000,0> translate<29.718000,0.000000,32.258000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<28.956000,0.000000,34.036000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.718000,0.000000,33.274000>}
box{<0,0,-0.076200><1.077631,0.035000,0.076200> rotate<0,44.997030,0> translate<28.956000,0.000000,34.036000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<29.210000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.480000,0.000000,41.910000>}
box{<0,0,-0.076200><1.796051,0.035000,0.076200> rotate<0,44.997030,0> translate<29.210000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.480000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.480000,0.000000,52.070000>}
box{<0,0,-0.076200><7.620000,0.035000,0.076200> rotate<0,90.000000,0> translate<30.480000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.416000,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<32.512000,-1.535000,24.384000>}
box{<0,0,-0.076200><6.096000,0.035000,0.076200> rotate<0,0.000000,0> translate<26.416000,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.940000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<32.766000,0.000000,14.986000>}
box{<0,0,-0.076200><6.824995,0.035000,0.076200> rotate<0,-44.997030,0> translate<27.940000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.940000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<32.766000,0.000000,22.860000>}
box{<0,0,-0.076200><4.826000,0.035000,0.076200> rotate<0,0.000000,0> translate<27.940000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<32.766000,0.000000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<33.274000,0.000000,14.986000>}
box{<0,0,-0.076200><0.508000,0.035000,0.076200> rotate<0,0.000000,0> translate<32.766000,0.000000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<32.512000,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<33.528000,-1.535000,25.400000>}
box{<0,0,-0.076200><1.436841,0.035000,0.076200> rotate<0,-44.997030,0> translate<32.512000,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.940000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<34.290000,0.000000,21.844000>}
box{<0,0,-0.076200><8.980256,0.035000,0.076200> rotate<0,44.997030,0> translate<27.940000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.432000,0.000000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<34.544000,0.000000,18.796000>}
box{<0,0,-0.076200><7.112000,0.035000,0.076200> rotate<0,0.000000,0> translate<27.432000,0.000000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<33.274000,0.000000,14.986000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<35.306000,0.000000,12.954000>}
box{<0,0,-0.076200><2.873682,0.035000,0.076200> rotate<0,44.997030,0> translate<33.274000,0.000000,14.986000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<32.766000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<35.306000,0.000000,20.320000>}
box{<0,0,-0.076200><3.592102,0.035000,0.076200> rotate<0,44.997030,0> translate<32.766000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.494000,0.000000,53.594000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<35.306000,0.000000,53.594000>}
box{<0,0,-0.076200><19.812000,0.035000,0.076200> rotate<0,0.000000,0> translate<15.494000,0.000000,53.594000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<35.560000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<35.560000,0.000000,13.970000>}
box{<0,0,-0.076200><3.810000,0.035000,0.076200> rotate<0,-90.000000,0> translate<35.560000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<34.544000,0.000000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<35.560000,0.000000,17.780000>}
box{<0,0,-0.076200><1.436841,0.035000,0.076200> rotate<0,44.997030,0> translate<34.544000,0.000000,18.796000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<35.306000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<35.560000,0.000000,20.320000>}
box{<0,0,-0.076200><0.254000,0.035000,0.076200> rotate<0,0.000000,0> translate<35.306000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<33.528000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<35.560000,-1.535000,25.400000>}
box{<0,0,-0.076200><2.032000,0.035000,0.076200> rotate<0,0.000000,0> translate<33.528000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.256000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<35.560000,0.000000,34.544000>}
box{<0,0,-0.076200><19.304000,0.035000,0.076200> rotate<0,0.000000,0> translate<16.256000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<35.560000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<35.560000,0.000000,34.544000>}
box{<0,0,-0.076200><1.524000,0.035000,0.076200> rotate<0,90.000000,0> translate<35.560000,0.000000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<35.560000,0.000000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<35.560000,0.000000,52.070000>}
box{<0,0,-0.076200><17.526000,0.035000,0.076200> rotate<0,90.000000,0> translate<35.560000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<34.290000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<36.068000,0.000000,21.844000>}
box{<0,0,-0.076200><1.778000,0.035000,0.076200> rotate<0,0.000000,0> translate<34.290000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<35.306000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<37.084000,0.000000,12.954000>}
box{<0,0,-0.076200><1.778000,0.035000,0.076200> rotate<0,0.000000,0> translate<35.306000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<36.068000,0.000000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<37.084000,0.000000,20.828000>}
box{<0,0,-0.076200><1.436841,0.035000,0.076200> rotate<0,44.997030,0> translate<36.068000,0.000000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<37.084000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<37.846000,0.000000,20.828000>}
box{<0,0,-0.076200><0.762000,0.035000,0.076200> rotate<0,0.000000,0> translate<37.084000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<37.846000,-1.535000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<37.846000,-1.535000,20.828000>}
box{<0,0,-0.076200><3.556000,0.035000,0.076200> rotate<0,90.000000,0> translate<37.846000,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<35.560000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<38.100000,0.000000,20.320000>}
box{<0,0,-0.076200><2.540000,0.035000,0.076200> rotate<0,0.000000,0> translate<35.560000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<35.560000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<39.370000,0.000000,22.860000>}
box{<0,0,-0.076200><3.810000,0.035000,0.076200> rotate<0,0.000000,0> translate<35.560000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<39.370000,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<39.370000,-1.535000,22.860000>}
box{<0,0,-0.076200><4.826000,0.035000,0.076200> rotate<0,90.000000,0> translate<39.370000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<35.560000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<39.370000,0.000000,33.020000>}
box{<0,0,-0.076200><3.810000,0.035000,0.076200> rotate<0,0.000000,0> translate<35.560000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<39.370000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<39.370000,-1.535000,33.020000>}
box{<0,0,-0.076200><6.350000,0.035000,0.076200> rotate<0,90.000000,0> translate<39.370000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<39.624000,0.000000,49.276000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<39.624000,0.000000,42.926000>}
box{<0,0,-0.076200><6.350000,0.035000,0.076200> rotate<0,-90.000000,0> translate<39.624000,0.000000,42.926000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<35.306000,0.000000,53.594000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<39.624000,0.000000,49.276000>}
box{<0,0,-0.076200><6.106574,0.035000,0.076200> rotate<0,44.997030,0> translate<35.306000,0.000000,53.594000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<39.624000,0.000000,42.926000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<40.640000,0.000000,41.910000>}
box{<0,0,-0.076200><1.436841,0.035000,0.076200> rotate<0,44.997030,0> translate<39.624000,0.000000,42.926000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<40.640000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<40.640000,0.000000,52.070000>}
box{<0,0,-0.076200><7.620000,0.035000,0.076200> rotate<0,90.000000,0> translate<40.640000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<37.084000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<41.910000,0.000000,17.780000>}
box{<0,0,-0.076200><6.824995,0.035000,0.076200> rotate<0,-44.997030,0> translate<37.084000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<39.370000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<44.196000,-1.535000,21.844000>}
box{<0,0,-0.076200><6.824995,0.035000,0.076200> rotate<0,44.997030,0> translate<39.370000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<44.196000,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<44.196000,-1.535000,21.844000>}
box{<0,0,-0.076200><1.270000,0.035000,0.076200> rotate<0,90.000000,0> translate<44.196000,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<41.910000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<44.450000,0.000000,20.320000>}
box{<0,0,-0.076200><3.592102,0.035000,0.076200> rotate<0,-44.997030,0> translate<41.910000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<44.196000,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<44.450000,-1.535000,20.320000>}
box{<0,0,-0.076200><0.359210,0.035000,0.076200> rotate<0,44.997030,0> translate<44.196000,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<39.370000,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<44.704000,-1.535000,12.700000>}
box{<0,0,-0.076200><7.543415,0.035000,0.076200> rotate<0,44.997030,0> translate<39.370000,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<37.846000,-1.535000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<44.958000,-1.535000,10.160000>}
box{<0,0,-0.076200><10.057887,0.035000,0.076200> rotate<0,44.997030,0> translate<37.846000,-1.535000,17.272000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<41.910000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<46.990000,0.000000,7.620000>}
box{<0,0,-0.076200><5.080000,0.035000,0.076200> rotate<0,0.000000,0> translate<41.910000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<44.958000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<46.990000,-1.535000,10.160000>}
box{<0,0,-0.076200><2.032000,0.035000,0.076200> rotate<0,0.000000,0> translate<44.958000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<44.704000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<46.990000,-1.535000,12.700000>}
box{<0,0,-0.076200><2.286000,0.035000,0.076200> rotate<0,0.000000,0> translate<44.704000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<44.450000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<49.530000,0.000000,15.240000>}
box{<0,0,-0.076200><7.184205,0.035000,0.076200> rotate<0,44.997030,0> translate<44.450000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<38.100000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<50.800000,0.000000,33.020000>}
box{<0,0,-0.076200><17.960512,0.035000,0.076200> rotate<0,-44.997030,0> translate<38.100000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<50.800000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<50.800000,0.000000,52.070000>}
box{<0,0,-0.076200><19.050000,0.035000,0.076200> rotate<0,90.000000,0> translate<50.800000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<52.070000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<52.070000,0.000000,30.480000>}
box{<0,0,-0.076200><5.334000,0.035000,0.076200> rotate<0,90.000000,0> translate<52.070000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<53.340000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<53.340000,0.000000,6.350000>}
box{<0,0,-0.076200><2.540000,0.035000,0.076200> rotate<0,90.000000,0> translate<53.340000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<53.340000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.610000,0.000000,7.620000>}
box{<0,0,-0.076200><1.796051,0.035000,0.076200> rotate<0,-44.997030,0> translate<53.340000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.610000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.610000,0.000000,12.700000>}
box{<0,0,-0.076200><2.540000,0.035000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<49.530000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.610000,0.000000,15.240000>}
box{<0,0,-0.076200><5.080000,0.035000,0.076200> rotate<0,0.000000,0> translate<49.530000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<52.070000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.610000,0.000000,22.606000>}
box{<0,0,-0.076200><3.592102,0.035000,0.076200> rotate<0,44.997030,0> translate<52.070000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.610000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.610000,0.000000,22.606000>}
box{<0,0,-0.076200><2.286000,0.035000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.610000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.610000,0.000000,27.940000>}
box{<0,0,-0.076200><4.826000,0.035000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.610000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<59.690000,0.000000,17.780000>}
box{<0,0,-0.076200><7.184205,0.035000,0.076200> rotate<0,-44.997030,0> translate<54.610000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<54.610000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<59.690000,0.000000,18.034000>}
box{<0,0,-0.076200><7.184205,0.035000,0.076200> rotate<0,44.997030,0> translate<54.610000,0.000000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<59.690000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<59.690000,0.000000,18.034000>}
box{<0,0,-0.076200><0.254000,0.035000,0.076200> rotate<0,90.000000,0> translate<59.690000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<60.960000,0.000000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<60.960000,0.000000,15.748000>}
box{<0,0,-0.076200><1.016000,0.035000,0.076200> rotate<0,-90.000000,0> translate<60.960000,0.000000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<59.690000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<60.960000,0.000000,16.764000>}
box{<0,0,-0.076200><1.796051,0.035000,0.076200> rotate<0,44.997030,0> translate<59.690000,0.000000,18.034000> }
//Text
//Rect
union{
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygons
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,0.457100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,65.572800>}
box{<0,0,-0.203200><65.115700,0.035000,0.203200> rotate<0,90.000000,0> translate<0.457100,-1.535000,65.572800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,0.457100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,0.457100>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,0.457100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,0.812800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,0.812800>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,0.812800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,1.219200>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,1.625600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,1.625600>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,1.625600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.606500,-1.535000,2.032000>}
box{<0,0,-0.203200><2.149400,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.200100,-1.535000,2.438400>}
box{<0,0,-0.203200><1.743000,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.927800,-1.535000,2.844800>}
box{<0,0,-0.203200><1.470700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.759500,-1.535000,3.251200>}
box{<0,0,-0.203200><1.302400,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.701800,-1.535000,3.657600>}
box{<0,0,-0.203200><1.244700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.701800,-1.535000,4.064000>}
box{<0,0,-0.203200><1.244700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.801700,-1.535000,4.470400>}
box{<0,0,-0.203200><1.344600,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.970000,-1.535000,4.876800>}
box{<0,0,-0.203200><1.512900,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.301800,-1.535000,5.283200>}
box{<0,0,-0.203200><1.844700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.838900,-1.535000,5.689600>}
box{<0,0,-0.203200><2.381800,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.741000,-1.535000,6.096000>}
box{<0,0,-0.203200><30.283900,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.909300,-1.535000,6.502400>}
box{<0,0,-0.203200><30.452200,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.284500,-1.535000,6.908800>}
box{<0,0,-0.203200><30.827400,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.785100,-1.535000,7.315200>}
box{<0,0,-0.203200><31.328000,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.256200,-1.535000,7.721600>}
box{<0,0,-0.203200><34.799100,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.516300,-1.535000,8.128000>}
box{<0,0,-0.203200><37.059200,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.256200,-1.535000,8.534400>}
box{<0,0,-0.203200><34.799100,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.204700,-1.535000,8.940800>}
box{<0,0,-0.203200><31.747600,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.492100,-1.535000,9.347200>}
box{<0,0,-0.203200><31.035000,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.085700,-1.535000,9.753600>}
box{<0,0,-0.203200><30.628600,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.877300,-1.535000,10.160000>}
box{<0,0,-0.203200><30.420200,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.929100,-1.535000,10.566400>}
box{<0,0,-0.203200><11.472000,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.638400,-1.535000,10.972800>}
box{<0,0,-0.203200><11.181300,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.544300,-1.535000,11.379200>}
box{<0,0,-0.203200><11.087200,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.596400,-1.535000,11.785600>}
box{<0,0,-0.203200><11.139300,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.827600,-1.535000,12.192000>}
box{<0,0,-0.203200><11.370500,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.630400,-1.535000,12.598400>}
box{<0,0,-0.203200><14.173300,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.524200,-1.535000,13.004800>}
box{<0,0,-0.203200><31.067100,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.998300,-1.535000,13.411200>}
box{<0,0,-0.203200><31.541200,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.902400,-1.535000,13.817600>}
box{<0,0,-0.203200><31.445300,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.902400,-1.535000,14.224000>}
box{<0,0,-0.203200><31.445300,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.100000,-1.535000,14.630400>}
box{<0,0,-0.203200><31.642900,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.506400,-1.535000,15.036800>}
box{<0,0,-0.203200><32.049300,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.064100,-1.535000,15.443200>}
box{<0,0,-0.203200><38.607000,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.657700,-1.535000,15.849600>}
box{<0,0,-0.203200><38.200600,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.251300,-1.535000,16.256000>}
box{<0,0,-0.203200><37.794200,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.277200,-1.535000,16.662400>}
box{<0,0,-0.203200><8.820100,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.624400,-1.535000,17.068800>}
box{<0,0,-0.203200><5.167300,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334000,-1.535000,17.475200>}
box{<0,0,-0.203200><4.876900,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334000,-1.535000,17.881600>}
box{<0,0,-0.203200><4.876900,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.421300,-1.535000,18.288000>}
box{<0,0,-0.203200><4.964200,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.827700,-1.535000,18.694400>}
box{<0,0,-0.203200><5.370600,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.522300,-1.535000,19.100800>}
box{<0,0,-0.203200><20.065200,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.875500,-1.535000,19.507200>}
box{<0,0,-0.203200><8.418400,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.568200,-1.535000,19.913600>}
box{<0,0,-0.203200><8.111100,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,20.320000>}
box{<0,0,-0.203200><8.026500,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.568300,-1.535000,20.726400>}
box{<0,0,-0.203200><8.111200,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.875600,-1.535000,21.132800>}
box{<0,0,-0.203200><8.418500,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.960700,-1.535000,21.539200>}
box{<0,0,-0.203200><22.503600,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.052100,-1.535000,21.945600>}
box{<0,0,-0.203200><8.595000,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.610200,-1.535000,22.352000>}
box{<0,0,-0.203200><8.153100,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,22.758400>}
box{<0,0,-0.203200><8.026500,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.526200,-1.535000,23.164800>}
box{<0,0,-0.203200><8.069100,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.774000,-1.535000,23.571200>}
box{<0,0,-0.203200><8.316900,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.399100,-1.535000,23.977600>}
box{<0,0,-0.203200><24.942000,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.297400,-1.535000,24.384000>}
box{<0,0,-0.203200><8.840300,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.672300,-1.535000,24.790400>}
box{<0,0,-0.203200><8.215200,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.484000,-1.535000,25.196800>}
box{<0,0,-0.203200><8.026900,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.484100,-1.535000,25.603200>}
box{<0,0,-0.203200><8.027000,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.672400,-1.535000,26.009600>}
box{<0,0,-0.203200><8.215300,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.013300,-1.535000,26.416000>}
box{<0,0,-0.203200><38.556200,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.897200,-1.535000,26.822400>}
box{<0,0,-0.203200><16.440100,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.624400,-1.535000,27.228800>}
box{<0,0,-0.203200><5.167300,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334000,-1.535000,27.635200>}
box{<0,0,-0.203200><4.876900,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334000,-1.535000,28.041600>}
box{<0,0,-0.203200><4.876900,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.421300,-1.535000,28.448000>}
box{<0,0,-0.203200><4.964200,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.827700,-1.535000,28.854400>}
box{<0,0,-0.203200><5.370600,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,29.260800>}
box{<0,0,-0.203200><38.481100,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.726000,-1.535000,29.667200>}
box{<0,0,-0.203200><5.268900,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334000,-1.535000,30.073600>}
box{<0,0,-0.203200><4.876900,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334000,-1.535000,30.480000>}
box{<0,0,-0.203200><4.876900,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334000,-1.535000,30.886400>}
box{<0,0,-0.203200><4.876900,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.726100,-1.535000,31.292800>}
box{<0,0,-0.203200><5.269000,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,31.699200>}
box{<0,0,-0.203200><38.481100,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.052100,-1.535000,32.105600>}
box{<0,0,-0.203200><8.595000,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.610200,-1.535000,32.512000>}
box{<0,0,-0.203200><8.153100,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,32.918400>}
box{<0,0,-0.203200><8.026500,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.526200,-1.535000,33.324800>}
box{<0,0,-0.203200><8.069100,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.774000,-1.535000,33.731200>}
box{<0,0,-0.203200><8.316900,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,34.137600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,34.137600>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,34.137600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,34.544000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,34.544000>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,34.544000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,34.950400>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,35.356800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,35.356800>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,35.356800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,35.763200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,35.763200>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,35.763200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,36.169600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,36.169600>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,36.169600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,36.576000>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,36.982400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,36.982400>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,36.982400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.434400,-1.535000,37.388800>}
box{<0,0,-0.203200><8.977300,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.144000,-1.535000,37.795200>}
box{<0,0,-0.203200><8.686900,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.144000,-1.535000,38.201600>}
box{<0,0,-0.203200><8.686900,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.231300,-1.535000,38.608000>}
box{<0,0,-0.203200><8.774200,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.637700,-1.535000,39.014400>}
box{<0,0,-0.203200><9.180600,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,39.420800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,39.420800>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,39.420800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,39.827200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.726000,-1.535000,39.827200>}
box{<0,0,-0.203200><5.268900,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,39.827200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334000,-1.535000,40.233600>}
box{<0,0,-0.203200><4.876900,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334000,-1.535000,40.640000>}
box{<0,0,-0.203200><4.876900,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,41.046400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334000,-1.535000,41.046400>}
box{<0,0,-0.203200><4.876900,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,41.046400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.726100,-1.535000,41.452800>}
box{<0,0,-0.203200><5.269000,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,41.859200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662400,-1.535000,41.859200>}
box{<0,0,-0.203200><16.205300,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,41.859200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,42.265600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662400,-1.535000,42.265600>}
box{<0,0,-0.203200><16.205300,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,42.265600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.961600,-1.535000,42.672000>}
box{<0,0,-0.203200><16.504500,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,43.078400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.114000,-1.535000,43.078400>}
box{<0,0,-0.203200><22.656900,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,43.078400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.848400,-1.535000,43.484800>}
box{<0,0,-0.203200><19.391300,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.442000,-1.535000,43.891200>}
box{<0,0,-0.203200><18.984900,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,44.297600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,-1.535000,44.297600>}
box{<0,0,-0.203200><18.846900,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,44.297600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,-1.535000,44.704000>}
box{<0,0,-0.203200><18.846900,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,45.110400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.543700,-1.535000,45.110400>}
box{<0,0,-0.203200><19.086600,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,45.110400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,45.516800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,45.516800>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,45.516800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,45.923200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,45.923200>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,45.923200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,46.329600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,46.329600>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,46.329600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,46.736000>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,47.142400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,47.142400>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,47.142400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,47.548800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,47.548800>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,47.548800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,47.955200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,47.955200>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,47.955200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,48.361600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,48.361600>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,48.361600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,48.768000>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,49.174400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,49.174400>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,49.174400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,49.580800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,49.580800>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,49.580800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,49.987200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,49.987200>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,49.987200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,50.393600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,50.393600>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,50.393600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,50.800000>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.686600,-1.535000,51.206400>}
box{<0,0,-0.203200><14.229500,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,51.612800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.336500,-1.535000,51.612800>}
box{<0,0,-0.203200><13.879400,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,51.612800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,52.019200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.230400,-1.535000,52.019200>}
box{<0,0,-0.203200><13.773300,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,52.019200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.294600,-1.535000,52.425600>}
box{<0,0,-0.203200><13.837500,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.574300,-1.535000,52.832000>}
box{<0,0,-0.203200><14.117200,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,53.238400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,53.238400>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,53.238400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,53.644800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,53.644800>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,53.644800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,54.051200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,54.051200>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,54.051200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,54.457600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,54.457600>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,54.457600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,54.864000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,54.864000>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,54.864000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,55.270400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,55.270400>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,55.270400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,55.676800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,55.676800>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,55.676800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,56.083200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,56.083200>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,56.083200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,56.489600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,56.489600>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,56.489600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,56.896000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,56.896000>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,56.896000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,57.302400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,57.302400>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,57.302400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,57.708800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,57.708800>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,57.708800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,58.115200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,58.115200>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,58.115200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,58.521600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,58.521600>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,58.521600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,58.928000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,58.928000>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,58.928000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,59.334400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,59.334400>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,59.334400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,59.740800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,59.740800>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,59.740800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,60.147200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.329200,-1.535000,60.147200>}
box{<0,0,-0.203200><2.872100,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,60.147200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,60.553600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.504900,-1.535000,60.553600>}
box{<0,0,-0.203200><2.047800,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,60.553600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.098500,-1.535000,60.960000>}
box{<0,0,-0.203200><1.641400,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,61.366400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.885700,-1.535000,61.366400>}
box{<0,0,-0.203200><1.428600,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,61.366400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,61.772800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.717400,-1.535000,61.772800>}
box{<0,0,-0.203200><1.260300,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,61.772800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,62.179200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.701800,-1.535000,62.179200>}
box{<0,0,-0.203200><1.244700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,62.179200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,62.585600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.701800,-1.535000,62.585600>}
box{<0,0,-0.203200><1.244700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,62.585600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,62.992000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.843800,-1.535000,62.992000>}
box{<0,0,-0.203200><1.386700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,62.992000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,63.398400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.012100,-1.535000,63.398400>}
box{<0,0,-0.203200><1.555000,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,63.398400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,63.804800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.403400,-1.535000,63.804800>}
box{<0,0,-0.203200><1.946300,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,63.804800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,64.211200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.084300,-1.535000,64.211200>}
box{<0,0,-0.203200><2.627200,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,64.211200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,64.617600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,64.617600>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,64.617600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,65.024000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,65.024000>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,65.024000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,65.430400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,65.430400>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,65.430400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.457100,-1.535000,65.572800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,65.572800>}
box{<0,0,-0.203200><64.795700,0.035000,0.203200> rotate<0,0.000000,0> translate<0.457100,-1.535000,65.572800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.701800,-1.535000,3.390600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.022700,-1.535000,2.615800>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,67.497607,0> translate<1.701800,-1.535000,3.390600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.701800,-1.535000,4.229300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.701800,-1.535000,3.390600>}
box{<0,0,-0.203200><0.838700,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.701800,-1.535000,3.390600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.701800,-1.535000,4.229300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.022700,-1.535000,5.004100>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,-67.497607,0> translate<1.701800,-1.535000,4.229300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.701800,-1.535000,61.810600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.022700,-1.535000,61.035800>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,67.497607,0> translate<1.701800,-1.535000,61.810600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.701800,-1.535000,62.649300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.701800,-1.535000,61.810600>}
box{<0,0,-0.203200><0.838700,0.035000,0.203200> rotate<0,-90.000000,0> translate<1.701800,-1.535000,61.810600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<1.701800,-1.535000,62.649300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.022700,-1.535000,63.424100>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,-67.497607,0> translate<1.701800,-1.535000,62.649300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.022700,-1.535000,2.615800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.615800,-1.535000,2.022700>}
box{<0,0,-0.203200><0.838770,0.035000,0.203200> rotate<0,44.997030,0> translate<2.022700,-1.535000,2.615800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.022700,-1.535000,5.004100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.615800,-1.535000,5.597200>}
box{<0,0,-0.203200><0.838770,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.022700,-1.535000,5.004100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.022700,-1.535000,61.035800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.615800,-1.535000,60.442700>}
box{<0,0,-0.203200><0.838770,0.035000,0.203200> rotate<0,44.997030,0> translate<2.022700,-1.535000,61.035800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.022700,-1.535000,63.424100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.615800,-1.535000,64.017200>}
box{<0,0,-0.203200><0.838770,0.035000,0.203200> rotate<0,-44.997030,0> translate<2.022700,-1.535000,63.424100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.615800,-1.535000,2.022700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.390600,-1.535000,1.701800>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,22.496453,0> translate<2.615800,-1.535000,2.022700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.615800,-1.535000,5.597200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.390600,-1.535000,5.918100>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,-22.496453,0> translate<2.615800,-1.535000,5.597200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.615800,-1.535000,60.442700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.390600,-1.535000,60.121800>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,22.496453,0> translate<2.615800,-1.535000,60.442700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.615800,-1.535000,64.017200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.390600,-1.535000,64.338100>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,-22.496453,0> translate<2.615800,-1.535000,64.017200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.390600,-1.535000,1.701800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.229300,-1.535000,1.701800>}
box{<0,0,-0.203200><0.838700,0.035000,0.203200> rotate<0,0.000000,0> translate<3.390600,-1.535000,1.701800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.390600,-1.535000,5.918100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.229300,-1.535000,5.918100>}
box{<0,0,-0.203200><0.838700,0.035000,0.203200> rotate<0,0.000000,0> translate<3.390600,-1.535000,5.918100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.390600,-1.535000,60.121800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.229300,-1.535000,60.121800>}
box{<0,0,-0.203200><0.838700,0.035000,0.203200> rotate<0,0.000000,0> translate<3.390600,-1.535000,60.121800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.390600,-1.535000,64.338100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.229300,-1.535000,64.338100>}
box{<0,0,-0.203200><0.838700,0.035000,0.203200> rotate<0,0.000000,0> translate<3.390600,-1.535000,64.338100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.229300,-1.535000,1.701800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.004100,-1.535000,2.022700>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,-22.496453,0> translate<4.229300,-1.535000,1.701800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.229300,-1.535000,5.918100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.004100,-1.535000,5.597200>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,22.496453,0> translate<4.229300,-1.535000,5.918100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.229300,-1.535000,60.121800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.004100,-1.535000,60.442700>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,-22.496453,0> translate<4.229300,-1.535000,60.121800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.229300,-1.535000,64.338100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.004100,-1.535000,64.017200>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,22.496453,0> translate<4.229300,-1.535000,64.338100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.290600,-1.535000,60.147200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.749200,-1.535000,60.147200>}
box{<0,0,-0.203200><57.458600,0.035000,0.203200> rotate<0,0.000000,0> translate<4.290600,-1.535000,60.147200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.535700,-1.535000,64.211200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.504300,-1.535000,64.211200>}
box{<0,0,-0.203200><56.968600,0.035000,0.203200> rotate<0,0.000000,0> translate<4.535700,-1.535000,64.211200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.781100,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.752400,-1.535000,5.689600>}
box{<0,0,-0.203200><9.971300,0.035000,0.203200> rotate<0,0.000000,0> translate<4.781100,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.004100,-1.535000,2.022700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.597200,-1.535000,2.615800>}
box{<0,0,-0.203200><0.838770,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.004100,-1.535000,2.022700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.004100,-1.535000,5.597200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.597200,-1.535000,5.004100>}
box{<0,0,-0.203200><0.838770,0.035000,0.203200> rotate<0,44.997030,0> translate<5.004100,-1.535000,5.597200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.004100,-1.535000,60.442700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.597200,-1.535000,61.035800>}
box{<0,0,-0.203200><0.838770,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.004100,-1.535000,60.442700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.004100,-1.535000,64.017200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.597200,-1.535000,63.424100>}
box{<0,0,-0.203200><0.838770,0.035000,0.203200> rotate<0,44.997030,0> translate<5.004100,-1.535000,64.017200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.013400,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.232200,-1.535000,2.032000>}
box{<0,0,-0.203200><7.218800,0.035000,0.203200> rotate<0,0.000000,0> translate<5.013400,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.115000,-1.535000,60.553600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.924900,-1.535000,60.553600>}
box{<0,0,-0.203200><55.809900,0.035000,0.203200> rotate<0,0.000000,0> translate<5.115000,-1.535000,60.553600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.216500,-1.535000,63.804800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.823400,-1.535000,63.804800>}
box{<0,0,-0.203200><55.606900,0.035000,0.203200> rotate<0,0.000000,0> translate<5.216500,-1.535000,63.804800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.318100,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.830700,-1.535000,5.283200>}
box{<0,0,-0.203200><6.512600,0.035000,0.203200> rotate<0,0.000000,0> translate<5.318100,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334000,-1.535000,17.359200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.929200,-1.535000,16.764000>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<5.334000,-1.535000,17.359200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334000,-1.535000,18.200700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334000,-1.535000,17.359200>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.334000,-1.535000,17.359200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334000,-1.535000,18.200700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.929200,-1.535000,18.795900>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.334000,-1.535000,18.200700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334000,-1.535000,27.519200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.929200,-1.535000,26.924000>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<5.334000,-1.535000,27.519200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334000,-1.535000,28.360700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334000,-1.535000,27.519200>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.334000,-1.535000,27.519200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334000,-1.535000,28.360700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.929200,-1.535000,28.955900>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.334000,-1.535000,28.360700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334000,-1.535000,30.059200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.929200,-1.535000,29.464000>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<5.334000,-1.535000,30.059200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334000,-1.535000,30.900700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334000,-1.535000,30.059200>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.334000,-1.535000,30.059200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334000,-1.535000,30.900700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.929200,-1.535000,31.495900>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.334000,-1.535000,30.900700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334000,-1.535000,40.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.929200,-1.535000,39.624000>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<5.334000,-1.535000,40.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334000,-1.535000,41.060700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334000,-1.535000,40.219200>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,-90.000000,0> translate<5.334000,-1.535000,40.219200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.334000,-1.535000,41.060700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.929200,-1.535000,41.655900>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.334000,-1.535000,41.060700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.419800,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.742700,-1.535000,2.438400>}
box{<0,0,-0.203200><6.322900,0.035000,0.203200> rotate<0,0.000000,0> translate<5.419800,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.521400,-1.535000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.518500,-1.535000,60.960000>}
box{<0,0,-0.203200><54.997100,0.035000,0.203200> rotate<0,0.000000,0> translate<5.521400,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.597200,-1.535000,2.615800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.918100,-1.535000,3.390600>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,-67.497607,0> translate<5.597200,-1.535000,2.615800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.597200,-1.535000,5.004100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.918100,-1.535000,4.229300>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,67.497607,0> translate<5.597200,-1.535000,5.004100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.597200,-1.535000,61.035800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.918100,-1.535000,61.810600>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,-67.497607,0> translate<5.597200,-1.535000,61.035800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.597200,-1.535000,63.424100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.918100,-1.535000,62.649300>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,67.497607,0> translate<5.597200,-1.535000,63.424100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.607900,-1.535000,63.398400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.432100,-1.535000,63.398400>}
box{<0,0,-0.203200><54.824200,0.035000,0.203200> rotate<0,0.000000,0> translate<5.607900,-1.535000,63.398400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.650000,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.616600,-1.535000,4.876800>}
box{<0,0,-0.203200><5.966600,0.035000,0.203200> rotate<0,0.000000,0> translate<5.650000,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.692000,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.582400,-1.535000,2.844800>}
box{<0,0,-0.203200><5.890400,0.035000,0.203200> rotate<0,0.000000,0> translate<5.692000,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.734100,-1.535000,61.366400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.305700,-1.535000,61.366400>}
box{<0,0,-0.203200><54.571600,0.035000,0.203200> rotate<0,0.000000,0> translate<5.734100,-1.535000,61.366400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.776200,-1.535000,62.992000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.263800,-1.535000,62.992000>}
box{<0,0,-0.203200><54.487600,0.035000,0.203200> rotate<0,0.000000,0> translate<5.776200,-1.535000,62.992000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.818300,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.582400,-1.535000,4.470400>}
box{<0,0,-0.203200><5.764100,0.035000,0.203200> rotate<0,0.000000,0> translate<5.818300,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.860300,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.582400,-1.535000,3.251200>}
box{<0,0,-0.203200><5.722100,0.035000,0.203200> rotate<0,0.000000,0> translate<5.860300,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.902400,-1.535000,61.772800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.137400,-1.535000,61.772800>}
box{<0,0,-0.203200><54.235000,0.035000,0.203200> rotate<0,0.000000,0> translate<5.902400,-1.535000,61.772800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.918100,-1.535000,3.390600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.918100,-1.535000,4.229300>}
box{<0,0,-0.203200><0.838700,0.035000,0.203200> rotate<0,90.000000,0> translate<5.918100,-1.535000,4.229300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.918100,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.582400,-1.535000,3.657600>}
box{<0,0,-0.203200><5.664300,0.035000,0.203200> rotate<0,0.000000,0> translate<5.918100,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.918100,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.582400,-1.535000,4.064000>}
box{<0,0,-0.203200><5.664300,0.035000,0.203200> rotate<0,0.000000,0> translate<5.918100,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.918100,-1.535000,61.810600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.918100,-1.535000,62.649300>}
box{<0,0,-0.203200><0.838700,0.035000,0.203200> rotate<0,90.000000,0> translate<5.918100,-1.535000,62.649300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.918100,-1.535000,62.179200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.121800,-1.535000,62.179200>}
box{<0,0,-0.203200><54.203700,0.035000,0.203200> rotate<0,0.000000,0> translate<5.918100,-1.535000,62.179200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.918100,-1.535000,62.585600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.121800,-1.535000,62.585600>}
box{<0,0,-0.203200><54.203700,0.035000,0.203200> rotate<0,0.000000,0> translate<5.918100,-1.535000,62.585600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.929200,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.770700,-1.535000,16.764000>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<5.929200,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.929200,-1.535000,18.795900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.770700,-1.535000,18.795900>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<5.929200,-1.535000,18.795900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.929200,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.770700,-1.535000,26.924000>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<5.929200,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.929200,-1.535000,28.955900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.770700,-1.535000,28.955900>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<5.929200,-1.535000,28.955900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.929200,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.770700,-1.535000,29.464000>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<5.929200,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.929200,-1.535000,31.495900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.770700,-1.535000,31.495900>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<5.929200,-1.535000,31.495900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.929200,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.770700,-1.535000,39.624000>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<5.929200,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.929200,-1.535000,41.655900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.770700,-1.535000,41.655900>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<5.929200,-1.535000,41.655900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.770700,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.365900,-1.535000,17.359200>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.770700,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.770700,-1.535000,18.795900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.365900,-1.535000,18.200700>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<6.770700,-1.535000,18.795900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.770700,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.365900,-1.535000,27.519200>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.770700,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.770700,-1.535000,28.955900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.365900,-1.535000,28.360700>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<6.770700,-1.535000,28.955900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.770700,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.365900,-1.535000,30.059200>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.770700,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.770700,-1.535000,31.495900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.365900,-1.535000,30.900700>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<6.770700,-1.535000,31.495900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.770700,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.365900,-1.535000,40.219200>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.770700,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.770700,-1.535000,41.655900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.365900,-1.535000,41.060700>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<6.770700,-1.535000,41.655900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.872200,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.833500,-1.535000,18.694400>}
box{<0,0,-0.203200><1.961300,0.035000,0.203200> rotate<0,0.000000,0> translate<6.872200,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.872200,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.052500,-1.535000,28.854400>}
box{<0,0,-0.203200><2.180300,0.035000,0.203200> rotate<0,0.000000,0> translate<6.872200,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.973800,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.875600,-1.535000,31.292800>}
box{<0,0,-0.203200><1.901800,0.035000,0.203200> rotate<0,0.000000,0> translate<6.973800,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.973800,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662400,-1.535000,41.452800>}
box{<0,0,-0.203200><9.688600,0.035000,0.203200> rotate<0,0.000000,0> translate<6.973800,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.973900,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.875500,-1.535000,29.667200>}
box{<0,0,-0.203200><1.901600,0.035000,0.203200> rotate<0,0.000000,0> translate<6.973900,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.973900,-1.535000,39.827200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,39.827200>}
box{<0,0,-0.203200><58.278900,0.035000,0.203200> rotate<0,0.000000,0> translate<6.973900,-1.535000,39.827200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.075500,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.630200,-1.535000,17.068800>}
box{<0,0,-0.203200><1.554700,0.035000,0.203200> rotate<0,0.000000,0> translate<7.075500,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.075500,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.773900,-1.535000,27.228800>}
box{<0,0,-0.203200><1.698400,0.035000,0.203200> rotate<0,0.000000,0> translate<7.075500,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.278600,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.500400,-1.535000,18.288000>}
box{<0,0,-0.203200><1.221800,0.035000,0.203200> rotate<0,0.000000,0> translate<7.278600,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.278600,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.610400,-1.535000,28.448000>}
box{<0,0,-0.203200><1.331800,0.035000,0.203200> rotate<0,0.000000,0> translate<7.278600,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.365900,-1.535000,17.359200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.365900,-1.535000,18.200700>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,90.000000,0> translate<7.365900,-1.535000,18.200700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.365900,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.416100,-1.535000,17.475200>}
box{<0,0,-0.203200><1.050200,0.035000,0.203200> rotate<0,0.000000,0> translate<7.365900,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.365900,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,-1.535000,17.881600>}
box{<0,0,-0.203200><1.016100,0.035000,0.203200> rotate<0,0.000000,0> translate<7.365900,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.365900,-1.535000,27.519200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.365900,-1.535000,28.360700>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,90.000000,0> translate<7.365900,-1.535000,28.360700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.365900,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.526100,-1.535000,27.635200>}
box{<0,0,-0.203200><1.160200,0.035000,0.203200> rotate<0,0.000000,0> translate<7.365900,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.365900,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,28.041600>}
box{<0,0,-0.203200><1.117700,0.035000,0.203200> rotate<0,0.000000,0> translate<7.365900,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.365900,-1.535000,30.059200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.365900,-1.535000,30.900700>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,90.000000,0> translate<7.365900,-1.535000,30.900700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.365900,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.568200,-1.535000,30.073600>}
box{<0,0,-0.203200><1.202300,0.035000,0.203200> rotate<0,0.000000,0> translate<7.365900,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.365900,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,30.480000>}
box{<0,0,-0.203200><1.117700,0.035000,0.203200> rotate<0,0.000000,0> translate<7.365900,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.365900,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.568300,-1.535000,30.886400>}
box{<0,0,-0.203200><1.202400,0.035000,0.203200> rotate<0,0.000000,0> translate<7.365900,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.365900,-1.535000,40.219200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.365900,-1.535000,41.060700>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,90.000000,0> translate<7.365900,-1.535000,41.060700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.365900,-1.535000,40.233600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,40.233600>}
box{<0,0,-0.203200><57.886900,0.035000,0.203200> rotate<0,0.000000,0> translate<7.365900,-1.535000,40.233600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.365900,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,40.640000>}
box{<0,0,-0.203200><57.886900,0.035000,0.203200> rotate<0,0.000000,0> translate<7.365900,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.365900,-1.535000,41.046400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.063100,-1.535000,41.046400>}
box{<0,0,-0.203200><9.697200,0.035000,0.203200> rotate<0,0.000000,0> translate<7.365900,-1.535000,41.046400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,-1.535000,17.557600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.552100,-1.535000,17.146900>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,67.497630,0> translate<8.382000,-1.535000,17.557600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,-1.535000,17.779400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,-1.535000,17.557600>}
box{<0,0,-0.203200><0.221800,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.382000,-1.535000,17.557600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,-1.535000,17.779400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.158900,-1.535000,17.779400>}
box{<0,0,-0.203200><1.776900,0.035000,0.203200> rotate<0,0.000000,0> translate<8.382000,-1.535000,17.779400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,-1.535000,17.780400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.158900,-1.535000,17.780400>}
box{<0,0,-0.203200><1.776900,0.035000,0.203200> rotate<0,0.000000,0> translate<8.382000,-1.535000,17.780400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,-1.535000,18.002300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,-1.535000,17.780400>}
box{<0,0,-0.203200><0.221900,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.382000,-1.535000,17.780400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.382000,-1.535000,18.002300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.552100,-1.535000,18.413000>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-67.497630,0> translate<8.382000,-1.535000,18.002300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,20.117800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.638300,-1.535000,19.744400>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<8.483600,-1.535000,20.117800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,20.522100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,20.117800>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.483600,-1.535000,20.117800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,20.522100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.638300,-1.535000,20.895500>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<8.483600,-1.535000,20.522100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,22.657800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.638300,-1.535000,22.284400>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<8.483600,-1.535000,22.657800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,23.062100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,22.657800>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.483600,-1.535000,22.657800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,23.062100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.638300,-1.535000,23.435500>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<8.483600,-1.535000,23.062100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,25.197800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.638300,-1.535000,24.824400>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<8.483600,-1.535000,25.197800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,25.602100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,25.197800>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.483600,-1.535000,25.197800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,25.602100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.638300,-1.535000,25.975500>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<8.483600,-1.535000,25.602100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,27.737800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.638300,-1.535000,27.364400>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<8.483600,-1.535000,27.737800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,28.142100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,27.737800>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.483600,-1.535000,27.737800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,28.142100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.638300,-1.535000,28.515500>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<8.483600,-1.535000,28.142100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,30.277800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.638300,-1.535000,29.904400>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<8.483600,-1.535000,30.277800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,30.682100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,30.277800>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.483600,-1.535000,30.277800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,30.682100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.638300,-1.535000,31.055500>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<8.483600,-1.535000,30.682100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,32.817800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.638300,-1.535000,32.444400>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<8.483600,-1.535000,32.817800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,33.222100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,32.817800>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.483600,-1.535000,32.817800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.483600,-1.535000,33.222100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.638300,-1.535000,33.595500>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<8.483600,-1.535000,33.222100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.552100,-1.535000,17.146900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.866500,-1.535000,16.832500>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,44.997030,0> translate<8.552100,-1.535000,17.146900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.552100,-1.535000,18.413000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.866500,-1.535000,18.727400>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.552100,-1.535000,18.413000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.638300,-1.535000,19.744400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.924000,-1.535000,19.458700>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<8.638300,-1.535000,19.744400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.638300,-1.535000,20.895500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.924000,-1.535000,21.181200>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.638300,-1.535000,20.895500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.638300,-1.535000,22.284400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.924000,-1.535000,21.998700>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<8.638300,-1.535000,22.284400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.638300,-1.535000,23.435500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.924000,-1.535000,23.721200>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.638300,-1.535000,23.435500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.638300,-1.535000,24.824400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.924000,-1.535000,24.538700>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<8.638300,-1.535000,24.824400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.638300,-1.535000,25.975500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.924000,-1.535000,26.261200>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.638300,-1.535000,25.975500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.638300,-1.535000,27.364400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.924000,-1.535000,27.078700>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<8.638300,-1.535000,27.364400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.638300,-1.535000,28.515500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.924000,-1.535000,28.801200>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.638300,-1.535000,28.515500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.638300,-1.535000,29.904400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.924000,-1.535000,29.618700>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<8.638300,-1.535000,29.904400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.638300,-1.535000,31.055500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.924000,-1.535000,31.341200>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.638300,-1.535000,31.055500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.638300,-1.535000,32.444400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.924000,-1.535000,32.158700>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<8.638300,-1.535000,32.444400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.638300,-1.535000,33.595500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.924000,-1.535000,33.881200>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<8.638300,-1.535000,33.595500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.866500,-1.535000,16.832500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.277200,-1.535000,16.662400>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,22.496430,0> translate<8.866500,-1.535000,16.832500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.866500,-1.535000,18.727400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.277200,-1.535000,18.897500>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-22.496430,0> translate<8.866500,-1.535000,18.727400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.924000,-1.535000,19.458700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.297400,-1.535000,19.304000>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<8.924000,-1.535000,19.458700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.924000,-1.535000,21.181200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.297400,-1.535000,21.335900>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<8.924000,-1.535000,21.181200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.924000,-1.535000,21.998700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.297400,-1.535000,21.844000>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<8.924000,-1.535000,21.998700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.924000,-1.535000,23.721200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.297400,-1.535000,23.875900>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<8.924000,-1.535000,23.721200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.924000,-1.535000,24.538700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.297400,-1.535000,24.384000>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<8.924000,-1.535000,24.538700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.924000,-1.535000,26.261200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.297400,-1.535000,26.415900>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<8.924000,-1.535000,26.261200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.924000,-1.535000,27.078700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.297400,-1.535000,26.924000>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<8.924000,-1.535000,27.078700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.924000,-1.535000,28.801200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.297400,-1.535000,28.955900>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<8.924000,-1.535000,28.801200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.924000,-1.535000,29.618700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.297400,-1.535000,29.464000>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<8.924000,-1.535000,29.618700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.924000,-1.535000,31.341200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.297400,-1.535000,31.495900>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<8.924000,-1.535000,31.341200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.924000,-1.535000,32.158700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.297400,-1.535000,32.004000>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<8.924000,-1.535000,32.158700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.924000,-1.535000,33.881200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.297400,-1.535000,34.035900>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<8.924000,-1.535000,33.881200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.144000,-1.535000,37.679200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.739200,-1.535000,37.084000>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<9.144000,-1.535000,37.679200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.144000,-1.535000,38.520700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.144000,-1.535000,37.679200>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,-90.000000,0> translate<9.144000,-1.535000,37.679200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.144000,-1.535000,38.520700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.739200,-1.535000,39.115900>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.144000,-1.535000,38.520700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.277200,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.159400,-1.535000,16.662400>}
box{<0,0,-0.203200><0.882200,0.035000,0.203200> rotate<0,0.000000,0> translate<9.277200,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.277200,-1.535000,18.897500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.159400,-1.535000,18.897500>}
box{<0,0,-0.203200><0.882200,0.035000,0.203200> rotate<0,0.000000,0> translate<9.277200,-1.535000,18.897500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.297400,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.022500,-1.535000,19.304000>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<9.297400,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.297400,-1.535000,21.335900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.022500,-1.535000,21.335900>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<9.297400,-1.535000,21.335900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.297400,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.022500,-1.535000,21.844000>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<9.297400,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.297400,-1.535000,23.875900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.022500,-1.535000,23.875900>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<9.297400,-1.535000,23.875900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.297400,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.022500,-1.535000,24.384000>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<9.297400,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.297400,-1.535000,26.415900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.022500,-1.535000,26.415900>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<9.297400,-1.535000,26.415900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.297400,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.022500,-1.535000,26.924000>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<9.297400,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.297400,-1.535000,28.955900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.022500,-1.535000,28.955900>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<9.297400,-1.535000,28.955900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.297400,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.022500,-1.535000,29.464000>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<9.297400,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.297400,-1.535000,31.495900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.022500,-1.535000,31.495900>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<9.297400,-1.535000,31.495900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.297400,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.022500,-1.535000,32.004000>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<9.297400,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.297400,-1.535000,34.035900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.022500,-1.535000,34.035900>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<9.297400,-1.535000,34.035900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.739200,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.580700,-1.535000,37.084000>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<9.739200,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.739200,-1.535000,39.115900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.580700,-1.535000,39.115900>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<9.739200,-1.535000,39.115900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.158900,-1.535000,17.780400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.158900,-1.535000,17.779400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.158900,-1.535000,17.779400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.159400,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.159400,-1.535000,17.778900>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<10.159400,-1.535000,17.778900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.159400,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160400,-1.535000,16.662400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.159400,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.159400,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160400,-1.535000,17.068800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.159400,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.159400,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160400,-1.535000,17.475200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.159400,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.159400,-1.535000,17.778900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160400,-1.535000,17.778900>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.159400,-1.535000,17.778900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.159400,-1.535000,17.781000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.159400,-1.535000,18.897500>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<10.159400,-1.535000,18.897500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.159400,-1.535000,17.781000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160400,-1.535000,17.781000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.159400,-1.535000,17.781000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.159400,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160400,-1.535000,17.881600>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.159400,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.159400,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160400,-1.535000,18.288000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.159400,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.159400,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160400,-1.535000,18.694400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.159400,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160400,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.042700,-1.535000,16.662400>}
box{<0,0,-0.203200><0.882300,0.035000,0.203200> rotate<0,0.000000,0> translate<10.160400,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160400,-1.535000,17.778900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160400,-1.535000,16.662400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.160400,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160400,-1.535000,18.897500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160400,-1.535000,17.781000>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<10.160400,-1.535000,17.781000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160400,-1.535000,18.897500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.042700,-1.535000,18.897500>}
box{<0,0,-0.203200><0.882300,0.035000,0.203200> rotate<0,0.000000,0> translate<10.160400,-1.535000,18.897500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.161000,-1.535000,17.779400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.161000,-1.535000,17.780400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,90.000000,0> translate<10.161000,-1.535000,17.780400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.161000,-1.535000,17.779400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.937900,-1.535000,17.779400>}
box{<0,0,-0.203200><1.776900,0.035000,0.203200> rotate<0,0.000000,0> translate<10.161000,-1.535000,17.779400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.161000,-1.535000,17.780400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.937900,-1.535000,17.780400>}
box{<0,0,-0.203200><1.776900,0.035000,0.203200> rotate<0,0.000000,0> translate<10.161000,-1.535000,17.780400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.580700,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.175900,-1.535000,37.679200>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<10.580700,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.580700,-1.535000,39.115900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.175900,-1.535000,38.520700>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<10.580700,-1.535000,39.115900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.682200,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.797700,-1.535000,39.014400>}
box{<0,0,-0.203200><9.115500,0.035000,0.203200> rotate<0,0.000000,0> translate<10.682200,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.885500,-1.535000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.594400,-1.535000,37.388800>}
box{<0,0,-0.203200><8.708900,0.035000,0.203200> rotate<0,0.000000,0> translate<10.885500,-1.535000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.022500,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.395900,-1.535000,19.458700>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<11.022500,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.022500,-1.535000,21.335900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.395900,-1.535000,21.181200>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<11.022500,-1.535000,21.335900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.022500,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.395900,-1.535000,21.998700>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<11.022500,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.022500,-1.535000,23.875900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.395900,-1.535000,23.721200>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<11.022500,-1.535000,23.875900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.022500,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.395900,-1.535000,24.538700>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<11.022500,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.022500,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.917400,-1.535000,24.384000>}
box{<0,0,-0.203200><5.894900,0.035000,0.203200> rotate<0,0.000000,0> translate<11.022500,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.022500,-1.535000,26.415900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.395900,-1.535000,26.261200>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<11.022500,-1.535000,26.415900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.022500,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.395900,-1.535000,27.078700>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<11.022500,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.022500,-1.535000,28.955900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.395900,-1.535000,28.801200>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<11.022500,-1.535000,28.955900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.022500,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.395900,-1.535000,29.618700>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<11.022500,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.022500,-1.535000,31.495900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.395900,-1.535000,31.341200>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<11.022500,-1.535000,31.495900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.022500,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.395900,-1.535000,32.158700>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<11.022500,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.022500,-1.535000,34.035900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.395900,-1.535000,33.881200>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<11.022500,-1.535000,34.035900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.042700,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.453400,-1.535000,16.832500>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-22.496430,0> translate<11.042700,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.042700,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.057200,-1.535000,16.662400>}
box{<0,0,-0.203200><16.014500,0.035000,0.203200> rotate<0,0.000000,0> translate<11.042700,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.042700,-1.535000,18.897500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.453400,-1.535000,18.727400>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,22.496430,0> translate<11.042700,-1.535000,18.897500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.088600,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.391300,-1.535000,38.608000>}
box{<0,0,-0.203200><8.302700,0.035000,0.203200> rotate<0,0.000000,0> translate<11.088600,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.175900,-1.535000,37.679200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.175900,-1.535000,38.520700>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,90.000000,0> translate<11.175900,-1.535000,38.520700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.175900,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,-1.535000,37.795200>}
box{<0,0,-0.203200><8.128100,0.035000,0.203200> rotate<0,0.000000,0> translate<11.175900,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.175900,-1.535000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,-1.535000,38.201600>}
box{<0,0,-0.203200><8.128100,0.035000,0.203200> rotate<0,0.000000,0> translate<11.175900,-1.535000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.267500,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.453500,-1.535000,28.854400>}
box{<0,0,-0.203200><5.186000,0.035000,0.203200> rotate<0,0.000000,0> translate<11.267500,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.267700,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.672100,-1.535000,21.945600>}
box{<0,0,-0.203200><5.404400,0.035000,0.203200> rotate<0,0.000000,0> translate<11.267700,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.267700,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.672100,-1.535000,32.105600>}
box{<0,0,-0.203200><5.404400,0.035000,0.203200> rotate<0,0.000000,0> translate<11.267700,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.395900,-1.535000,19.458700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.681600,-1.535000,19.744400>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.395900,-1.535000,19.458700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.395900,-1.535000,21.181200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.681600,-1.535000,20.895500>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<11.395900,-1.535000,21.181200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.395900,-1.535000,21.998700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.681600,-1.535000,22.284400>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.395900,-1.535000,21.998700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.395900,-1.535000,23.721200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.681600,-1.535000,23.435500>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<11.395900,-1.535000,23.721200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.395900,-1.535000,24.538700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.681600,-1.535000,24.824400>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.395900,-1.535000,24.538700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.395900,-1.535000,26.261200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.681600,-1.535000,25.975500>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<11.395900,-1.535000,26.261200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.395900,-1.535000,27.078700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.681600,-1.535000,27.364400>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.395900,-1.535000,27.078700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.395900,-1.535000,28.801200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.681600,-1.535000,28.515500>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<11.395900,-1.535000,28.801200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.395900,-1.535000,29.618700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.681600,-1.535000,29.904400>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.395900,-1.535000,29.618700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.395900,-1.535000,31.341200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.681600,-1.535000,31.055500>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<11.395900,-1.535000,31.341200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.395900,-1.535000,32.158700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.681600,-1.535000,32.444400>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.395900,-1.535000,32.158700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.395900,-1.535000,33.881200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.681600,-1.535000,33.595500>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<11.395900,-1.535000,33.881200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.444300,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.495600,-1.535000,21.132800>}
box{<0,0,-0.203200><5.051300,0.035000,0.203200> rotate<0,0.000000,0> translate<11.444300,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.444300,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.351900,-1.535000,31.292800>}
box{<0,0,-0.203200><4.907600,0.035000,0.203200> rotate<0,0.000000,0> translate<11.444300,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.444400,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.495500,-1.535000,19.507200>}
box{<0,0,-0.203200><5.051100,0.035000,0.203200> rotate<0,0.000000,0> translate<11.444400,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.444400,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.351800,-1.535000,29.667200>}
box{<0,0,-0.203200><4.907400,0.035000,0.203200> rotate<0,0.000000,0> translate<11.444400,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.453400,-1.535000,16.832500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.767800,-1.535000,17.146900>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.453400,-1.535000,16.832500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.453400,-1.535000,18.727400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.767800,-1.535000,18.413000>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,44.997030,0> translate<11.453400,-1.535000,18.727400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.486400,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.672500,-1.535000,18.694400>}
box{<0,0,-0.203200><5.186100,0.035000,0.203200> rotate<0,0.000000,0> translate<11.486400,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.544300,-1.535000,11.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.720200,-1.535000,10.775300>}
box{<0,0,-0.203200><0.459686,0.035000,0.203200> rotate<0,67.497445,0> translate<11.544300,-1.535000,11.200000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.544300,-1.535000,11.659900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.544300,-1.535000,11.200000>}
box{<0,0,-0.203200><0.459900,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.544300,-1.535000,11.200000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.544300,-1.535000,11.659900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.720200,-1.535000,12.084600>}
box{<0,0,-0.203200><0.459686,0.035000,0.203200> rotate<0,-67.497445,0> translate<11.544300,-1.535000,11.659900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.545900,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.394000,-1.535000,23.571200>}
box{<0,0,-0.203200><4.848100,0.035000,0.203200> rotate<0,0.000000,0> translate<11.545900,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.545900,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.394000,-1.535000,33.731200>}
box{<0,0,-0.203200><4.848100,0.035000,0.203200> rotate<0,0.000000,0> translate<11.545900,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.546000,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.250200,-1.535000,27.228800>}
box{<0,0,-0.203200><4.704200,0.035000,0.203200> rotate<0,0.000000,0> translate<11.546000,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.582400,-1.535000,2.825600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.752500,-1.535000,2.414900>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,67.497630,0> translate<11.582400,-1.535000,2.825600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.582400,-1.535000,4.794300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.582400,-1.535000,2.825600>}
box{<0,0,-0.203200><1.968700,0.035000,0.203200> rotate<0,-90.000000,0> translate<11.582400,-1.535000,2.825600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.582400,-1.535000,4.794300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.752500,-1.535000,5.205000>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-67.497630,0> translate<11.582400,-1.535000,4.794300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.647500,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.292400,-1.535000,26.009600>}
box{<0,0,-0.203200><4.644900,0.035000,0.203200> rotate<0,0.000000,0> translate<11.647500,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.647600,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.292300,-1.535000,24.790400>}
box{<0,0,-0.203200><4.644700,0.035000,0.203200> rotate<0,0.000000,0> translate<11.647600,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.681600,-1.535000,19.744400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,20.117800>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<11.681600,-1.535000,19.744400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.681600,-1.535000,20.895500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,20.522100>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<11.681600,-1.535000,20.895500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.681600,-1.535000,22.284400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,22.657800>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<11.681600,-1.535000,22.284400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.681600,-1.535000,23.435500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,23.062100>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<11.681600,-1.535000,23.435500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.681600,-1.535000,24.824400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,25.197800>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<11.681600,-1.535000,24.824400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.681600,-1.535000,25.975500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,25.602100>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<11.681600,-1.535000,25.975500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.681600,-1.535000,27.364400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,27.737800>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<11.681600,-1.535000,27.364400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.681600,-1.535000,28.515500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,28.142100>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<11.681600,-1.535000,28.515500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.681600,-1.535000,29.904400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,30.277800>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<11.681600,-1.535000,29.904400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.681600,-1.535000,31.055500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,30.682100>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<11.681600,-1.535000,31.055500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.681600,-1.535000,32.444400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,32.817800>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<11.681600,-1.535000,32.444400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.681600,-1.535000,33.595500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,33.222100>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<11.681600,-1.535000,33.595500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.689700,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.393900,-1.535000,17.068800>}
box{<0,0,-0.203200><4.704200,0.035000,0.203200> rotate<0,0.000000,0> translate<11.689700,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.709600,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.230200,-1.535000,22.352000>}
box{<0,0,-0.203200><4.520600,0.035000,0.203200> rotate<0,0.000000,0> translate<11.709600,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.709600,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.120400,-1.535000,28.448000>}
box{<0,0,-0.203200><4.410800,0.035000,0.203200> rotate<0,0.000000,0> translate<11.709600,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.709600,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.230200,-1.535000,32.512000>}
box{<0,0,-0.203200><4.520600,0.035000,0.203200> rotate<0,0.000000,0> translate<11.709600,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.720200,-1.535000,10.775300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.045300,-1.535000,10.450200>}
box{<0,0,-0.203200><0.459761,0.035000,0.203200> rotate<0,44.997030,0> translate<11.720200,-1.535000,10.775300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.720200,-1.535000,12.084600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.045300,-1.535000,12.409700>}
box{<0,0,-0.203200><0.459761,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.720200,-1.535000,12.084600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.751600,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.188200,-1.535000,19.913600>}
box{<0,0,-0.203200><4.436600,0.035000,0.203200> rotate<0,0.000000,0> translate<11.751600,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.751600,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.078200,-1.535000,30.073600>}
box{<0,0,-0.203200><4.326600,0.035000,0.203200> rotate<0,0.000000,0> translate<11.751600,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.751700,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.188300,-1.535000,20.726400>}
box{<0,0,-0.203200><4.436600,0.035000,0.203200> rotate<0,0.000000,0> translate<11.751700,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.751700,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.078300,-1.535000,30.886400>}
box{<0,0,-0.203200><4.326600,0.035000,0.203200> rotate<0,0.000000,0> translate<11.751700,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.752500,-1.535000,2.414900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.066900,-1.535000,2.100500>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,44.997030,0> translate<11.752500,-1.535000,2.414900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.752500,-1.535000,5.205000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.066900,-1.535000,5.519400>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.752500,-1.535000,5.205000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.767800,-1.535000,17.146900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.937900,-1.535000,17.557600>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-67.497630,0> translate<11.767800,-1.535000,17.146900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.767800,-1.535000,18.413000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.937900,-1.535000,18.002300>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,67.497630,0> translate<11.767800,-1.535000,18.413000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.793700,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.036100,-1.535000,27.635200>}
box{<0,0,-0.203200><4.242400,0.035000,0.203200> rotate<0,0.000000,0> translate<11.793700,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.793800,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.146200,-1.535000,23.164800>}
box{<0,0,-0.203200><4.352400,0.035000,0.203200> rotate<0,0.000000,0> translate<11.793800,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.793800,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.146200,-1.535000,33.324800>}
box{<0,0,-0.203200><4.352400,0.035000,0.203200> rotate<0,0.000000,0> translate<11.793800,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.819600,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.230400,-1.535000,18.288000>}
box{<0,0,-0.203200><4.410800,0.035000,0.203200> rotate<0,0.000000,0> translate<11.819600,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.835800,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.104000,-1.535000,25.196800>}
box{<0,0,-0.203200><4.268200,0.035000,0.203200> rotate<0,0.000000,0> translate<11.835800,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.835900,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.104100,-1.535000,25.603200>}
box{<0,0,-0.203200><4.268200,0.035000,0.203200> rotate<0,0.000000,0> translate<11.835900,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,20.117800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,20.522100>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,90.000000,0> translate<11.836300,-1.535000,20.522100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,-1.535000,20.320000>}
box{<0,0,-0.203200><4.267300,0.035000,0.203200> rotate<0,0.000000,0> translate<11.836300,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,22.657800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,23.062100>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,90.000000,0> translate<11.836300,-1.535000,23.062100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,-1.535000,22.758400>}
box{<0,0,-0.203200><4.267300,0.035000,0.203200> rotate<0,0.000000,0> translate<11.836300,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,25.197800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,25.602100>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,90.000000,0> translate<11.836300,-1.535000,25.602100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,27.737800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,28.142100>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,90.000000,0> translate<11.836300,-1.535000,28.142100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.002000,-1.535000,28.041600>}
box{<0,0,-0.203200><4.165700,0.035000,0.203200> rotate<0,0.000000,0> translate<11.836300,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,30.277800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,30.682100>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,90.000000,0> translate<11.836300,-1.535000,30.682100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.778900,-1.535000,30.480000>}
box{<0,0,-0.203200><5.942600,0.035000,0.203200> rotate<0,0.000000,0> translate<11.836300,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,32.817800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,33.222100>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,90.000000,0> translate<11.836300,-1.535000,33.222100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.836300,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,-1.535000,32.918400>}
box{<0,0,-0.203200><4.267300,0.035000,0.203200> rotate<0,0.000000,0> translate<11.836300,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.903700,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.146100,-1.535000,17.475200>}
box{<0,0,-0.203200><4.242400,0.035000,0.203200> rotate<0,0.000000,0> translate<11.903700,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.937900,-1.535000,17.557600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.937900,-1.535000,17.779400>}
box{<0,0,-0.203200><0.221800,0.035000,0.203200> rotate<0,90.000000,0> translate<11.937900,-1.535000,17.779400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.937900,-1.535000,17.780400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.937900,-1.535000,18.002300>}
box{<0,0,-0.203200><0.221900,0.035000,0.203200> rotate<0,90.000000,0> translate<11.937900,-1.535000,18.002300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.937900,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,-1.535000,17.881600>}
box{<0,0,-0.203200><4.165700,0.035000,0.203200> rotate<0,0.000000,0> translate<11.937900,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.045300,-1.535000,10.450200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.470000,-1.535000,10.274300>}
box{<0,0,-0.203200><0.459686,0.035000,0.203200> rotate<0,22.496615,0> translate<12.045300,-1.535000,10.450200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.045300,-1.535000,12.409700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.470000,-1.535000,12.585600>}
box{<0,0,-0.203200><0.459686,0.035000,0.203200> rotate<0,-22.496615,0> translate<12.045300,-1.535000,12.409700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.066900,-1.535000,2.100500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.477600,-1.535000,1.930400>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,22.496430,0> translate<12.066900,-1.535000,2.100500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.066900,-1.535000,5.519400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.477600,-1.535000,5.689500>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-22.496430,0> translate<12.066900,-1.535000,5.519400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.470000,-1.535000,10.274300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.929900,-1.535000,10.274300>}
box{<0,0,-0.203200><0.459900,0.035000,0.203200> rotate<0,0.000000,0> translate<12.470000,-1.535000,10.274300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.470000,-1.535000,12.585600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.929900,-1.535000,12.585600>}
box{<0,0,-0.203200><0.459900,0.035000,0.203200> rotate<0,0.000000,0> translate<12.470000,-1.535000,12.585600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.477600,-1.535000,1.930400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.922300,-1.535000,1.930400>}
box{<0,0,-0.203200><0.444700,0.035000,0.203200> rotate<0,0.000000,0> translate<12.477600,-1.535000,1.930400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.477600,-1.535000,5.689500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.922300,-1.535000,5.689500>}
box{<0,0,-0.203200><0.444700,0.035000,0.203200> rotate<0,0.000000,0> translate<12.477600,-1.535000,5.689500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.922300,-1.535000,1.930400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.333000,-1.535000,2.100500>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-22.496430,0> translate<12.922300,-1.535000,1.930400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.922300,-1.535000,5.689500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.333000,-1.535000,5.519400>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,22.496430,0> translate<12.922300,-1.535000,5.689500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.929900,-1.535000,10.274300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.354600,-1.535000,10.450200>}
box{<0,0,-0.203200><0.459686,0.035000,0.203200> rotate<0,-22.496615,0> translate<12.929900,-1.535000,10.274300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.929900,-1.535000,12.585600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.354600,-1.535000,12.409700>}
box{<0,0,-0.203200><0.459686,0.035000,0.203200> rotate<0,22.496615,0> translate<12.929900,-1.535000,12.585600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.167600,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.531700,-1.535000,2.032000>}
box{<0,0,-0.203200><1.364100,0.035000,0.203200> rotate<0,0.000000,0> translate<13.167600,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.333000,-1.535000,2.100500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.647400,-1.535000,2.414900>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.333000,-1.535000,2.100500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.333000,-1.535000,5.519400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.647400,-1.535000,5.205000>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,44.997030,0> translate<13.333000,-1.535000,5.519400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.354600,-1.535000,10.450200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.679700,-1.535000,10.775300>}
box{<0,0,-0.203200><0.459761,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.354600,-1.535000,10.450200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.354600,-1.535000,12.409700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.679700,-1.535000,12.084600>}
box{<0,0,-0.203200><0.459761,0.035000,0.203200> rotate<0,44.997030,0> translate<13.354600,-1.535000,12.409700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.470800,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.325500,-1.535000,10.566400>}
box{<0,0,-0.203200><0.854700,0.035000,0.203200> rotate<0,0.000000,0> translate<13.470800,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.569200,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.227000,-1.535000,5.283200>}
box{<0,0,-0.203200><0.657800,0.035000,0.203200> rotate<0,0.000000,0> translate<13.569200,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.572300,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.224000,-1.535000,12.192000>}
box{<0,0,-0.203200><0.651700,0.035000,0.203200> rotate<0,0.000000,0> translate<13.572300,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.647400,-1.535000,2.414900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.817500,-1.535000,2.825600>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-67.497630,0> translate<13.647400,-1.535000,2.414900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.647400,-1.535000,5.205000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.817500,-1.535000,4.794300>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,67.497630,0> translate<13.647400,-1.535000,5.205000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.657100,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.172800,-1.535000,2.438400>}
box{<0,0,-0.203200><0.515700,0.035000,0.203200> rotate<0,0.000000,0> translate<13.657100,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.679700,-1.535000,10.775300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.855600,-1.535000,11.200000>}
box{<0,0,-0.203200><0.459686,0.035000,0.203200> rotate<0,-67.497445,0> translate<13.679700,-1.535000,10.775300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.679700,-1.535000,12.084600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.855600,-1.535000,11.659900>}
box{<0,0,-0.203200><0.459686,0.035000,0.203200> rotate<0,67.497445,0> translate<13.679700,-1.535000,12.084600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.761400,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.982700,-1.535000,10.972800>}
box{<0,0,-0.203200><0.221300,0.035000,0.203200> rotate<0,0.000000,0> translate<13.761400,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.783400,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.046700,-1.535000,4.876800>}
box{<0,0,-0.203200><0.263300,0.035000,0.203200> rotate<0,0.000000,0> translate<13.783400,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.803600,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.982700,-1.535000,11.785600>}
box{<0,0,-0.203200><0.179100,0.035000,0.203200> rotate<0,0.000000,0> translate<13.803600,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.817500,-1.535000,2.825600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.817500,-1.535000,4.794300>}
box{<0,0,-0.203200><1.968700,0.035000,0.203200> rotate<0,90.000000,0> translate<13.817500,-1.535000,4.794300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.817500,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.020800,-1.535000,2.844800>}
box{<0,0,-0.203200><0.203300,0.035000,0.203200> rotate<0,0.000000,0> translate<13.817500,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.817500,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.020800,-1.535000,3.251200>}
box{<0,0,-0.203200><0.203300,0.035000,0.203200> rotate<0,0.000000,0> translate<13.817500,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.817500,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.020800,-1.535000,3.657600>}
box{<0,0,-0.203200><0.203300,0.035000,0.203200> rotate<0,0.000000,0> translate<13.817500,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.817500,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.020800,-1.535000,4.064000>}
box{<0,0,-0.203200><0.203300,0.035000,0.203200> rotate<0,0.000000,0> translate<13.817500,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.817500,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.020800,-1.535000,4.470400>}
box{<0,0,-0.203200><0.203300,0.035000,0.203200> rotate<0,0.000000,0> translate<13.817500,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.855600,-1.535000,11.200000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.855600,-1.535000,11.659900>}
box{<0,0,-0.203200><0.459900,0.035000,0.203200> rotate<0,90.000000,0> translate<13.855600,-1.535000,11.659900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.855600,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.982700,-1.535000,11.379200>}
box{<0,0,-0.203200><0.127100,0.035000,0.203200> rotate<0,0.000000,0> translate<13.855600,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.982700,-1.535000,10.909200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.719200,-1.535000,10.172700>}
box{<0,0,-0.203200><1.041568,0.035000,0.203200> rotate<0,44.997030,0> translate<13.982700,-1.535000,10.909200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.982700,-1.535000,11.429400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.982700,-1.535000,10.909200>}
box{<0,0,-0.203200><0.520200,0.035000,0.203200> rotate<0,-90.000000,0> translate<13.982700,-1.535000,10.909200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.982700,-1.535000,11.429400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.238900,-1.535000,11.429400>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,0.000000,0> translate<13.982700,-1.535000,11.429400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.982700,-1.535000,11.430400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.238900,-1.535000,11.430400>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,0.000000,0> translate<13.982700,-1.535000,11.430400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.982700,-1.535000,11.950700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.982700,-1.535000,11.430400>}
box{<0,0,-0.203200><0.520300,0.035000,0.203200> rotate<0,-90.000000,0> translate<13.982700,-1.535000,11.430400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.982700,-1.535000,11.950700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.719200,-1.535000,12.687200>}
box{<0,0,-0.203200><1.041568,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.982700,-1.535000,11.950700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.020800,-1.535000,2.805400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.206400,-1.535000,2.357300>}
box{<0,0,-0.203200><0.485016,0.035000,0.203200> rotate<0,67.496538,0> translate<14.020800,-1.535000,2.805400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.020800,-1.535000,3.759000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.020800,-1.535000,2.805400>}
box{<0,0,-0.203200><0.953600,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.020800,-1.535000,2.805400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.020800,-1.535000,3.759000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.188500,-1.535000,3.759000>}
box{<0,0,-0.203200><1.167700,0.035000,0.203200> rotate<0,0.000000,0> translate<14.020800,-1.535000,3.759000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.020800,-1.535000,3.860800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.188500,-1.535000,3.860800>}
box{<0,0,-0.203200><1.167700,0.035000,0.203200> rotate<0,0.000000,0> translate<14.020800,-1.535000,3.860800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.020800,-1.535000,4.814500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.020800,-1.535000,3.860800>}
box{<0,0,-0.203200><0.953700,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.020800,-1.535000,3.860800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.020800,-1.535000,4.814500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.206400,-1.535000,5.262600>}
box{<0,0,-0.203200><0.485016,0.035000,0.203200> rotate<0,-67.496538,0> translate<14.020800,-1.535000,4.814500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.206400,-1.535000,2.357300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.549300,-1.535000,2.014400>}
box{<0,0,-0.203200><0.484934,0.035000,0.203200> rotate<0,44.997030,0> translate<14.206400,-1.535000,2.357300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.206400,-1.535000,5.262600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.549300,-1.535000,5.605500>}
box{<0,0,-0.203200><0.484934,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.206400,-1.535000,5.262600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.230400,-1.535000,51.869100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.384100,-1.535000,51.498100>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,67.492017,0> translate<14.230400,-1.535000,51.869100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.230400,-1.535000,52.270800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.230400,-1.535000,51.869100>}
box{<0,0,-0.203200><0.401700,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.230400,-1.535000,51.869100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.230400,-1.535000,52.270800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.384100,-1.535000,52.641800>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,-67.492017,0> translate<14.230400,-1.535000,52.270800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.384100,-1.535000,51.498100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.668100,-1.535000,51.214100>}
box{<0,0,-0.203200><0.401637,0.035000,0.203200> rotate<0,44.997030,0> translate<14.384100,-1.535000,51.498100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.384100,-1.535000,52.641800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.668100,-1.535000,52.925800>}
box{<0,0,-0.203200><0.401637,0.035000,0.203200> rotate<0,-44.997030,0> translate<14.384100,-1.535000,52.641800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.549300,-1.535000,2.014400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.997400,-1.535000,1.828800>}
box{<0,0,-0.203200><0.485016,0.035000,0.203200> rotate<0,22.497522,0> translate<14.549300,-1.535000,2.014400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.549300,-1.535000,5.605500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.997400,-1.535000,5.791100>}
box{<0,0,-0.203200><0.485016,0.035000,0.203200> rotate<0,-22.497522,0> translate<14.549300,-1.535000,5.605500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.668100,-1.535000,51.214100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.039100,-1.535000,51.060400>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,22.502043,0> translate<14.668100,-1.535000,51.214100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.668100,-1.535000,52.925800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.039100,-1.535000,53.079500>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,-22.502043,0> translate<14.668100,-1.535000,52.925800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.719200,-1.535000,10.172700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.239400,-1.535000,10.172700>}
box{<0,0,-0.203200><0.520200,0.035000,0.203200> rotate<0,0.000000,0> translate<14.719200,-1.535000,10.172700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.719200,-1.535000,12.687200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.239400,-1.535000,12.687200>}
box{<0,0,-0.203200><0.520200,0.035000,0.203200> rotate<0,0.000000,0> translate<14.719200,-1.535000,12.687200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.997400,-1.535000,1.828800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189000,-1.535000,1.828800>}
box{<0,0,-0.203200><0.191600,0.035000,0.203200> rotate<0,0.000000,0> translate<14.997400,-1.535000,1.828800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.997400,-1.535000,5.791100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189000,-1.535000,5.791100>}
box{<0,0,-0.203200><0.191600,0.035000,0.203200> rotate<0,0.000000,0> translate<14.997400,-1.535000,5.791100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.039100,-1.535000,51.060400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.440800,-1.535000,51.060400>}
box{<0,0,-0.203200><0.401700,0.035000,0.203200> rotate<0,0.000000,0> translate<15.039100,-1.535000,51.060400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.039100,-1.535000,53.079500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.440800,-1.535000,53.079500>}
box{<0,0,-0.203200><0.401700,0.035000,0.203200> rotate<0,0.000000,0> translate<15.039100,-1.535000,53.079500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.188500,-1.535000,3.860800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.188500,-1.535000,3.759000>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.188500,-1.535000,3.759000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189000,-1.535000,1.828800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189000,-1.535000,3.758500>}
box{<0,0,-0.203200><1.929700,0.035000,0.203200> rotate<0,90.000000,0> translate<15.189000,-1.535000,3.758500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189000,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.290800,-1.535000,2.032000>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<15.189000,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189000,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.290800,-1.535000,2.438400>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<15.189000,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189000,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.290800,-1.535000,2.844800>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<15.189000,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189000,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.290800,-1.535000,3.251200>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<15.189000,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189000,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.290800,-1.535000,3.657600>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<15.189000,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189000,-1.535000,3.758500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.290800,-1.535000,3.758500>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<15.189000,-1.535000,3.758500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189000,-1.535000,3.861400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189000,-1.535000,5.791100>}
box{<0,0,-0.203200><1.929700,0.035000,0.203200> rotate<0,90.000000,0> translate<15.189000,-1.535000,5.791100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189000,-1.535000,3.861400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.290800,-1.535000,3.861400>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<15.189000,-1.535000,3.861400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189000,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.290800,-1.535000,4.064000>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<15.189000,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189000,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.290800,-1.535000,4.470400>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<15.189000,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189000,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.290800,-1.535000,4.876800>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<15.189000,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189000,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.290800,-1.535000,5.283200>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<15.189000,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.189000,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.290800,-1.535000,5.689600>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,0.000000,0> translate<15.189000,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.238900,-1.535000,11.430400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.238900,-1.535000,11.429400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.238900,-1.535000,11.429400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.239400,-1.535000,10.172700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.239400,-1.535000,11.428900>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,90.000000,0> translate<15.239400,-1.535000,11.428900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.239400,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240400,-1.535000,10.566400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.239400,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.239400,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240400,-1.535000,10.972800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.239400,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.239400,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240400,-1.535000,11.379200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.239400,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.239400,-1.535000,11.428900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240400,-1.535000,11.428900>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.239400,-1.535000,11.428900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.239400,-1.535000,11.431000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.239400,-1.535000,12.687200>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,90.000000,0> translate<15.239400,-1.535000,12.687200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.239400,-1.535000,11.431000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240400,-1.535000,11.431000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.239400,-1.535000,11.431000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.239400,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240400,-1.535000,11.785600>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.239400,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.239400,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240400,-1.535000,12.192000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.239400,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.239400,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240400,-1.535000,12.598400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.239400,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240400,-1.535000,10.172700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.760700,-1.535000,10.172700>}
box{<0,0,-0.203200><0.520300,0.035000,0.203200> rotate<0,0.000000,0> translate<15.240400,-1.535000,10.172700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240400,-1.535000,11.428900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240400,-1.535000,10.172700>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.240400,-1.535000,10.172700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240400,-1.535000,12.687200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240400,-1.535000,11.431000>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.240400,-1.535000,11.431000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240400,-1.535000,12.687200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.760700,-1.535000,12.687200>}
box{<0,0,-0.203200><0.520300,0.035000,0.203200> rotate<0,0.000000,0> translate<15.240400,-1.535000,12.687200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.241000,-1.535000,11.429400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.241000,-1.535000,11.430400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,90.000000,0> translate<15.241000,-1.535000,11.430400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.241000,-1.535000,11.429400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.497200,-1.535000,11.429400>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,0.000000,0> translate<15.241000,-1.535000,11.429400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.241000,-1.535000,11.430400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.497200,-1.535000,11.430400>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,0.000000,0> translate<15.241000,-1.535000,11.430400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.290800,-1.535000,1.828700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.482500,-1.535000,1.828800>}
box{<0,0,-0.203200><0.191700,0.035000,0.203200> rotate<0,-0.029886,0> translate<15.290800,-1.535000,1.828700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.290800,-1.535000,3.758500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.290800,-1.535000,1.828700>}
box{<0,0,-0.203200><1.929800,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.290800,-1.535000,1.828700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.290800,-1.535000,5.791100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.290800,-1.535000,3.861400>}
box{<0,0,-0.203200><1.929700,0.035000,0.203200> rotate<0,-90.000000,0> translate<15.290800,-1.535000,3.861400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.290800,-1.535000,5.791100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.482500,-1.535000,5.791100>}
box{<0,0,-0.203200><0.191700,0.035000,0.203200> rotate<0,0.000000,0> translate<15.290800,-1.535000,5.791100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.291400,-1.535000,3.759000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.291400,-1.535000,3.860800>}
box{<0,0,-0.203200><0.101800,0.035000,0.203200> rotate<0,90.000000,0> translate<15.291400,-1.535000,3.860800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.291400,-1.535000,3.759000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.459100,-1.535000,3.759000>}
box{<0,0,-0.203200><1.167700,0.035000,0.203200> rotate<0,0.000000,0> translate<15.291400,-1.535000,3.759000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.291400,-1.535000,3.860800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.459100,-1.535000,3.860800>}
box{<0,0,-0.203200><1.167700,0.035000,0.203200> rotate<0,0.000000,0> translate<15.291400,-1.535000,3.860800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.440800,-1.535000,51.060400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.811800,-1.535000,51.214100>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,-22.502043,0> translate<15.440800,-1.535000,51.060400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.440800,-1.535000,53.079500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.811800,-1.535000,52.925800>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,22.502043,0> translate<15.440800,-1.535000,53.079500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.482500,-1.535000,1.828800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.930600,-1.535000,2.014400>}
box{<0,0,-0.203200><0.485016,0.035000,0.203200> rotate<0,-22.497522,0> translate<15.482500,-1.535000,1.828800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.482500,-1.535000,5.791100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.930600,-1.535000,5.605500>}
box{<0,0,-0.203200><0.485016,0.035000,0.203200> rotate<0,22.497522,0> translate<15.482500,-1.535000,5.791100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.727600,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.572600,-1.535000,5.689600>}
box{<0,0,-0.203200><14.845000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.727600,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.760700,-1.535000,10.172700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.497200,-1.535000,10.909200>}
box{<0,0,-0.203200><1.041568,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.760700,-1.535000,10.172700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.760700,-1.535000,12.687200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.497200,-1.535000,11.950700>}
box{<0,0,-0.203200><1.041568,0.035000,0.203200> rotate<0,44.997030,0> translate<15.760700,-1.535000,12.687200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.793200,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.766600,-1.535000,51.206400>}
box{<0,0,-0.203200><3.973400,0.035000,0.203200> rotate<0,0.000000,0> translate<15.793200,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.811800,-1.535000,51.214100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.095800,-1.535000,51.498100>}
box{<0,0,-0.203200><0.401637,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.811800,-1.535000,51.214100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.811800,-1.535000,52.925800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.095800,-1.535000,52.641800>}
box{<0,0,-0.203200><0.401637,0.035000,0.203200> rotate<0,44.997030,0> translate<15.811800,-1.535000,52.925800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.849500,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.117800,-1.535000,12.598400>}
box{<0,0,-0.203200><15.268300,0.035000,0.203200> rotate<0,0.000000,0> translate<15.849500,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.905600,-1.535000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.654300,-1.535000,52.832000>}
box{<0,0,-0.203200><3.748700,0.035000,0.203200> rotate<0,0.000000,0> translate<15.905600,-1.535000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.930600,-1.535000,2.014400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.273500,-1.535000,2.357300>}
box{<0,0,-0.203200><0.484934,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.930600,-1.535000,2.014400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.930600,-1.535000,5.605500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.273500,-1.535000,5.262600>}
box{<0,0,-0.203200><0.484934,0.035000,0.203200> rotate<0,44.997030,0> translate<15.930600,-1.535000,5.605500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.948200,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.312200,-1.535000,2.032000>}
box{<0,0,-0.203200><1.364000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.948200,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.002000,-1.535000,27.717600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.172100,-1.535000,27.306900>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,67.497630,0> translate<16.002000,-1.535000,27.717600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.002000,-1.535000,27.939400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.002000,-1.535000,27.717600>}
box{<0,0,-0.203200><0.221800,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.002000,-1.535000,27.717600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.002000,-1.535000,27.939400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.778900,-1.535000,27.939400>}
box{<0,0,-0.203200><1.776900,0.035000,0.203200> rotate<0,0.000000,0> translate<16.002000,-1.535000,27.939400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.002000,-1.535000,27.940400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.778900,-1.535000,27.940400>}
box{<0,0,-0.203200><1.776900,0.035000,0.203200> rotate<0,0.000000,0> translate<16.002000,-1.535000,27.940400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.002000,-1.535000,28.162300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.002000,-1.535000,27.940400>}
box{<0,0,-0.203200><0.221900,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.002000,-1.535000,27.940400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.002000,-1.535000,28.162300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.172100,-1.535000,28.573000>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-67.497630,0> translate<16.002000,-1.535000,28.162300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.002000,-1.535000,30.257600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.172100,-1.535000,29.846900>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,67.497630,0> translate<16.002000,-1.535000,30.257600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.002000,-1.535000,30.479400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.002000,-1.535000,30.257600>}
box{<0,0,-0.203200><0.221800,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.002000,-1.535000,30.257600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.002000,-1.535000,30.479400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.778900,-1.535000,30.479400>}
box{<0,0,-0.203200><1.776900,0.035000,0.203200> rotate<0,0.000000,0> translate<16.002000,-1.535000,30.479400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.002000,-1.535000,30.480400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.778900,-1.535000,30.480400>}
box{<0,0,-0.203200><1.776900,0.035000,0.203200> rotate<0,0.000000,0> translate<16.002000,-1.535000,30.480400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.002000,-1.535000,30.702300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.002000,-1.535000,30.480400>}
box{<0,0,-0.203200><0.221900,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.002000,-1.535000,30.480400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.002000,-1.535000,30.702300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.172100,-1.535000,31.113000>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-67.497630,0> translate<16.002000,-1.535000,30.702300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.095800,-1.535000,51.498100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.249500,-1.535000,51.869100>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,-67.492017,0> translate<16.095800,-1.535000,51.498100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.095800,-1.535000,52.641800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.249500,-1.535000,52.270800>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,67.492017,0> translate<16.095800,-1.535000,52.641800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,-1.535000,17.577800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.258300,-1.535000,17.204400>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<16.103600,-1.535000,17.577800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,-1.535000,17.982100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,-1.535000,17.577800>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.103600,-1.535000,17.577800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,-1.535000,17.982100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.258300,-1.535000,18.355500>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<16.103600,-1.535000,17.982100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,-1.535000,20.117800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.258300,-1.535000,19.744400>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<16.103600,-1.535000,20.117800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,-1.535000,20.522100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,-1.535000,20.117800>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.103600,-1.535000,20.117800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,-1.535000,20.522100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.258300,-1.535000,20.895500>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<16.103600,-1.535000,20.522100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,-1.535000,22.657800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.258300,-1.535000,22.284400>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<16.103600,-1.535000,22.657800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,-1.535000,23.062100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,-1.535000,22.657800>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.103600,-1.535000,22.657800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,-1.535000,23.062100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.258300,-1.535000,23.435500>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<16.103600,-1.535000,23.062100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,-1.535000,25.197800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.258300,-1.535000,24.824400>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<16.103600,-1.535000,25.197800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,-1.535000,25.602100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,-1.535000,25.197800>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.103600,-1.535000,25.197800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,-1.535000,25.602100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.258300,-1.535000,25.975500>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<16.103600,-1.535000,25.602100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,-1.535000,32.817800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.258300,-1.535000,32.444400>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<16.103600,-1.535000,32.817800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,-1.535000,33.222100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,-1.535000,32.817800>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.103600,-1.535000,32.817800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.103600,-1.535000,33.222100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.258300,-1.535000,33.595500>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<16.103600,-1.535000,33.222100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.143300,-1.535000,51.612800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.416500,-1.535000,51.612800>}
box{<0,0,-0.203200><3.273200,0.035000,0.203200> rotate<0,0.000000,0> translate<16.143300,-1.535000,51.612800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.154400,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.708900,-1.535000,10.566400>}
box{<0,0,-0.203200><14.554500,0.035000,0.203200> rotate<0,0.000000,0> translate<16.154400,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.172100,-1.535000,27.306900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.486500,-1.535000,26.992500>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,44.997030,0> translate<16.172100,-1.535000,27.306900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.172100,-1.535000,28.573000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.486500,-1.535000,28.887400>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.172100,-1.535000,28.573000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.172100,-1.535000,29.846900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.486500,-1.535000,29.532500>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,44.997030,0> translate<16.172100,-1.535000,29.846900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.172100,-1.535000,31.113000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.486500,-1.535000,31.427400>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.172100,-1.535000,31.113000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.185400,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.374600,-1.535000,52.425600>}
box{<0,0,-0.203200><3.189200,0.035000,0.203200> rotate<0,0.000000,0> translate<16.185400,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.249500,-1.535000,51.869100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.249500,-1.535000,52.270800>}
box{<0,0,-0.203200><0.401700,0.035000,0.203200> rotate<0,90.000000,0> translate<16.249500,-1.535000,52.270800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.249500,-1.535000,52.019200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.310400,-1.535000,52.019200>}
box{<0,0,-0.203200><3.060900,0.035000,0.203200> rotate<0,0.000000,0> translate<16.249500,-1.535000,52.019200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.252900,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.910700,-1.535000,5.283200>}
box{<0,0,-0.203200><0.657800,0.035000,0.203200> rotate<0,0.000000,0> translate<16.252900,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.255900,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.890700,-1.535000,12.192000>}
box{<0,0,-0.203200><14.634800,0.035000,0.203200> rotate<0,0.000000,0> translate<16.255900,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.258300,-1.535000,17.204400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.544000,-1.535000,16.918700>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<16.258300,-1.535000,17.204400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.258300,-1.535000,18.355500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.544000,-1.535000,18.641200>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.258300,-1.535000,18.355500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.258300,-1.535000,19.744400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.544000,-1.535000,19.458700>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<16.258300,-1.535000,19.744400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.258300,-1.535000,20.895500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.544000,-1.535000,21.181200>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.258300,-1.535000,20.895500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.258300,-1.535000,22.284400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.544000,-1.535000,21.998700>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<16.258300,-1.535000,22.284400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.258300,-1.535000,23.435500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.544000,-1.535000,23.721200>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.258300,-1.535000,23.435500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.258300,-1.535000,24.824400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.544000,-1.535000,24.538700>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<16.258300,-1.535000,24.824400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.258300,-1.535000,25.975500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.544000,-1.535000,26.261200>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.258300,-1.535000,25.975500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.258300,-1.535000,32.444400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.544000,-1.535000,32.158700>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<16.258300,-1.535000,32.444400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.258300,-1.535000,33.595500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.544000,-1.535000,33.881200>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.258300,-1.535000,33.595500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.273500,-1.535000,2.357300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.459100,-1.535000,2.805400>}
box{<0,0,-0.203200><0.485016,0.035000,0.203200> rotate<0,-67.496538,0> translate<16.273500,-1.535000,2.357300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.273500,-1.535000,5.262600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.459100,-1.535000,4.814500>}
box{<0,0,-0.203200><0.485016,0.035000,0.203200> rotate<0,67.496538,0> translate<16.273500,-1.535000,5.262600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.307000,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.822700,-1.535000,2.438400>}
box{<0,0,-0.203200><0.515700,0.035000,0.203200> rotate<0,0.000000,0> translate<16.307000,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.433300,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.696600,-1.535000,4.876800>}
box{<0,0,-0.203200><0.263300,0.035000,0.203200> rotate<0,0.000000,0> translate<16.433300,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.459100,-1.535000,2.805400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.459100,-1.535000,3.759000>}
box{<0,0,-0.203200><0.953600,0.035000,0.203200> rotate<0,90.000000,0> translate<16.459100,-1.535000,3.759000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.459100,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662400,-1.535000,2.844800>}
box{<0,0,-0.203200><0.203300,0.035000,0.203200> rotate<0,0.000000,0> translate<16.459100,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.459100,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662400,-1.535000,3.251200>}
box{<0,0,-0.203200><0.203300,0.035000,0.203200> rotate<0,0.000000,0> translate<16.459100,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.459100,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662400,-1.535000,3.657600>}
box{<0,0,-0.203200><0.203300,0.035000,0.203200> rotate<0,0.000000,0> translate<16.459100,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.459100,-1.535000,3.860800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.459100,-1.535000,4.814500>}
box{<0,0,-0.203200><0.953700,0.035000,0.203200> rotate<0,90.000000,0> translate<16.459100,-1.535000,4.814500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.459100,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662400,-1.535000,4.064000>}
box{<0,0,-0.203200><0.203300,0.035000,0.203200> rotate<0,0.000000,0> translate<16.459100,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.459100,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662400,-1.535000,4.470400>}
box{<0,0,-0.203200><0.203300,0.035000,0.203200> rotate<0,0.000000,0> translate<16.459100,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.486500,-1.535000,26.992500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.897200,-1.535000,26.822400>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,22.496430,0> translate<16.486500,-1.535000,26.992500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.486500,-1.535000,28.887400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.897200,-1.535000,29.057500>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-22.496430,0> translate<16.486500,-1.535000,28.887400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.486500,-1.535000,29.532500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.897200,-1.535000,29.362400>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,22.496430,0> translate<16.486500,-1.535000,29.532500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.486500,-1.535000,31.427400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.897200,-1.535000,31.597500>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-22.496430,0> translate<16.486500,-1.535000,31.427400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.497200,-1.535000,10.909200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.497200,-1.535000,11.429400>}
box{<0,0,-0.203200><0.520200,0.035000,0.203200> rotate<0,90.000000,0> translate<16.497200,-1.535000,11.429400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.497200,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.657800,-1.535000,10.972800>}
box{<0,0,-0.203200><14.160600,0.035000,0.203200> rotate<0,0.000000,0> translate<16.497200,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.497200,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.657800,-1.535000,11.379200>}
box{<0,0,-0.203200><14.160600,0.035000,0.203200> rotate<0,0.000000,0> translate<16.497200,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.497200,-1.535000,11.430400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.497200,-1.535000,11.950700>}
box{<0,0,-0.203200><0.520300,0.035000,0.203200> rotate<0,90.000000,0> translate<16.497200,-1.535000,11.950700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.497200,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.722300,-1.535000,11.785600>}
box{<0,0,-0.203200><14.225100,0.035000,0.203200> rotate<0,0.000000,0> translate<16.497200,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.544000,-1.535000,16.918700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.917400,-1.535000,16.764000>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<16.544000,-1.535000,16.918700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.544000,-1.535000,18.641200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.917400,-1.535000,18.795900>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<16.544000,-1.535000,18.641200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.544000,-1.535000,19.458700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.917400,-1.535000,19.304000>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<16.544000,-1.535000,19.458700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.544000,-1.535000,21.181200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.917400,-1.535000,21.335900>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<16.544000,-1.535000,21.181200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.544000,-1.535000,21.998700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.917400,-1.535000,21.844000>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<16.544000,-1.535000,21.998700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.544000,-1.535000,23.721200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.917400,-1.535000,23.875900>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<16.544000,-1.535000,23.721200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.544000,-1.535000,24.538700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.917400,-1.535000,24.384000>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<16.544000,-1.535000,24.538700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.544000,-1.535000,26.261200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.917400,-1.535000,26.415900>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<16.544000,-1.535000,26.261200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.544000,-1.535000,32.158700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.917400,-1.535000,32.004000>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<16.544000,-1.535000,32.158700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.544000,-1.535000,33.881200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.917400,-1.535000,34.035900>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<16.544000,-1.535000,33.881200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662400,-1.535000,2.825600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.832500,-1.535000,2.414900>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,67.497630,0> translate<16.662400,-1.535000,2.825600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662400,-1.535000,4.794300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662400,-1.535000,2.825600>}
box{<0,0,-0.203200><1.968700,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.662400,-1.535000,2.825600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662400,-1.535000,4.794300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.832500,-1.535000,5.205000>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-67.497630,0> translate<16.662400,-1.535000,4.794300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662400,-1.535000,41.447100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.317100,-1.535000,40.792400>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,44.997030,0> translate<16.662400,-1.535000,41.447100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662400,-1.535000,41.909400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662400,-1.535000,41.447100>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.662400,-1.535000,41.447100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662400,-1.535000,41.909400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.778900,-1.535000,41.909400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<16.662400,-1.535000,41.909400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662400,-1.535000,41.910400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.778900,-1.535000,41.910400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<16.662400,-1.535000,41.910400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662400,-1.535000,42.372800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662400,-1.535000,41.910400>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,-90.000000,0> translate<16.662400,-1.535000,41.910400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.662400,-1.535000,42.372800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.317100,-1.535000,43.027500>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.662400,-1.535000,42.372800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.832500,-1.535000,2.414900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.146900,-1.535000,2.100500>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,44.997030,0> translate<16.832500,-1.535000,2.414900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.832500,-1.535000,5.205000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.146900,-1.535000,5.519400>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.832500,-1.535000,5.205000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.897200,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,26.822400>}
box{<0,0,-0.203200><0.882200,0.035000,0.203200> rotate<0,0.000000,0> translate<16.897200,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.897200,-1.535000,29.057500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,29.057500>}
box{<0,0,-0.203200><0.882200,0.035000,0.203200> rotate<0,0.000000,0> translate<16.897200,-1.535000,29.057500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.897200,-1.535000,29.362400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,29.362400>}
box{<0,0,-0.203200><0.882200,0.035000,0.203200> rotate<0,0.000000,0> translate<16.897200,-1.535000,29.362400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.897200,-1.535000,31.597500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,31.597500>}
box{<0,0,-0.203200><0.882200,0.035000,0.203200> rotate<0,0.000000,0> translate<16.897200,-1.535000,31.597500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.917400,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.642500,-1.535000,16.764000>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<16.917400,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.917400,-1.535000,18.795900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.642500,-1.535000,18.795900>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<16.917400,-1.535000,18.795900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.917400,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.642500,-1.535000,19.304000>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<16.917400,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.917400,-1.535000,21.335900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.642500,-1.535000,21.335900>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<16.917400,-1.535000,21.335900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.917400,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.642500,-1.535000,21.844000>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<16.917400,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.917400,-1.535000,23.875900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.642500,-1.535000,23.875900>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<16.917400,-1.535000,23.875900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.917400,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.642500,-1.535000,24.384000>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<16.917400,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.917400,-1.535000,26.415900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.642500,-1.535000,26.415900>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<16.917400,-1.535000,26.415900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.917400,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.642500,-1.535000,32.004000>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<16.917400,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.917400,-1.535000,34.035900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.642500,-1.535000,34.035900>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<16.917400,-1.535000,34.035900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.146900,-1.535000,2.100500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.557600,-1.535000,1.930400>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,22.496430,0> translate<17.146900,-1.535000,2.100500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.146900,-1.535000,5.519400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.557600,-1.535000,5.689500>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-22.496430,0> translate<17.146900,-1.535000,5.519400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.317100,-1.535000,40.792400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,40.792400>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,0.000000,0> translate<17.317100,-1.535000,40.792400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.317100,-1.535000,43.027500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,43.027500>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,0.000000,0> translate<17.317100,-1.535000,43.027500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.557600,-1.535000,1.930400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.002300,-1.535000,1.930400>}
box{<0,0,-0.203200><0.444700,0.035000,0.203200> rotate<0,0.000000,0> translate<17.557600,-1.535000,1.930400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.557600,-1.535000,5.689500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.002300,-1.535000,5.689500>}
box{<0,0,-0.203200><0.444700,0.035000,0.203200> rotate<0,0.000000,0> translate<17.557600,-1.535000,5.689500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.778900,-1.535000,27.940400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.778900,-1.535000,27.939400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.778900,-1.535000,27.939400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.778900,-1.535000,30.480400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.778900,-1.535000,30.479400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.778900,-1.535000,30.479400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.778900,-1.535000,41.910400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.778900,-1.535000,41.909400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.778900,-1.535000,41.909400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,27.938900>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<17.779400,-1.535000,27.938900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,26.822400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.779400,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,27.228800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.779400,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,27.635200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.779400,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,27.938900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,27.938900>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.779400,-1.535000,27.938900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,27.941000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,29.057500>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<17.779400,-1.535000,29.057500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,27.941000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,27.941000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.779400,-1.535000,27.941000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,28.041600>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.779400,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,28.448000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.779400,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,28.854400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.779400,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,29.362400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,30.478900>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<17.779400,-1.535000,30.478900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,29.667200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.779400,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,30.073600>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.779400,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,30.478900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,30.478900>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.779400,-1.535000,30.478900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,30.481000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,31.597500>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<17.779400,-1.535000,31.597500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,30.481000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,30.481000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.779400,-1.535000,30.481000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,30.886400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.779400,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,31.292800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.779400,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,40.792400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,41.908900>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<17.779400,-1.535000,41.908900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,41.046400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,41.046400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.779400,-1.535000,41.046400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,41.452800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.779400,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,41.859200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,41.859200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.779400,-1.535000,41.859200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,41.908900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,41.908900>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.779400,-1.535000,41.908900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,41.911000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,43.027500>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<17.779400,-1.535000,43.027500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,41.911000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,41.911000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.779400,-1.535000,41.911000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,42.265600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,42.265600>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.779400,-1.535000,42.265600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.779400,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,42.672000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.779400,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.662700,-1.535000,26.822400>}
box{<0,0,-0.203200><0.882300,0.035000,0.203200> rotate<0,0.000000,0> translate<17.780400,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,27.938900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,26.822400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.780400,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,29.057500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,27.941000>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.780400,-1.535000,27.941000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,29.057500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.662700,-1.535000,29.057500>}
box{<0,0,-0.203200><0.882300,0.035000,0.203200> rotate<0,0.000000,0> translate<17.780400,-1.535000,29.057500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,29.362400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.662700,-1.535000,29.362400>}
box{<0,0,-0.203200><0.882300,0.035000,0.203200> rotate<0,0.000000,0> translate<17.780400,-1.535000,29.362400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,30.478900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,29.362400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.780400,-1.535000,29.362400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,31.597500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,30.481000>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.780400,-1.535000,30.481000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,31.597500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.662700,-1.535000,31.597500>}
box{<0,0,-0.203200><0.882300,0.035000,0.203200> rotate<0,0.000000,0> translate<17.780400,-1.535000,31.597500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,40.792400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.242800,-1.535000,40.792400>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,0.000000,0> translate<17.780400,-1.535000,40.792400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,41.908900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,40.792400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.780400,-1.535000,40.792400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,43.027500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,41.911000>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<17.780400,-1.535000,41.911000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780400,-1.535000,43.027500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.242800,-1.535000,43.027500>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,0.000000,0> translate<17.780400,-1.535000,43.027500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.781000,-1.535000,27.939400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.781000,-1.535000,27.940400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,90.000000,0> translate<17.781000,-1.535000,27.940400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.781000,-1.535000,27.939400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.557900,-1.535000,27.939400>}
box{<0,0,-0.203200><1.776900,0.035000,0.203200> rotate<0,0.000000,0> translate<17.781000,-1.535000,27.939400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.781000,-1.535000,27.940400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.557900,-1.535000,27.940400>}
box{<0,0,-0.203200><1.776900,0.035000,0.203200> rotate<0,0.000000,0> translate<17.781000,-1.535000,27.940400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.781000,-1.535000,30.479400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.781000,-1.535000,30.480400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,90.000000,0> translate<17.781000,-1.535000,30.480400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.781000,-1.535000,30.479400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.557900,-1.535000,30.479400>}
box{<0,0,-0.203200><1.776900,0.035000,0.203200> rotate<0,0.000000,0> translate<17.781000,-1.535000,30.479400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.781000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.263600,-1.535000,30.480000>}
box{<0,0,-0.203200><8.482600,0.035000,0.203200> rotate<0,0.000000,0> translate<17.781000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.781000,-1.535000,30.480400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.557900,-1.535000,30.480400>}
box{<0,0,-0.203200><1.776900,0.035000,0.203200> rotate<0,0.000000,0> translate<17.781000,-1.535000,30.480400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.781000,-1.535000,41.909400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.781000,-1.535000,41.910400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,90.000000,0> translate<17.781000,-1.535000,41.910400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.781000,-1.535000,41.909400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897500,-1.535000,41.909400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<17.781000,-1.535000,41.909400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.781000,-1.535000,41.910400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897500,-1.535000,41.910400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<17.781000,-1.535000,41.910400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.002300,-1.535000,1.930400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.413000,-1.535000,2.100500>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-22.496430,0> translate<18.002300,-1.535000,1.930400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.002300,-1.535000,5.689500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.413000,-1.535000,5.519400>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,22.496430,0> translate<18.002300,-1.535000,5.689500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.242800,-1.535000,40.792400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897500,-1.535000,41.447100>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.242800,-1.535000,40.792400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.242800,-1.535000,43.027500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897500,-1.535000,42.372800>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,44.997030,0> translate<18.242800,-1.535000,43.027500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.247600,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.026500,-1.535000,2.032000>}
box{<0,0,-0.203200><42.778900,0.035000,0.203200> rotate<0,0.000000,0> translate<18.247600,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.413000,-1.535000,2.100500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.727400,-1.535000,2.414900>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.413000,-1.535000,2.100500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.413000,-1.535000,5.519400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.727400,-1.535000,5.205000>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,44.997030,0> translate<18.413000,-1.535000,5.519400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.496800,-1.535000,41.046400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.746800,-1.535000,41.046400>}
box{<0,0,-0.203200><1.250000,0.035000,0.203200> rotate<0,0.000000,0> translate<18.496800,-1.535000,41.046400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.598300,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.645300,-1.535000,42.672000>}
box{<0,0,-0.203200><1.047000,0.035000,0.203200> rotate<0,0.000000,0> translate<18.598300,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.642500,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.015900,-1.535000,16.918700>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<18.642500,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.642500,-1.535000,18.795900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.015900,-1.535000,18.641200>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<18.642500,-1.535000,18.795900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.642500,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.015900,-1.535000,19.458700>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<18.642500,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.642500,-1.535000,21.335900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.015900,-1.535000,21.181200>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<18.642500,-1.535000,21.335900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.642500,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.015900,-1.535000,21.998700>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<18.642500,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.642500,-1.535000,23.875900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.015900,-1.535000,23.721200>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<18.642500,-1.535000,23.875900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.642500,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.015900,-1.535000,24.538700>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<18.642500,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.642500,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.805500,-1.535000,24.384000>}
box{<0,0,-0.203200><7.163000,0.035000,0.203200> rotate<0,0.000000,0> translate<18.642500,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.642500,-1.535000,26.415900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.015900,-1.535000,26.261200>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<18.642500,-1.535000,26.415900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.642500,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.015900,-1.535000,32.158700>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<18.642500,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.642500,-1.535000,34.035900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.015900,-1.535000,33.881200>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<18.642500,-1.535000,34.035900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.649200,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816300,-1.535000,5.283200>}
box{<0,0,-0.203200><14.167100,0.035000,0.203200> rotate<0,0.000000,0> translate<18.649200,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.662700,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.073400,-1.535000,26.992500>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-22.496430,0> translate<18.662700,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.662700,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,26.822400>}
box{<0,0,-0.203200><20.275500,0.035000,0.203200> rotate<0,0.000000,0> translate<18.662700,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.662700,-1.535000,29.057500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.073400,-1.535000,28.887400>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,22.496430,0> translate<18.662700,-1.535000,29.057500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.662700,-1.535000,29.362400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.073400,-1.535000,29.532500>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-22.496430,0> translate<18.662700,-1.535000,29.362400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.662700,-1.535000,31.597500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.073400,-1.535000,31.427400>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,22.496430,0> translate<18.662700,-1.535000,31.597500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.727400,-1.535000,2.414900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897500,-1.535000,2.825600>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-67.497630,0> translate<18.727400,-1.535000,2.414900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.727400,-1.535000,5.205000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897500,-1.535000,4.794300>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,67.497630,0> translate<18.727400,-1.535000,5.205000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.737100,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.620100,-1.535000,2.438400>}
box{<0,0,-0.203200><41.883000,0.035000,0.203200> rotate<0,0.000000,0> translate<18.737100,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.863400,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.616400,-1.535000,4.876800>}
box{<0,0,-0.203200><4.753000,0.035000,0.203200> rotate<0,0.000000,0> translate<18.863400,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.887500,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.115900,-1.535000,18.694400>}
box{<0,0,-0.203200><1.228400,0.035000,0.203200> rotate<0,0.000000,0> translate<18.887500,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.887700,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.367100,-1.535000,21.945600>}
box{<0,0,-0.203200><4.479400,0.035000,0.203200> rotate<0,0.000000,0> translate<18.887700,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.887700,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.607600,-1.535000,32.105600>}
box{<0,0,-0.203200><4.719900,0.035000,0.203200> rotate<0,0.000000,0> translate<18.887700,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897500,-1.535000,2.825600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897500,-1.535000,4.794300>}
box{<0,0,-0.203200><1.968700,0.035000,0.203200> rotate<0,90.000000,0> translate<18.897500,-1.535000,4.794300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897500,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.514700,-1.535000,2.844800>}
box{<0,0,-0.203200><4.617200,0.035000,0.203200> rotate<0,0.000000,0> translate<18.897500,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897500,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.108300,-1.535000,3.251200>}
box{<0,0,-0.203200><4.210800,0.035000,0.203200> rotate<0,0.000000,0> translate<18.897500,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897500,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.012400,-1.535000,3.657600>}
box{<0,0,-0.203200><4.114900,0.035000,0.203200> rotate<0,0.000000,0> translate<18.897500,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897500,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.012400,-1.535000,4.064000>}
box{<0,0,-0.203200><4.114900,0.035000,0.203200> rotate<0,0.000000,0> translate<18.897500,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897500,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.210000,-1.535000,4.470400>}
box{<0,0,-0.203200><4.312500,0.035000,0.203200> rotate<0,0.000000,0> translate<18.897500,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897500,-1.535000,41.447100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897500,-1.535000,41.909400>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,90.000000,0> translate<18.897500,-1.535000,41.909400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897500,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.340400,-1.535000,41.452800>}
box{<0,0,-0.203200><0.442900,0.035000,0.203200> rotate<0,0.000000,0> translate<18.897500,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897500,-1.535000,41.859200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,-1.535000,41.859200>}
box{<0,0,-0.203200><0.406500,0.035000,0.203200> rotate<0,0.000000,0> translate<18.897500,-1.535000,41.859200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897500,-1.535000,41.910400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897500,-1.535000,42.372800>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,90.000000,0> translate<18.897500,-1.535000,42.372800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.897500,-1.535000,42.265600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,-1.535000,42.265600>}
box{<0,0,-0.203200><0.406500,0.035000,0.203200> rotate<0,0.000000,0> translate<18.897500,-1.535000,42.265600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.015900,-1.535000,16.918700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.301600,-1.535000,17.204400>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.015900,-1.535000,16.918700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.015900,-1.535000,18.641200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.301600,-1.535000,18.355500>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<19.015900,-1.535000,18.641200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.015900,-1.535000,19.458700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.301600,-1.535000,19.744400>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.015900,-1.535000,19.458700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.015900,-1.535000,21.181200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.301600,-1.535000,20.895500>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<19.015900,-1.535000,21.181200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.015900,-1.535000,21.998700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.301600,-1.535000,22.284400>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.015900,-1.535000,21.998700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.015900,-1.535000,23.721200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.301600,-1.535000,23.435500>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<19.015900,-1.535000,23.721200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.015900,-1.535000,24.538700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.301600,-1.535000,24.824400>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.015900,-1.535000,24.538700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.015900,-1.535000,26.261200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.301600,-1.535000,25.975500>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<19.015900,-1.535000,26.261200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.015900,-1.535000,32.158700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.301600,-1.535000,32.444400>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.015900,-1.535000,32.158700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.015900,-1.535000,33.881200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.301600,-1.535000,33.595500>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<19.015900,-1.535000,33.881200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.064300,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.554300,-1.535000,21.132800>}
box{<0,0,-0.203200><3.490000,0.035000,0.203200> rotate<0,0.000000,0> translate<19.064300,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.064400,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.928700,-1.535000,19.507200>}
box{<0,0,-0.203200><1.864300,0.035000,0.203200> rotate<0,0.000000,0> translate<19.064400,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.073400,-1.535000,26.992500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.387800,-1.535000,27.306900>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.073400,-1.535000,26.992500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.073400,-1.535000,28.887400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.387800,-1.535000,28.573000>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,44.997030,0> translate<19.073400,-1.535000,28.887400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.073400,-1.535000,29.532500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.387800,-1.535000,29.846900>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.073400,-1.535000,29.532500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.073400,-1.535000,31.427400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.387800,-1.535000,31.113000>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,44.997030,0> translate<19.073400,-1.535000,31.427400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.106400,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.832500,-1.535000,28.854400>}
box{<0,0,-0.203200><7.726100,0.035000,0.203200> rotate<0,0.000000,0> translate<19.106400,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.165900,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.992700,-1.535000,23.571200>}
box{<0,0,-0.203200><5.826800,0.035000,0.203200> rotate<0,0.000000,0> translate<19.165900,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.165900,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.404500,-1.535000,33.731200>}
box{<0,0,-0.203200><4.238600,0.035000,0.203200> rotate<0,0.000000,0> translate<19.165900,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.166000,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.410200,-1.535000,17.068800>}
box{<0,0,-0.203200><7.244200,0.035000,0.203200> rotate<0,0.000000,0> translate<19.166000,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.208000,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.655600,-1.535000,31.292800>}
box{<0,0,-0.203200><7.447600,0.035000,0.203200> rotate<0,0.000000,0> translate<19.208000,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.208100,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.655500,-1.535000,29.667200>}
box{<0,0,-0.203200><7.447400,0.035000,0.203200> rotate<0,0.000000,0> translate<19.208100,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.267500,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.452400,-1.535000,26.009600>}
box{<0,0,-0.203200><7.184900,0.035000,0.203200> rotate<0,0.000000,0> translate<19.267500,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.267600,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.211800,-1.535000,24.790400>}
box{<0,0,-0.203200><6.944200,0.035000,0.203200> rotate<0,0.000000,0> translate<19.267600,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.301600,-1.535000,17.204400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.361100,-1.535000,17.348200>}
box{<0,0,-0.203200><0.155624,0.035000,0.203200> rotate<0,-67.517283,0> translate<19.301600,-1.535000,17.204400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.301600,-1.535000,18.355500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.361100,-1.535000,18.211700>}
box{<0,0,-0.203200><0.155624,0.035000,0.203200> rotate<0,67.517283,0> translate<19.301600,-1.535000,18.355500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.301600,-1.535000,19.744400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,20.117800>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<19.301600,-1.535000,19.744400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.301600,-1.535000,20.895500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,20.522100>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<19.301600,-1.535000,20.895500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.301600,-1.535000,22.284400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,22.657800>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<19.301600,-1.535000,22.284400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.301600,-1.535000,23.435500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,23.062100>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<19.301600,-1.535000,23.435500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.301600,-1.535000,24.824400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,25.197800>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<19.301600,-1.535000,24.824400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.301600,-1.535000,25.975500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,25.602100>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<19.301600,-1.535000,25.975500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.301600,-1.535000,32.444400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,32.817800>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<19.301600,-1.535000,32.444400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.301600,-1.535000,33.595500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,33.222100>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<19.301600,-1.535000,33.595500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,-1.535000,37.679200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.899200,-1.535000,37.084000>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<19.304000,-1.535000,37.679200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,-1.535000,38.520700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,-1.535000,37.679200>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,-90.000000,0> translate<19.304000,-1.535000,37.679200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,-1.535000,38.520700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.899200,-1.535000,39.115900>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.304000,-1.535000,38.520700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,-1.535000,41.489200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.899200,-1.535000,40.894000>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<19.304000,-1.535000,41.489200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,-1.535000,42.330700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,-1.535000,41.489200>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,-90.000000,0> translate<19.304000,-1.535000,41.489200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,-1.535000,42.330700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.899200,-1.535000,42.925900>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.304000,-1.535000,42.330700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,-1.535000,44.029200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.899200,-1.535000,43.434000>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<19.304000,-1.535000,44.029200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,-1.535000,44.870700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,-1.535000,44.029200>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,-90.000000,0> translate<19.304000,-1.535000,44.029200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,-1.535000,44.870700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.899200,-1.535000,45.465900>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.304000,-1.535000,44.870700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.309700,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.553900,-1.535000,27.228800>}
box{<0,0,-0.203200><7.244200,0.035000,0.203200> rotate<0,0.000000,0> translate<19.309700,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.310400,-1.535000,51.869100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.464100,-1.535000,51.498100>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,67.492017,0> translate<19.310400,-1.535000,51.869100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.310400,-1.535000,52.270800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.310400,-1.535000,51.869100>}
box{<0,0,-0.203200><0.401700,0.035000,0.203200> rotate<0,-90.000000,0> translate<19.310400,-1.535000,51.869100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.310400,-1.535000,52.270800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.464100,-1.535000,52.641800>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,-67.492017,0> translate<19.310400,-1.535000,52.270800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.329600,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.709500,-1.535000,18.288000>}
box{<0,0,-0.203200><0.379900,0.035000,0.203200> rotate<0,0.000000,0> translate<19.329600,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.329600,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.773500,-1.535000,22.352000>}
box{<0,0,-0.203200><4.443900,0.035000,0.203200> rotate<0,0.000000,0> translate<19.329600,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.329600,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.201200,-1.535000,32.512000>}
box{<0,0,-0.203200><3.871600,0.035000,0.203200> rotate<0,0.000000,0> translate<19.329600,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.361100,-1.535000,17.348200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.990800,-1.535000,17.348200>}
box{<0,0,-0.203200><0.629700,0.035000,0.203200> rotate<0,0.000000,0> translate<19.361100,-1.535000,17.348200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.361100,-1.535000,18.211700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.633200,-1.535000,18.211700>}
box{<0,0,-0.203200><0.272100,0.035000,0.203200> rotate<0,0.000000,0> translate<19.361100,-1.535000,18.211700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.371600,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.335100,-1.535000,19.913600>}
box{<0,0,-0.203200><1.963500,0.035000,0.203200> rotate<0,0.000000,0> translate<19.371600,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.371700,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.147900,-1.535000,20.726400>}
box{<0,0,-0.203200><2.776200,0.035000,0.203200> rotate<0,0.000000,0> translate<19.371700,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.387800,-1.535000,27.306900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.557900,-1.535000,27.717600>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-67.497630,0> translate<19.387800,-1.535000,27.306900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.387800,-1.535000,28.573000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.557900,-1.535000,28.162300>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,67.497630,0> translate<19.387800,-1.535000,28.573000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.387800,-1.535000,29.846900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.557900,-1.535000,30.257600>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-67.497630,0> translate<19.387800,-1.535000,29.846900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.387800,-1.535000,31.113000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.557900,-1.535000,30.702300>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,67.497630,0> translate<19.387800,-1.535000,31.113000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.413800,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.586300,-1.535000,23.164800>}
box{<0,0,-0.203200><5.172500,0.035000,0.203200> rotate<0,0.000000,0> translate<19.413800,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.413800,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.114000,-1.535000,33.324800>}
box{<0,0,-0.203200><3.700200,0.035000,0.203200> rotate<0,0.000000,0> translate<19.413800,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.439600,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.390400,-1.535000,28.448000>}
box{<0,0,-0.203200><6.950800,0.035000,0.203200> rotate<0,0.000000,0> translate<19.439600,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.455800,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.264000,-1.535000,25.196800>}
box{<0,0,-0.203200><6.808200,0.035000,0.203200> rotate<0,0.000000,0> translate<19.455800,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.455900,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.264100,-1.535000,25.603200>}
box{<0,0,-0.203200><6.808200,0.035000,0.203200> rotate<0,0.000000,0> translate<19.455900,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,20.117800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,20.522100>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,90.000000,0> translate<19.456300,-1.535000,20.522100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.741500,-1.535000,20.320000>}
box{<0,0,-0.203200><2.285200,0.035000,0.203200> rotate<0,0.000000,0> translate<19.456300,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,22.657800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,23.062100>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,90.000000,0> translate<19.456300,-1.535000,23.062100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.179900,-1.535000,22.758400>}
box{<0,0,-0.203200><4.723600,0.035000,0.203200> rotate<0,0.000000,0> translate<19.456300,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,25.197800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,25.602100>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,90.000000,0> translate<19.456300,-1.535000,25.602100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,32.817800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,33.222100>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,90.000000,0> translate<19.456300,-1.535000,33.222100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.456300,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.114000,-1.535000,32.918400>}
box{<0,0,-0.203200><3.657700,0.035000,0.203200> rotate<0,0.000000,0> translate<19.456300,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.464100,-1.535000,51.498100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.748100,-1.535000,51.214100>}
box{<0,0,-0.203200><0.401637,0.035000,0.203200> rotate<0,44.997030,0> translate<19.464100,-1.535000,51.498100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.464100,-1.535000,52.641800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.748100,-1.535000,52.925800>}
box{<0,0,-0.203200><0.401637,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.464100,-1.535000,52.641800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.481600,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.348200,-1.535000,30.073600>}
box{<0,0,-0.203200><6.866600,0.035000,0.203200> rotate<0,0.000000,0> translate<19.481600,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.481700,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.348300,-1.535000,30.886400>}
box{<0,0,-0.203200><6.866600,0.035000,0.203200> rotate<0,0.000000,0> translate<19.481700,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.523700,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.306100,-1.535000,27.635200>}
box{<0,0,-0.203200><6.782400,0.035000,0.203200> rotate<0,0.000000,0> translate<19.523700,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.557900,-1.535000,27.717600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.557900,-1.535000,27.939400>}
box{<0,0,-0.203200><0.221800,0.035000,0.203200> rotate<0,90.000000,0> translate<19.557900,-1.535000,27.939400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.557900,-1.535000,27.940400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.557900,-1.535000,28.162300>}
box{<0,0,-0.203200><0.221900,0.035000,0.203200> rotate<0,90.000000,0> translate<19.557900,-1.535000,28.162300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.557900,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.263600,-1.535000,28.041600>}
box{<0,0,-0.203200><6.705700,0.035000,0.203200> rotate<0,0.000000,0> translate<19.557900,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.557900,-1.535000,30.257600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.557900,-1.535000,30.479400>}
box{<0,0,-0.203200><0.221800,0.035000,0.203200> rotate<0,90.000000,0> translate<19.557900,-1.535000,30.479400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.557900,-1.535000,30.480400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.557900,-1.535000,30.702300>}
box{<0,0,-0.203200><0.221900,0.035000,0.203200> rotate<0,90.000000,0> translate<19.557900,-1.535000,30.702300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.633200,-1.535000,18.211700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.984200,-1.535000,24.562700>}
box{<0,0,-0.203200><8.981670,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.633200,-1.535000,18.211700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.748100,-1.535000,51.214100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.119100,-1.535000,51.060400>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,22.502043,0> translate<19.748100,-1.535000,51.214100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.748100,-1.535000,52.925800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.119100,-1.535000,53.079500>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,-22.502043,0> translate<19.748100,-1.535000,52.925800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.899200,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.740700,-1.535000,37.084000>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<19.899200,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.899200,-1.535000,39.115900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.740700,-1.535000,39.115900>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<19.899200,-1.535000,39.115900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.899200,-1.535000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.740700,-1.535000,40.894000>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<19.899200,-1.535000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.899200,-1.535000,42.925900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.740700,-1.535000,42.925900>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<19.899200,-1.535000,42.925900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.899200,-1.535000,43.434000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.740700,-1.535000,43.434000>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<19.899200,-1.535000,43.434000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.899200,-1.535000,45.465900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.740700,-1.535000,45.465900>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<19.899200,-1.535000,45.465900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.990800,-1.535000,17.348200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.243700,-1.535000,17.601100>}
box{<0,0,-0.203200><0.357655,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.990800,-1.535000,17.348200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.117800,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.196100,-1.535000,17.475200>}
box{<0,0,-0.203200><6.078300,0.035000,0.203200> rotate<0,0.000000,0> translate<20.117800,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.119100,-1.535000,51.060400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.520800,-1.535000,51.060400>}
box{<0,0,-0.203200><0.401700,0.035000,0.203200> rotate<0,0.000000,0> translate<20.119100,-1.535000,51.060400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.119100,-1.535000,53.079500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.520800,-1.535000,53.079500>}
box{<0,0,-0.203200><0.401700,0.035000,0.203200> rotate<0,0.000000,0> translate<20.119100,-1.535000,53.079500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.243700,-1.535000,17.601100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.243700,-1.535000,17.601200>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,90.000000,0> translate<20.243700,-1.535000,17.601200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.243700,-1.535000,17.601200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.594700,-1.535000,23.952200>}
box{<0,0,-0.203200><8.981670,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.243700,-1.535000,17.601200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.520800,-1.535000,51.060400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.891800,-1.535000,51.214100>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,-22.502043,0> translate<20.520800,-1.535000,51.060400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.520800,-1.535000,53.079500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.891800,-1.535000,52.925800>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,22.502043,0> translate<20.520800,-1.535000,53.079500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.524100,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.162000,-1.535000,17.881600>}
box{<0,0,-0.203200><5.637900,0.035000,0.203200> rotate<0,0.000000,0> translate<20.524100,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.740700,-1.535000,37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.335900,-1.535000,37.679200>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.740700,-1.535000,37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.740700,-1.535000,39.115900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.335900,-1.535000,38.520700>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<20.740700,-1.535000,39.115900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.740700,-1.535000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.335900,-1.535000,41.489200>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.740700,-1.535000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.740700,-1.535000,42.925900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.335900,-1.535000,42.330700>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<20.740700,-1.535000,42.925900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.740700,-1.535000,43.434000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.335900,-1.535000,44.029200>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.740700,-1.535000,43.434000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.740700,-1.535000,45.465900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.335900,-1.535000,44.870700>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<20.740700,-1.535000,45.465900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.791500,-1.535000,43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.114000,-1.535000,43.484800>}
box{<0,0,-0.203200><2.322500,0.035000,0.203200> rotate<0,0.000000,0> translate<20.791500,-1.535000,43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.842200,-1.535000,39.014400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,39.014400>}
box{<0,0,-0.203200><44.410600,0.035000,0.203200> rotate<0,0.000000,0> translate<20.842200,-1.535000,39.014400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.873200,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.846600,-1.535000,51.206400>}
box{<0,0,-0.203200><3.973400,0.035000,0.203200> rotate<0,0.000000,0> translate<20.873200,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.891800,-1.535000,51.214100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.175800,-1.535000,51.498100>}
box{<0,0,-0.203200><0.401637,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.891800,-1.535000,51.214100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.891800,-1.535000,52.925800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.175800,-1.535000,52.641800>}
box{<0,0,-0.203200><0.401637,0.035000,0.203200> rotate<0,44.997030,0> translate<20.891800,-1.535000,52.925800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.893100,-1.535000,41.046400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.223100,-1.535000,41.046400>}
box{<0,0,-0.203200><6.330000,0.035000,0.203200> rotate<0,0.000000,0> translate<20.893100,-1.535000,41.046400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.930500,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.280400,-1.535000,18.288000>}
box{<0,0,-0.203200><5.349900,0.035000,0.203200> rotate<0,0.000000,0> translate<20.930500,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.985600,-1.535000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.734300,-1.535000,52.832000>}
box{<0,0,-0.203200><3.748700,0.035000,0.203200> rotate<0,0.000000,0> translate<20.985600,-1.535000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.994600,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.201200,-1.535000,42.672000>}
box{<0,0,-0.203200><2.206600,0.035000,0.203200> rotate<0,0.000000,0> translate<20.994600,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.045500,-1.535000,37.388800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,37.388800>}
box{<0,0,-0.203200><44.207300,0.035000,0.203200> rotate<0,0.000000,0> translate<21.045500,-1.535000,37.388800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.096200,-1.535000,45.110400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.703700,-1.535000,45.110400>}
box{<0,0,-0.203200><8.607500,0.035000,0.203200> rotate<0,0.000000,0> translate<21.096200,-1.535000,45.110400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.175800,-1.535000,51.498100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.329500,-1.535000,51.869100>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,-67.492017,0> translate<21.175800,-1.535000,51.498100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.175800,-1.535000,52.641800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.329500,-1.535000,52.270800>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,67.492017,0> translate<21.175800,-1.535000,52.641800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.197900,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.404500,-1.535000,43.891200>}
box{<0,0,-0.203200><2.206600,0.035000,0.203200> rotate<0,0.000000,0> translate<21.197900,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.223300,-1.535000,51.612800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.496500,-1.535000,51.612800>}
box{<0,0,-0.203200><3.273200,0.035000,0.203200> rotate<0,0.000000,0> translate<21.223300,-1.535000,51.612800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.248600,-1.535000,38.608000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,38.608000>}
box{<0,0,-0.203200><44.004200,0.035000,0.203200> rotate<0,0.000000,0> translate<21.248600,-1.535000,38.608000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.265400,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.454600,-1.535000,52.425600>}
box{<0,0,-0.203200><3.189200,0.035000,0.203200> rotate<0,0.000000,0> translate<21.265400,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.299500,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.822400,-1.535000,41.452800>}
box{<0,0,-0.203200><5.522900,0.035000,0.203200> rotate<0,0.000000,0> translate<21.299500,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.329500,-1.535000,51.869100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.329500,-1.535000,52.270800>}
box{<0,0,-0.203200><0.401700,0.035000,0.203200> rotate<0,90.000000,0> translate<21.329500,-1.535000,52.270800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.329500,-1.535000,52.019200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.390400,-1.535000,52.019200>}
box{<0,0,-0.203200><3.060900,0.035000,0.203200> rotate<0,0.000000,0> translate<21.329500,-1.535000,52.019200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.335900,-1.535000,37.679200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.335900,-1.535000,38.520700>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,90.000000,0> translate<21.335900,-1.535000,38.520700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.335900,-1.535000,37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,37.795200>}
box{<0,0,-0.203200><43.916900,0.035000,0.203200> rotate<0,0.000000,0> translate<21.335900,-1.535000,37.795200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.335900,-1.535000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,38.201600>}
box{<0,0,-0.203200><43.916900,0.035000,0.203200> rotate<0,0.000000,0> translate<21.335900,-1.535000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.335900,-1.535000,41.489200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.335900,-1.535000,42.330700>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,90.000000,0> translate<21.335900,-1.535000,42.330700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.335900,-1.535000,41.859200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.822400,-1.535000,41.859200>}
box{<0,0,-0.203200><5.486500,0.035000,0.203200> rotate<0,0.000000,0> translate<21.335900,-1.535000,41.859200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.335900,-1.535000,42.265600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.607600,-1.535000,42.265600>}
box{<0,0,-0.203200><2.271700,0.035000,0.203200> rotate<0,0.000000,0> translate<21.335900,-1.535000,42.265600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.335900,-1.535000,44.029200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.335900,-1.535000,44.870700>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,90.000000,0> translate<21.335900,-1.535000,44.870700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.335900,-1.535000,44.297600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,-1.535000,44.297600>}
box{<0,0,-0.203200><8.128100,0.035000,0.203200> rotate<0,0.000000,0> translate<21.335900,-1.535000,44.297600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.335900,-1.535000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,-1.535000,44.704000>}
box{<0,0,-0.203200><8.128100,0.035000,0.203200> rotate<0,0.000000,0> translate<21.335900,-1.535000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.336900,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.704300,-1.535000,18.694400>}
box{<0,0,-0.203200><3.367400,0.035000,0.203200> rotate<0,0.000000,0> translate<21.336900,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.743300,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.288800,-1.535000,19.100800>}
box{<0,0,-0.203200><2.545500,0.035000,0.203200> rotate<0,0.000000,0> translate<21.743300,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.149700,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.288900,-1.535000,19.507200>}
box{<0,0,-0.203200><2.139200,0.035000,0.203200> rotate<0,0.000000,0> translate<22.149700,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.556100,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.704600,-1.535000,19.913600>}
box{<0,0,-0.203200><2.148500,0.035000,0.203200> rotate<0,0.000000,0> translate<22.556100,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.962500,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.297400,-1.535000,20.320000>}
box{<0,0,-0.203200><2.334900,0.035000,0.203200> rotate<0,0.000000,0> translate<22.962500,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.012400,-1.535000,3.347100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.667100,-1.535000,2.692400>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,44.997030,0> translate<23.012400,-1.535000,3.347100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.012400,-1.535000,3.809400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.012400,-1.535000,3.347100>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,-90.000000,0> translate<23.012400,-1.535000,3.347100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.012400,-1.535000,3.809400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.128900,-1.535000,3.809400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<23.012400,-1.535000,3.809400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.012400,-1.535000,3.810400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.128900,-1.535000,3.810400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<23.012400,-1.535000,3.810400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.012400,-1.535000,4.272800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.012400,-1.535000,3.810400>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,-90.000000,0> translate<23.012400,-1.535000,3.810400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.012400,-1.535000,4.272800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.667100,-1.535000,4.927500>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.012400,-1.535000,4.272800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.114000,-1.535000,32.599200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.709200,-1.535000,32.004000>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<23.114000,-1.535000,32.599200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.114000,-1.535000,33.440700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.114000,-1.535000,32.599200>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,-90.000000,0> translate<23.114000,-1.535000,32.599200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.114000,-1.535000,33.440700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.709200,-1.535000,34.035900>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.114000,-1.535000,33.440700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.114000,-1.535000,42.759200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.709200,-1.535000,42.164000>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<23.114000,-1.535000,42.759200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.114000,-1.535000,43.600700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.114000,-1.535000,42.759200>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,-90.000000,0> translate<23.114000,-1.535000,42.759200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.114000,-1.535000,43.600700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.709200,-1.535000,44.195900>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.114000,-1.535000,43.600700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.368900,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.703800,-1.535000,20.726400>}
box{<0,0,-0.203200><2.334900,0.035000,0.203200> rotate<0,0.000000,0> translate<23.368900,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.667100,-1.535000,2.692400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.129400,-1.535000,2.692400>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,0.000000,0> translate<23.667100,-1.535000,2.692400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.667100,-1.535000,4.927500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.129400,-1.535000,4.927500>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,0.000000,0> translate<23.667100,-1.535000,4.927500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.709200,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.550700,-1.535000,32.004000>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<23.709200,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.709200,-1.535000,34.035900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.550700,-1.535000,34.035900>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<23.709200,-1.535000,34.035900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.709200,-1.535000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.550700,-1.535000,42.164000>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<23.709200,-1.535000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.709200,-1.535000,44.195900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.550700,-1.535000,44.195900>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<23.709200,-1.535000,44.195900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.775300,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.655600,-1.535000,21.132800>}
box{<0,0,-0.203200><2.880300,0.035000,0.203200> rotate<0,0.000000,0> translate<23.775300,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.128900,-1.535000,3.810400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.128900,-1.535000,3.809400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.128900,-1.535000,3.809400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.129400,-1.535000,2.692400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.129400,-1.535000,3.808900>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<24.129400,-1.535000,3.808900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.129400,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130400,-1.535000,2.844800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.129400,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.129400,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130400,-1.535000,3.251200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.129400,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.129400,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130400,-1.535000,3.657600>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.129400,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.129400,-1.535000,3.808900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130400,-1.535000,3.808900>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.129400,-1.535000,3.808900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.129400,-1.535000,3.811000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.129400,-1.535000,4.927500>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<24.129400,-1.535000,4.927500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.129400,-1.535000,3.811000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130400,-1.535000,3.811000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.129400,-1.535000,3.811000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.129400,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130400,-1.535000,4.064000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.129400,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.129400,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130400,-1.535000,4.470400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.129400,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.129400,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130400,-1.535000,4.876800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.129400,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130400,-1.535000,2.692400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.592800,-1.535000,2.692400>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,0.000000,0> translate<24.130400,-1.535000,2.692400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130400,-1.535000,3.808900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130400,-1.535000,2.692400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.130400,-1.535000,2.692400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130400,-1.535000,4.927500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130400,-1.535000,3.811000>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.130400,-1.535000,3.811000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.130400,-1.535000,4.927500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.592800,-1.535000,4.927500>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,0.000000,0> translate<24.130400,-1.535000,4.927500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.131000,-1.535000,3.809400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.131000,-1.535000,3.810400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,90.000000,0> translate<24.131000,-1.535000,3.810400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.131000,-1.535000,3.809400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.247500,-1.535000,3.809400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<24.131000,-1.535000,3.809400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.131000,-1.535000,3.810400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.247500,-1.535000,3.810400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<24.131000,-1.535000,3.810400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.181700,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,21.539200>}
box{<0,0,-0.203200><14.756500,0.035000,0.203200> rotate<0,0.000000,0> translate<24.181700,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.257000,-1.535000,19.177600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.353700,-1.535000,18.944300>}
box{<0,0,-0.203200><0.252547,0.035000,0.203200> rotate<0,67.482137,0> translate<24.257000,-1.535000,19.177600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.257000,-1.535000,19.430300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.257000,-1.535000,19.177600>}
box{<0,0,-0.203200><0.252700,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.257000,-1.535000,19.177600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.257000,-1.535000,19.430300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.353700,-1.535000,19.663600>}
box{<0,0,-0.203200><0.252547,0.035000,0.203200> rotate<0,-67.482137,0> translate<24.257000,-1.535000,19.430300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.353700,-1.535000,18.944300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.532300,-1.535000,18.765700>}
box{<0,0,-0.203200><0.252579,0.035000,0.203200> rotate<0,44.997030,0> translate<24.353700,-1.535000,18.944300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.353700,-1.535000,19.663600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.532300,-1.535000,19.842200>}
box{<0,0,-0.203200><0.252579,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.353700,-1.535000,19.663600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.390400,-1.535000,51.869100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.544100,-1.535000,51.498100>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,67.492017,0> translate<24.390400,-1.535000,51.869100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.390400,-1.535000,52.270800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.390400,-1.535000,51.869100>}
box{<0,0,-0.203200><0.401700,0.035000,0.203200> rotate<0,-90.000000,0> translate<24.390400,-1.535000,51.869100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.390400,-1.535000,52.270800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.544100,-1.535000,52.641800>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,-67.492017,0> translate<24.390400,-1.535000,52.270800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.532300,-1.535000,18.765700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.765600,-1.535000,18.669000>}
box{<0,0,-0.203200><0.252547,0.035000,0.203200> rotate<0,22.511924,0> translate<24.532300,-1.535000,18.765700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.532300,-1.535000,19.842200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.765600,-1.535000,19.938900>}
box{<0,0,-0.203200><0.252547,0.035000,0.203200> rotate<0,-22.511924,0> translate<24.532300,-1.535000,19.842200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.544100,-1.535000,51.498100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.828100,-1.535000,51.214100>}
box{<0,0,-0.203200><0.401637,0.035000,0.203200> rotate<0,44.997030,0> translate<24.544100,-1.535000,51.498100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.544100,-1.535000,52.641800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.828100,-1.535000,52.925800>}
box{<0,0,-0.203200><0.401637,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.544100,-1.535000,52.641800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.550700,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.145900,-1.535000,32.599200>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.550700,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.550700,-1.535000,34.035900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.145900,-1.535000,33.440700>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<24.550700,-1.535000,34.035900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.550700,-1.535000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.145900,-1.535000,42.759200>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.550700,-1.535000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.550700,-1.535000,44.195900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.145900,-1.535000,43.600700>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<24.550700,-1.535000,44.195900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.588100,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.832100,-1.535000,21.945600>}
box{<0,0,-0.203200><2.244000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.588100,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.592800,-1.535000,2.692400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.247500,-1.535000,3.347100>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.592800,-1.535000,2.692400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.592800,-1.535000,4.927500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.247500,-1.535000,4.272800>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,44.997030,0> translate<24.592800,-1.535000,4.927500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.643500,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.556200,-1.535000,4.876800>}
box{<0,0,-0.203200><5.912700,0.035000,0.203200> rotate<0,0.000000,0> translate<24.643500,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.652300,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.832100,-1.535000,32.105600>}
box{<0,0,-0.203200><2.179800,0.035000,0.203200> rotate<0,0.000000,0> translate<24.652300,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.652300,-1.535000,42.265600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.822400,-1.535000,42.265600>}
box{<0,0,-0.203200><2.170100,0.035000,0.203200> rotate<0,0.000000,0> translate<24.652300,-1.535000,42.265600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.745200,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.198400,-1.535000,2.844800>}
box{<0,0,-0.203200><1.453200,0.035000,0.203200> rotate<0,0.000000,0> translate<24.745200,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.765600,-1.535000,18.669000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.018300,-1.535000,18.669000>}
box{<0,0,-0.203200><0.252700,0.035000,0.203200> rotate<0,0.000000,0> translate<24.765600,-1.535000,18.669000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.765600,-1.535000,19.938900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.916300,-1.535000,19.938900>}
box{<0,0,-0.203200><0.150700,0.035000,0.203200> rotate<0,0.000000,0> translate<24.765600,-1.535000,19.938900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.828100,-1.535000,51.214100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.199100,-1.535000,51.060400>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,22.502043,0> translate<24.828100,-1.535000,51.214100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.828100,-1.535000,52.925800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.199100,-1.535000,53.079500>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,-22.502043,0> translate<24.828100,-1.535000,52.925800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.855400,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.554000,-1.535000,33.731200>}
box{<0,0,-0.203200><1.698600,0.035000,0.203200> rotate<0,0.000000,0> translate<24.855400,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.855400,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.602000,-1.535000,43.891200>}
box{<0,0,-0.203200><4.746600,0.035000,0.203200> rotate<0,0.000000,0> translate<24.855400,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.916300,-1.535000,19.938900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.476200,-1.535000,20.498800>}
box{<0,0,-0.203200><0.791818,0.035000,0.203200> rotate<0,-44.997030,0> translate<24.916300,-1.535000,19.938900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.994500,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.390200,-1.535000,22.352000>}
box{<0,0,-0.203200><1.395700,0.035000,0.203200> rotate<0,0.000000,0> translate<24.994500,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.018300,-1.535000,18.669000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.251600,-1.535000,18.765700>}
box{<0,0,-0.203200><0.252547,0.035000,0.203200> rotate<0,-22.511924,0> translate<25.018300,-1.535000,18.669000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.049900,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.893700,-1.535000,4.470400>}
box{<0,0,-0.203200><0.843800,0.035000,0.203200> rotate<0,0.000000,0> translate<25.049900,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.058700,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.390200,-1.535000,32.512000>}
box{<0,0,-0.203200><1.331500,0.035000,0.203200> rotate<0,0.000000,0> translate<25.058700,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.058700,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.121600,-1.535000,42.672000>}
box{<0,0,-0.203200><2.062900,0.035000,0.203200> rotate<0,0.000000,0> translate<25.058700,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.079500,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.613500,-1.535000,18.694400>}
box{<0,0,-0.203200><1.534000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.079500,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.145900,-1.535000,32.599200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.145900,-1.535000,33.440700>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,90.000000,0> translate<25.145900,-1.535000,33.440700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.145900,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.263600,-1.535000,32.918400>}
box{<0,0,-0.203200><1.117700,0.035000,0.203200> rotate<0,0.000000,0> translate<25.145900,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.145900,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.306200,-1.535000,33.324800>}
box{<0,0,-0.203200><1.160300,0.035000,0.203200> rotate<0,0.000000,0> translate<25.145900,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.145900,-1.535000,42.759200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.145900,-1.535000,43.600700>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,90.000000,0> translate<25.145900,-1.535000,43.600700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.145900,-1.535000,43.078400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,43.078400>}
box{<0,0,-0.203200><40.106900,0.035000,0.203200> rotate<0,0.000000,0> translate<25.145900,-1.535000,43.078400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.145900,-1.535000,43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.008400,-1.535000,43.484800>}
box{<0,0,-0.203200><4.862500,0.035000,0.203200> rotate<0,0.000000,0> translate<25.145900,-1.535000,43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.151600,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.792000,-1.535000,3.251200>}
box{<0,0,-0.203200><0.640400,0.035000,0.203200> rotate<0,0.000000,0> translate<25.151600,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.199100,-1.535000,51.060400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.600800,-1.535000,51.060400>}
box{<0,0,-0.203200><0.401700,0.035000,0.203200> rotate<0,0.000000,0> translate<25.199100,-1.535000,51.060400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.199100,-1.535000,53.079500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.600800,-1.535000,53.079500>}
box{<0,0,-0.203200><0.401700,0.035000,0.203200> rotate<0,0.000000,0> translate<25.199100,-1.535000,53.079500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.247500,-1.535000,3.347100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.247500,-1.535000,3.809400>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,90.000000,0> translate<25.247500,-1.535000,3.809400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.247500,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,-1.535000,3.657600>}
box{<0,0,-0.203200><0.406500,0.035000,0.203200> rotate<0,0.000000,0> translate<25.247500,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.247500,-1.535000,3.810400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.247500,-1.535000,4.272800>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,90.000000,0> translate<25.247500,-1.535000,4.272800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.247500,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,-1.535000,4.064000>}
box{<0,0,-0.203200><0.406500,0.035000,0.203200> rotate<0,0.000000,0> translate<25.247500,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.251600,-1.535000,18.765700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.430200,-1.535000,18.944300>}
box{<0,0,-0.203200><0.252579,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.251600,-1.535000,18.765700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.400900,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.263600,-1.535000,22.758400>}
box{<0,0,-0.203200><0.862700,0.035000,0.203200> rotate<0,0.000000,0> translate<25.400900,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.430200,-1.535000,18.944300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.526900,-1.535000,19.177600>}
box{<0,0,-0.203200><0.252547,0.035000,0.203200> rotate<0,-67.482137,0> translate<25.430200,-1.535000,18.944300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.476200,-1.535000,20.498800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.729100,-1.535000,20.751700>}
box{<0,0,-0.203200><0.357655,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.476200,-1.535000,20.498800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.495000,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.414200,-1.535000,19.100800>}
box{<0,0,-0.203200><11.919200,0.035000,0.203200> rotate<0,0.000000,0> translate<25.495000,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.526900,-1.535000,19.177600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.526900,-1.535000,19.328300>}
box{<0,0,-0.203200><0.150700,0.035000,0.203200> rotate<0,90.000000,0> translate<25.526900,-1.535000,19.328300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.526900,-1.535000,19.328300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.086800,-1.535000,19.888200>}
box{<0,0,-0.203200><0.791818,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.526900,-1.535000,19.328300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.600800,-1.535000,51.060400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.971800,-1.535000,51.214100>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,-22.502043,0> translate<25.600800,-1.535000,51.060400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.600800,-1.535000,53.079500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.971800,-1.535000,52.925800>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,22.502043,0> translate<25.600800,-1.535000,53.079500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,-1.535000,3.389200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.249200,-1.535000,2.794000>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<25.654000,-1.535000,3.389200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,-1.535000,4.230700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,-1.535000,3.389200>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,-90.000000,0> translate<25.654000,-1.535000,3.389200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,-1.535000,4.230700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.249200,-1.535000,4.825900>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.654000,-1.535000,4.230700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.705800,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.655500,-1.535000,19.507200>}
box{<0,0,-0.203200><0.949700,0.035000,0.203200> rotate<0,0.000000,0> translate<25.705800,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.729100,-1.535000,20.751700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.358800,-1.535000,20.751700>}
box{<0,0,-0.203200><0.629700,0.035000,0.203200> rotate<0,0.000000,0> translate<25.729100,-1.535000,20.751700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.807300,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.306200,-1.535000,23.164800>}
box{<0,0,-0.203200><0.498900,0.035000,0.203200> rotate<0,0.000000,0> translate<25.807300,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.953200,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.926600,-1.535000,51.206400>}
box{<0,0,-0.203200><3.973400,0.035000,0.203200> rotate<0,0.000000,0> translate<25.953200,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.971800,-1.535000,51.214100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.255800,-1.535000,51.498100>}
box{<0,0,-0.203200><0.401637,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.971800,-1.535000,51.214100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.971800,-1.535000,52.925800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.255800,-1.535000,52.641800>}
box{<0,0,-0.203200><0.401637,0.035000,0.203200> rotate<0,44.997030,0> translate<25.971800,-1.535000,52.925800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.984200,-1.535000,24.562800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.984200,-1.535000,24.562700>}
box{<0,0,-0.203200><0.000100,0.035000,0.203200> rotate<0,-90.000000,0> translate<25.984200,-1.535000,24.562700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.984200,-1.535000,24.562800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.237100,-1.535000,24.815700>}
box{<0,0,-0.203200><0.357655,0.035000,0.203200> rotate<0,-44.997030,0> translate<25.984200,-1.535000,24.562800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.065600,-1.535000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.814300,-1.535000,52.832000>}
box{<0,0,-0.203200><3.748700,0.035000,0.203200> rotate<0,0.000000,0> translate<26.065600,-1.535000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.086800,-1.535000,19.888200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.358800,-1.535000,19.888200>}
box{<0,0,-0.203200><0.272000,0.035000,0.203200> rotate<0,0.000000,0> translate<26.086800,-1.535000,19.888200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.162000,-1.535000,17.557600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.332100,-1.535000,17.146900>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,67.497630,0> translate<26.162000,-1.535000,17.557600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.162000,-1.535000,17.779400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.162000,-1.535000,17.557600>}
box{<0,0,-0.203200><0.221800,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.162000,-1.535000,17.557600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.162000,-1.535000,17.779400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.938900,-1.535000,17.779400>}
box{<0,0,-0.203200><1.776900,0.035000,0.203200> rotate<0,0.000000,0> translate<26.162000,-1.535000,17.779400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.162000,-1.535000,17.780400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.938900,-1.535000,17.780400>}
box{<0,0,-0.203200><1.776900,0.035000,0.203200> rotate<0,0.000000,0> translate<26.162000,-1.535000,17.780400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.162000,-1.535000,18.002300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.162000,-1.535000,17.780400>}
box{<0,0,-0.203200><0.221900,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.162000,-1.535000,17.780400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.162000,-1.535000,18.002300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.332100,-1.535000,18.413000>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-67.497630,0> translate<26.162000,-1.535000,18.002300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.213700,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.554000,-1.535000,23.571200>}
box{<0,0,-0.203200><0.340300,0.035000,0.203200> rotate<0,0.000000,0> translate<26.213700,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.237100,-1.535000,24.815700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.427100,-1.535000,24.815700>}
box{<0,0,-0.203200><0.190000,0.035000,0.203200> rotate<0,0.000000,0> translate<26.237100,-1.535000,24.815700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.249200,-1.535000,2.794000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.090700,-1.535000,2.794000>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<26.249200,-1.535000,2.794000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.249200,-1.535000,4.825900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.090700,-1.535000,4.825900>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<26.249200,-1.535000,4.825900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.255800,-1.535000,51.498100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.409500,-1.535000,51.869100>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,-67.492017,0> translate<26.255800,-1.535000,51.498100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.255800,-1.535000,52.641800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.409500,-1.535000,52.270800>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,67.492017,0> translate<26.255800,-1.535000,52.641800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.263600,-1.535000,22.657800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.418300,-1.535000,22.284400>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<26.263600,-1.535000,22.657800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.263600,-1.535000,23.062100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.263600,-1.535000,22.657800>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.263600,-1.535000,22.657800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.263600,-1.535000,23.062100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.418300,-1.535000,23.435500>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<26.263600,-1.535000,23.062100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.263600,-1.535000,25.197800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.418300,-1.535000,24.824400>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<26.263600,-1.535000,25.197800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.263600,-1.535000,25.602100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.263600,-1.535000,25.197800>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.263600,-1.535000,25.197800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.263600,-1.535000,25.602100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.418300,-1.535000,25.975500>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<26.263600,-1.535000,25.602100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.263600,-1.535000,27.737800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.418300,-1.535000,27.364400>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<26.263600,-1.535000,27.737800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.263600,-1.535000,28.142100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.263600,-1.535000,27.737800>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.263600,-1.535000,27.737800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.263600,-1.535000,28.142100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.418300,-1.535000,28.515500>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<26.263600,-1.535000,28.142100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.263600,-1.535000,30.277800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.418300,-1.535000,29.904400>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<26.263600,-1.535000,30.277800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.263600,-1.535000,30.682100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.263600,-1.535000,30.277800>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.263600,-1.535000,30.277800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.263600,-1.535000,30.682100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.418300,-1.535000,31.055500>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<26.263600,-1.535000,30.682100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.263600,-1.535000,32.817800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.418300,-1.535000,32.444400>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<26.263600,-1.535000,32.817800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.263600,-1.535000,33.222100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.263600,-1.535000,32.817800>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.263600,-1.535000,32.817800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.263600,-1.535000,33.222100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.418300,-1.535000,33.595500>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<26.263600,-1.535000,33.222100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.303300,-1.535000,51.612800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.576500,-1.535000,51.612800>}
box{<0,0,-0.203200><3.273200,0.035000,0.203200> rotate<0,0.000000,0> translate<26.303300,-1.535000,51.612800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.332100,-1.535000,17.146900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.646500,-1.535000,16.832500>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,44.997030,0> translate<26.332100,-1.535000,17.146900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.332100,-1.535000,18.413000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.646500,-1.535000,18.727400>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.332100,-1.535000,18.413000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.345400,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.534600,-1.535000,52.425600>}
box{<0,0,-0.203200><3.189200,0.035000,0.203200> rotate<0,0.000000,0> translate<26.345400,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.358800,-1.535000,19.888200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.418300,-1.535000,19.744400>}
box{<0,0,-0.203200><0.155624,0.035000,0.203200> rotate<0,67.517283,0> translate<26.358800,-1.535000,19.888200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.358800,-1.535000,20.751700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.418300,-1.535000,20.895500>}
box{<0,0,-0.203200><0.155624,0.035000,0.203200> rotate<0,-67.517283,0> translate<26.358800,-1.535000,20.751700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.409500,-1.535000,51.869100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.409500,-1.535000,52.270800>}
box{<0,0,-0.203200><0.401700,0.035000,0.203200> rotate<0,90.000000,0> translate<26.409500,-1.535000,52.270800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.409500,-1.535000,52.019200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.470400,-1.535000,52.019200>}
box{<0,0,-0.203200><3.060900,0.035000,0.203200> rotate<0,0.000000,0> translate<26.409500,-1.535000,52.019200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.418300,-1.535000,19.744400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.704000,-1.535000,19.458700>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<26.418300,-1.535000,19.744400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.418300,-1.535000,20.895500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.704000,-1.535000,21.181200>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.418300,-1.535000,20.895500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.418300,-1.535000,22.284400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.704000,-1.535000,21.998700>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<26.418300,-1.535000,22.284400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.418300,-1.535000,23.435500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.704000,-1.535000,23.721200>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.418300,-1.535000,23.435500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.418300,-1.535000,24.824400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.427100,-1.535000,24.815700>}
box{<0,0,-0.203200><0.012375,0.035000,0.203200> rotate<0,44.669651,0> translate<26.418300,-1.535000,24.824400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.418300,-1.535000,25.975500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.704000,-1.535000,26.261200>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.418300,-1.535000,25.975500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.418300,-1.535000,27.364400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.704000,-1.535000,27.078700>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<26.418300,-1.535000,27.364400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.418300,-1.535000,28.515500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.704000,-1.535000,28.801200>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.418300,-1.535000,28.515500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.418300,-1.535000,29.904400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.704000,-1.535000,29.618700>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<26.418300,-1.535000,29.904400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.418300,-1.535000,31.055500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.704000,-1.535000,31.341200>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.418300,-1.535000,31.055500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.418300,-1.535000,32.444400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.704000,-1.535000,32.158700>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<26.418300,-1.535000,32.444400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.418300,-1.535000,33.595500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.704000,-1.535000,33.881200>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.418300,-1.535000,33.595500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.594700,-1.535000,23.952200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.333100,-1.535000,23.952200>}
box{<0,0,-0.203200><5.738400,0.035000,0.203200> rotate<0,0.000000,0> translate<26.594700,-1.535000,23.952200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.646500,-1.535000,16.832500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.057200,-1.535000,16.662400>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,22.496430,0> translate<26.646500,-1.535000,16.832500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.646500,-1.535000,18.727400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.057200,-1.535000,18.897500>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-22.496430,0> translate<26.646500,-1.535000,18.727400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.704000,-1.535000,19.458700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.077400,-1.535000,19.304000>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<26.704000,-1.535000,19.458700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.704000,-1.535000,21.181200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.077400,-1.535000,21.335900>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<26.704000,-1.535000,21.181200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.704000,-1.535000,21.998700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.077400,-1.535000,21.844000>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<26.704000,-1.535000,21.998700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.704000,-1.535000,23.721200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.077400,-1.535000,23.875900>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<26.704000,-1.535000,23.721200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.704000,-1.535000,26.261200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.077400,-1.535000,26.415900>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<26.704000,-1.535000,26.261200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.704000,-1.535000,27.078700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.077400,-1.535000,26.924000>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<26.704000,-1.535000,27.078700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.704000,-1.535000,28.801200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.077400,-1.535000,28.955900>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<26.704000,-1.535000,28.801200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.704000,-1.535000,29.618700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.077400,-1.535000,29.464000>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<26.704000,-1.535000,29.618700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.704000,-1.535000,31.341200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.077400,-1.535000,31.495900>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<26.704000,-1.535000,31.341200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.704000,-1.535000,32.158700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.077400,-1.535000,32.004000>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<26.704000,-1.535000,32.158700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.704000,-1.535000,33.881200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.077400,-1.535000,34.035900>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<26.704000,-1.535000,33.881200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.822400,-1.535000,41.447100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.477100,-1.535000,40.792400>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,44.997030,0> translate<26.822400,-1.535000,41.447100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.822400,-1.535000,41.909400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.822400,-1.535000,41.447100>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.822400,-1.535000,41.447100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.822400,-1.535000,41.909400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.938900,-1.535000,41.909400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<26.822400,-1.535000,41.909400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.822400,-1.535000,41.910400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.938900,-1.535000,41.910400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<26.822400,-1.535000,41.910400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.822400,-1.535000,42.372800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.822400,-1.535000,41.910400>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.822400,-1.535000,41.910400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.822400,-1.535000,42.372800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.477100,-1.535000,43.027500>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.822400,-1.535000,42.372800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.057200,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.939400,-1.535000,16.662400>}
box{<0,0,-0.203200><0.882200,0.035000,0.203200> rotate<0,0.000000,0> translate<27.057200,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.057200,-1.535000,18.897500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.939400,-1.535000,18.897500>}
box{<0,0,-0.203200><0.882200,0.035000,0.203200> rotate<0,0.000000,0> translate<27.057200,-1.535000,18.897500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.077400,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.802500,-1.535000,19.304000>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<27.077400,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.077400,-1.535000,21.335900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.802500,-1.535000,21.335900>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<27.077400,-1.535000,21.335900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.077400,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.802500,-1.535000,21.844000>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<27.077400,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.077400,-1.535000,23.875900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.802500,-1.535000,23.875900>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<27.077400,-1.535000,23.875900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.077400,-1.535000,26.415900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.802500,-1.535000,26.415900>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<27.077400,-1.535000,26.415900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.077400,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.802500,-1.535000,26.924000>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<27.077400,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.077400,-1.535000,28.955900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.802500,-1.535000,28.955900>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<27.077400,-1.535000,28.955900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.077400,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.802500,-1.535000,29.464000>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<27.077400,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.077400,-1.535000,31.495900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.802500,-1.535000,31.495900>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<27.077400,-1.535000,31.495900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.077400,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.802500,-1.535000,32.004000>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<27.077400,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.077400,-1.535000,34.035900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.802500,-1.535000,34.035900>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<27.077400,-1.535000,34.035900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.090700,-1.535000,2.794000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.685900,-1.535000,3.389200>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.090700,-1.535000,2.794000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.090700,-1.535000,4.825900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.685900,-1.535000,4.230700>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<27.090700,-1.535000,4.825900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.141500,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.171000,-1.535000,2.844800>}
box{<0,0,-0.203200><5.029500,0.035000,0.203200> rotate<0,0.000000,0> translate<27.141500,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.446200,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.638800,-1.535000,4.470400>}
box{<0,0,-0.203200><3.192600,0.035000,0.203200> rotate<0,0.000000,0> translate<27.446200,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.477100,-1.535000,40.792400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.939400,-1.535000,40.792400>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,0.000000,0> translate<27.477100,-1.535000,40.792400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.477100,-1.535000,43.027500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.939400,-1.535000,43.027500>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,0.000000,0> translate<27.477100,-1.535000,43.027500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.547900,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.444400,-1.535000,3.251200>}
box{<0,0,-0.203200><3.896500,0.035000,0.203200> rotate<0,0.000000,0> translate<27.547900,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.685900,-1.535000,3.389200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.685900,-1.535000,4.230700>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,90.000000,0> translate<27.685900,-1.535000,4.230700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.685900,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.038000,-1.535000,3.657600>}
box{<0,0,-0.203200><3.352100,0.035000,0.203200> rotate<0,0.000000,0> translate<27.685900,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.685900,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.807100,-1.535000,4.064000>}
box{<0,0,-0.203200><3.121200,0.035000,0.203200> rotate<0,0.000000,0> translate<27.685900,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.938900,-1.535000,17.780400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.938900,-1.535000,17.779400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<27.938900,-1.535000,17.779400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.938900,-1.535000,41.910400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.938900,-1.535000,41.909400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<27.938900,-1.535000,41.909400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.939400,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.939400,-1.535000,17.778900>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<27.939400,-1.535000,17.778900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.939400,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940400,-1.535000,16.662400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<27.939400,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.939400,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940400,-1.535000,17.068800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<27.939400,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.939400,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940400,-1.535000,17.475200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<27.939400,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.939400,-1.535000,17.778900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940400,-1.535000,17.778900>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<27.939400,-1.535000,17.778900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.939400,-1.535000,17.781000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.939400,-1.535000,18.897500>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<27.939400,-1.535000,18.897500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.939400,-1.535000,17.781000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940400,-1.535000,17.781000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<27.939400,-1.535000,17.781000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.939400,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940400,-1.535000,17.881600>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<27.939400,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.939400,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940400,-1.535000,18.288000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<27.939400,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.939400,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940400,-1.535000,18.694400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<27.939400,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.939400,-1.535000,40.792400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.939400,-1.535000,41.908900>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<27.939400,-1.535000,41.908900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.939400,-1.535000,41.046400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940400,-1.535000,41.046400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<27.939400,-1.535000,41.046400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.939400,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940400,-1.535000,41.452800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<27.939400,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.939400,-1.535000,41.859200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940400,-1.535000,41.859200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<27.939400,-1.535000,41.859200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.939400,-1.535000,41.908900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940400,-1.535000,41.908900>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<27.939400,-1.535000,41.908900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.939400,-1.535000,41.911000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.939400,-1.535000,43.027500>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<27.939400,-1.535000,43.027500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.939400,-1.535000,41.911000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940400,-1.535000,41.911000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<27.939400,-1.535000,41.911000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.939400,-1.535000,42.265600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940400,-1.535000,42.265600>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<27.939400,-1.535000,42.265600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.939400,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940400,-1.535000,42.672000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<27.939400,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940400,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.822700,-1.535000,16.662400>}
box{<0,0,-0.203200><0.882300,0.035000,0.203200> rotate<0,0.000000,0> translate<27.940400,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940400,-1.535000,17.778900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940400,-1.535000,16.662400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<27.940400,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940400,-1.535000,18.897500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940400,-1.535000,17.781000>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<27.940400,-1.535000,17.781000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940400,-1.535000,18.897500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.822700,-1.535000,18.897500>}
box{<0,0,-0.203200><0.882300,0.035000,0.203200> rotate<0,0.000000,0> translate<27.940400,-1.535000,18.897500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940400,-1.535000,40.792400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.402800,-1.535000,40.792400>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,0.000000,0> translate<27.940400,-1.535000,40.792400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940400,-1.535000,41.908900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940400,-1.535000,40.792400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<27.940400,-1.535000,40.792400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940400,-1.535000,43.027500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940400,-1.535000,41.911000>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<27.940400,-1.535000,41.911000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940400,-1.535000,43.027500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.402800,-1.535000,43.027500>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,0.000000,0> translate<27.940400,-1.535000,43.027500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.941000,-1.535000,17.779400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.941000,-1.535000,17.780400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,90.000000,0> translate<27.941000,-1.535000,17.780400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.941000,-1.535000,17.779400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.717900,-1.535000,17.779400>}
box{<0,0,-0.203200><1.776900,0.035000,0.203200> rotate<0,0.000000,0> translate<27.941000,-1.535000,17.779400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.941000,-1.535000,17.780400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.717900,-1.535000,17.780400>}
box{<0,0,-0.203200><1.776900,0.035000,0.203200> rotate<0,0.000000,0> translate<27.941000,-1.535000,17.780400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.941000,-1.535000,41.909400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.941000,-1.535000,41.910400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,90.000000,0> translate<27.941000,-1.535000,41.910400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.941000,-1.535000,41.909400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.057500,-1.535000,41.909400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<27.941000,-1.535000,41.909400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.941000,-1.535000,41.910400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.057500,-1.535000,41.910400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<27.941000,-1.535000,41.910400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.402800,-1.535000,40.792400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.057500,-1.535000,41.447100>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.402800,-1.535000,40.792400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.402800,-1.535000,43.027500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.057500,-1.535000,42.372800>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,44.997030,0> translate<28.402800,-1.535000,43.027500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.656800,-1.535000,41.046400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.906800,-1.535000,41.046400>}
box{<0,0,-0.203200><1.250000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.656800,-1.535000,41.046400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.758300,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.805300,-1.535000,42.672000>}
box{<0,0,-0.203200><1.047000,0.035000,0.203200> rotate<0,0.000000,0> translate<28.758300,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.802500,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.175900,-1.535000,19.458700>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<28.802500,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.802500,-1.535000,21.335900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.175900,-1.535000,21.181200>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<28.802500,-1.535000,21.335900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.802500,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.175900,-1.535000,21.998700>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<28.802500,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.802500,-1.535000,23.875900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.175900,-1.535000,23.721200>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<28.802500,-1.535000,23.875900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.802500,-1.535000,26.415900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.175900,-1.535000,26.261200>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<28.802500,-1.535000,26.415900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.802500,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.175900,-1.535000,27.078700>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<28.802500,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.802500,-1.535000,28.955900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.175900,-1.535000,28.801200>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<28.802500,-1.535000,28.955900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.802500,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.175900,-1.535000,29.618700>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<28.802500,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.802500,-1.535000,31.495900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.175900,-1.535000,31.341200>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<28.802500,-1.535000,31.495900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.802500,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.175900,-1.535000,32.158700>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<28.802500,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.802500,-1.535000,34.035900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.175900,-1.535000,33.881200>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<28.802500,-1.535000,34.035900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.822700,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.233400,-1.535000,16.832500>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-22.496430,0> translate<28.822700,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.822700,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.844900,-1.535000,16.662400>}
box{<0,0,-0.203200><9.022200,0.035000,0.203200> rotate<0,0.000000,0> translate<28.822700,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.822700,-1.535000,18.897500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.233400,-1.535000,18.727400>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,22.496430,0> translate<28.822700,-1.535000,18.897500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.047500,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.452500,-1.535000,28.854400>}
box{<0,0,-0.203200><5.405000,0.035000,0.203200> rotate<0,0.000000,0> translate<29.047500,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.047700,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.452100,-1.535000,21.945600>}
box{<0,0,-0.203200><5.404400,0.035000,0.203200> rotate<0,0.000000,0> translate<29.047700,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.047700,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.452100,-1.535000,32.105600>}
box{<0,0,-0.203200><5.404400,0.035000,0.203200> rotate<0,0.000000,0> translate<29.047700,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.057500,-1.535000,41.447100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.057500,-1.535000,41.909400>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,90.000000,0> translate<29.057500,-1.535000,41.909400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.057500,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.500400,-1.535000,41.452800>}
box{<0,0,-0.203200><0.442900,0.035000,0.203200> rotate<0,0.000000,0> translate<29.057500,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.057500,-1.535000,41.859200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,-1.535000,41.859200>}
box{<0,0,-0.203200><0.406500,0.035000,0.203200> rotate<0,0.000000,0> translate<29.057500,-1.535000,41.859200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.057500,-1.535000,41.910400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.057500,-1.535000,42.372800>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,90.000000,0> translate<29.057500,-1.535000,42.372800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.057500,-1.535000,42.265600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,-1.535000,42.265600>}
box{<0,0,-0.203200><0.406500,0.035000,0.203200> rotate<0,0.000000,0> translate<29.057500,-1.535000,42.265600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.175900,-1.535000,19.458700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.461600,-1.535000,19.744400>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.175900,-1.535000,19.458700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.175900,-1.535000,21.181200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.461600,-1.535000,20.895500>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<29.175900,-1.535000,21.181200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.175900,-1.535000,21.998700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.461600,-1.535000,22.284400>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.175900,-1.535000,21.998700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.175900,-1.535000,23.721200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.461600,-1.535000,23.435500>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<29.175900,-1.535000,23.721200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.175900,-1.535000,26.261200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.461600,-1.535000,25.975500>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<29.175900,-1.535000,26.261200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.175900,-1.535000,27.078700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.461600,-1.535000,27.364400>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.175900,-1.535000,27.078700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.175900,-1.535000,28.801200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.461600,-1.535000,28.515500>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<29.175900,-1.535000,28.801200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.175900,-1.535000,29.618700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.461600,-1.535000,29.904400>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.175900,-1.535000,29.618700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.175900,-1.535000,31.341200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.461600,-1.535000,31.055500>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<29.175900,-1.535000,31.341200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.175900,-1.535000,32.158700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.461600,-1.535000,32.444400>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.175900,-1.535000,32.158700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.175900,-1.535000,33.881200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.461600,-1.535000,33.595500>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<29.175900,-1.535000,33.881200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.224300,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.275600,-1.535000,21.132800>}
box{<0,0,-0.203200><5.051300,0.035000,0.203200> rotate<0,0.000000,0> translate<29.224300,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.224300,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.131900,-1.535000,31.292800>}
box{<0,0,-0.203200><4.907600,0.035000,0.203200> rotate<0,0.000000,0> translate<29.224300,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.224400,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.275500,-1.535000,19.507200>}
box{<0,0,-0.203200><5.051100,0.035000,0.203200> rotate<0,0.000000,0> translate<29.224400,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.224400,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.131800,-1.535000,29.667200>}
box{<0,0,-0.203200><4.907400,0.035000,0.203200> rotate<0,0.000000,0> translate<29.224400,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.233400,-1.535000,16.832500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.547800,-1.535000,17.146900>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.233400,-1.535000,16.832500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.233400,-1.535000,18.727400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.547800,-1.535000,18.413000>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,44.997030,0> translate<29.233400,-1.535000,18.727400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.266400,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.452500,-1.535000,18.694400>}
box{<0,0,-0.203200><5.186100,0.035000,0.203200> rotate<0,0.000000,0> translate<29.266400,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.325900,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.174000,-1.535000,23.571200>}
box{<0,0,-0.203200><4.848100,0.035000,0.203200> rotate<0,0.000000,0> translate<29.325900,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.325900,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.174000,-1.535000,33.731200>}
box{<0,0,-0.203200><4.848100,0.035000,0.203200> rotate<0,0.000000,0> translate<29.325900,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.326000,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.173900,-1.535000,27.228800>}
box{<0,0,-0.203200><4.847900,0.035000,0.203200> rotate<0,0.000000,0> translate<29.326000,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.427500,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.072400,-1.535000,26.009600>}
box{<0,0,-0.203200><4.644900,0.035000,0.203200> rotate<0,0.000000,0> translate<29.427500,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.452800,-1.535000,24.815700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.461600,-1.535000,24.824400>}
box{<0,0,-0.203200><0.012375,0.035000,0.203200> rotate<0,-44.669651,0> translate<29.452800,-1.535000,24.815700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.452800,-1.535000,24.815700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.333100,-1.535000,24.815700>}
box{<0,0,-0.203200><2.880300,0.035000,0.203200> rotate<0,0.000000,0> translate<29.452800,-1.535000,24.815700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.461600,-1.535000,19.744400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,20.117800>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<29.461600,-1.535000,19.744400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.461600,-1.535000,20.895500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,20.522100>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<29.461600,-1.535000,20.895500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.461600,-1.535000,22.284400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,22.657800>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<29.461600,-1.535000,22.284400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.461600,-1.535000,23.435500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,23.062100>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<29.461600,-1.535000,23.435500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.461600,-1.535000,24.824400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,25.197800>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<29.461600,-1.535000,24.824400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.461600,-1.535000,25.975500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,25.602100>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<29.461600,-1.535000,25.975500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.461600,-1.535000,27.364400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,27.737800>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<29.461600,-1.535000,27.364400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.461600,-1.535000,28.515500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,28.142100>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<29.461600,-1.535000,28.515500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.461600,-1.535000,29.904400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,30.277800>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<29.461600,-1.535000,29.904400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.461600,-1.535000,31.055500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,30.682100>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<29.461600,-1.535000,31.055500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.461600,-1.535000,32.444400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,32.817800>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<29.461600,-1.535000,32.444400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.461600,-1.535000,33.595500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,33.222100>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<29.461600,-1.535000,33.595500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,-1.535000,41.489200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.059200,-1.535000,40.894000>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<29.464000,-1.535000,41.489200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,-1.535000,42.330700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,-1.535000,41.489200>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.464000,-1.535000,41.489200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,-1.535000,42.330700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.059200,-1.535000,42.925900>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.464000,-1.535000,42.330700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,-1.535000,44.029200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.059200,-1.535000,43.434000>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<29.464000,-1.535000,44.029200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,-1.535000,44.870700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,-1.535000,44.029200>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.464000,-1.535000,44.029200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.464000,-1.535000,44.870700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.059200,-1.535000,45.465900>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.464000,-1.535000,44.870700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.469700,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.173900,-1.535000,17.068800>}
box{<0,0,-0.203200><4.704200,0.035000,0.203200> rotate<0,0.000000,0> translate<29.469700,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.470400,-1.535000,51.869100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.624100,-1.535000,51.498100>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,67.492017,0> translate<29.470400,-1.535000,51.869100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.470400,-1.535000,52.270800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.470400,-1.535000,51.869100>}
box{<0,0,-0.203200><0.401700,0.035000,0.203200> rotate<0,-90.000000,0> translate<29.470400,-1.535000,51.869100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.470400,-1.535000,52.270800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.624100,-1.535000,52.641800>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,-67.492017,0> translate<29.470400,-1.535000,52.270800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.489600,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.010200,-1.535000,22.352000>}
box{<0,0,-0.203200><4.520600,0.035000,0.203200> rotate<0,0.000000,0> translate<29.489600,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.489600,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.010400,-1.535000,28.448000>}
box{<0,0,-0.203200><4.520800,0.035000,0.203200> rotate<0,0.000000,0> translate<29.489600,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.489600,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.010200,-1.535000,32.512000>}
box{<0,0,-0.203200><4.520600,0.035000,0.203200> rotate<0,0.000000,0> translate<29.489600,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.531600,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.968200,-1.535000,19.913600>}
box{<0,0,-0.203200><4.436600,0.035000,0.203200> rotate<0,0.000000,0> translate<29.531600,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.531600,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.858200,-1.535000,30.073600>}
box{<0,0,-0.203200><4.326600,0.035000,0.203200> rotate<0,0.000000,0> translate<29.531600,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.531700,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.968300,-1.535000,20.726400>}
box{<0,0,-0.203200><4.436600,0.035000,0.203200> rotate<0,0.000000,0> translate<29.531700,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.531700,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.858300,-1.535000,30.886400>}
box{<0,0,-0.203200><4.326600,0.035000,0.203200> rotate<0,0.000000,0> translate<29.531700,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.547800,-1.535000,17.146900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.717900,-1.535000,17.557600>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-67.497630,0> translate<29.547800,-1.535000,17.146900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.547800,-1.535000,18.413000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.717900,-1.535000,18.002300>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,67.497630,0> translate<29.547800,-1.535000,18.413000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.573700,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.926100,-1.535000,27.635200>}
box{<0,0,-0.203200><4.352400,0.035000,0.203200> rotate<0,0.000000,0> translate<29.573700,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.573800,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.926200,-1.535000,23.164800>}
box{<0,0,-0.203200><4.352400,0.035000,0.203200> rotate<0,0.000000,0> translate<29.573800,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.573800,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.926200,-1.535000,33.324800>}
box{<0,0,-0.203200><4.352400,0.035000,0.203200> rotate<0,0.000000,0> translate<29.573800,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.599600,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.010400,-1.535000,18.288000>}
box{<0,0,-0.203200><4.410800,0.035000,0.203200> rotate<0,0.000000,0> translate<29.599600,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.615800,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.714200,-1.535000,25.196800>}
box{<0,0,-0.203200><3.098400,0.035000,0.203200> rotate<0,0.000000,0> translate<29.615800,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.615900,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.120600,-1.535000,25.603200>}
box{<0,0,-0.203200><3.504700,0.035000,0.203200> rotate<0,0.000000,0> translate<29.615900,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,20.117800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,20.522100>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,90.000000,0> translate<29.616300,-1.535000,20.522100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.883600,-1.535000,20.320000>}
box{<0,0,-0.203200><4.267300,0.035000,0.203200> rotate<0,0.000000,0> translate<29.616300,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,22.657800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,23.062100>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,90.000000,0> translate<29.616300,-1.535000,23.062100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.883600,-1.535000,22.758400>}
box{<0,0,-0.203200><4.267300,0.035000,0.203200> rotate<0,0.000000,0> translate<29.616300,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,25.197800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,25.602100>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,90.000000,0> translate<29.616300,-1.535000,25.602100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,27.737800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,28.142100>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,90.000000,0> translate<29.616300,-1.535000,28.142100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.883600,-1.535000,28.041600>}
box{<0,0,-0.203200><4.267300,0.035000,0.203200> rotate<0,0.000000,0> translate<29.616300,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,30.277800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,30.682100>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,90.000000,0> translate<29.616300,-1.535000,30.682100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.558900,-1.535000,30.480000>}
box{<0,0,-0.203200><5.942600,0.035000,0.203200> rotate<0,0.000000,0> translate<29.616300,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,32.817800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,33.222100>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,90.000000,0> translate<29.616300,-1.535000,33.222100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.616300,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.883600,-1.535000,32.918400>}
box{<0,0,-0.203200><4.267300,0.035000,0.203200> rotate<0,0.000000,0> translate<29.616300,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.624100,-1.535000,51.498100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.908100,-1.535000,51.214100>}
box{<0,0,-0.203200><0.401637,0.035000,0.203200> rotate<0,44.997030,0> translate<29.624100,-1.535000,51.498100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.624100,-1.535000,52.641800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.908100,-1.535000,52.925800>}
box{<0,0,-0.203200><0.401637,0.035000,0.203200> rotate<0,-44.997030,0> translate<29.624100,-1.535000,52.641800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.683700,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.926100,-1.535000,17.475200>}
box{<0,0,-0.203200><4.242400,0.035000,0.203200> rotate<0,0.000000,0> translate<29.683700,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.717900,-1.535000,17.557600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.717900,-1.535000,17.779400>}
box{<0,0,-0.203200><0.221800,0.035000,0.203200> rotate<0,90.000000,0> translate<29.717900,-1.535000,17.779400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.717900,-1.535000,17.780400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.717900,-1.535000,18.002300>}
box{<0,0,-0.203200><0.221900,0.035000,0.203200> rotate<0,90.000000,0> translate<29.717900,-1.535000,18.002300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.717900,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.883600,-1.535000,17.881600>}
box{<0,0,-0.203200><4.165700,0.035000,0.203200> rotate<0,0.000000,0> translate<29.717900,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.908100,-1.535000,51.214100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.279100,-1.535000,51.060400>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,22.502043,0> translate<29.908100,-1.535000,51.214100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.908100,-1.535000,52.925800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.279100,-1.535000,53.079500>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,-22.502043,0> translate<29.908100,-1.535000,52.925800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.059200,-1.535000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.900700,-1.535000,40.894000>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<30.059200,-1.535000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.059200,-1.535000,42.925900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.900700,-1.535000,42.925900>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<30.059200,-1.535000,42.925900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.059200,-1.535000,43.434000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.900700,-1.535000,43.434000>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<30.059200,-1.535000,43.434000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.059200,-1.535000,45.465900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.900700,-1.535000,45.465900>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<30.059200,-1.535000,45.465900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.279100,-1.535000,51.060400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.680800,-1.535000,51.060400>}
box{<0,0,-0.203200><0.401700,0.035000,0.203200> rotate<0,0.000000,0> translate<30.279100,-1.535000,51.060400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.279100,-1.535000,53.079500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.680800,-1.535000,53.079500>}
box{<0,0,-0.203200><0.401700,0.035000,0.203200> rotate<0,0.000000,0> translate<30.279100,-1.535000,53.079500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.556200,-1.535000,4.669800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.931300,-1.535000,3.764300>}
box{<0,0,-0.203200><0.980117,0.035000,0.203200> rotate<0,67.493946,0> translate<30.556200,-1.535000,4.669800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.556200,-1.535000,4.956800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.556200,-1.535000,4.669800>}
box{<0,0,-0.203200><0.287000,0.035000,0.203200> rotate<0,-90.000000,0> translate<30.556200,-1.535000,4.669800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.556200,-1.535000,4.956800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816300,-1.535000,4.956800>}
box{<0,0,-0.203200><2.260100,0.035000,0.203200> rotate<0,0.000000,0> translate<30.556200,-1.535000,4.956800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.556200,-1.535000,5.363000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816300,-1.535000,5.363000>}
box{<0,0,-0.203200><2.260100,0.035000,0.203200> rotate<0,0.000000,0> translate<30.556200,-1.535000,5.363000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.556200,-1.535000,5.650100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.556200,-1.535000,5.363000>}
box{<0,0,-0.203200><0.287100,0.035000,0.203200> rotate<0,-90.000000,0> translate<30.556200,-1.535000,5.363000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.556200,-1.535000,5.650100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.931300,-1.535000,6.555600>}
box{<0,0,-0.203200><0.980117,0.035000,0.203200> rotate<0,-67.493946,0> translate<30.556200,-1.535000,5.650100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.657800,-1.535000,10.690000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.017400,-1.535000,9.821900>}
box{<0,0,-0.203200><0.939633,0.035000,0.203200> rotate<0,67.494351,0> translate<30.657800,-1.535000,10.690000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.657800,-1.535000,11.629900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.657800,-1.535000,10.690000>}
box{<0,0,-0.203200><0.939900,0.035000,0.203200> rotate<0,-90.000000,0> translate<30.657800,-1.535000,10.690000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.657800,-1.535000,11.629900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.017400,-1.535000,12.498000>}
box{<0,0,-0.203200><0.939633,0.035000,0.203200> rotate<0,-67.494351,0> translate<30.657800,-1.535000,11.629900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.680800,-1.535000,51.060400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.051800,-1.535000,51.214100>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,-22.502043,0> translate<30.680800,-1.535000,51.060400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.680800,-1.535000,53.079500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.051800,-1.535000,52.925800>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,22.502043,0> translate<30.680800,-1.535000,53.079500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.900700,-1.535000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.495900,-1.535000,41.489200>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.900700,-1.535000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.900700,-1.535000,42.925900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.495900,-1.535000,42.330700>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<30.900700,-1.535000,42.925900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.900700,-1.535000,43.434000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.495900,-1.535000,44.029200>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.900700,-1.535000,43.434000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.900700,-1.535000,45.465900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.495900,-1.535000,44.870700>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<30.900700,-1.535000,45.465900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.931300,-1.535000,3.764300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.624300,-1.535000,3.071300>}
box{<0,0,-0.203200><0.980050,0.035000,0.203200> rotate<0,44.997030,0> translate<30.931300,-1.535000,3.764300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.931300,-1.535000,6.555600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.624300,-1.535000,7.248600>}
box{<0,0,-0.203200><0.980050,0.035000,0.203200> rotate<0,-44.997030,0> translate<30.931300,-1.535000,6.555600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.951500,-1.535000,43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.168400,-1.535000,43.484800>}
box{<0,0,-0.203200><9.216900,0.035000,0.203200> rotate<0,0.000000,0> translate<30.951500,-1.535000,43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.017400,-1.535000,9.821900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.681900,-1.535000,9.157400>}
box{<0,0,-0.203200><0.939745,0.035000,0.203200> rotate<0,44.997030,0> translate<31.017400,-1.535000,9.821900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.017400,-1.535000,12.498000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.681900,-1.535000,13.162500>}
box{<0,0,-0.203200><0.939745,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.017400,-1.535000,12.498000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.033200,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.006600,-1.535000,51.206400>}
box{<0,0,-0.203200><3.973400,0.035000,0.203200> rotate<0,0.000000,0> translate<31.033200,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.051800,-1.535000,51.214100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.335800,-1.535000,51.498100>}
box{<0,0,-0.203200><0.401637,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.051800,-1.535000,51.214100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.051800,-1.535000,52.925800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.335800,-1.535000,52.641800>}
box{<0,0,-0.203200><0.401637,0.035000,0.203200> rotate<0,44.997030,0> translate<31.051800,-1.535000,52.925800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.053100,-1.535000,41.046400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.383100,-1.535000,41.046400>}
box{<0,0,-0.203200><6.330000,0.035000,0.203200> rotate<0,0.000000,0> translate<31.053100,-1.535000,41.046400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.145600,-1.535000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.894300,-1.535000,52.832000>}
box{<0,0,-0.203200><3.748700,0.035000,0.203200> rotate<0,0.000000,0> translate<31.145600,-1.535000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.154600,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.281600,-1.535000,42.672000>}
box{<0,0,-0.203200><6.127000,0.035000,0.203200> rotate<0,0.000000,0> translate<31.154600,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.256200,-1.535000,45.110400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.863700,-1.535000,45.110400>}
box{<0,0,-0.203200><8.607500,0.035000,0.203200> rotate<0,0.000000,0> translate<31.256200,-1.535000,45.110400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.335800,-1.535000,51.498100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.489500,-1.535000,51.869100>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,-67.492017,0> translate<31.335800,-1.535000,51.498100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.335800,-1.535000,52.641800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.489500,-1.535000,52.270800>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,67.492017,0> translate<31.335800,-1.535000,52.641800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.357900,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.762000,-1.535000,43.891200>}
box{<0,0,-0.203200><8.404100,0.035000,0.203200> rotate<0,0.000000,0> translate<31.357900,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.383300,-1.535000,51.612800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.656500,-1.535000,51.612800>}
box{<0,0,-0.203200><3.273200,0.035000,0.203200> rotate<0,0.000000,0> translate<31.383300,-1.535000,51.612800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.425400,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.614600,-1.535000,52.425600>}
box{<0,0,-0.203200><3.189200,0.035000,0.203200> rotate<0,0.000000,0> translate<31.425400,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.459500,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.982400,-1.535000,41.452800>}
box{<0,0,-0.203200><5.522900,0.035000,0.203200> rotate<0,0.000000,0> translate<31.459500,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.489500,-1.535000,51.869100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.489500,-1.535000,52.270800>}
box{<0,0,-0.203200><0.401700,0.035000,0.203200> rotate<0,90.000000,0> translate<31.489500,-1.535000,52.270800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.489500,-1.535000,52.019200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.550400,-1.535000,52.019200>}
box{<0,0,-0.203200><3.060900,0.035000,0.203200> rotate<0,0.000000,0> translate<31.489500,-1.535000,52.019200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.495900,-1.535000,41.489200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.495900,-1.535000,42.330700>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,90.000000,0> translate<31.495900,-1.535000,42.330700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.495900,-1.535000,41.859200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.982400,-1.535000,41.859200>}
box{<0,0,-0.203200><5.486500,0.035000,0.203200> rotate<0,0.000000,0> translate<31.495900,-1.535000,41.859200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.495900,-1.535000,42.265600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.982400,-1.535000,42.265600>}
box{<0,0,-0.203200><5.486500,0.035000,0.203200> rotate<0,0.000000,0> translate<31.495900,-1.535000,42.265600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.495900,-1.535000,44.029200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.495900,-1.535000,44.870700>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,90.000000,0> translate<31.495900,-1.535000,44.870700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.495900,-1.535000,44.297600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.624000,-1.535000,44.297600>}
box{<0,0,-0.203200><8.128100,0.035000,0.203200> rotate<0,0.000000,0> translate<31.495900,-1.535000,44.297600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.495900,-1.535000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.624000,-1.535000,44.704000>}
box{<0,0,-0.203200><8.128100,0.035000,0.203200> rotate<0,0.000000,0> translate<31.495900,-1.535000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.624300,-1.535000,3.071300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.529800,-1.535000,2.696200>}
box{<0,0,-0.203200><0.980117,0.035000,0.203200> rotate<0,22.500115,0> translate<31.624300,-1.535000,3.071300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.624300,-1.535000,7.248600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.529800,-1.535000,7.623700>}
box{<0,0,-0.203200><0.980117,0.035000,0.203200> rotate<0,-22.500115,0> translate<31.624300,-1.535000,7.248600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.681900,-1.535000,9.157400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.550000,-1.535000,8.797800>}
box{<0,0,-0.203200><0.939633,0.035000,0.203200> rotate<0,22.499710,0> translate<31.681900,-1.535000,9.157400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.681900,-1.535000,13.162500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.081600,-1.535000,13.328000>}
box{<0,0,-0.203200><0.432609,0.035000,0.203200> rotate<0,-22.491032,0> translate<31.681900,-1.535000,13.162500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.902400,-1.535000,13.507100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.081600,-1.535000,13.328000>}
box{<0,0,-0.203200><0.253356,0.035000,0.203200> rotate<0,44.981040,0> translate<31.902400,-1.535000,13.507100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.902400,-1.535000,13.969400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.902400,-1.535000,13.507100>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.902400,-1.535000,13.507100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.902400,-1.535000,13.969400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.018900,-1.535000,13.969400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<31.902400,-1.535000,13.969400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.902400,-1.535000,13.970400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.018900,-1.535000,13.970400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<31.902400,-1.535000,13.970400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.902400,-1.535000,14.432800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.902400,-1.535000,13.970400>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,-90.000000,0> translate<31.902400,-1.535000,13.970400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.902400,-1.535000,14.432800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.557100,-1.535000,15.087500>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.902400,-1.535000,14.432800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.333100,-1.535000,23.952200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.690800,-1.535000,23.952200>}
box{<0,0,-0.203200><0.357700,0.035000,0.203200> rotate<0,0.000000,0> translate<32.333100,-1.535000,23.952200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.333100,-1.535000,24.815700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.096200,-1.535000,25.578800>}
box{<0,0,-0.203200><1.079186,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.333100,-1.535000,24.815700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.529800,-1.535000,2.696200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816800,-1.535000,2.696200>}
box{<0,0,-0.203200><0.287000,0.035000,0.203200> rotate<0,0.000000,0> translate<32.529800,-1.535000,2.696200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.529800,-1.535000,7.623700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816800,-1.535000,7.623700>}
box{<0,0,-0.203200><0.287000,0.035000,0.203200> rotate<0,0.000000,0> translate<32.529800,-1.535000,7.623700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.550000,-1.535000,8.797800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.489900,-1.535000,8.797800>}
box{<0,0,-0.203200><0.939900,0.035000,0.203200> rotate<0,0.000000,0> translate<32.550000,-1.535000,8.797800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.557100,-1.535000,15.087500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.019400,-1.535000,15.087500>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,0.000000,0> translate<32.557100,-1.535000,15.087500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.690800,-1.535000,23.952200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.706800,-1.535000,24.968200>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,-44.997030,0> translate<32.690800,-1.535000,23.952200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.716200,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.451700,-1.535000,23.977600>}
box{<0,0,-0.203200><8.735500,0.035000,0.203200> rotate<0,0.000000,0> translate<32.716200,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816300,-1.535000,5.363000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816300,-1.535000,4.956800>}
box{<0,0,-0.203200><0.406200,0.035000,0.203200> rotate<0,-90.000000,0> translate<32.816300,-1.535000,4.956800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816800,-1.535000,2.696200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816800,-1.535000,4.956300>}
box{<0,0,-0.203200><2.260100,0.035000,0.203200> rotate<0,90.000000,0> translate<32.816800,-1.535000,4.956300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816800,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.223000,-1.535000,2.844800>}
box{<0,0,-0.203200><0.406200,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816800,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816800,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.223000,-1.535000,3.251200>}
box{<0,0,-0.203200><0.406200,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816800,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816800,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.223000,-1.535000,3.657600>}
box{<0,0,-0.203200><0.406200,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816800,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816800,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.223000,-1.535000,4.064000>}
box{<0,0,-0.203200><0.406200,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816800,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816800,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.223000,-1.535000,4.470400>}
box{<0,0,-0.203200><0.406200,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816800,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816800,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.223000,-1.535000,4.876800>}
box{<0,0,-0.203200><0.406200,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816800,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816800,-1.535000,4.956300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.223000,-1.535000,4.956300>}
box{<0,0,-0.203200><0.406200,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816800,-1.535000,4.956300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816800,-1.535000,5.363600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816800,-1.535000,7.623700>}
box{<0,0,-0.203200><2.260100,0.035000,0.203200> rotate<0,90.000000,0> translate<32.816800,-1.535000,7.623700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816800,-1.535000,5.363600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.223000,-1.535000,5.363600>}
box{<0,0,-0.203200><0.406200,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816800,-1.535000,5.363600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816800,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.223000,-1.535000,5.689600>}
box{<0,0,-0.203200><0.406200,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816800,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816800,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.223000,-1.535000,6.096000>}
box{<0,0,-0.203200><0.406200,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816800,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816800,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.223000,-1.535000,6.502400>}
box{<0,0,-0.203200><0.406200,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816800,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816800,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.223000,-1.535000,6.908800>}
box{<0,0,-0.203200><0.406200,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816800,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.816800,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.223000,-1.535000,7.315200>}
box{<0,0,-0.203200><0.406200,0.035000,0.203200> rotate<0,0.000000,0> translate<32.816800,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.018900,-1.535000,13.970400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.018900,-1.535000,13.969400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.018900,-1.535000,13.969400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.019400,-1.535000,13.971000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.019400,-1.535000,15.087500>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<33.019400,-1.535000,15.087500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.019400,-1.535000,13.971000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020400,-1.535000,13.971000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.019400,-1.535000,13.971000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.019400,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020400,-1.535000,14.224000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.019400,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.019400,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020400,-1.535000,14.630400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.019400,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.019400,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020400,-1.535000,15.036800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.019400,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020400,-1.535000,15.087500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020400,-1.535000,13.971000>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.020400,-1.535000,13.971000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.020400,-1.535000,15.087500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.482800,-1.535000,15.087500>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,0.000000,0> translate<33.020400,-1.535000,15.087500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.021000,-1.535000,13.969400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.021000,-1.535000,13.970400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,90.000000,0> translate<33.021000,-1.535000,13.970400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.021000,-1.535000,13.969400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.137500,-1.535000,13.969400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<33.021000,-1.535000,13.969400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.021000,-1.535000,13.970400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.137500,-1.535000,13.970400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<33.021000,-1.535000,13.970400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.096200,-1.535000,25.578800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.349100,-1.535000,25.831700>}
box{<0,0,-0.203200><0.357655,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.096200,-1.535000,25.578800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.122600,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.697400,-1.535000,24.384000>}
box{<0,0,-0.203200><1.574800,0.035000,0.203200> rotate<0,0.000000,0> translate<33.122600,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.223000,-1.535000,2.696200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.510100,-1.535000,2.696200>}
box{<0,0,-0.203200><0.287100,0.035000,0.203200> rotate<0,0.000000,0> translate<33.223000,-1.535000,2.696200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.223000,-1.535000,4.956300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.223000,-1.535000,2.696200>}
box{<0,0,-0.203200><2.260100,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.223000,-1.535000,2.696200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.223000,-1.535000,7.623700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.223000,-1.535000,5.363600>}
box{<0,0,-0.203200><2.260100,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.223000,-1.535000,5.363600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.223000,-1.535000,7.623700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.510100,-1.535000,7.623700>}
box{<0,0,-0.203200><0.287100,0.035000,0.203200> rotate<0,0.000000,0> translate<33.223000,-1.535000,7.623700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.223600,-1.535000,4.956800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.223600,-1.535000,5.363000>}
box{<0,0,-0.203200><0.406200,0.035000,0.203200> rotate<0,90.000000,0> translate<33.223600,-1.535000,5.363000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.223600,-1.535000,4.956800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.483700,-1.535000,4.956800>}
box{<0,0,-0.203200><2.260100,0.035000,0.203200> rotate<0,0.000000,0> translate<33.223600,-1.535000,4.956800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.223600,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.721800,-1.535000,5.283200>}
box{<0,0,-0.203200><27.498200,0.035000,0.203200> rotate<0,0.000000,0> translate<33.223600,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.223600,-1.535000,5.363000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.483700,-1.535000,5.363000>}
box{<0,0,-0.203200><2.260100,0.035000,0.203200> rotate<0,0.000000,0> translate<33.223600,-1.535000,5.363000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.349100,-1.535000,25.831700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.978800,-1.535000,25.831700>}
box{<0,0,-0.203200><0.629700,0.035000,0.203200> rotate<0,0.000000,0> translate<33.349100,-1.535000,25.831700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.482800,-1.535000,15.087500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.137500,-1.535000,14.432800>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,44.997030,0> translate<33.482800,-1.535000,15.087500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.489900,-1.535000,8.797800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.358000,-1.535000,9.157400>}
box{<0,0,-0.203200><0.939633,0.035000,0.203200> rotate<0,-22.499710,0> translate<33.489900,-1.535000,8.797800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.510100,-1.535000,2.696200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.415600,-1.535000,3.071300>}
box{<0,0,-0.203200><0.980117,0.035000,0.203200> rotate<0,-22.500115,0> translate<33.510100,-1.535000,2.696200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.510100,-1.535000,7.623700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.415600,-1.535000,7.248600>}
box{<0,0,-0.203200><0.980117,0.035000,0.203200> rotate<0,22.500115,0> translate<33.510100,-1.535000,7.623700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.529000,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.072300,-1.535000,24.790400>}
box{<0,0,-0.203200><0.543300,0.035000,0.203200> rotate<0,0.000000,0> translate<33.529000,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.533500,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.470500,-1.535000,15.036800>}
box{<0,0,-0.203200><5.937000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.533500,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.706800,-1.535000,24.968200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.978800,-1.535000,24.968200>}
box{<0,0,-0.203200><0.272000,0.035000,0.203200> rotate<0,0.000000,0> translate<33.706800,-1.535000,24.968200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.782000,-1.535000,30.257600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.952100,-1.535000,29.846900>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,67.497630,0> translate<33.782000,-1.535000,30.257600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.782000,-1.535000,30.479400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.782000,-1.535000,30.257600>}
box{<0,0,-0.203200><0.221800,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.782000,-1.535000,30.257600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.782000,-1.535000,30.479400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.558900,-1.535000,30.479400>}
box{<0,0,-0.203200><1.776900,0.035000,0.203200> rotate<0,0.000000,0> translate<33.782000,-1.535000,30.479400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.782000,-1.535000,30.480400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.558900,-1.535000,30.480400>}
box{<0,0,-0.203200><1.776900,0.035000,0.203200> rotate<0,0.000000,0> translate<33.782000,-1.535000,30.480400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.782000,-1.535000,30.702300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.782000,-1.535000,30.480400>}
box{<0,0,-0.203200><0.221900,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.782000,-1.535000,30.480400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.782000,-1.535000,30.702300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.952100,-1.535000,31.113000>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-67.497630,0> translate<33.782000,-1.535000,30.702300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.835100,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.376700,-1.535000,8.940800>}
box{<0,0,-0.203200><1.541600,0.035000,0.203200> rotate<0,0.000000,0> translate<33.835100,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.868800,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.868400,-1.535000,2.844800>}
box{<0,0,-0.203200><18.999600,0.035000,0.203200> rotate<0,0.000000,0> translate<33.868800,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.883600,-1.535000,17.577800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.038300,-1.535000,17.204400>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<33.883600,-1.535000,17.577800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.883600,-1.535000,17.982100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.883600,-1.535000,17.577800>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.883600,-1.535000,17.577800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.883600,-1.535000,17.982100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.038300,-1.535000,18.355500>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<33.883600,-1.535000,17.982100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.883600,-1.535000,20.117800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.038300,-1.535000,19.744400>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<33.883600,-1.535000,20.117800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.883600,-1.535000,20.522100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.883600,-1.535000,20.117800>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.883600,-1.535000,20.117800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.883600,-1.535000,20.522100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.038300,-1.535000,20.895500>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<33.883600,-1.535000,20.522100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.883600,-1.535000,22.657800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.038300,-1.535000,22.284400>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<33.883600,-1.535000,22.657800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.883600,-1.535000,23.062100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.883600,-1.535000,22.657800>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.883600,-1.535000,22.657800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.883600,-1.535000,23.062100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.038300,-1.535000,23.435500>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<33.883600,-1.535000,23.062100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.883600,-1.535000,27.737800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.038300,-1.535000,27.364400>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<33.883600,-1.535000,27.737800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.883600,-1.535000,28.142100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.883600,-1.535000,27.737800>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.883600,-1.535000,27.737800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.883600,-1.535000,28.142100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.038300,-1.535000,28.515500>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<33.883600,-1.535000,28.142100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.883600,-1.535000,32.817800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.038300,-1.535000,32.444400>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<33.883600,-1.535000,32.817800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.883600,-1.535000,33.222100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.883600,-1.535000,32.817800>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,-90.000000,0> translate<33.883600,-1.535000,32.817800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.883600,-1.535000,33.222100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.038300,-1.535000,33.595500>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<33.883600,-1.535000,33.222100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.939900,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.783700,-1.535000,14.630400>}
box{<0,0,-0.203200><0.843800,0.035000,0.203200> rotate<0,0.000000,0> translate<33.939900,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.952100,-1.535000,29.846900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.266500,-1.535000,29.532500>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,44.997030,0> translate<33.952100,-1.535000,29.846900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.952100,-1.535000,31.113000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.266500,-1.535000,31.427400>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,-44.997030,0> translate<33.952100,-1.535000,31.113000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.958300,-1.535000,13.328000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.137500,-1.535000,13.507100>}
box{<0,0,-0.203200><0.253356,0.035000,0.203200> rotate<0,-44.981040,0> translate<33.958300,-1.535000,13.328000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.958300,-1.535000,13.328000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.358000,-1.535000,13.162500>}
box{<0,0,-0.203200><0.432609,0.035000,0.203200> rotate<0,22.491032,0> translate<33.958300,-1.535000,13.328000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.978800,-1.535000,24.968200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.038300,-1.535000,24.824400>}
box{<0,0,-0.203200><0.155624,0.035000,0.203200> rotate<0,67.517283,0> translate<33.978800,-1.535000,24.968200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<33.978800,-1.535000,25.831700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.038300,-1.535000,25.975500>}
box{<0,0,-0.203200><0.155624,0.035000,0.203200> rotate<0,-67.517283,0> translate<33.978800,-1.535000,25.831700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.038300,-1.535000,17.204400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.324000,-1.535000,16.918700>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<34.038300,-1.535000,17.204400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.038300,-1.535000,18.355500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.324000,-1.535000,18.641200>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.038300,-1.535000,18.355500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.038300,-1.535000,19.744400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.324000,-1.535000,19.458700>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<34.038300,-1.535000,19.744400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.038300,-1.535000,20.895500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.324000,-1.535000,21.181200>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.038300,-1.535000,20.895500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.038300,-1.535000,22.284400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.324000,-1.535000,21.998700>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<34.038300,-1.535000,22.284400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.038300,-1.535000,23.435500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.324000,-1.535000,23.721200>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.038300,-1.535000,23.435500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.038300,-1.535000,24.824400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.324000,-1.535000,24.538700>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<34.038300,-1.535000,24.824400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.038300,-1.535000,25.975500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.324000,-1.535000,26.261200>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.038300,-1.535000,25.975500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.038300,-1.535000,27.364400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.324000,-1.535000,27.078700>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<34.038300,-1.535000,27.364400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.038300,-1.535000,28.515500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.324000,-1.535000,28.801200>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.038300,-1.535000,28.515500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.038300,-1.535000,32.444400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.324000,-1.535000,32.158700>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<34.038300,-1.535000,32.444400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.038300,-1.535000,33.595500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.324000,-1.535000,33.881200>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.038300,-1.535000,33.595500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.041500,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.682000,-1.535000,13.411200>}
box{<0,0,-0.203200><0.640500,0.035000,0.203200> rotate<0,0.000000,0> translate<34.041500,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.137500,-1.535000,13.507100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.137500,-1.535000,13.969400>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,90.000000,0> translate<34.137500,-1.535000,13.969400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.137500,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,-1.535000,13.817600>}
box{<0,0,-0.203200><0.406500,0.035000,0.203200> rotate<0,0.000000,0> translate<34.137500,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.137500,-1.535000,13.970400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.137500,-1.535000,14.432800>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,90.000000,0> translate<34.137500,-1.535000,14.432800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.137500,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,-1.535000,14.224000>}
box{<0,0,-0.203200><0.406500,0.035000,0.203200> rotate<0,0.000000,0> translate<34.137500,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.254900,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.403000,-1.535000,7.315200>}
box{<0,0,-0.203200><1.148100,0.035000,0.203200> rotate<0,0.000000,0> translate<34.254900,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.266500,-1.535000,29.532500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.677200,-1.535000,29.362400>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,22.496430,0> translate<34.266500,-1.535000,29.532500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.266500,-1.535000,31.427400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.677200,-1.535000,31.597500>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-22.496430,0> translate<34.266500,-1.535000,31.427400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.324000,-1.535000,16.918700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.697400,-1.535000,16.764000>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<34.324000,-1.535000,16.918700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.324000,-1.535000,18.641200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.697400,-1.535000,18.795900>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<34.324000,-1.535000,18.641200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.324000,-1.535000,19.458700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.697400,-1.535000,19.304000>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<34.324000,-1.535000,19.458700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.324000,-1.535000,21.181200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.697400,-1.535000,21.335900>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<34.324000,-1.535000,21.181200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.324000,-1.535000,21.998700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.697400,-1.535000,21.844000>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<34.324000,-1.535000,21.998700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.324000,-1.535000,23.721200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.697400,-1.535000,23.875900>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<34.324000,-1.535000,23.721200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.324000,-1.535000,24.538700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.697400,-1.535000,24.384000>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<34.324000,-1.535000,24.538700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.324000,-1.535000,26.261200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.697400,-1.535000,26.415900>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<34.324000,-1.535000,26.261200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.324000,-1.535000,27.078700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.697400,-1.535000,26.924000>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<34.324000,-1.535000,27.078700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.324000,-1.535000,28.801200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.697400,-1.535000,28.955900>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<34.324000,-1.535000,28.801200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.324000,-1.535000,32.158700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.697400,-1.535000,32.004000>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<34.324000,-1.535000,32.158700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.324000,-1.535000,33.881200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.697400,-1.535000,34.035900>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<34.324000,-1.535000,33.881200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.358000,-1.535000,9.157400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.022500,-1.535000,9.821900>}
box{<0,0,-0.203200><0.939745,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.358000,-1.535000,9.157400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.358000,-1.535000,13.162500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.022500,-1.535000,12.498000>}
box{<0,0,-0.203200><0.939745,0.035000,0.203200> rotate<0,44.997030,0> translate<34.358000,-1.535000,13.162500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.415600,-1.535000,3.071300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.108600,-1.535000,3.764300>}
box{<0,0,-0.203200><0.980050,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.415600,-1.535000,3.071300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.415600,-1.535000,7.248600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.108600,-1.535000,6.555600>}
box{<0,0,-0.203200><0.980050,0.035000,0.203200> rotate<0,44.997030,0> translate<34.415600,-1.535000,7.248600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.515700,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.088400,-1.535000,13.004800>}
box{<0,0,-0.203200><0.572700,0.035000,0.203200> rotate<0,0.000000,0> translate<34.515700,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,-1.535000,13.549200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.139200,-1.535000,12.954000>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<34.544000,-1.535000,13.549200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,-1.535000,14.390700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,-1.535000,13.549200>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,-90.000000,0> translate<34.544000,-1.535000,13.549200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.544000,-1.535000,14.390700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.139200,-1.535000,14.985900>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.544000,-1.535000,14.390700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.547800,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.545000,-1.535000,9.347200>}
box{<0,0,-0.203200><0.997200,0.035000,0.203200> rotate<0,0.000000,0> translate<34.547800,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.550400,-1.535000,51.869100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.704100,-1.535000,51.498100>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,67.492017,0> translate<34.550400,-1.535000,51.869100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.550400,-1.535000,52.270800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.550400,-1.535000,51.869100>}
box{<0,0,-0.203200><0.401700,0.035000,0.203200> rotate<0,-90.000000,0> translate<34.550400,-1.535000,51.869100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.550400,-1.535000,52.270800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.704100,-1.535000,52.641800>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,-67.492017,0> translate<34.550400,-1.535000,52.270800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.595500,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.462000,-1.535000,3.251200>}
box{<0,0,-0.203200><17.866500,0.035000,0.203200> rotate<0,0.000000,0> translate<34.595500,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.677200,-1.535000,29.362400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,29.362400>}
box{<0,0,-0.203200><0.882200,0.035000,0.203200> rotate<0,0.000000,0> translate<34.677200,-1.535000,29.362400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.677200,-1.535000,31.597500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,31.597500>}
box{<0,0,-0.203200><0.882200,0.035000,0.203200> rotate<0,0.000000,0> translate<34.677200,-1.535000,31.597500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.697400,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.422500,-1.535000,16.764000>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<34.697400,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.697400,-1.535000,18.795900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.422500,-1.535000,18.795900>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<34.697400,-1.535000,18.795900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.697400,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.422500,-1.535000,19.304000>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<34.697400,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.697400,-1.535000,21.335900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.422500,-1.535000,21.335900>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<34.697400,-1.535000,21.335900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.697400,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.422500,-1.535000,21.844000>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<34.697400,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.697400,-1.535000,23.875900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.422500,-1.535000,23.875900>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<34.697400,-1.535000,23.875900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.697400,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.422500,-1.535000,24.384000>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<34.697400,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.697400,-1.535000,26.415900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.422500,-1.535000,26.415900>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<34.697400,-1.535000,26.415900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.697400,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.422500,-1.535000,26.924000>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<34.697400,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.697400,-1.535000,28.955900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.422500,-1.535000,28.955900>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<34.697400,-1.535000,28.955900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.697400,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.422500,-1.535000,32.004000>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<34.697400,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.697400,-1.535000,34.035900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.422500,-1.535000,34.035900>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<34.697400,-1.535000,34.035900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.704100,-1.535000,51.498100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.988100,-1.535000,51.214100>}
box{<0,0,-0.203200><0.401637,0.035000,0.203200> rotate<0,44.997030,0> translate<34.704100,-1.535000,51.498100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.704100,-1.535000,52.641800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.988100,-1.535000,52.925800>}
box{<0,0,-0.203200><0.401637,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.704100,-1.535000,52.641800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.755400,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.571400,-1.535000,6.908800>}
box{<0,0,-0.203200><0.816000,0.035000,0.203200> rotate<0,0.000000,0> translate<34.755400,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.922100,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.908900,-1.535000,12.598400>}
box{<0,0,-0.203200><6.986800,0.035000,0.203200> rotate<0,0.000000,0> translate<34.922100,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.954200,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.829300,-1.535000,9.753600>}
box{<0,0,-0.203200><0.875100,0.035000,0.203200> rotate<0,0.000000,0> translate<34.954200,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.988100,-1.535000,51.214100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.359100,-1.535000,51.060400>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,22.502043,0> translate<34.988100,-1.535000,51.214100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.988100,-1.535000,52.925800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.359100,-1.535000,53.079500>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,-22.502043,0> translate<34.988100,-1.535000,52.925800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.001900,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.324000,-1.535000,3.657600>}
box{<0,0,-0.203200><17.322100,0.035000,0.203200> rotate<0,0.000000,0> translate<35.001900,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.022500,-1.535000,9.821900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.382100,-1.535000,10.690000>}
box{<0,0,-0.203200><0.939633,0.035000,0.203200> rotate<0,-67.494351,0> translate<35.022500,-1.535000,9.821900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.022500,-1.535000,12.498000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.382100,-1.535000,11.629900>}
box{<0,0,-0.203200><0.939633,0.035000,0.203200> rotate<0,67.494351,0> translate<35.022500,-1.535000,12.498000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.108600,-1.535000,3.764300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.483700,-1.535000,4.669800>}
box{<0,0,-0.203200><0.980117,0.035000,0.203200> rotate<0,-67.493946,0> translate<35.108600,-1.535000,3.764300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.108600,-1.535000,6.555600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.483700,-1.535000,5.650100>}
box{<0,0,-0.203200><0.980117,0.035000,0.203200> rotate<0,67.493946,0> translate<35.108600,-1.535000,6.555600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.130700,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.893200,-1.535000,6.502400>}
box{<0,0,-0.203200><0.762500,0.035000,0.203200> rotate<0,0.000000,0> translate<35.130700,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.139200,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.980700,-1.535000,12.954000>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<35.139200,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.139200,-1.535000,14.985900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.980700,-1.535000,14.985900>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<35.139200,-1.535000,14.985900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.149300,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.315300,-1.535000,12.192000>}
box{<0,0,-0.203200><7.166000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.149300,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.162500,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.235700,-1.535000,10.160000>}
box{<0,0,-0.203200><1.073200,0.035000,0.203200> rotate<0,0.000000,0> translate<35.162500,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.232700,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.324000,-1.535000,4.064000>}
box{<0,0,-0.203200><17.091300,0.035000,0.203200> rotate<0,0.000000,0> translate<35.232700,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.256200,-1.535000,7.669800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.631300,-1.535000,6.764300>}
box{<0,0,-0.203200><0.980117,0.035000,0.203200> rotate<0,67.493946,0> translate<35.256200,-1.535000,7.669800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.256200,-1.535000,7.956800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.256200,-1.535000,7.669800>}
box{<0,0,-0.203200><0.287000,0.035000,0.203200> rotate<0,-90.000000,0> translate<35.256200,-1.535000,7.669800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.256200,-1.535000,7.956800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.516300,-1.535000,7.956800>}
box{<0,0,-0.203200><2.260100,0.035000,0.203200> rotate<0,0.000000,0> translate<35.256200,-1.535000,7.956800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.256200,-1.535000,8.363000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.516300,-1.535000,8.363000>}
box{<0,0,-0.203200><2.260100,0.035000,0.203200> rotate<0,0.000000,0> translate<35.256200,-1.535000,8.363000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.256200,-1.535000,8.650100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.256200,-1.535000,8.363000>}
box{<0,0,-0.203200><0.287100,0.035000,0.203200> rotate<0,-90.000000,0> translate<35.256200,-1.535000,8.363000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.256200,-1.535000,8.650100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.631300,-1.535000,9.555600>}
box{<0,0,-0.203200><0.980117,0.035000,0.203200> rotate<0,-67.493946,0> translate<35.256200,-1.535000,8.650100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.299000,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.299600,-1.535000,6.096000>}
box{<0,0,-0.203200><1.000600,0.035000,0.203200> rotate<0,0.000000,0> translate<35.299000,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.317700,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.721700,-1.535000,11.785600>}
box{<0,0,-0.203200><7.404000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.317700,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.330900,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.091500,-1.535000,10.566400>}
box{<0,0,-0.203200><1.760600,0.035000,0.203200> rotate<0,0.000000,0> translate<35.330900,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.359100,-1.535000,51.060400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.760800,-1.535000,51.060400>}
box{<0,0,-0.203200><0.401700,0.035000,0.203200> rotate<0,0.000000,0> translate<35.359100,-1.535000,51.060400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.359100,-1.535000,53.079500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.760800,-1.535000,53.079500>}
box{<0,0,-0.203200><0.401700,0.035000,0.203200> rotate<0,0.000000,0> translate<35.359100,-1.535000,53.079500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.382100,-1.535000,10.690000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.382100,-1.535000,11.629900>}
box{<0,0,-0.203200><0.939900,0.035000,0.203200> rotate<0,90.000000,0> translate<35.382100,-1.535000,11.629900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.382100,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.534500,-1.535000,10.972800>}
box{<0,0,-0.203200><8.152400,0.035000,0.203200> rotate<0,0.000000,0> translate<35.382100,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.382100,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.128100,-1.535000,11.379200>}
box{<0,0,-0.203200><7.746000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.382100,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.401000,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.563700,-1.535000,4.470400>}
box{<0,0,-0.203200><17.162700,0.035000,0.203200> rotate<0,0.000000,0> translate<35.401000,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.467400,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.258900,-1.535000,5.689600>}
box{<0,0,-0.203200><25.791500,0.035000,0.203200> rotate<0,0.000000,0> translate<35.467400,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.483700,-1.535000,4.669800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.483700,-1.535000,4.956800>}
box{<0,0,-0.203200><0.287000,0.035000,0.203200> rotate<0,90.000000,0> translate<35.483700,-1.535000,4.956800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.483700,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.366400,-1.535000,4.876800>}
box{<0,0,-0.203200><19.882700,0.035000,0.203200> rotate<0,0.000000,0> translate<35.483700,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.483700,-1.535000,5.363000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.483700,-1.535000,5.650100>}
box{<0,0,-0.203200><0.287100,0.035000,0.203200> rotate<0,90.000000,0> translate<35.483700,-1.535000,5.650100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.558900,-1.535000,30.480400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.558900,-1.535000,30.479400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<35.558900,-1.535000,30.479400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,29.362400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,30.478900>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<35.559400,-1.535000,30.478900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,29.667200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.559400,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,30.073600>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.559400,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,30.478900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,30.478900>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.559400,-1.535000,30.478900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,30.481000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,31.597500>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<35.559400,-1.535000,31.597500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,30.481000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,30.481000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.559400,-1.535000,30.481000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,30.886400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.559400,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.559400,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,31.292800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.559400,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,29.362400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.442700,-1.535000,29.362400>}
box{<0,0,-0.203200><0.882300,0.035000,0.203200> rotate<0,0.000000,0> translate<35.560400,-1.535000,29.362400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,30.478900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,29.362400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<35.560400,-1.535000,29.362400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,31.597500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,30.481000>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<35.560400,-1.535000,30.481000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560400,-1.535000,31.597500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.442700,-1.535000,31.597500>}
box{<0,0,-0.203200><0.882300,0.035000,0.203200> rotate<0,0.000000,0> translate<35.560400,-1.535000,31.597500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.561000,-1.535000,30.479400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.561000,-1.535000,30.480400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,90.000000,0> translate<35.561000,-1.535000,30.480400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.561000,-1.535000,30.479400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.337900,-1.535000,30.479400>}
box{<0,0,-0.203200><1.776900,0.035000,0.203200> rotate<0,0.000000,0> translate<35.561000,-1.535000,30.479400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.561000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,30.480000>}
box{<0,0,-0.203200><3.377200,0.035000,0.203200> rotate<0,0.000000,0> translate<35.561000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.561000,-1.535000,30.480400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.337900,-1.535000,30.480400>}
box{<0,0,-0.203200><1.776900,0.035000,0.203200> rotate<0,0.000000,0> translate<35.561000,-1.535000,30.480400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.631300,-1.535000,6.764300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.324300,-1.535000,6.071300>}
box{<0,0,-0.203200><0.980050,0.035000,0.203200> rotate<0,44.997030,0> translate<35.631300,-1.535000,6.764300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.631300,-1.535000,9.555600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.324300,-1.535000,10.248600>}
box{<0,0,-0.203200><0.980050,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.631300,-1.535000,9.555600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.760800,-1.535000,51.060400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.131800,-1.535000,51.214100>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,-22.502043,0> translate<35.760800,-1.535000,51.060400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.760800,-1.535000,53.079500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.131800,-1.535000,52.925800>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,22.502043,0> translate<35.760800,-1.535000,53.079500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.980700,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.575900,-1.535000,13.549200>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.980700,-1.535000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.980700,-1.535000,14.985900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.575900,-1.535000,14.390700>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<35.980700,-1.535000,14.985900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.031500,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.502500,-1.535000,13.004800>}
box{<0,0,-0.203200><5.471000,0.035000,0.203200> rotate<0,0.000000,0> translate<36.031500,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.113200,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.086600,-1.535000,51.206400>}
box{<0,0,-0.203200><3.973400,0.035000,0.203200> rotate<0,0.000000,0> translate<36.113200,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.131800,-1.535000,51.214100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.415800,-1.535000,51.498100>}
box{<0,0,-0.203200><0.401637,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.131800,-1.535000,51.214100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.131800,-1.535000,52.925800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.415800,-1.535000,52.641800>}
box{<0,0,-0.203200><0.401637,0.035000,0.203200> rotate<0,44.997030,0> translate<36.131800,-1.535000,52.925800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.225600,-1.535000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.974300,-1.535000,52.832000>}
box{<0,0,-0.203200><3.748700,0.035000,0.203200> rotate<0,0.000000,0> translate<36.225600,-1.535000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.324300,-1.535000,6.071300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.229800,-1.535000,5.696200>}
box{<0,0,-0.203200><0.980117,0.035000,0.203200> rotate<0,22.500115,0> translate<36.324300,-1.535000,6.071300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.324300,-1.535000,10.248600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.229800,-1.535000,10.623700>}
box{<0,0,-0.203200><0.980117,0.035000,0.203200> rotate<0,-22.500115,0> translate<36.324300,-1.535000,10.248600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.336200,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.876900,-1.535000,14.630400>}
box{<0,0,-0.203200><3.540700,0.035000,0.203200> rotate<0,0.000000,0> translate<36.336200,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.415800,-1.535000,51.498100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.569500,-1.535000,51.869100>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,-67.492017,0> translate<36.415800,-1.535000,51.498100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.415800,-1.535000,52.641800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.569500,-1.535000,52.270800>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,67.492017,0> translate<36.415800,-1.535000,52.641800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.422500,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.795900,-1.535000,16.918700>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<36.422500,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.422500,-1.535000,18.795900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.795900,-1.535000,18.641200>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<36.422500,-1.535000,18.795900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.422500,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.795900,-1.535000,19.458700>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<36.422500,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.422500,-1.535000,21.335900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.795900,-1.535000,21.181200>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<36.422500,-1.535000,21.335900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.422500,-1.535000,21.844000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.795900,-1.535000,21.998700>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<36.422500,-1.535000,21.844000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.422500,-1.535000,23.875900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.795900,-1.535000,23.721200>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<36.422500,-1.535000,23.875900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.422500,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.795900,-1.535000,24.538700>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<36.422500,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.422500,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.045300,-1.535000,24.384000>}
box{<0,0,-0.203200><4.622800,0.035000,0.203200> rotate<0,0.000000,0> translate<36.422500,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.422500,-1.535000,26.415900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.795900,-1.535000,26.261200>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<36.422500,-1.535000,26.415900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.422500,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.795900,-1.535000,27.078700>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<36.422500,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.422500,-1.535000,28.955900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.795900,-1.535000,28.801200>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<36.422500,-1.535000,28.955900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.422500,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.795900,-1.535000,32.158700>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<36.422500,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.422500,-1.535000,34.035900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.795900,-1.535000,33.881200>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<36.422500,-1.535000,34.035900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.437900,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.096100,-1.535000,13.411200>}
box{<0,0,-0.203200><4.658200,0.035000,0.203200> rotate<0,0.000000,0> translate<36.437900,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.442700,-1.535000,29.362400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.853400,-1.535000,29.532500>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-22.496430,0> translate<36.442700,-1.535000,29.362400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.442700,-1.535000,31.597500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.853400,-1.535000,31.427400>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,22.496430,0> translate<36.442700,-1.535000,31.597500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.463300,-1.535000,51.612800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.736500,-1.535000,51.612800>}
box{<0,0,-0.203200><3.273200,0.035000,0.203200> rotate<0,0.000000,0> translate<36.463300,-1.535000,51.612800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.505400,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.694600,-1.535000,52.425600>}
box{<0,0,-0.203200><3.189200,0.035000,0.203200> rotate<0,0.000000,0> translate<36.505400,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.569500,-1.535000,51.869100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.569500,-1.535000,52.270800>}
box{<0,0,-0.203200><0.401700,0.035000,0.203200> rotate<0,90.000000,0> translate<36.569500,-1.535000,52.270800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.569500,-1.535000,52.019200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.630400,-1.535000,52.019200>}
box{<0,0,-0.203200><3.060900,0.035000,0.203200> rotate<0,0.000000,0> translate<36.569500,-1.535000,52.019200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.575900,-1.535000,13.549200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.575900,-1.535000,14.390700>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,90.000000,0> translate<36.575900,-1.535000,14.390700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.575900,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.689700,-1.535000,13.817600>}
box{<0,0,-0.203200><4.113800,0.035000,0.203200> rotate<0,0.000000,0> translate<36.575900,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.575900,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.283300,-1.535000,14.224000>}
box{<0,0,-0.203200><3.707400,0.035000,0.203200> rotate<0,0.000000,0> translate<36.575900,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.667500,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.414200,-1.535000,18.694400>}
box{<0,0,-0.203200><0.746700,0.035000,0.203200> rotate<0,0.000000,0> translate<36.667500,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.667500,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,28.854400>}
box{<0,0,-0.203200><2.270700,0.035000,0.203200> rotate<0,0.000000,0> translate<36.667500,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.667700,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.847600,-1.535000,21.945600>}
box{<0,0,-0.203200><2.179900,0.035000,0.203200> rotate<0,0.000000,0> translate<36.667700,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.667700,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.847600,-1.535000,32.105600>}
box{<0,0,-0.203200><2.179900,0.035000,0.203200> rotate<0,0.000000,0> translate<36.667700,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.795900,-1.535000,16.918700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.081600,-1.535000,17.204400>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.795900,-1.535000,16.918700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.795900,-1.535000,18.641200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.081600,-1.535000,18.355500>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<36.795900,-1.535000,18.641200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.795900,-1.535000,19.458700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.081600,-1.535000,19.744400>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.795900,-1.535000,19.458700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.795900,-1.535000,21.181200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.081600,-1.535000,20.895500>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<36.795900,-1.535000,21.181200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.795900,-1.535000,21.998700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.081600,-1.535000,22.284400>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.795900,-1.535000,21.998700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.795900,-1.535000,23.721200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.081600,-1.535000,23.435500>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<36.795900,-1.535000,23.721200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.795900,-1.535000,24.538700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.081600,-1.535000,24.824400>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.795900,-1.535000,24.538700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.795900,-1.535000,26.261200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.081600,-1.535000,25.975500>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<36.795900,-1.535000,26.261200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.795900,-1.535000,27.078700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.081600,-1.535000,27.364400>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.795900,-1.535000,27.078700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.795900,-1.535000,28.801200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.081600,-1.535000,28.515500>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<36.795900,-1.535000,28.801200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.795900,-1.535000,32.158700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.081600,-1.535000,32.444400>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.795900,-1.535000,32.158700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.795900,-1.535000,33.881200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.081600,-1.535000,33.595500>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<36.795900,-1.535000,33.881200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.844300,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.285000,-1.535000,21.132800>}
box{<0,0,-0.203200><0.440700,0.035000,0.203200> rotate<0,0.000000,0> translate<36.844300,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.844400,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.414200,-1.535000,19.507200>}
box{<0,0,-0.203200><0.569800,0.035000,0.203200> rotate<0,0.000000,0> translate<36.844400,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.853400,-1.535000,29.532500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.167800,-1.535000,29.846900>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.853400,-1.535000,29.532500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.853400,-1.535000,31.427400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.167800,-1.535000,31.113000>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,44.997030,0> translate<36.853400,-1.535000,31.427400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.945900,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.644500,-1.535000,23.571200>}
box{<0,0,-0.203200><1.698600,0.035000,0.203200> rotate<0,0.000000,0> translate<36.945900,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.945900,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.644500,-1.535000,33.731200>}
box{<0,0,-0.203200><1.698600,0.035000,0.203200> rotate<0,0.000000,0> translate<36.945900,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.946000,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.438500,-1.535000,17.068800>}
box{<0,0,-0.203200><0.492500,0.035000,0.203200> rotate<0,0.000000,0> translate<36.946000,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.946000,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,27.228800>}
box{<0,0,-0.203200><1.992200,0.035000,0.203200> rotate<0,0.000000,0> translate<36.946000,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.982400,-1.535000,41.447100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.637100,-1.535000,40.792400>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,44.997030,0> translate<36.982400,-1.535000,41.447100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.982400,-1.535000,41.909400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.982400,-1.535000,41.447100>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,-90.000000,0> translate<36.982400,-1.535000,41.447100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.982400,-1.535000,41.909400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.098900,-1.535000,41.909400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<36.982400,-1.535000,41.909400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.982400,-1.535000,41.910400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.098900,-1.535000,41.910400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<36.982400,-1.535000,41.910400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.982400,-1.535000,42.372800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.982400,-1.535000,41.910400>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,-90.000000,0> translate<36.982400,-1.535000,41.910400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.982400,-1.535000,42.372800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.637100,-1.535000,43.027500>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,-44.997030,0> translate<36.982400,-1.535000,42.372800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.988000,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,31.292800>}
box{<0,0,-0.203200><1.950200,0.035000,0.203200> rotate<0,0.000000,0> translate<36.988000,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.988100,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,29.667200>}
box{<0,0,-0.203200><1.950100,0.035000,0.203200> rotate<0,0.000000,0> translate<36.988100,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.047500,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.419700,-1.535000,26.009600>}
box{<0,0,-0.203200><2.372200,0.035000,0.203200> rotate<0,0.000000,0> translate<37.047500,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.047600,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.638900,-1.535000,24.790400>}
box{<0,0,-0.203200><3.591300,0.035000,0.203200> rotate<0,0.000000,0> translate<37.047600,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.081600,-1.535000,17.204400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,17.577800>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<37.081600,-1.535000,17.204400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.081600,-1.535000,18.355500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,17.982100>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<37.081600,-1.535000,18.355500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.081600,-1.535000,19.744400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,20.117800>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<37.081600,-1.535000,19.744400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.081600,-1.535000,20.895500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,20.522100>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<37.081600,-1.535000,20.895500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.081600,-1.535000,22.284400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,22.657800>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<37.081600,-1.535000,22.284400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.081600,-1.535000,23.435500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,23.062100>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<37.081600,-1.535000,23.435500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.081600,-1.535000,24.824400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,25.197800>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<37.081600,-1.535000,24.824400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.081600,-1.535000,25.975500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,25.602100>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<37.081600,-1.535000,25.975500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.081600,-1.535000,27.364400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,27.737800>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<37.081600,-1.535000,27.364400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.081600,-1.535000,28.515500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,28.142100>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<37.081600,-1.535000,28.515500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.081600,-1.535000,32.444400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,32.817800>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<37.081600,-1.535000,32.444400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.081600,-1.535000,33.595500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,33.222100>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<37.081600,-1.535000,33.595500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.109600,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.414200,-1.535000,18.288000>}
box{<0,0,-0.203200><0.304600,0.035000,0.203200> rotate<0,0.000000,0> translate<37.109600,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.109600,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.441200,-1.535000,22.352000>}
box{<0,0,-0.203200><1.331600,0.035000,0.203200> rotate<0,0.000000,0> translate<37.109600,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.109600,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,28.448000>}
box{<0,0,-0.203200><1.828600,0.035000,0.203200> rotate<0,0.000000,0> translate<37.109600,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.109600,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.441200,-1.535000,32.512000>}
box{<0,0,-0.203200><1.331600,0.035000,0.203200> rotate<0,0.000000,0> translate<37.109600,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.151600,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.414200,-1.535000,19.913600>}
box{<0,0,-0.203200><0.262600,0.035000,0.203200> rotate<0,0.000000,0> translate<37.151600,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.151700,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.211000,-1.535000,20.726400>}
box{<0,0,-0.203200><0.059300,0.035000,0.203200> rotate<0,0.000000,0> translate<37.151700,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.167800,-1.535000,29.846900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.337900,-1.535000,30.257600>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-67.497630,0> translate<37.167800,-1.535000,29.846900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.167800,-1.535000,31.113000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.337900,-1.535000,30.702300>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,67.497630,0> translate<37.167800,-1.535000,31.113000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.193700,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.414200,-1.535000,17.475200>}
box{<0,0,-0.203200><0.220500,0.035000,0.203200> rotate<0,0.000000,0> translate<37.193700,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.193700,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,27.635200>}
box{<0,0,-0.203200><1.744500,0.035000,0.203200> rotate<0,0.000000,0> translate<37.193700,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.193800,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,-1.535000,23.164800>}
box{<0,0,-0.203200><1.160200,0.035000,0.203200> rotate<0,0.000000,0> translate<37.193800,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.193800,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,-1.535000,33.324800>}
box{<0,0,-0.203200><1.160200,0.035000,0.203200> rotate<0,0.000000,0> translate<37.193800,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.211000,-1.535000,20.701600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.307700,-1.535000,20.468300>}
box{<0,0,-0.203200><0.252547,0.035000,0.203200> rotate<0,67.482137,0> translate<37.211000,-1.535000,20.701600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.211000,-1.535000,20.954300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.211000,-1.535000,20.701600>}
box{<0,0,-0.203200><0.252700,0.035000,0.203200> rotate<0,-90.000000,0> translate<37.211000,-1.535000,20.701600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.211000,-1.535000,20.954300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.307700,-1.535000,21.187600>}
box{<0,0,-0.203200><0.252547,0.035000,0.203200> rotate<0,-67.482137,0> translate<37.211000,-1.535000,20.954300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.229800,-1.535000,5.696200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.516800,-1.535000,5.696200>}
box{<0,0,-0.203200><0.287000,0.035000,0.203200> rotate<0,0.000000,0> translate<37.229800,-1.535000,5.696200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.229800,-1.535000,10.623700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.516800,-1.535000,10.623700>}
box{<0,0,-0.203200><0.287000,0.035000,0.203200> rotate<0,0.000000,0> translate<37.229800,-1.535000,10.623700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.235800,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.232500,-1.535000,25.196800>}
box{<0,0,-0.203200><2.996700,0.035000,0.203200> rotate<0,0.000000,0> translate<37.235800,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.235900,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.826100,-1.535000,25.603200>}
box{<0,0,-0.203200><2.590200,0.035000,0.203200> rotate<0,0.000000,0> translate<37.235900,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,17.577800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,17.982100>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,90.000000,0> translate<37.236300,-1.535000,17.982100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.414200,-1.535000,17.881600>}
box{<0,0,-0.203200><0.177900,0.035000,0.203200> rotate<0,0.000000,0> translate<37.236300,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,20.117800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,20.522100>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,90.000000,0> translate<37.236300,-1.535000,20.522100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.414200,-1.535000,20.320000>}
box{<0,0,-0.203200><0.177900,0.035000,0.203200> rotate<0,0.000000,0> translate<37.236300,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,22.657800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,23.062100>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,90.000000,0> translate<37.236300,-1.535000,23.062100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,-1.535000,22.758400>}
box{<0,0,-0.203200><1.117700,0.035000,0.203200> rotate<0,0.000000,0> translate<37.236300,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,25.197800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,25.602100>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,90.000000,0> translate<37.236300,-1.535000,25.602100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,27.737800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,28.142100>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,90.000000,0> translate<37.236300,-1.535000,28.142100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,28.041600>}
box{<0,0,-0.203200><1.701900,0.035000,0.203200> rotate<0,0.000000,0> translate<37.236300,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,32.817800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,33.222100>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,90.000000,0> translate<37.236300,-1.535000,33.222100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.236300,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,-1.535000,32.918400>}
box{<0,0,-0.203200><1.117700,0.035000,0.203200> rotate<0,0.000000,0> translate<37.236300,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.261600,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,30.073600>}
box{<0,0,-0.203200><1.676600,0.035000,0.203200> rotate<0,0.000000,0> translate<37.261600,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.261700,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,30.886400>}
box{<0,0,-0.203200><1.676500,0.035000,0.203200> rotate<0,0.000000,0> translate<37.261700,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.307700,-1.535000,20.468300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.414200,-1.535000,20.361800>}
box{<0,0,-0.203200><0.150614,0.035000,0.203200> rotate<0,44.997030,0> translate<37.307700,-1.535000,20.468300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.307700,-1.535000,21.187600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.486300,-1.535000,21.366200>}
box{<0,0,-0.203200><0.252579,0.035000,0.203200> rotate<0,-44.997030,0> translate<37.307700,-1.535000,21.187600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.337900,-1.535000,30.257600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.337900,-1.535000,30.479400>}
box{<0,0,-0.203200><0.221800,0.035000,0.203200> rotate<0,90.000000,0> translate<37.337900,-1.535000,30.479400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.337900,-1.535000,30.480400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.337900,-1.535000,30.702300>}
box{<0,0,-0.203200><0.221900,0.035000,0.203200> rotate<0,90.000000,0> translate<37.337900,-1.535000,30.702300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.414200,-1.535000,17.093100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.667100,-1.535000,16.840200>}
box{<0,0,-0.203200><0.357655,0.035000,0.203200> rotate<0,44.997030,0> translate<37.414200,-1.535000,17.093100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.414200,-1.535000,20.361800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.414200,-1.535000,17.093100>}
box{<0,0,-0.203200><3.268700,0.035000,0.203200> rotate<0,-90.000000,0> translate<37.414200,-1.535000,17.093100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.486300,-1.535000,21.366200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.719600,-1.535000,21.462900>}
box{<0,0,-0.203200><0.252547,0.035000,0.203200> rotate<0,-22.511924,0> translate<37.486300,-1.535000,21.366200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.516300,-1.535000,8.363000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.516300,-1.535000,7.956800>}
box{<0,0,-0.203200><0.406200,0.035000,0.203200> rotate<0,-90.000000,0> translate<37.516300,-1.535000,7.956800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.516800,-1.535000,5.696200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.516800,-1.535000,7.956300>}
box{<0,0,-0.203200><2.260100,0.035000,0.203200> rotate<0,90.000000,0> translate<37.516800,-1.535000,7.956300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.516800,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.923000,-1.535000,6.096000>}
box{<0,0,-0.203200><0.406200,0.035000,0.203200> rotate<0,0.000000,0> translate<37.516800,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.516800,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.923000,-1.535000,6.502400>}
box{<0,0,-0.203200><0.406200,0.035000,0.203200> rotate<0,0.000000,0> translate<37.516800,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.516800,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.923000,-1.535000,6.908800>}
box{<0,0,-0.203200><0.406200,0.035000,0.203200> rotate<0,0.000000,0> translate<37.516800,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.516800,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.923000,-1.535000,7.315200>}
box{<0,0,-0.203200><0.406200,0.035000,0.203200> rotate<0,0.000000,0> translate<37.516800,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.516800,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.923000,-1.535000,7.721600>}
box{<0,0,-0.203200><0.406200,0.035000,0.203200> rotate<0,0.000000,0> translate<37.516800,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.516800,-1.535000,7.956300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.923000,-1.535000,7.956300>}
box{<0,0,-0.203200><0.406200,0.035000,0.203200> rotate<0,0.000000,0> translate<37.516800,-1.535000,7.956300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.516800,-1.535000,8.363600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.516800,-1.535000,10.623700>}
box{<0,0,-0.203200><2.260100,0.035000,0.203200> rotate<0,90.000000,0> translate<37.516800,-1.535000,10.623700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.516800,-1.535000,8.363600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.923000,-1.535000,8.363600>}
box{<0,0,-0.203200><0.406200,0.035000,0.203200> rotate<0,0.000000,0> translate<37.516800,-1.535000,8.363600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.516800,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.923000,-1.535000,8.534400>}
box{<0,0,-0.203200><0.406200,0.035000,0.203200> rotate<0,0.000000,0> translate<37.516800,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.516800,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.923000,-1.535000,8.940800>}
box{<0,0,-0.203200><0.406200,0.035000,0.203200> rotate<0,0.000000,0> translate<37.516800,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.516800,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.923000,-1.535000,9.347200>}
box{<0,0,-0.203200><0.406200,0.035000,0.203200> rotate<0,0.000000,0> translate<37.516800,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.516800,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.923000,-1.535000,9.753600>}
box{<0,0,-0.203200><0.406200,0.035000,0.203200> rotate<0,0.000000,0> translate<37.516800,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.516800,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.923000,-1.535000,10.160000>}
box{<0,0,-0.203200><0.406200,0.035000,0.203200> rotate<0,0.000000,0> translate<37.516800,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.516800,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.923000,-1.535000,10.566400>}
box{<0,0,-0.203200><0.406200,0.035000,0.203200> rotate<0,0.000000,0> translate<37.516800,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.637100,-1.535000,40.792400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.099400,-1.535000,40.792400>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,0.000000,0> translate<37.637100,-1.535000,40.792400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.637100,-1.535000,43.027500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.099400,-1.535000,43.027500>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,0.000000,0> translate<37.637100,-1.535000,43.027500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.667100,-1.535000,16.840200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.779100,-1.535000,9.728200>}
box{<0,0,-0.203200><10.057887,0.035000,0.203200> rotate<0,44.997030,0> translate<37.667100,-1.535000,16.840200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.719600,-1.535000,21.462900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.972300,-1.535000,21.462900>}
box{<0,0,-0.203200><0.252700,0.035000,0.203200> rotate<0,0.000000,0> translate<37.719600,-1.535000,21.462900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.923000,-1.535000,5.696200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.210100,-1.535000,5.696200>}
box{<0,0,-0.203200><0.287100,0.035000,0.203200> rotate<0,0.000000,0> translate<37.923000,-1.535000,5.696200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.923000,-1.535000,7.956300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.923000,-1.535000,5.696200>}
box{<0,0,-0.203200><2.260100,0.035000,0.203200> rotate<0,-90.000000,0> translate<37.923000,-1.535000,5.696200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.923000,-1.535000,10.623600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.923000,-1.535000,8.363600>}
box{<0,0,-0.203200><2.260000,0.035000,0.203200> rotate<0,-90.000000,0> translate<37.923000,-1.535000,8.363600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.923000,-1.535000,10.623600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.210100,-1.535000,10.623700>}
box{<0,0,-0.203200><0.287100,0.035000,0.203200> rotate<0,-0.019955,0> translate<37.923000,-1.535000,10.623600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.923600,-1.535000,7.956800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.923600,-1.535000,8.363000>}
box{<0,0,-0.203200><0.406200,0.035000,0.203200> rotate<0,90.000000,0> translate<37.923600,-1.535000,8.363000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.923600,-1.535000,7.956800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.183700,-1.535000,7.956800>}
box{<0,0,-0.203200><2.260100,0.035000,0.203200> rotate<0,0.000000,0> translate<37.923600,-1.535000,7.956800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.923600,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.981300,-1.535000,8.128000>}
box{<0,0,-0.203200><3.057700,0.035000,0.203200> rotate<0,0.000000,0> translate<37.923600,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.923600,-1.535000,8.363000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.183700,-1.535000,8.363000>}
box{<0,0,-0.203200><2.260100,0.035000,0.203200> rotate<0,0.000000,0> translate<37.923600,-1.535000,8.363000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.972300,-1.535000,21.462900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.205600,-1.535000,21.366200>}
box{<0,0,-0.203200><0.252547,0.035000,0.203200> rotate<0,22.511924,0> translate<37.972300,-1.535000,21.462900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.098900,-1.535000,41.910400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.098900,-1.535000,41.909400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.098900,-1.535000,41.909400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.099400,-1.535000,40.792400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.099400,-1.535000,41.908900>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<38.099400,-1.535000,41.908900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.099400,-1.535000,41.046400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100400,-1.535000,41.046400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<38.099400,-1.535000,41.046400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.099400,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100400,-1.535000,41.452800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<38.099400,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.099400,-1.535000,41.859200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100400,-1.535000,41.859200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<38.099400,-1.535000,41.859200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.099400,-1.535000,41.908900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100400,-1.535000,41.908900>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<38.099400,-1.535000,41.908900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.099400,-1.535000,41.911000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.099400,-1.535000,43.027500>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<38.099400,-1.535000,43.027500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.099400,-1.535000,41.911000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100400,-1.535000,41.911000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<38.099400,-1.535000,41.911000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.099400,-1.535000,42.265600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100400,-1.535000,42.265600>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<38.099400,-1.535000,42.265600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.099400,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100400,-1.535000,42.672000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<38.099400,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100400,-1.535000,40.792400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.562800,-1.535000,40.792400>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,0.000000,0> translate<38.100400,-1.535000,40.792400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100400,-1.535000,41.908900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100400,-1.535000,40.792400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.100400,-1.535000,40.792400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100400,-1.535000,43.027500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100400,-1.535000,41.911000>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.100400,-1.535000,41.911000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.100400,-1.535000,43.027500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.562800,-1.535000,43.027500>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,0.000000,0> translate<38.100400,-1.535000,43.027500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.101000,-1.535000,41.909400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.101000,-1.535000,41.910400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,90.000000,0> translate<38.101000,-1.535000,41.910400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.101000,-1.535000,41.909400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.217500,-1.535000,41.909400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<38.101000,-1.535000,41.909400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.101000,-1.535000,41.910400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.217500,-1.535000,41.910400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<38.101000,-1.535000,41.910400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.205600,-1.535000,21.366200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.384200,-1.535000,21.187600>}
box{<0,0,-0.203200><0.252579,0.035000,0.203200> rotate<0,44.997030,0> translate<38.205600,-1.535000,21.366200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.210100,-1.535000,5.696200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.115600,-1.535000,6.071300>}
box{<0,0,-0.203200><0.980117,0.035000,0.203200> rotate<0,-22.500115,0> translate<38.210100,-1.535000,5.696200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.210100,-1.535000,10.623700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.115600,-1.535000,10.248600>}
box{<0,0,-0.203200><0.980117,0.035000,0.203200> rotate<0,22.500115,0> translate<38.210100,-1.535000,10.623700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.277700,-1.535000,17.450800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.277700,-1.535000,20.361800>}
box{<0,0,-0.203200><2.911000,0.035000,0.203200> rotate<0,90.000000,0> translate<38.277700,-1.535000,20.361800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.277700,-1.535000,17.450800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.136800,-1.535000,10.591700>}
box{<0,0,-0.203200><9.700232,0.035000,0.203200> rotate<0,44.997030,0> translate<38.277700,-1.535000,17.450800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.277700,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.318100,-1.535000,17.475200>}
box{<0,0,-0.203200><1.040400,0.035000,0.203200> rotate<0,0.000000,0> translate<38.277700,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.277700,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,17.881600>}
box{<0,0,-0.203200><0.660500,0.035000,0.203200> rotate<0,0.000000,0> translate<38.277700,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.277700,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,18.288000>}
box{<0,0,-0.203200><0.660500,0.035000,0.203200> rotate<0,0.000000,0> translate<38.277700,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.277700,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,18.694400>}
box{<0,0,-0.203200><0.660500,0.035000,0.203200> rotate<0,0.000000,0> translate<38.277700,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.277700,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,19.100800>}
box{<0,0,-0.203200><0.660500,0.035000,0.203200> rotate<0,0.000000,0> translate<38.277700,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.277700,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,19.507200>}
box{<0,0,-0.203200><0.660500,0.035000,0.203200> rotate<0,0.000000,0> translate<38.277700,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.277700,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,19.913600>}
box{<0,0,-0.203200><0.660500,0.035000,0.203200> rotate<0,0.000000,0> translate<38.277700,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.277700,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,20.320000>}
box{<0,0,-0.203200><0.660500,0.035000,0.203200> rotate<0,0.000000,0> translate<38.277700,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.277700,-1.535000,20.361800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.384200,-1.535000,20.468300>}
box{<0,0,-0.203200><0.150614,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.277700,-1.535000,20.361800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.348500,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.940900,-1.535000,10.566400>}
box{<0,0,-0.203200><5.592400,0.035000,0.203200> rotate<0,0.000000,0> translate<38.348500,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,-1.535000,22.439200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,21.855000>}
box{<0,0,-0.203200><0.826184,0.035000,0.203200> rotate<0,44.997030,0> translate<38.354000,-1.535000,22.439200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,-1.535000,23.280700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,-1.535000,22.439200>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.354000,-1.535000,22.439200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,-1.535000,23.280700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.949200,-1.535000,23.875900>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.354000,-1.535000,23.280700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,-1.535000,32.599200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,32.015000>}
box{<0,0,-0.203200><0.826184,0.035000,0.203200> rotate<0,44.997030,0> translate<38.354000,-1.535000,32.599200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,-1.535000,33.440700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,-1.535000,32.599200>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.354000,-1.535000,32.599200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.354000,-1.535000,33.440700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.949200,-1.535000,34.035900>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.354000,-1.535000,33.440700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.384200,-1.535000,20.468300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.480900,-1.535000,20.701600>}
box{<0,0,-0.203200><0.252547,0.035000,0.203200> rotate<0,-67.482137,0> translate<38.384200,-1.535000,20.468300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.384200,-1.535000,21.187600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.480900,-1.535000,20.954300>}
box{<0,0,-0.203200><0.252547,0.035000,0.203200> rotate<0,67.482137,0> translate<38.384200,-1.535000,21.187600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.407000,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,21.132800>}
box{<0,0,-0.203200><0.531200,0.035000,0.203200> rotate<0,0.000000,0> translate<38.407000,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.480900,-1.535000,20.701600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.480900,-1.535000,20.954300>}
box{<0,0,-0.203200><0.252700,0.035000,0.203200> rotate<0,90.000000,0> translate<38.480900,-1.535000,20.954300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.480900,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,20.726400>}
box{<0,0,-0.203200><0.457300,0.035000,0.203200> rotate<0,0.000000,0> translate<38.480900,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.562800,-1.535000,40.792400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.217500,-1.535000,41.447100>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.562800,-1.535000,40.792400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.562800,-1.535000,43.027500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.217500,-1.535000,42.372800>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,44.997030,0> translate<38.562800,-1.535000,43.027500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.659700,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.724500,-1.535000,17.068800>}
box{<0,0,-0.203200><1.064800,0.035000,0.203200> rotate<0,0.000000,0> translate<38.659700,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.816800,-1.535000,41.046400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.066800,-1.535000,41.046400>}
box{<0,0,-0.203200><1.250000,0.035000,0.203200> rotate<0,0.000000,0> translate<38.816800,-1.535000,41.046400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.918300,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.965300,-1.535000,42.672000>}
box{<0,0,-0.203200><1.047000,0.035000,0.203200> rotate<0,0.000000,0> translate<38.918300,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,17.855100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.191100,-1.535000,17.602200>}
box{<0,0,-0.203200><0.357655,0.035000,0.203200> rotate<0,44.997030,0> translate<38.938200,-1.535000,17.855100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,21.855000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,17.855100>}
box{<0,0,-0.203200><3.999900,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.938200,-1.535000,17.855100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,26.491100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.764200,-1.535000,21.665100>}
box{<0,0,-0.203200><6.824995,0.035000,0.203200> rotate<0,44.997030,0> translate<38.938200,-1.535000,26.491100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,26.848800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,26.491100>}
box{<0,0,-0.203200><0.357700,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.938200,-1.535000,26.491100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,32.015000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.938200,-1.535000,26.848800>}
box{<0,0,-0.203200><5.166200,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.938200,-1.535000,26.848800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.949200,-1.535000,23.875900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.790700,-1.535000,23.875900>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<38.949200,-1.535000,23.875900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.949200,-1.535000,34.035900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.790700,-1.535000,34.035900>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<38.949200,-1.535000,34.035900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.066100,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.130900,-1.535000,16.662400>}
box{<0,0,-0.203200><1.064800,0.035000,0.203200> rotate<0,0.000000,0> translate<39.066100,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.115600,-1.535000,6.071300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.808600,-1.535000,6.764300>}
box{<0,0,-0.203200><0.980050,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.115600,-1.535000,6.071300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.115600,-1.535000,10.248600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.808600,-1.535000,9.555600>}
box{<0,0,-0.203200><0.980050,0.035000,0.203200> rotate<0,44.997030,0> translate<39.115600,-1.535000,10.248600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.140300,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,6.096000>}
box{<0,0,-0.203200><26.112500,0.035000,0.203200> rotate<0,0.000000,0> translate<39.140300,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.191100,-1.535000,17.602200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.525100,-1.535000,12.268200>}
box{<0,0,-0.203200><7.543415,0.035000,0.203200> rotate<0,44.997030,0> translate<39.191100,-1.535000,17.602200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.204200,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.347300,-1.535000,10.160000>}
box{<0,0,-0.203200><5.143100,0.035000,0.203200> rotate<0,0.000000,0> translate<39.204200,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.217500,-1.535000,41.447100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.217500,-1.535000,41.909400>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,90.000000,0> translate<39.217500,-1.535000,41.909400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.217500,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.660400,-1.535000,41.452800>}
box{<0,0,-0.203200><0.442900,0.035000,0.203200> rotate<0,0.000000,0> translate<39.217500,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.217500,-1.535000,41.859200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.624000,-1.535000,41.859200>}
box{<0,0,-0.203200><0.406500,0.035000,0.203200> rotate<0,0.000000,0> translate<39.217500,-1.535000,41.859200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.217500,-1.535000,41.910400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.217500,-1.535000,42.372800>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,90.000000,0> translate<39.217500,-1.535000,42.372800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.217500,-1.535000,42.265600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.624000,-1.535000,42.265600>}
box{<0,0,-0.203200><0.406500,0.035000,0.203200> rotate<0,0.000000,0> translate<39.217500,-1.535000,42.265600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.472500,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.537300,-1.535000,16.256000>}
box{<0,0,-0.203200><1.064800,0.035000,0.203200> rotate<0,0.000000,0> translate<39.472500,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.546700,-1.535000,6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,6.502400>}
box{<0,0,-0.203200><25.706100,0.035000,0.203200> rotate<0,0.000000,0> translate<39.546700,-1.535000,6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.610600,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.753700,-1.535000,9.753600>}
box{<0,0,-0.203200><5.143100,0.035000,0.203200> rotate<0,0.000000,0> translate<39.610600,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.624000,-1.535000,41.489200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.219200,-1.535000,40.894000>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<39.624000,-1.535000,41.489200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.624000,-1.535000,42.330700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.624000,-1.535000,41.489200>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,-90.000000,0> translate<39.624000,-1.535000,41.489200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.624000,-1.535000,42.330700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.219200,-1.535000,42.925900>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.624000,-1.535000,42.330700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.624000,-1.535000,44.029200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.219200,-1.535000,43.434000>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<39.624000,-1.535000,44.029200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.624000,-1.535000,44.870700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.624000,-1.535000,44.029200>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,-90.000000,0> translate<39.624000,-1.535000,44.029200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.624000,-1.535000,44.870700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.219200,-1.535000,45.465900>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.624000,-1.535000,44.870700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.630400,-1.535000,51.869100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.784100,-1.535000,51.498100>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,67.492017,0> translate<39.630400,-1.535000,51.869100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.630400,-1.535000,52.270800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.630400,-1.535000,51.869100>}
box{<0,0,-0.203200><0.401700,0.035000,0.203200> rotate<0,-90.000000,0> translate<39.630400,-1.535000,51.869100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.630400,-1.535000,52.270800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.784100,-1.535000,52.641800>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,-67.492017,0> translate<39.630400,-1.535000,52.270800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.784100,-1.535000,51.498100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.068100,-1.535000,51.214100>}
box{<0,0,-0.203200><0.401637,0.035000,0.203200> rotate<0,44.997030,0> translate<39.784100,-1.535000,51.498100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.784100,-1.535000,52.641800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.068100,-1.535000,52.925800>}
box{<0,0,-0.203200><0.401637,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.784100,-1.535000,52.641800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.790700,-1.535000,23.875900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.385900,-1.535000,23.280700>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<39.790700,-1.535000,23.875900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.790700,-1.535000,34.035900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.385900,-1.535000,33.440700>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<39.790700,-1.535000,34.035900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.801700,-1.535000,18.212800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.801700,-1.535000,21.855000>}
box{<0,0,-0.203200><3.642200,0.035000,0.203200> rotate<0,90.000000,0> translate<39.801700,-1.535000,21.855000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.801700,-1.535000,18.212800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.882800,-1.535000,13.131700>}
box{<0,0,-0.203200><7.185761,0.035000,0.203200> rotate<0,44.997030,0> translate<39.801700,-1.535000,18.212800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.801700,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.981300,-1.535000,18.288000>}
box{<0,0,-0.203200><1.179600,0.035000,0.203200> rotate<0,0.000000,0> translate<39.801700,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.801700,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.387700,-1.535000,18.694400>}
box{<0,0,-0.203200><1.586000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.801700,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.801700,-1.535000,19.100800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,19.100800>}
box{<0,0,-0.203200><25.451100,0.035000,0.203200> rotate<0,0.000000,0> translate<39.801700,-1.535000,19.100800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.801700,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.826000,-1.535000,19.507200>}
box{<0,0,-0.203200><4.024300,0.035000,0.203200> rotate<0,0.000000,0> translate<39.801700,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.801700,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.434000,-1.535000,19.913600>}
box{<0,0,-0.203200><3.632300,0.035000,0.203200> rotate<0,0.000000,0> translate<39.801700,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.801700,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.434000,-1.535000,20.320000>}
box{<0,0,-0.203200><3.632300,0.035000,0.203200> rotate<0,0.000000,0> translate<39.801700,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.801700,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.434000,-1.535000,20.726400>}
box{<0,0,-0.203200><3.632300,0.035000,0.203200> rotate<0,0.000000,0> translate<39.801700,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.801700,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.764200,-1.535000,21.132800>}
box{<0,0,-0.203200><3.962500,0.035000,0.203200> rotate<0,0.000000,0> translate<39.801700,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.801700,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.764200,-1.535000,21.539200>}
box{<0,0,-0.203200><3.962500,0.035000,0.203200> rotate<0,0.000000,0> translate<39.801700,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.801700,-1.535000,21.855000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.385900,-1.535000,22.439200>}
box{<0,0,-0.203200><0.826184,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.801700,-1.535000,21.855000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.801700,-1.535000,26.848800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.801700,-1.535000,32.015000>}
box{<0,0,-0.203200><5.166200,0.035000,0.203200> rotate<0,90.000000,0> translate<39.801700,-1.535000,32.015000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.801700,-1.535000,26.848800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.374800,-1.535000,22.275700>}
box{<0,0,-0.203200><6.467340,0.035000,0.203200> rotate<0,44.997030,0> translate<39.801700,-1.535000,26.848800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.801700,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.884400,-1.535000,27.228800>}
box{<0,0,-0.203200><14.082700,0.035000,0.203200> rotate<0,0.000000,0> translate<39.801700,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.801700,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.594000,-1.535000,27.635200>}
box{<0,0,-0.203200><13.792300,0.035000,0.203200> rotate<0,0.000000,0> translate<39.801700,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.801700,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.594000,-1.535000,28.041600>}
box{<0,0,-0.203200><13.792300,0.035000,0.203200> rotate<0,0.000000,0> translate<39.801700,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.801700,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.681300,-1.535000,28.448000>}
box{<0,0,-0.203200><13.879600,0.035000,0.203200> rotate<0,0.000000,0> translate<39.801700,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.801700,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.087700,-1.535000,28.854400>}
box{<0,0,-0.203200><14.286000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.801700,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.801700,-1.535000,29.260800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,29.260800>}
box{<0,0,-0.203200><25.451100,0.035000,0.203200> rotate<0,0.000000,0> translate<39.801700,-1.535000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.801700,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.446000,-1.535000,29.667200>}
box{<0,0,-0.203200><11.644300,0.035000,0.203200> rotate<0,0.000000,0> translate<39.801700,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.801700,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.054000,-1.535000,30.073600>}
box{<0,0,-0.203200><11.252300,0.035000,0.203200> rotate<0,0.000000,0> translate<39.801700,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.801700,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.054000,-1.535000,30.480000>}
box{<0,0,-0.203200><11.252300,0.035000,0.203200> rotate<0,0.000000,0> translate<39.801700,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.801700,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.054000,-1.535000,30.886400>}
box{<0,0,-0.203200><11.252300,0.035000,0.203200> rotate<0,0.000000,0> translate<39.801700,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.801700,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.446100,-1.535000,31.292800>}
box{<0,0,-0.203200><11.644400,0.035000,0.203200> rotate<0,0.000000,0> translate<39.801700,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.801700,-1.535000,31.699200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,31.699200>}
box{<0,0,-0.203200><25.451100,0.035000,0.203200> rotate<0,0.000000,0> translate<39.801700,-1.535000,31.699200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.801700,-1.535000,32.015000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.385900,-1.535000,32.599200>}
box{<0,0,-0.203200><0.826184,0.035000,0.203200> rotate<0,-44.997030,0> translate<39.801700,-1.535000,32.015000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.808600,-1.535000,6.764300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.183700,-1.535000,7.669800>}
box{<0,0,-0.203200><0.980117,0.035000,0.203200> rotate<0,-67.493946,0> translate<39.808600,-1.535000,6.764300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.808600,-1.535000,9.555600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.183700,-1.535000,8.650100>}
box{<0,0,-0.203200><0.980117,0.035000,0.203200> rotate<0,67.493946,0> translate<39.808600,-1.535000,9.555600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.828100,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,26.822400>}
box{<0,0,-0.203200><25.424700,0.035000,0.203200> rotate<0,0.000000,0> translate<39.828100,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.868400,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.184400,-1.535000,6.908800>}
box{<0,0,-0.203200><1.316000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.868400,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.878900,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.943700,-1.535000,15.849600>}
box{<0,0,-0.203200><1.064800,0.035000,0.203200> rotate<0,0.000000,0> translate<39.878900,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.892300,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.483700,-1.535000,21.945600>}
box{<0,0,-0.203200><3.591400,0.035000,0.203200> rotate<0,0.000000,0> translate<39.892300,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.892300,-1.535000,32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,32.105600>}
box{<0,0,-0.203200><25.360500,0.035000,0.203200> rotate<0,0.000000,0> translate<39.892300,-1.535000,32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.895000,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.705500,-1.535000,9.347200>}
box{<0,0,-0.203200><5.810500,0.035000,0.203200> rotate<0,0.000000,0> translate<39.895000,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.036800,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.894000,-1.535000,7.315200>}
box{<0,0,-0.203200><0.857200,0.035000,0.203200> rotate<0,0.000000,0> translate<40.036800,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.063300,-1.535000,8.940800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,8.940800>}
box{<0,0,-0.203200><25.189500,0.035000,0.203200> rotate<0,0.000000,0> translate<40.063300,-1.535000,8.940800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.068100,-1.535000,51.214100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.439100,-1.535000,51.060400>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,22.502043,0> translate<40.068100,-1.535000,51.214100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.068100,-1.535000,52.925800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.439100,-1.535000,53.079500>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,-22.502043,0> translate<40.068100,-1.535000,52.925800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.095400,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.858100,-1.535000,23.571200>}
box{<0,0,-0.203200><1.762700,0.035000,0.203200> rotate<0,0.000000,0> translate<40.095400,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.095400,-1.535000,33.731200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,33.731200>}
box{<0,0,-0.203200><25.157400,0.035000,0.203200> rotate<0,0.000000,0> translate<40.095400,-1.535000,33.731200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.132900,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.894000,-1.535000,17.881600>}
box{<0,0,-0.203200><0.761100,0.035000,0.203200> rotate<0,0.000000,0> translate<40.132900,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.183700,-1.535000,7.669800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.183700,-1.535000,7.956800>}
box{<0,0,-0.203200><0.287000,0.035000,0.203200> rotate<0,90.000000,0> translate<40.183700,-1.535000,7.956800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.183700,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.894000,-1.535000,7.721600>}
box{<0,0,-0.203200><0.710300,0.035000,0.203200> rotate<0,0.000000,0> translate<40.183700,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.183700,-1.535000,8.363000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.183700,-1.535000,8.650100>}
box{<0,0,-0.203200><0.287100,0.035000,0.203200> rotate<0,90.000000,0> translate<40.183700,-1.535000,8.650100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.183700,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.387700,-1.535000,8.534400>}
box{<0,0,-0.203200><1.204000,0.035000,0.203200> rotate<0,0.000000,0> translate<40.183700,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.219200,-1.535000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.060700,-1.535000,40.894000>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<40.219200,-1.535000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.219200,-1.535000,42.925900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.060700,-1.535000,42.925900>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<40.219200,-1.535000,42.925900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.219200,-1.535000,43.434000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.060700,-1.535000,43.434000>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<40.219200,-1.535000,43.434000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.219200,-1.535000,45.465900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.060700,-1.535000,45.465900>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<40.219200,-1.535000,45.465900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.234500,-1.535000,26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,26.416000>}
box{<0,0,-0.203200><25.018300,0.035000,0.203200> rotate<0,0.000000,0> translate<40.234500,-1.535000,26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.285300,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.350100,-1.535000,15.443200>}
box{<0,0,-0.203200><1.064800,0.035000,0.203200> rotate<0,0.000000,0> translate<40.285300,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.298700,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.077300,-1.535000,22.352000>}
box{<0,0,-0.203200><2.778600,0.035000,0.203200> rotate<0,0.000000,0> translate<40.298700,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.298700,-1.535000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,32.512000>}
box{<0,0,-0.203200><24.954100,0.035000,0.203200> rotate<0,0.000000,0> translate<40.298700,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.385900,-1.535000,22.439200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.385900,-1.535000,23.280700>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,90.000000,0> translate<40.385900,-1.535000,23.280700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.385900,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.670900,-1.535000,22.758400>}
box{<0,0,-0.203200><2.285000,0.035000,0.203200> rotate<0,0.000000,0> translate<40.385900,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.385900,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.264500,-1.535000,23.164800>}
box{<0,0,-0.203200><1.878600,0.035000,0.203200> rotate<0,0.000000,0> translate<40.385900,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.385900,-1.535000,32.599200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.385900,-1.535000,33.440700>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,90.000000,0> translate<40.385900,-1.535000,33.440700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.385900,-1.535000,32.918400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,32.918400>}
box{<0,0,-0.203200><24.866900,0.035000,0.203200> rotate<0,0.000000,0> translate<40.385900,-1.535000,32.918400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.385900,-1.535000,33.324800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,33.324800>}
box{<0,0,-0.203200><24.866900,0.035000,0.203200> rotate<0,0.000000,0> translate<40.385900,-1.535000,33.324800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.439100,-1.535000,51.060400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.840800,-1.535000,51.060400>}
box{<0,0,-0.203200><0.401700,0.035000,0.203200> rotate<0,0.000000,0> translate<40.439100,-1.535000,51.060400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.439100,-1.535000,53.079500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.840800,-1.535000,53.079500>}
box{<0,0,-0.203200><0.401700,0.035000,0.203200> rotate<0,0.000000,0> translate<40.439100,-1.535000,53.079500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.539300,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.894000,-1.535000,17.475200>}
box{<0,0,-0.203200><0.354700,0.035000,0.203200> rotate<0,0.000000,0> translate<40.539300,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.640900,-1.535000,26.009600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,26.009600>}
box{<0,0,-0.203200><24.611900,0.035000,0.203200> rotate<0,0.000000,0> translate<40.640900,-1.535000,26.009600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.691700,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.756500,-1.535000,15.036800>}
box{<0,0,-0.203200><1.064800,0.035000,0.203200> rotate<0,0.000000,0> translate<40.691700,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.840800,-1.535000,51.060400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.211800,-1.535000,51.214100>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,-22.502043,0> translate<40.840800,-1.535000,51.060400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.840800,-1.535000,53.079500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.211800,-1.535000,52.925800>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,22.502043,0> translate<40.840800,-1.535000,53.079500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.894000,-1.535000,7.199200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.489200,-1.535000,6.604000>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<40.894000,-1.535000,7.199200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.894000,-1.535000,8.040700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.894000,-1.535000,7.199200>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,-90.000000,0> translate<40.894000,-1.535000,7.199200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.894000,-1.535000,8.040700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.489200,-1.535000,8.635900>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<40.894000,-1.535000,8.040700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.894000,-1.535000,17.359200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.489200,-1.535000,16.764000>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<40.894000,-1.535000,17.359200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.894000,-1.535000,18.200700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.894000,-1.535000,17.359200>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,-90.000000,0> translate<40.894000,-1.535000,17.359200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.894000,-1.535000,18.200700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.489200,-1.535000,18.795900>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<40.894000,-1.535000,18.200700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.945700,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.184400,-1.535000,17.068800>}
box{<0,0,-0.203200><0.238700,0.035000,0.203200> rotate<0,0.000000,0> translate<40.945700,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.047300,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,25.603200>}
box{<0,0,-0.203200><24.205500,0.035000,0.203200> rotate<0,0.000000,0> translate<41.047300,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.060700,-1.535000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.655900,-1.535000,41.489200>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<41.060700,-1.535000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.060700,-1.535000,42.925900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.655900,-1.535000,42.330700>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<41.060700,-1.535000,42.925900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.060700,-1.535000,43.434000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.655900,-1.535000,44.029200>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<41.060700,-1.535000,43.434000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.060700,-1.535000,45.465900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.655900,-1.535000,44.870700>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<41.060700,-1.535000,45.465900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.098100,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.162900,-1.535000,14.630400>}
box{<0,0,-0.203200><1.064800,0.035000,0.203200> rotate<0,0.000000,0> translate<41.098100,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.111500,-1.535000,43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,43.484800>}
box{<0,0,-0.203200><24.141300,0.035000,0.203200> rotate<0,0.000000,0> translate<41.111500,-1.535000,43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.193200,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.012100,-1.535000,51.206400>}
box{<0,0,-0.203200><3.818900,0.035000,0.203200> rotate<0,0.000000,0> translate<41.193200,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.211800,-1.535000,51.214100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.495800,-1.535000,51.498100>}
box{<0,0,-0.203200><0.401637,0.035000,0.203200> rotate<0,-44.997030,0> translate<41.211800,-1.535000,51.214100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.211800,-1.535000,52.925800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.495800,-1.535000,52.641800>}
box{<0,0,-0.203200><0.401637,0.035000,0.203200> rotate<0,44.997030,0> translate<41.211800,-1.535000,52.925800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.213100,-1.535000,41.046400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,41.046400>}
box{<0,0,-0.203200><24.039700,0.035000,0.203200> rotate<0,0.000000,0> translate<41.213100,-1.535000,41.046400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.305600,-1.535000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.910600,-1.535000,52.832000>}
box{<0,0,-0.203200><3.605000,0.035000,0.203200> rotate<0,0.000000,0> translate<41.305600,-1.535000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.314600,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,42.672000>}
box{<0,0,-0.203200><23.938200,0.035000,0.203200> rotate<0,0.000000,0> translate<41.314600,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.352100,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.240000,-1.535000,16.662400>}
box{<0,0,-0.203200><18.887900,0.035000,0.203200> rotate<0,0.000000,0> translate<41.352100,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.416200,-1.535000,45.110400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,45.110400>}
box{<0,0,-0.203200><23.836600,0.035000,0.203200> rotate<0,0.000000,0> translate<41.416200,-1.535000,45.110400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.453700,-1.535000,25.196800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,25.196800>}
box{<0,0,-0.203200><23.799100,0.035000,0.203200> rotate<0,0.000000,0> translate<41.453700,-1.535000,25.196800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.489200,-1.535000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.330700,-1.535000,6.604000>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<41.489200,-1.535000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.489200,-1.535000,8.635900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.330700,-1.535000,8.635900>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<41.489200,-1.535000,8.635900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.489200,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.330700,-1.535000,16.764000>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<41.489200,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.489200,-1.535000,18.795900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.330700,-1.535000,18.795900>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<41.489200,-1.535000,18.795900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.495800,-1.535000,51.498100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.649500,-1.535000,51.869100>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,-67.492017,0> translate<41.495800,-1.535000,51.498100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.495800,-1.535000,52.641800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.649500,-1.535000,52.270800>}
box{<0,0,-0.203200><0.401578,0.035000,0.203200> rotate<0,67.492017,0> translate<41.495800,-1.535000,52.641800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.504500,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.569300,-1.535000,14.224000>}
box{<0,0,-0.203200><1.064800,0.035000,0.203200> rotate<0,0.000000,0> translate<41.504500,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.517900,-1.535000,43.891200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,43.891200>}
box{<0,0,-0.203200><23.734900,0.035000,0.203200> rotate<0,0.000000,0> translate<41.517900,-1.535000,43.891200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.543300,-1.535000,51.612800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.706600,-1.535000,51.612800>}
box{<0,0,-0.203200><3.163300,0.035000,0.203200> rotate<0,0.000000,0> translate<41.543300,-1.535000,51.612800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.585400,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.664600,-1.535000,52.425600>}
box{<0,0,-0.203200><3.079200,0.035000,0.203200> rotate<0,0.000000,0> translate<41.585400,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.619500,-1.535000,41.452800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,41.452800>}
box{<0,0,-0.203200><23.633300,0.035000,0.203200> rotate<0,0.000000,0> translate<41.619500,-1.535000,41.452800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.649500,-1.535000,51.869100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.649500,-1.535000,52.270800>}
box{<0,0,-0.203200><0.401700,0.035000,0.203200> rotate<0,90.000000,0> translate<41.649500,-1.535000,52.270800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.649500,-1.535000,52.019200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.608800,-1.535000,52.019200>}
box{<0,0,-0.203200><2.959300,0.035000,0.203200> rotate<0,0.000000,0> translate<41.649500,-1.535000,52.019200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.655900,-1.535000,41.489200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.655900,-1.535000,42.330700>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,90.000000,0> translate<41.655900,-1.535000,42.330700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.655900,-1.535000,41.859200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,41.859200>}
box{<0,0,-0.203200><23.596900,0.035000,0.203200> rotate<0,0.000000,0> translate<41.655900,-1.535000,41.859200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.655900,-1.535000,42.265600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,42.265600>}
box{<0,0,-0.203200><23.596900,0.035000,0.203200> rotate<0,0.000000,0> translate<41.655900,-1.535000,42.265600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.655900,-1.535000,44.029200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.655900,-1.535000,44.870700>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,90.000000,0> translate<41.655900,-1.535000,44.870700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.655900,-1.535000,44.297600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,44.297600>}
box{<0,0,-0.203200><23.596900,0.035000,0.203200> rotate<0,0.000000,0> translate<41.655900,-1.535000,44.297600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.655900,-1.535000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,44.704000>}
box{<0,0,-0.203200><23.596900,0.035000,0.203200> rotate<0,0.000000,0> translate<41.655900,-1.535000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.758500,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.862200,-1.535000,16.256000>}
box{<0,0,-0.203200><4.103700,0.035000,0.203200> rotate<0,0.000000,0> translate<41.758500,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.860100,-1.535000,24.790400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,24.790400>}
box{<0,0,-0.203200><23.392700,0.035000,0.203200> rotate<0,0.000000,0> translate<41.860100,-1.535000,24.790400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.910900,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.975700,-1.535000,13.817600>}
box{<0,0,-0.203200><1.064800,0.035000,0.203200> rotate<0,0.000000,0> translate<41.910900,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.164900,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.372500,-1.535000,15.849600>}
box{<0,0,-0.203200><3.207600,0.035000,0.203200> rotate<0,0.000000,0> translate<42.164900,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.266500,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,24.384000>}
box{<0,0,-0.203200><22.986300,0.035000,0.203200> rotate<0,0.000000,0> translate<42.266500,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.317300,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.382100,-1.535000,13.411200>}
box{<0,0,-0.203200><1.064800,0.035000,0.203200> rotate<0,0.000000,0> translate<42.317300,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.330700,-1.535000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.925900,-1.535000,7.199200>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<42.330700,-1.535000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.330700,-1.535000,8.635900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.925900,-1.535000,8.040700>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<42.330700,-1.535000,8.635900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.330700,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.925900,-1.535000,17.359200>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<42.330700,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.330700,-1.535000,18.795900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.925900,-1.535000,18.200700>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<42.330700,-1.535000,18.795900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.432200,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.882500,-1.535000,8.534400>}
box{<0,0,-0.203200><3.450300,0.035000,0.203200> rotate<0,0.000000,0> translate<42.432200,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.432200,-1.535000,18.694400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,18.694400>}
box{<0,0,-0.203200><22.820600,0.035000,0.203200> rotate<0,0.000000,0> translate<42.432200,-1.535000,18.694400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.571300,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.212000,-1.535000,15.443200>}
box{<0,0,-0.203200><2.640700,0.035000,0.203200> rotate<0,0.000000,0> translate<42.571300,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.635500,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.603900,-1.535000,6.908800>}
box{<0,0,-0.203200><2.968400,0.035000,0.203200> rotate<0,0.000000,0> translate<42.635500,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.635500,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,17.068800>}
box{<0,0,-0.203200><22.617300,0.035000,0.203200> rotate<0,0.000000,0> translate<42.635500,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.672900,-1.535000,23.977600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,23.977600>}
box{<0,0,-0.203200><22.579900,0.035000,0.203200> rotate<0,0.000000,0> translate<42.672900,-1.535000,23.977600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.723700,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.788500,-1.535000,13.004800>}
box{<0,0,-0.203200><1.064800,0.035000,0.203200> rotate<0,0.000000,0> translate<42.723700,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.838600,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.440400,-1.535000,8.128000>}
box{<0,0,-0.203200><2.601800,0.035000,0.203200> rotate<0,0.000000,0> translate<42.838600,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.838600,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,18.288000>}
box{<0,0,-0.203200><22.414200,0.035000,0.203200> rotate<0,0.000000,0> translate<42.838600,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.925900,-1.535000,7.199200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.925900,-1.535000,8.040700>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,90.000000,0> translate<42.925900,-1.535000,8.040700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.925900,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.356100,-1.535000,7.315200>}
box{<0,0,-0.203200><2.430200,0.035000,0.203200> rotate<0,0.000000,0> translate<42.925900,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.925900,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.313600,-1.535000,7.721600>}
box{<0,0,-0.203200><2.387700,0.035000,0.203200> rotate<0,0.000000,0> translate<42.925900,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.925900,-1.535000,17.359200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.925900,-1.535000,18.200700>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,90.000000,0> translate<42.925900,-1.535000,18.200700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.925900,-1.535000,17.475200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,17.475200>}
box{<0,0,-0.203200><22.326900,0.035000,0.203200> rotate<0,0.000000,0> translate<42.925900,-1.535000,17.475200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.925900,-1.535000,17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,17.881600>}
box{<0,0,-0.203200><22.326900,0.035000,0.203200> rotate<0,0.000000,0> translate<42.925900,-1.535000,17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.977700,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.212000,-1.535000,15.036800>}
box{<0,0,-0.203200><2.234300,0.035000,0.203200> rotate<0,0.000000,0> translate<42.977700,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.079300,-1.535000,23.571200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,23.571200>}
box{<0,0,-0.203200><22.173500,0.035000,0.203200> rotate<0,0.000000,0> translate<43.079300,-1.535000,23.571200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.130100,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.194900,-1.535000,12.598400>}
box{<0,0,-0.203200><1.064800,0.035000,0.203200> rotate<0,0.000000,0> translate<43.130100,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.384100,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.372300,-1.535000,14.630400>}
box{<0,0,-0.203200><1.988200,0.035000,0.203200> rotate<0,0.000000,0> translate<43.384100,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.434000,-1.535000,19.899200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.029200,-1.535000,19.304000>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<43.434000,-1.535000,19.899200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.434000,-1.535000,20.740700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.434000,-1.535000,19.899200>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.434000,-1.535000,19.899200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.434000,-1.535000,20.740700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.764200,-1.535000,21.070900>}
box{<0,0,-0.203200><0.466973,0.035000,0.203200> rotate<0,-44.997030,0> translate<43.434000,-1.535000,20.740700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.485700,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,23.164800>}
box{<0,0,-0.203200><21.767100,0.035000,0.203200> rotate<0,0.000000,0> translate<43.485700,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.536500,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.440300,-1.535000,12.192000>}
box{<0,0,-0.203200><1.903800,0.035000,0.203200> rotate<0,0.000000,0> translate<43.536500,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.764200,-1.535000,21.665100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.764200,-1.535000,21.070900>}
box{<0,0,-0.203200><0.594200,0.035000,0.203200> rotate<0,-90.000000,0> translate<43.764200,-1.535000,21.070900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.790500,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.861800,-1.535000,14.224000>}
box{<0,0,-0.203200><2.071300,0.035000,0.203200> rotate<0,0.000000,0> translate<43.790500,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.892100,-1.535000,22.758400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,22.758400>}
box{<0,0,-0.203200><21.360700,0.035000,0.203200> rotate<0,0.000000,0> translate<43.892100,-1.535000,22.758400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.942900,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.882100,-1.535000,11.785600>}
box{<0,0,-0.203200><1.939200,0.035000,0.203200> rotate<0,0.000000,0> translate<43.942900,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.029200,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.870700,-1.535000,19.304000>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<44.029200,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.196900,-1.535000,13.817600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,13.817600>}
box{<0,0,-0.203200><21.055900,0.035000,0.203200> rotate<0,0.000000,0> translate<44.196900,-1.535000,13.817600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.298500,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,22.352000>}
box{<0,0,-0.203200><20.954300,0.035000,0.203200> rotate<0,0.000000,0> translate<44.298500,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.349300,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.994700,-1.535000,11.379200>}
box{<0,0,-0.203200><15.645400,0.035000,0.203200> rotate<0,0.000000,0> translate<44.349300,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.374800,-1.535000,22.275700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.627700,-1.535000,22.022800>}
box{<0,0,-0.203200><0.357655,0.035000,0.203200> rotate<0,44.997030,0> translate<44.374800,-1.535000,22.275700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.525100,-1.535000,12.268200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.882800,-1.535000,12.268200>}
box{<0,0,-0.203200><0.357700,0.035000,0.203200> rotate<0,0.000000,0> translate<44.525100,-1.535000,12.268200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.603300,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.604000,-1.535000,13.411200>}
box{<0,0,-0.203200><1.000700,0.035000,0.203200> rotate<0,0.000000,0> translate<44.603300,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.608800,-1.535000,51.848900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.778000,-1.535000,51.440500>}
box{<0,0,-0.203200><0.442062,0.035000,0.203200> rotate<0,67.491333,0> translate<44.608800,-1.535000,51.848900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.608800,-1.535000,52.069400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.608800,-1.535000,51.848900>}
box{<0,0,-0.203200><0.220500,0.035000,0.203200> rotate<0,-90.000000,0> translate<44.608800,-1.535000,51.848900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.608800,-1.535000,52.069400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.718900,-1.535000,52.069400>}
box{<0,0,-0.203200><1.110100,0.035000,0.203200> rotate<0,0.000000,0> translate<44.608800,-1.535000,52.069400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.608800,-1.535000,52.070400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.718900,-1.535000,52.070400>}
box{<0,0,-0.203200><1.110100,0.035000,0.203200> rotate<0,0.000000,0> translate<44.608800,-1.535000,52.070400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.608800,-1.535000,52.291000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.608800,-1.535000,52.070400>}
box{<0,0,-0.203200><0.220600,0.035000,0.203200> rotate<0,-90.000000,0> translate<44.608800,-1.535000,52.070400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.608800,-1.535000,52.291000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.778000,-1.535000,52.699400>}
box{<0,0,-0.203200><0.442062,0.035000,0.203200> rotate<0,-67.491333,0> translate<44.608800,-1.535000,52.291000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.627700,-1.535000,21.335900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.627700,-1.535000,22.022800>}
box{<0,0,-0.203200><0.686900,0.035000,0.203200> rotate<0,90.000000,0> translate<44.627700,-1.535000,22.022800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.627700,-1.535000,21.335900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.870700,-1.535000,21.335900>}
box{<0,0,-0.203200><0.243000,0.035000,0.203200> rotate<0,0.000000,0> translate<44.627700,-1.535000,21.335900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.627700,-1.535000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,21.539200>}
box{<0,0,-0.203200><20.625100,0.035000,0.203200> rotate<0,0.000000,0> translate<44.627700,-1.535000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.627700,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,21.945600>}
box{<0,0,-0.203200><20.625100,0.035000,0.203200> rotate<0,0.000000,0> translate<44.627700,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.755700,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.705600,-1.535000,10.972800>}
box{<0,0,-0.203200><0.949900,0.035000,0.203200> rotate<0,0.000000,0> translate<44.755700,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.778000,-1.535000,51.440500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.090500,-1.535000,51.128000>}
box{<0,0,-0.203200><0.441942,0.035000,0.203200> rotate<0,44.997030,0> translate<44.778000,-1.535000,51.440500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.778000,-1.535000,52.699400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.090500,-1.535000,53.011900>}
box{<0,0,-0.203200><0.441942,0.035000,0.203200> rotate<0,-44.997030,0> translate<44.778000,-1.535000,52.699400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.779100,-1.535000,9.728200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.136800,-1.535000,9.728200>}
box{<0,0,-0.203200><0.357700,0.035000,0.203200> rotate<0,0.000000,0> translate<44.779100,-1.535000,9.728200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.870700,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.465900,-1.535000,19.899200>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<44.870700,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.870700,-1.535000,21.335900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.465900,-1.535000,20.740700>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<44.870700,-1.535000,21.335900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.882800,-1.535000,12.268200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.408800,-1.535000,12.268200>}
box{<0,0,-0.203200><0.526000,0.035000,0.203200> rotate<0,0.000000,0> translate<44.882800,-1.535000,12.268200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<44.882800,-1.535000,13.131700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.408800,-1.535000,13.131700>}
box{<0,0,-0.203200><0.526000,0.035000,0.203200> rotate<0,0.000000,0> translate<44.882800,-1.535000,13.131700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.073800,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.986100,-1.535000,21.132800>}
box{<0,0,-0.203200><8.912300,0.035000,0.203200> rotate<0,0.000000,0> translate<45.073800,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.073900,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.986000,-1.535000,19.507200>}
box{<0,0,-0.203200><8.912100,0.035000,0.203200> rotate<0,0.000000,0> translate<45.073900,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.090500,-1.535000,51.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.498900,-1.535000,50.958800>}
box{<0,0,-0.203200><0.442062,0.035000,0.203200> rotate<0,22.502728,0> translate<45.090500,-1.535000,51.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.090500,-1.535000,53.011900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.498900,-1.535000,53.181100>}
box{<0,0,-0.203200><0.442062,0.035000,0.203200> rotate<0,-22.502728,0> translate<45.090500,-1.535000,53.011900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.136800,-1.535000,9.728200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.408800,-1.535000,9.728200>}
box{<0,0,-0.203200><0.272000,0.035000,0.203200> rotate<0,0.000000,0> translate<45.136800,-1.535000,9.728200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.136800,-1.535000,10.591700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.408800,-1.535000,10.591700>}
box{<0,0,-0.203200><0.272000,0.035000,0.203200> rotate<0,0.000000,0> translate<45.136800,-1.535000,10.591700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.212000,-1.535000,15.017600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.382100,-1.535000,14.606900>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,67.497630,0> translate<45.212000,-1.535000,15.017600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.212000,-1.535000,15.239400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.212000,-1.535000,15.017600>}
box{<0,0,-0.203200><0.221800,0.035000,0.203200> rotate<0,-90.000000,0> translate<45.212000,-1.535000,15.017600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.212000,-1.535000,15.239400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.988900,-1.535000,15.239400>}
box{<0,0,-0.203200><1.776900,0.035000,0.203200> rotate<0,0.000000,0> translate<45.212000,-1.535000,15.239400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.212000,-1.535000,15.240400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.988900,-1.535000,15.240400>}
box{<0,0,-0.203200><1.776900,0.035000,0.203200> rotate<0,0.000000,0> translate<45.212000,-1.535000,15.240400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.212000,-1.535000,15.462300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.212000,-1.535000,15.240400>}
box{<0,0,-0.203200><0.221900,0.035000,0.203200> rotate<0,-90.000000,0> translate<45.212000,-1.535000,15.240400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.212000,-1.535000,15.462300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.382100,-1.535000,15.873000>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-67.497630,0> translate<45.212000,-1.535000,15.462300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.313600,-1.535000,7.417800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.468300,-1.535000,7.044400>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<45.313600,-1.535000,7.417800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.313600,-1.535000,7.822100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.313600,-1.535000,7.417800>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,-90.000000,0> translate<45.313600,-1.535000,7.417800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.313600,-1.535000,7.822100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.468300,-1.535000,8.195500>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<45.313600,-1.535000,7.822100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.382100,-1.535000,14.606900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.696500,-1.535000,14.292500>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,44.997030,0> translate<45.382100,-1.535000,14.606900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.382100,-1.535000,15.873000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.696500,-1.535000,16.187400>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,-44.997030,0> translate<45.382100,-1.535000,15.873000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.408800,-1.535000,9.728200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.468300,-1.535000,9.584400>}
box{<0,0,-0.203200><0.155624,0.035000,0.203200> rotate<0,67.517283,0> translate<45.408800,-1.535000,9.728200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.408800,-1.535000,10.591700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.468300,-1.535000,10.735500>}
box{<0,0,-0.203200><0.155624,0.035000,0.203200> rotate<0,-67.517283,0> translate<45.408800,-1.535000,10.591700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.408800,-1.535000,12.268200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.468300,-1.535000,12.124400>}
box{<0,0,-0.203200><0.155624,0.035000,0.203200> rotate<0,67.517283,0> translate<45.408800,-1.535000,12.268200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.408800,-1.535000,13.131700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.468300,-1.535000,13.275500>}
box{<0,0,-0.203200><0.155624,0.035000,0.203200> rotate<0,-67.517283,0> translate<45.408800,-1.535000,13.131700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.465900,-1.535000,19.899200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.465900,-1.535000,20.740700>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,90.000000,0> translate<45.465900,-1.535000,20.740700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.465900,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.594000,-1.535000,19.913600>}
box{<0,0,-0.203200><8.128100,0.035000,0.203200> rotate<0,0.000000,0> translate<45.465900,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.465900,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.594000,-1.535000,20.320000>}
box{<0,0,-0.203200><8.128100,0.035000,0.203200> rotate<0,0.000000,0> translate<45.465900,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.465900,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.594000,-1.535000,20.726400>}
box{<0,0,-0.203200><8.128100,0.035000,0.203200> rotate<0,0.000000,0> translate<45.465900,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.468300,-1.535000,7.044400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.754000,-1.535000,6.758700>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<45.468300,-1.535000,7.044400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.468300,-1.535000,8.195500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.754000,-1.535000,8.481200>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<45.468300,-1.535000,8.195500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.468300,-1.535000,9.584400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.754000,-1.535000,9.298700>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<45.468300,-1.535000,9.584400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.468300,-1.535000,10.735500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.754000,-1.535000,11.021200>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<45.468300,-1.535000,10.735500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.468300,-1.535000,12.124400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.754000,-1.535000,11.838700>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<45.468300,-1.535000,12.124400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.468300,-1.535000,13.275500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.754000,-1.535000,13.561200>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<45.468300,-1.535000,13.275500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.498900,-1.535000,50.958800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.719400,-1.535000,50.958800>}
box{<0,0,-0.203200><0.220500,0.035000,0.203200> rotate<0,0.000000,0> translate<45.498900,-1.535000,50.958800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.498900,-1.535000,53.181100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.719400,-1.535000,53.181100>}
box{<0,0,-0.203200><0.220500,0.035000,0.203200> rotate<0,0.000000,0> translate<45.498900,-1.535000,53.181100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.696500,-1.535000,14.292500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.107200,-1.535000,14.122400>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,22.496430,0> translate<45.696500,-1.535000,14.292500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.696500,-1.535000,16.187400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.107200,-1.535000,16.357500>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-22.496430,0> translate<45.696500,-1.535000,16.187400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.718900,-1.535000,52.070400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.718900,-1.535000,52.069400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<45.718900,-1.535000,52.069400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.719400,-1.535000,50.958800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.719400,-1.535000,52.068900>}
box{<0,0,-0.203200><1.110100,0.035000,0.203200> rotate<0,90.000000,0> translate<45.719400,-1.535000,52.068900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.719400,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.720400,-1.535000,51.206400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<45.719400,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.719400,-1.535000,51.612800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.720400,-1.535000,51.612800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<45.719400,-1.535000,51.612800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.719400,-1.535000,52.019200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.720400,-1.535000,52.019200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<45.719400,-1.535000,52.019200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.719400,-1.535000,52.068900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.720400,-1.535000,52.068900>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<45.719400,-1.535000,52.068900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.719400,-1.535000,52.071000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.719400,-1.535000,53.181100>}
box{<0,0,-0.203200><1.110100,0.035000,0.203200> rotate<0,90.000000,0> translate<45.719400,-1.535000,53.181100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.719400,-1.535000,52.071000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.720400,-1.535000,52.071000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<45.719400,-1.535000,52.071000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.719400,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.720400,-1.535000,52.425600>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<45.719400,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.719400,-1.535000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.720400,-1.535000,52.832000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<45.719400,-1.535000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.720400,-1.535000,50.958800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.941000,-1.535000,50.958800>}
box{<0,0,-0.203200><0.220600,0.035000,0.203200> rotate<0,0.000000,0> translate<45.720400,-1.535000,50.958800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.720400,-1.535000,52.068900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.720400,-1.535000,50.958800>}
box{<0,0,-0.203200><1.110100,0.035000,0.203200> rotate<0,-90.000000,0> translate<45.720400,-1.535000,50.958800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.720400,-1.535000,53.181100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.720400,-1.535000,52.071000>}
box{<0,0,-0.203200><1.110100,0.035000,0.203200> rotate<0,-90.000000,0> translate<45.720400,-1.535000,52.071000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.720400,-1.535000,53.181100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.941000,-1.535000,53.181100>}
box{<0,0,-0.203200><0.220600,0.035000,0.203200> rotate<0,0.000000,0> translate<45.720400,-1.535000,53.181100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.721000,-1.535000,52.069400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.721000,-1.535000,52.070400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,90.000000,0> translate<45.721000,-1.535000,52.070400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.721000,-1.535000,52.069400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.831100,-1.535000,52.069400>}
box{<0,0,-0.203200><1.110100,0.035000,0.203200> rotate<0,0.000000,0> translate<45.721000,-1.535000,52.069400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.721000,-1.535000,52.070400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.831100,-1.535000,52.070400>}
box{<0,0,-0.203200><1.110100,0.035000,0.203200> rotate<0,0.000000,0> translate<45.721000,-1.535000,52.070400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.754000,-1.535000,6.758700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.127400,-1.535000,6.604000>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<45.754000,-1.535000,6.758700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.754000,-1.535000,8.481200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.127400,-1.535000,8.635900>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<45.754000,-1.535000,8.481200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.754000,-1.535000,9.298700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.127400,-1.535000,9.144000>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<45.754000,-1.535000,9.298700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.754000,-1.535000,11.021200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.127400,-1.535000,11.175900>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<45.754000,-1.535000,11.021200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.754000,-1.535000,11.838700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.127400,-1.535000,11.684000>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<45.754000,-1.535000,11.838700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.754000,-1.535000,13.561200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.127400,-1.535000,13.715900>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<45.754000,-1.535000,13.561200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.941000,-1.535000,50.958800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.349400,-1.535000,51.128000>}
box{<0,0,-0.203200><0.442062,0.035000,0.203200> rotate<0,-22.502728,0> translate<45.941000,-1.535000,50.958800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.941000,-1.535000,53.181100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.349400,-1.535000,53.011900>}
box{<0,0,-0.203200><0.442062,0.035000,0.203200> rotate<0,22.502728,0> translate<45.941000,-1.535000,53.181100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.107200,-1.535000,14.122400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.989400,-1.535000,14.122400>}
box{<0,0,-0.203200><0.882200,0.035000,0.203200> rotate<0,0.000000,0> translate<46.107200,-1.535000,14.122400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.107200,-1.535000,16.357500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.989400,-1.535000,16.357500>}
box{<0,0,-0.203200><0.882200,0.035000,0.203200> rotate<0,0.000000,0> translate<46.107200,-1.535000,16.357500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.127400,-1.535000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.852500,-1.535000,6.604000>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<46.127400,-1.535000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.127400,-1.535000,8.635900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.852500,-1.535000,8.635900>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<46.127400,-1.535000,8.635900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.127400,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.852500,-1.535000,9.144000>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<46.127400,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.127400,-1.535000,11.175900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.852500,-1.535000,11.175900>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<46.127400,-1.535000,11.175900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.127400,-1.535000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.852500,-1.535000,11.684000>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<46.127400,-1.535000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.127400,-1.535000,13.715900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.852500,-1.535000,13.715900>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<46.127400,-1.535000,13.715900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.349400,-1.535000,51.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.661900,-1.535000,51.440500>}
box{<0,0,-0.203200><0.441942,0.035000,0.203200> rotate<0,-44.997030,0> translate<46.349400,-1.535000,51.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.349400,-1.535000,53.011900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.661900,-1.535000,52.699400>}
box{<0,0,-0.203200><0.441942,0.035000,0.203200> rotate<0,44.997030,0> translate<46.349400,-1.535000,53.011900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.427800,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.852600,-1.535000,51.206400>}
box{<0,0,-0.203200><3.424800,0.035000,0.203200> rotate<0,0.000000,0> translate<46.427800,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.529300,-1.535000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.790400,-1.535000,52.832000>}
box{<0,0,-0.203200><3.261100,0.035000,0.203200> rotate<0,0.000000,0> translate<46.529300,-1.535000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.661900,-1.535000,51.440500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.831100,-1.535000,51.848900>}
box{<0,0,-0.203200><0.442062,0.035000,0.203200> rotate<0,-67.491333,0> translate<46.661900,-1.535000,51.440500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.661900,-1.535000,52.699400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.831100,-1.535000,52.291000>}
box{<0,0,-0.203200><0.442062,0.035000,0.203200> rotate<0,67.491333,0> translate<46.661900,-1.535000,52.699400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.733200,-1.535000,51.612800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.790400,-1.535000,51.612800>}
box{<0,0,-0.203200><3.057200,0.035000,0.203200> rotate<0,0.000000,0> translate<46.733200,-1.535000,51.612800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.775400,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.790400,-1.535000,52.425600>}
box{<0,0,-0.203200><3.015000,0.035000,0.203200> rotate<0,0.000000,0> translate<46.775400,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.831100,-1.535000,51.848900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.831100,-1.535000,52.069400>}
box{<0,0,-0.203200><0.220500,0.035000,0.203200> rotate<0,90.000000,0> translate<46.831100,-1.535000,52.069400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.831100,-1.535000,52.019200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.790400,-1.535000,52.019200>}
box{<0,0,-0.203200><2.959300,0.035000,0.203200> rotate<0,0.000000,0> translate<46.831100,-1.535000,52.019200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.831100,-1.535000,52.070400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.831100,-1.535000,52.291000>}
box{<0,0,-0.203200><0.220600,0.035000,0.203200> rotate<0,90.000000,0> translate<46.831100,-1.535000,52.291000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.988900,-1.535000,15.240400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.988900,-1.535000,15.239400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<46.988900,-1.535000,15.239400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.989400,-1.535000,14.122400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.989400,-1.535000,15.238900>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<46.989400,-1.535000,15.238900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.989400,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.990400,-1.535000,14.224000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<46.989400,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.989400,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.990400,-1.535000,14.630400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<46.989400,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.989400,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.990400,-1.535000,15.036800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<46.989400,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.989400,-1.535000,15.238900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.990400,-1.535000,15.238900>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<46.989400,-1.535000,15.238900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.989400,-1.535000,15.241000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.989400,-1.535000,16.357500>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<46.989400,-1.535000,16.357500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.989400,-1.535000,15.241000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.990400,-1.535000,15.241000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<46.989400,-1.535000,15.241000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.989400,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.990400,-1.535000,15.443200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<46.989400,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.989400,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.990400,-1.535000,15.849600>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<46.989400,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.989400,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.990400,-1.535000,16.256000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<46.989400,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.990400,-1.535000,14.122400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.872700,-1.535000,14.122400>}
box{<0,0,-0.203200><0.882300,0.035000,0.203200> rotate<0,0.000000,0> translate<46.990400,-1.535000,14.122400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.990400,-1.535000,15.238900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.990400,-1.535000,14.122400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<46.990400,-1.535000,14.122400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.990400,-1.535000,16.357500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.990400,-1.535000,15.241000>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<46.990400,-1.535000,15.241000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.990400,-1.535000,16.357500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.872700,-1.535000,16.357500>}
box{<0,0,-0.203200><0.882300,0.035000,0.203200> rotate<0,0.000000,0> translate<46.990400,-1.535000,16.357500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.991000,-1.535000,15.239400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.991000,-1.535000,15.240400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,90.000000,0> translate<46.991000,-1.535000,15.240400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.991000,-1.535000,15.239400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.767900,-1.535000,15.239400>}
box{<0,0,-0.203200><1.776900,0.035000,0.203200> rotate<0,0.000000,0> translate<46.991000,-1.535000,15.239400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.991000,-1.535000,15.240400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.767900,-1.535000,15.240400>}
box{<0,0,-0.203200><1.776900,0.035000,0.203200> rotate<0,0.000000,0> translate<46.991000,-1.535000,15.240400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.852500,-1.535000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.225900,-1.535000,6.758700>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<47.852500,-1.535000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.852500,-1.535000,8.635900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.225900,-1.535000,8.481200>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<47.852500,-1.535000,8.635900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.852500,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.225900,-1.535000,9.298700>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<47.852500,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.852500,-1.535000,11.175900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.225900,-1.535000,11.021200>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<47.852500,-1.535000,11.175900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.852500,-1.535000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.225900,-1.535000,11.838700>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<47.852500,-1.535000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.852500,-1.535000,13.715900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.225900,-1.535000,13.561200>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<47.852500,-1.535000,13.715900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.872700,-1.535000,14.122400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.283400,-1.535000,14.292500>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-22.496430,0> translate<47.872700,-1.535000,14.122400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.872700,-1.535000,16.357500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.283400,-1.535000,16.187400>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,22.496430,0> translate<47.872700,-1.535000,16.357500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.097500,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.502500,-1.535000,8.534400>}
box{<0,0,-0.203200><5.405000,0.035000,0.203200> rotate<0,0.000000,0> translate<48.097500,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.097700,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.502100,-1.535000,11.785600>}
box{<0,0,-0.203200><5.404400,0.035000,0.203200> rotate<0,0.000000,0> translate<48.097700,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.117800,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.919500,-1.535000,16.256000>}
box{<0,0,-0.203200><11.801700,0.035000,0.203200> rotate<0,0.000000,0> translate<48.117800,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.118000,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.747400,-1.535000,14.224000>}
box{<0,0,-0.203200><5.629400,0.035000,0.203200> rotate<0,0.000000,0> translate<48.118000,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.225900,-1.535000,6.758700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.511600,-1.535000,7.044400>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<48.225900,-1.535000,6.758700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.225900,-1.535000,8.481200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.511600,-1.535000,8.195500>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<48.225900,-1.535000,8.481200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.225900,-1.535000,9.298700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.511600,-1.535000,9.584400>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<48.225900,-1.535000,9.298700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.225900,-1.535000,11.021200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.511600,-1.535000,10.735500>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<48.225900,-1.535000,11.021200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.225900,-1.535000,11.838700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.511600,-1.535000,12.124400>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<48.225900,-1.535000,11.838700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.225900,-1.535000,13.561200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.511600,-1.535000,13.275500>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<48.225900,-1.535000,13.561200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.274300,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.325600,-1.535000,10.972800>}
box{<0,0,-0.203200><5.051300,0.035000,0.203200> rotate<0,0.000000,0> translate<48.274300,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.274400,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.325500,-1.535000,9.347200>}
box{<0,0,-0.203200><5.051100,0.035000,0.203200> rotate<0,0.000000,0> translate<48.274400,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.283400,-1.535000,14.292500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.597800,-1.535000,14.606900>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,-44.997030,0> translate<48.283400,-1.535000,14.292500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.283400,-1.535000,16.187400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.597800,-1.535000,15.873000>}
box{<0,0,-0.203200><0.444629,0.035000,0.203200> rotate<0,44.997030,0> translate<48.283400,-1.535000,16.187400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.375900,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.224000,-1.535000,13.411200>}
box{<0,0,-0.203200><4.848100,0.035000,0.203200> rotate<0,0.000000,0> translate<48.375900,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.376000,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.223900,-1.535000,6.908800>}
box{<0,0,-0.203200><4.847900,0.035000,0.203200> rotate<0,0.000000,0> translate<48.376000,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.511600,-1.535000,7.044400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.666300,-1.535000,7.417800>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<48.511600,-1.535000,7.044400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.511600,-1.535000,8.195500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.666300,-1.535000,7.822100>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<48.511600,-1.535000,8.195500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.511600,-1.535000,9.584400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.666300,-1.535000,9.957800>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<48.511600,-1.535000,9.584400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.511600,-1.535000,10.735500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.666300,-1.535000,10.362100>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<48.511600,-1.535000,10.735500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.511600,-1.535000,12.124400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.666300,-1.535000,12.497800>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<48.511600,-1.535000,12.124400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.511600,-1.535000,13.275500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.666300,-1.535000,12.902100>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<48.511600,-1.535000,13.275500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.539600,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.060400,-1.535000,8.128000>}
box{<0,0,-0.203200><4.520800,0.035000,0.203200> rotate<0,0.000000,0> translate<48.539600,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.539600,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.060200,-1.535000,12.192000>}
box{<0,0,-0.203200><4.520600,0.035000,0.203200> rotate<0,0.000000,0> translate<48.539600,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.581600,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.018200,-1.535000,9.753600>}
box{<0,0,-0.203200><4.436600,0.035000,0.203200> rotate<0,0.000000,0> translate<48.581600,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.581700,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.018300,-1.535000,10.566400>}
box{<0,0,-0.203200><4.436600,0.035000,0.203200> rotate<0,0.000000,0> translate<48.581700,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.597800,-1.535000,14.606900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.767900,-1.535000,15.017600>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,-67.497630,0> translate<48.597800,-1.535000,14.606900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.597800,-1.535000,15.873000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.767900,-1.535000,15.462300>}
box{<0,0,-0.203200><0.444532,0.035000,0.203200> rotate<0,67.497630,0> translate<48.597800,-1.535000,15.873000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.607500,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.122300,-1.535000,14.630400>}
box{<0,0,-0.203200><4.514800,0.035000,0.203200> rotate<0,0.000000,0> translate<48.607500,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.607500,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.122400,-1.535000,15.849600>}
box{<0,0,-0.203200><4.514900,0.035000,0.203200> rotate<0,0.000000,0> translate<48.607500,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.623700,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.976100,-1.535000,7.315200>}
box{<0,0,-0.203200><4.352400,0.035000,0.203200> rotate<0,0.000000,0> translate<48.623700,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.623800,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.976200,-1.535000,13.004800>}
box{<0,0,-0.203200><4.352400,0.035000,0.203200> rotate<0,0.000000,0> translate<48.623800,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.666300,-1.535000,7.417800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.666300,-1.535000,7.822100>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,90.000000,0> translate<48.666300,-1.535000,7.822100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.666300,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.933600,-1.535000,7.721600>}
box{<0,0,-0.203200><4.267300,0.035000,0.203200> rotate<0,0.000000,0> translate<48.666300,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.666300,-1.535000,9.957800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.666300,-1.535000,10.362100>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,90.000000,0> translate<48.666300,-1.535000,10.362100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.666300,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.933600,-1.535000,10.160000>}
box{<0,0,-0.203200><4.267300,0.035000,0.203200> rotate<0,0.000000,0> translate<48.666300,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.666300,-1.535000,12.497800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.666300,-1.535000,12.902100>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,90.000000,0> translate<48.666300,-1.535000,12.902100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.666300,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.933600,-1.535000,12.598400>}
box{<0,0,-0.203200><4.267300,0.035000,0.203200> rotate<0,0.000000,0> translate<48.666300,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.767900,-1.535000,15.017600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.767900,-1.535000,15.239400>}
box{<0,0,-0.203200><0.221800,0.035000,0.203200> rotate<0,90.000000,0> translate<48.767900,-1.535000,15.239400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.767900,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.934000,-1.535000,15.036800>}
box{<0,0,-0.203200><4.166100,0.035000,0.203200> rotate<0,0.000000,0> translate<48.767900,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.767900,-1.535000,15.240400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.767900,-1.535000,15.462300>}
box{<0,0,-0.203200><0.221900,0.035000,0.203200> rotate<0,90.000000,0> translate<48.767900,-1.535000,15.462300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.767900,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.934100,-1.535000,15.443200>}
box{<0,0,-0.203200><4.166200,0.035000,0.203200> rotate<0,0.000000,0> translate<48.767900,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.790400,-1.535000,51.268600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.998600,-1.535000,51.060400>}
box{<0,0,-0.203200><0.294439,0.035000,0.203200> rotate<0,44.997030,0> translate<49.790400,-1.535000,51.268600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.790400,-1.535000,52.871300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.790400,-1.535000,51.268600>}
box{<0,0,-0.203200><1.602700,0.035000,0.203200> rotate<0,-90.000000,0> translate<49.790400,-1.535000,51.268600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.790400,-1.535000,52.871300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.998600,-1.535000,53.079500>}
box{<0,0,-0.203200><0.294439,0.035000,0.203200> rotate<0,-44.997030,0> translate<49.790400,-1.535000,52.871300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.998600,-1.535000,51.060400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.601300,-1.535000,51.060400>}
box{<0,0,-0.203200><1.602700,0.035000,0.203200> rotate<0,0.000000,0> translate<49.998600,-1.535000,51.060400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.998600,-1.535000,53.079500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.601300,-1.535000,53.079500>}
box{<0,0,-0.203200><1.602700,0.035000,0.203200> rotate<0,0.000000,0> translate<49.998600,-1.535000,53.079500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.054000,-1.535000,30.059200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.649200,-1.535000,29.464000>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<51.054000,-1.535000,30.059200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.054000,-1.535000,30.900700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.054000,-1.535000,30.059200>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,-90.000000,0> translate<51.054000,-1.535000,30.059200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.054000,-1.535000,30.900700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.649200,-1.535000,31.495900>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<51.054000,-1.535000,30.900700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.601300,-1.535000,51.060400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.809500,-1.535000,51.268600>}
box{<0,0,-0.203200><0.294439,0.035000,0.203200> rotate<0,-44.997030,0> translate<51.601300,-1.535000,51.060400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.601300,-1.535000,53.079500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.809500,-1.535000,52.871300>}
box{<0,0,-0.203200><0.294439,0.035000,0.203200> rotate<0,44.997030,0> translate<51.601300,-1.535000,53.079500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.649200,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.490700,-1.535000,29.464000>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<51.649200,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.649200,-1.535000,31.495900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.490700,-1.535000,31.495900>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<51.649200,-1.535000,31.495900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.747300,-1.535000,51.206400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,51.206400>}
box{<0,0,-0.203200><13.505500,0.035000,0.203200> rotate<0,0.000000,0> translate<51.747300,-1.535000,51.206400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.809500,-1.535000,51.268600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.809500,-1.535000,52.871300>}
box{<0,0,-0.203200><1.602700,0.035000,0.203200> rotate<0,90.000000,0> translate<51.809500,-1.535000,52.871300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.809500,-1.535000,51.612800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,51.612800>}
box{<0,0,-0.203200><13.443300,0.035000,0.203200> rotate<0,0.000000,0> translate<51.809500,-1.535000,51.612800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.809500,-1.535000,52.019200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,52.019200>}
box{<0,0,-0.203200><13.443300,0.035000,0.203200> rotate<0,0.000000,0> translate<51.809500,-1.535000,52.019200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.809500,-1.535000,52.425600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,52.425600>}
box{<0,0,-0.203200><13.443300,0.035000,0.203200> rotate<0,0.000000,0> translate<51.809500,-1.535000,52.425600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.809500,-1.535000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,52.832000>}
box{<0,0,-0.203200><13.443300,0.035000,0.203200> rotate<0,0.000000,0> translate<51.809500,-1.535000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.324000,-1.535000,3.389200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.919200,-1.535000,2.794000>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<52.324000,-1.535000,3.389200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.324000,-1.535000,4.230700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.324000,-1.535000,3.389200>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,-90.000000,0> translate<52.324000,-1.535000,3.389200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.324000,-1.535000,4.230700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.919200,-1.535000,4.825900>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<52.324000,-1.535000,4.230700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.490700,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.085900,-1.535000,30.059200>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<52.490700,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.490700,-1.535000,31.495900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.085900,-1.535000,30.900700>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<52.490700,-1.535000,31.495900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.693800,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.526100,-1.535000,31.292800>}
box{<0,0,-0.203200><3.832300,0.035000,0.203200> rotate<0,0.000000,0> translate<52.693800,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.693900,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.526000,-1.535000,29.667200>}
box{<0,0,-0.203200><3.832100,0.035000,0.203200> rotate<0,0.000000,0> translate<52.693900,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.919200,-1.535000,2.794000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.760700,-1.535000,2.794000>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<52.919200,-1.535000,2.794000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.919200,-1.535000,4.825900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.760700,-1.535000,4.825900>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<52.919200,-1.535000,4.825900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.933600,-1.535000,7.417800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.088300,-1.535000,7.044400>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<52.933600,-1.535000,7.417800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.933600,-1.535000,7.822100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.933600,-1.535000,7.417800>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,-90.000000,0> translate<52.933600,-1.535000,7.417800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.933600,-1.535000,7.822100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.088300,-1.535000,8.195500>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<52.933600,-1.535000,7.822100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.933600,-1.535000,9.957800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.088300,-1.535000,9.584400>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<52.933600,-1.535000,9.957800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.933600,-1.535000,10.362100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.933600,-1.535000,9.957800>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,-90.000000,0> translate<52.933600,-1.535000,9.957800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.933600,-1.535000,10.362100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.088300,-1.535000,10.735500>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<52.933600,-1.535000,10.362100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.933600,-1.535000,12.497800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.088300,-1.535000,12.124400>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<52.933600,-1.535000,12.497800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.933600,-1.535000,12.902100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.933600,-1.535000,12.497800>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,-90.000000,0> translate<52.933600,-1.535000,12.497800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.933600,-1.535000,12.902100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.088300,-1.535000,13.275500>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<52.933600,-1.535000,12.902100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.933600,-1.535000,15.037800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.088300,-1.535000,14.664400>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<52.933600,-1.535000,15.037800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.933600,-1.535000,15.442100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.933600,-1.535000,15.037800>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,-90.000000,0> translate<52.933600,-1.535000,15.037800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.933600,-1.535000,15.442100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.088300,-1.535000,15.815500>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<52.933600,-1.535000,15.442100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.085900,-1.535000,30.059200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.085900,-1.535000,30.900700>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,90.000000,0> translate<53.085900,-1.535000,30.900700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.085900,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.134000,-1.535000,30.073600>}
box{<0,0,-0.203200><3.048100,0.035000,0.203200> rotate<0,0.000000,0> translate<53.085900,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.085900,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.134000,-1.535000,30.480000>}
box{<0,0,-0.203200><3.048100,0.035000,0.203200> rotate<0,0.000000,0> translate<53.085900,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.085900,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.134000,-1.535000,30.886400>}
box{<0,0,-0.203200><3.048100,0.035000,0.203200> rotate<0,0.000000,0> translate<53.085900,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.088300,-1.535000,7.044400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.374000,-1.535000,6.758700>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<53.088300,-1.535000,7.044400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.088300,-1.535000,8.195500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.374000,-1.535000,8.481200>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<53.088300,-1.535000,8.195500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.088300,-1.535000,9.584400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.374000,-1.535000,9.298700>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<53.088300,-1.535000,9.584400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.088300,-1.535000,10.735500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.374000,-1.535000,11.021200>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<53.088300,-1.535000,10.735500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.088300,-1.535000,12.124400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.374000,-1.535000,11.838700>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<53.088300,-1.535000,12.124400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.088300,-1.535000,13.275500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.374000,-1.535000,13.561200>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<53.088300,-1.535000,13.275500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.088300,-1.535000,14.664400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.374000,-1.535000,14.378700>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<53.088300,-1.535000,14.664400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.088300,-1.535000,15.815500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.374000,-1.535000,16.101200>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<53.088300,-1.535000,15.815500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.374000,-1.535000,6.758700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.747400,-1.535000,6.604000>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<53.374000,-1.535000,6.758700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.374000,-1.535000,8.481200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.747400,-1.535000,8.635900>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<53.374000,-1.535000,8.481200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.374000,-1.535000,9.298700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.747400,-1.535000,9.144000>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<53.374000,-1.535000,9.298700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.374000,-1.535000,11.021200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.747400,-1.535000,11.175900>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<53.374000,-1.535000,11.021200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.374000,-1.535000,11.838700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.747400,-1.535000,11.684000>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<53.374000,-1.535000,11.838700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.374000,-1.535000,13.561200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.747400,-1.535000,13.715900>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<53.374000,-1.535000,13.561200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.374000,-1.535000,14.378700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.747400,-1.535000,14.224000>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<53.374000,-1.535000,14.378700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.374000,-1.535000,16.101200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.747400,-1.535000,16.255900>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<53.374000,-1.535000,16.101200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.594000,-1.535000,19.899200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.189200,-1.535000,19.304000>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<53.594000,-1.535000,19.899200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.594000,-1.535000,20.740700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.594000,-1.535000,19.899200>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,-90.000000,0> translate<53.594000,-1.535000,19.899200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.594000,-1.535000,20.740700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.189200,-1.535000,21.335900>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<53.594000,-1.535000,20.740700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.594000,-1.535000,27.519200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.189200,-1.535000,26.924000>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<53.594000,-1.535000,27.519200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.594000,-1.535000,28.360700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.594000,-1.535000,27.519200>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,-90.000000,0> translate<53.594000,-1.535000,27.519200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.594000,-1.535000,28.360700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.189200,-1.535000,28.955900>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<53.594000,-1.535000,28.360700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.747400,-1.535000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.472500,-1.535000,6.604000>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<53.747400,-1.535000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.747400,-1.535000,8.635900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.472500,-1.535000,8.635900>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<53.747400,-1.535000,8.635900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.747400,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.472500,-1.535000,9.144000>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<53.747400,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.747400,-1.535000,11.175900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.472500,-1.535000,11.175900>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<53.747400,-1.535000,11.175900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.747400,-1.535000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.472500,-1.535000,11.684000>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<53.747400,-1.535000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.747400,-1.535000,13.715900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.472500,-1.535000,13.715900>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<53.747400,-1.535000,13.715900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.747400,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.472500,-1.535000,14.224000>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<53.747400,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.747400,-1.535000,16.255900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.472500,-1.535000,16.255900>}
box{<0,0,-0.203200><1.725100,0.035000,0.203200> rotate<0,0.000000,0> translate<53.747400,-1.535000,16.255900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.760700,-1.535000,2.794000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.355900,-1.535000,3.389200>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<53.760700,-1.535000,2.794000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.760700,-1.535000,4.825900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.355900,-1.535000,4.230700>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<53.760700,-1.535000,4.825900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.811500,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.264700,-1.535000,2.844800>}
box{<0,0,-0.203200><1.453200,0.035000,0.203200> rotate<0,0.000000,0> translate<53.811500,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.116200,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.960000,-1.535000,4.470400>}
box{<0,0,-0.203200><0.843800,0.035000,0.203200> rotate<0,0.000000,0> translate<54.116200,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.189200,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.030700,-1.535000,19.304000>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<54.189200,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.189200,-1.535000,21.335900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.030700,-1.535000,21.335900>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<54.189200,-1.535000,21.335900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.189200,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.030700,-1.535000,26.924000>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<54.189200,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.189200,-1.535000,28.955900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.030700,-1.535000,28.955900>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<54.189200,-1.535000,28.955900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.217900,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.858300,-1.535000,3.251200>}
box{<0,0,-0.203200><0.640400,0.035000,0.203200> rotate<0,0.000000,0> translate<54.217900,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.355900,-1.535000,3.389200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.355900,-1.535000,4.230700>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,90.000000,0> translate<54.355900,-1.535000,4.230700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.355900,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.762400,-1.535000,3.657600>}
box{<0,0,-0.203200><0.406500,0.035000,0.203200> rotate<0,0.000000,0> translate<54.355900,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.355900,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.762400,-1.535000,4.064000>}
box{<0,0,-0.203200><0.406500,0.035000,0.203200> rotate<0,0.000000,0> translate<54.355900,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.762400,-1.535000,3.347100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.417100,-1.535000,2.692400>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,44.997030,0> translate<54.762400,-1.535000,3.347100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.762400,-1.535000,3.809400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.762400,-1.535000,3.347100>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,-90.000000,0> translate<54.762400,-1.535000,3.347100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.762400,-1.535000,3.809400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.878900,-1.535000,3.809400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<54.762400,-1.535000,3.809400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.762400,-1.535000,3.810400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.878900,-1.535000,3.810400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<54.762400,-1.535000,3.810400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.762400,-1.535000,4.272800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.762400,-1.535000,3.810400>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,-90.000000,0> translate<54.762400,-1.535000,3.810400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.762400,-1.535000,4.272800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.417100,-1.535000,4.927500>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,-44.997030,0> translate<54.762400,-1.535000,4.272800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.030700,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.625900,-1.535000,19.899200>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<55.030700,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.030700,-1.535000,21.335900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.625900,-1.535000,20.740700>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<55.030700,-1.535000,21.335900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.030700,-1.535000,26.924000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.625900,-1.535000,27.519200>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<55.030700,-1.535000,26.924000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.030700,-1.535000,28.955900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.625900,-1.535000,28.360700>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<55.030700,-1.535000,28.955900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.132200,-1.535000,28.854400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,28.854400>}
box{<0,0,-0.203200><10.120600,0.035000,0.203200> rotate<0,0.000000,0> translate<55.132200,-1.535000,28.854400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.233800,-1.535000,21.132800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,21.132800>}
box{<0,0,-0.203200><10.019000,0.035000,0.203200> rotate<0,0.000000,0> translate<55.233800,-1.535000,21.132800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.233900,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,19.507200>}
box{<0,0,-0.203200><10.018900,0.035000,0.203200> rotate<0,0.000000,0> translate<55.233900,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.335500,-1.535000,27.228800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,27.228800>}
box{<0,0,-0.203200><9.917300,0.035000,0.203200> rotate<0,0.000000,0> translate<55.335500,-1.535000,27.228800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.417100,-1.535000,2.692400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.879400,-1.535000,2.692400>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,0.000000,0> translate<55.417100,-1.535000,2.692400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.417100,-1.535000,4.927500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.879400,-1.535000,4.927500>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,0.000000,0> translate<55.417100,-1.535000,4.927500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.472500,-1.535000,6.604000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.845900,-1.535000,6.758700>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<55.472500,-1.535000,6.604000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.472500,-1.535000,8.635900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.845900,-1.535000,8.481200>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<55.472500,-1.535000,8.635900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.472500,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.845900,-1.535000,9.298700>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<55.472500,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.472500,-1.535000,11.175900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.845900,-1.535000,11.021200>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<55.472500,-1.535000,11.175900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.472500,-1.535000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.845900,-1.535000,11.838700>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<55.472500,-1.535000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.472500,-1.535000,13.715900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.845900,-1.535000,13.561200>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<55.472500,-1.535000,13.715900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.472500,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.845900,-1.535000,14.378700>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-22.502792,0> translate<55.472500,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.472500,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,14.224000>}
box{<0,0,-0.203200><9.780300,0.035000,0.203200> rotate<0,0.000000,0> translate<55.472500,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.472500,-1.535000,16.255900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.845900,-1.535000,16.101200>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,22.502792,0> translate<55.472500,-1.535000,16.255900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.538600,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,28.448000>}
box{<0,0,-0.203200><9.714200,0.035000,0.203200> rotate<0,0.000000,0> translate<55.538600,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.625900,-1.535000,19.899200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.625900,-1.535000,20.740700>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,90.000000,0> translate<55.625900,-1.535000,20.740700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.625900,-1.535000,19.913600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,19.913600>}
box{<0,0,-0.203200><9.626900,0.035000,0.203200> rotate<0,0.000000,0> translate<55.625900,-1.535000,19.913600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.625900,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,20.320000>}
box{<0,0,-0.203200><9.626900,0.035000,0.203200> rotate<0,0.000000,0> translate<55.625900,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.625900,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,20.726400>}
box{<0,0,-0.203200><9.626900,0.035000,0.203200> rotate<0,0.000000,0> translate<55.625900,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.625900,-1.535000,27.519200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.625900,-1.535000,28.360700>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,90.000000,0> translate<55.625900,-1.535000,28.360700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.625900,-1.535000,27.635200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,27.635200>}
box{<0,0,-0.203200><9.626900,0.035000,0.203200> rotate<0,0.000000,0> translate<55.625900,-1.535000,27.635200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.625900,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,28.041600>}
box{<0,0,-0.203200><9.626900,0.035000,0.203200> rotate<0,0.000000,0> translate<55.625900,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.717500,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,8.534400>}
box{<0,0,-0.203200><9.535300,0.035000,0.203200> rotate<0,0.000000,0> translate<55.717500,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.717700,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.702700,-1.535000,11.785600>}
box{<0,0,-0.203200><3.985000,0.035000,0.203200> rotate<0,0.000000,0> translate<55.717700,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.845900,-1.535000,6.758700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.131600,-1.535000,7.044400>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<55.845900,-1.535000,6.758700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.845900,-1.535000,8.481200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.131600,-1.535000,8.195500>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<55.845900,-1.535000,8.481200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.845900,-1.535000,9.298700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.131600,-1.535000,9.584400>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<55.845900,-1.535000,9.298700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.845900,-1.535000,11.021200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.131600,-1.535000,10.735500>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<55.845900,-1.535000,11.021200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.845900,-1.535000,11.838700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.131600,-1.535000,12.124400>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<55.845900,-1.535000,11.838700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.845900,-1.535000,13.561200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.131600,-1.535000,13.275500>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<55.845900,-1.535000,13.561200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.845900,-1.535000,14.378700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.131600,-1.535000,14.664400>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,-44.997030,0> translate<55.845900,-1.535000,14.378700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.845900,-1.535000,16.101200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.131600,-1.535000,15.815500>}
box{<0,0,-0.203200><0.404041,0.035000,0.203200> rotate<0,44.997030,0> translate<55.845900,-1.535000,16.101200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.878900,-1.535000,3.810400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.878900,-1.535000,3.809400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<55.878900,-1.535000,3.809400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.879400,-1.535000,2.692400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.879400,-1.535000,3.808900>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<55.879400,-1.535000,3.808900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.879400,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880400,-1.535000,2.844800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<55.879400,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.879400,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880400,-1.535000,3.251200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<55.879400,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.879400,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880400,-1.535000,3.657600>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<55.879400,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.879400,-1.535000,3.808900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880400,-1.535000,3.808900>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<55.879400,-1.535000,3.808900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.879400,-1.535000,3.811000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.879400,-1.535000,4.927500>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,90.000000,0> translate<55.879400,-1.535000,4.927500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.879400,-1.535000,3.811000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880400,-1.535000,3.811000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<55.879400,-1.535000,3.811000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.879400,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880400,-1.535000,4.064000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<55.879400,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.879400,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880400,-1.535000,4.470400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<55.879400,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.879400,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880400,-1.535000,4.876800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<55.879400,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880400,-1.535000,2.692400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.342800,-1.535000,2.692400>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,0.000000,0> translate<55.880400,-1.535000,2.692400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880400,-1.535000,3.808900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880400,-1.535000,2.692400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<55.880400,-1.535000,2.692400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880400,-1.535000,4.927500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880400,-1.535000,3.811000>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,-90.000000,0> translate<55.880400,-1.535000,3.811000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880400,-1.535000,4.927500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.342800,-1.535000,4.927500>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,0.000000,0> translate<55.880400,-1.535000,4.927500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.881000,-1.535000,3.809400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.881000,-1.535000,3.810400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,90.000000,0> translate<55.881000,-1.535000,3.810400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.881000,-1.535000,3.809400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.997500,-1.535000,3.809400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<55.881000,-1.535000,3.809400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.881000,-1.535000,3.810400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.997500,-1.535000,3.810400>}
box{<0,0,-0.203200><1.116500,0.035000,0.203200> rotate<0,0.000000,0> translate<55.881000,-1.535000,3.810400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.894300,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.401100,-1.535000,10.972800>}
box{<0,0,-0.203200><4.506800,0.035000,0.203200> rotate<0,0.000000,0> translate<55.894300,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.894400,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,9.347200>}
box{<0,0,-0.203200><9.358400,0.035000,0.203200> rotate<0,0.000000,0> translate<55.894400,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.995900,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.401200,-1.535000,13.411200>}
box{<0,0,-0.203200><4.405300,0.035000,0.203200> rotate<0,0.000000,0> translate<55.995900,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.996000,-1.535000,6.908800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,6.908800>}
box{<0,0,-0.203200><9.256800,0.035000,0.203200> rotate<0,0.000000,0> translate<55.996000,-1.535000,6.908800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.097500,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.804300,-1.535000,15.849600>}
box{<0,0,-0.203200><3.706800,0.035000,0.203200> rotate<0,0.000000,0> translate<56.097500,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.097600,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.638000,-1.535000,14.630400>}
box{<0,0,-0.203200><4.540400,0.035000,0.203200> rotate<0,0.000000,0> translate<56.097600,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.131600,-1.535000,7.044400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286300,-1.535000,7.417800>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<56.131600,-1.535000,7.044400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.131600,-1.535000,8.195500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286300,-1.535000,7.822100>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<56.131600,-1.535000,8.195500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.131600,-1.535000,9.584400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286300,-1.535000,9.957800>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<56.131600,-1.535000,9.584400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.131600,-1.535000,10.735500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286300,-1.535000,10.362100>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<56.131600,-1.535000,10.735500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.131600,-1.535000,12.124400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286300,-1.535000,12.497800>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<56.131600,-1.535000,12.124400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.131600,-1.535000,13.275500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286300,-1.535000,12.902100>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<56.131600,-1.535000,13.275500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.131600,-1.535000,14.664400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286300,-1.535000,15.037800>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,-67.491269,0> translate<56.131600,-1.535000,14.664400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.131600,-1.535000,15.815500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286300,-1.535000,15.442100>}
box{<0,0,-0.203200><0.404178,0.035000,0.203200> rotate<0,67.491269,0> translate<56.131600,-1.535000,15.815500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.134000,-1.535000,30.059200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.729200,-1.535000,29.464000>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<56.134000,-1.535000,30.059200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.134000,-1.535000,30.900700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.134000,-1.535000,30.059200>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,-90.000000,0> translate<56.134000,-1.535000,30.059200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.134000,-1.535000,30.900700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.729200,-1.535000,31.495900>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<56.134000,-1.535000,30.900700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.159600,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,8.128000>}
box{<0,0,-0.203200><9.093200,0.035000,0.203200> rotate<0,0.000000,0> translate<56.159600,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.159600,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.958900,-1.535000,12.192000>}
box{<0,0,-0.203200><4.799300,0.035000,0.203200> rotate<0,0.000000,0> translate<56.159600,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.201600,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,9.753600>}
box{<0,0,-0.203200><9.051200,0.035000,0.203200> rotate<0,0.000000,0> translate<56.201600,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.201700,-1.535000,10.566400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,10.566400>}
box{<0,0,-0.203200><9.051100,0.035000,0.203200> rotate<0,0.000000,0> translate<56.201700,-1.535000,10.566400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.243700,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,7.315200>}
box{<0,0,-0.203200><9.009100,0.035000,0.203200> rotate<0,0.000000,0> translate<56.243700,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.243800,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.994800,-1.535000,13.004800>}
box{<0,0,-0.203200><3.751000,0.035000,0.203200> rotate<0,0.000000,0> translate<56.243800,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.285800,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.036700,-1.535000,15.036800>}
box{<0,0,-0.203200><3.750900,0.035000,0.203200> rotate<0,0.000000,0> translate<56.285800,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.285900,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.835200,-1.535000,15.443200>}
box{<0,0,-0.203200><3.549300,0.035000,0.203200> rotate<0,0.000000,0> translate<56.285900,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286300,-1.535000,7.417800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286300,-1.535000,7.822100>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,90.000000,0> translate<56.286300,-1.535000,7.822100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286300,-1.535000,7.721600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,7.721600>}
box{<0,0,-0.203200><8.966500,0.035000,0.203200> rotate<0,0.000000,0> translate<56.286300,-1.535000,7.721600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286300,-1.535000,9.957800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286300,-1.535000,10.362100>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,90.000000,0> translate<56.286300,-1.535000,10.362100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286300,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,10.160000>}
box{<0,0,-0.203200><8.966500,0.035000,0.203200> rotate<0,0.000000,0> translate<56.286300,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286300,-1.535000,12.497800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286300,-1.535000,12.902100>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,90.000000,0> translate<56.286300,-1.535000,12.902100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286300,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.702700,-1.535000,12.598400>}
box{<0,0,-0.203200><3.416400,0.035000,0.203200> rotate<0,0.000000,0> translate<56.286300,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286300,-1.535000,15.037800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.286300,-1.535000,15.442100>}
box{<0,0,-0.203200><0.404300,0.035000,0.203200> rotate<0,90.000000,0> translate<56.286300,-1.535000,15.442100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.342800,-1.535000,2.692400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.997500,-1.535000,3.347100>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,-44.997030,0> translate<56.342800,-1.535000,2.692400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.342800,-1.535000,4.927500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.997500,-1.535000,4.272800>}
box{<0,0,-0.203200><0.925886,0.035000,0.203200> rotate<0,44.997030,0> translate<56.342800,-1.535000,4.927500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.393500,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.390000,-1.535000,4.876800>}
box{<0,0,-0.203200><3.996500,0.035000,0.203200> rotate<0,0.000000,0> translate<56.393500,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.495200,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.347800,-1.535000,2.844800>}
box{<0,0,-0.203200><3.852600,0.035000,0.203200> rotate<0,0.000000,0> translate<56.495200,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.729200,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.570700,-1.535000,29.464000>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<56.729200,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.729200,-1.535000,31.495900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.570700,-1.535000,31.495900>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,0.000000,0> translate<56.729200,-1.535000,31.495900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.799900,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.221700,-1.535000,4.470400>}
box{<0,0,-0.203200><3.421800,0.035000,0.203200> rotate<0,0.000000,0> translate<56.799900,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.901600,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.179500,-1.535000,3.251200>}
box{<0,0,-0.203200><3.277900,0.035000,0.203200> rotate<0,0.000000,0> translate<56.901600,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.997500,-1.535000,3.347100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.997500,-1.535000,3.809400>}
box{<0,0,-0.203200><0.462300,0.035000,0.203200> rotate<0,90.000000,0> translate<56.997500,-1.535000,3.809400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.997500,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.121800,-1.535000,3.657600>}
box{<0,0,-0.203200><3.124300,0.035000,0.203200> rotate<0,0.000000,0> translate<56.997500,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.997500,-1.535000,3.810400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.997500,-1.535000,4.272800>}
box{<0,0,-0.203200><0.462400,0.035000,0.203200> rotate<0,90.000000,0> translate<56.997500,-1.535000,4.272800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.997500,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.121800,-1.535000,4.064000>}
box{<0,0,-0.203200><3.124300,0.035000,0.203200> rotate<0,0.000000,0> translate<56.997500,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.570700,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.165900,-1.535000,30.059200>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,-44.997030,0> translate<57.570700,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.570700,-1.535000,31.495900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.165900,-1.535000,30.900700>}
box{<0,0,-0.203200><0.841740,0.035000,0.203200> rotate<0,44.997030,0> translate<57.570700,-1.535000,31.495900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.773800,-1.535000,31.292800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,31.292800>}
box{<0,0,-0.203200><7.479000,0.035000,0.203200> rotate<0,0.000000,0> translate<57.773800,-1.535000,31.292800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.773900,-1.535000,29.667200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,29.667200>}
box{<0,0,-0.203200><7.478900,0.035000,0.203200> rotate<0,0.000000,0> translate<57.773900,-1.535000,29.667200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.165900,-1.535000,30.059200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.165900,-1.535000,30.900700>}
box{<0,0,-0.203200><0.841500,0.035000,0.203200> rotate<0,90.000000,0> translate<58.165900,-1.535000,30.900700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.165900,-1.535000,30.073600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,30.073600>}
box{<0,0,-0.203200><7.086900,0.035000,0.203200> rotate<0,0.000000,0> translate<58.165900,-1.535000,30.073600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.165900,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,30.480000>}
box{<0,0,-0.203200><7.086900,0.035000,0.203200> rotate<0,0.000000,0> translate<58.165900,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.165900,-1.535000,30.886400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,30.886400>}
box{<0,0,-0.203200><7.086900,0.035000,0.203200> rotate<0,0.000000,0> translate<58.165900,-1.535000,30.886400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.702700,-1.535000,11.671200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.439200,-1.535000,10.934700>}
box{<0,0,-0.203200><1.041568,0.035000,0.203200> rotate<0,44.997030,0> translate<59.702700,-1.535000,11.671200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.702700,-1.535000,12.191400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.702700,-1.535000,11.671200>}
box{<0,0,-0.203200><0.520200,0.035000,0.203200> rotate<0,-90.000000,0> translate<59.702700,-1.535000,11.671200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.702700,-1.535000,12.191400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.958900,-1.535000,12.191400>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,0.000000,0> translate<59.702700,-1.535000,12.191400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.702700,-1.535000,12.192400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.958900,-1.535000,12.192400>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,0.000000,0> translate<59.702700,-1.535000,12.192400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.702700,-1.535000,12.712700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.702700,-1.535000,12.192400>}
box{<0,0,-0.203200><0.520300,0.035000,0.203200> rotate<0,-90.000000,0> translate<59.702700,-1.535000,12.192400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.702700,-1.535000,12.712700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.439200,-1.535000,13.449200>}
box{<0,0,-0.203200><1.041568,0.035000,0.203200> rotate<0,-44.997030,0> translate<59.702700,-1.535000,12.712700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.804300,-1.535000,15.518000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.980200,-1.535000,15.093300>}
box{<0,0,-0.203200><0.459686,0.035000,0.203200> rotate<0,67.497445,0> translate<59.804300,-1.535000,15.518000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.804300,-1.535000,15.977900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.804300,-1.535000,15.518000>}
box{<0,0,-0.203200><0.459900,0.035000,0.203200> rotate<0,-90.000000,0> translate<59.804300,-1.535000,15.518000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.804300,-1.535000,15.977900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.980200,-1.535000,16.402600>}
box{<0,0,-0.203200><0.459686,0.035000,0.203200> rotate<0,-67.497445,0> translate<59.804300,-1.535000,15.977900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.980200,-1.535000,15.093300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.305300,-1.535000,14.768200>}
box{<0,0,-0.203200><0.459761,0.035000,0.203200> rotate<0,44.997030,0> translate<59.980200,-1.535000,15.093300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.980200,-1.535000,16.402600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.305300,-1.535000,16.727700>}
box{<0,0,-0.203200><0.459761,0.035000,0.203200> rotate<0,-44.997030,0> translate<59.980200,-1.535000,16.402600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.121800,-1.535000,3.390600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.442700,-1.535000,2.615800>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,67.497607,0> translate<60.121800,-1.535000,3.390600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.121800,-1.535000,4.229300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.121800,-1.535000,3.390600>}
box{<0,0,-0.203200><0.838700,0.035000,0.203200> rotate<0,-90.000000,0> translate<60.121800,-1.535000,3.390600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.121800,-1.535000,4.229300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.442700,-1.535000,5.004100>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,-67.497607,0> translate<60.121800,-1.535000,4.229300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.121800,-1.535000,61.810600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.442700,-1.535000,61.035800>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,67.497607,0> translate<60.121800,-1.535000,61.810600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.121800,-1.535000,62.649300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.121800,-1.535000,61.810600>}
box{<0,0,-0.203200><0.838700,0.035000,0.203200> rotate<0,-90.000000,0> translate<60.121800,-1.535000,61.810600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.121800,-1.535000,62.649300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.442700,-1.535000,63.424100>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,-67.497607,0> translate<60.121800,-1.535000,62.649300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.305300,-1.535000,14.768200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.730000,-1.535000,14.592300>}
box{<0,0,-0.203200><0.459686,0.035000,0.203200> rotate<0,22.496615,0> translate<60.305300,-1.535000,14.768200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.305300,-1.535000,16.727700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.730000,-1.535000,16.903600>}
box{<0,0,-0.203200><0.459686,0.035000,0.203200> rotate<0,-22.496615,0> translate<60.305300,-1.535000,16.727700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.439200,-1.535000,10.934700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.959400,-1.535000,10.934700>}
box{<0,0,-0.203200><0.520200,0.035000,0.203200> rotate<0,0.000000,0> translate<60.439200,-1.535000,10.934700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.439200,-1.535000,13.449200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.959400,-1.535000,13.449200>}
box{<0,0,-0.203200><0.520200,0.035000,0.203200> rotate<0,0.000000,0> translate<60.439200,-1.535000,13.449200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.442700,-1.535000,2.615800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.035800,-1.535000,2.022700>}
box{<0,0,-0.203200><0.838770,0.035000,0.203200> rotate<0,44.997030,0> translate<60.442700,-1.535000,2.615800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.442700,-1.535000,5.004100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.035800,-1.535000,5.597200>}
box{<0,0,-0.203200><0.838770,0.035000,0.203200> rotate<0,-44.997030,0> translate<60.442700,-1.535000,5.004100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.442700,-1.535000,61.035800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.035800,-1.535000,60.442700>}
box{<0,0,-0.203200><0.838770,0.035000,0.203200> rotate<0,44.997030,0> translate<60.442700,-1.535000,61.035800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.442700,-1.535000,63.424100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.035800,-1.535000,64.017200>}
box{<0,0,-0.203200><0.838770,0.035000,0.203200> rotate<0,-44.997030,0> translate<60.442700,-1.535000,63.424100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.730000,-1.535000,14.592300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.189900,-1.535000,14.592300>}
box{<0,0,-0.203200><0.459900,0.035000,0.203200> rotate<0,0.000000,0> translate<60.730000,-1.535000,14.592300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.730000,-1.535000,16.903600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.189900,-1.535000,16.903600>}
box{<0,0,-0.203200><0.459900,0.035000,0.203200> rotate<0,0.000000,0> translate<60.730000,-1.535000,16.903600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.958900,-1.535000,12.192400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.958900,-1.535000,12.191400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<60.958900,-1.535000,12.191400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.959400,-1.535000,10.934700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.959400,-1.535000,12.190900>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,90.000000,0> translate<60.959400,-1.535000,12.190900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.959400,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960400,-1.535000,10.972800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<60.959400,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.959400,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960400,-1.535000,11.379200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<60.959400,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.959400,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960400,-1.535000,11.785600>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<60.959400,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.959400,-1.535000,12.190900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960400,-1.535000,12.190900>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<60.959400,-1.535000,12.190900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.959400,-1.535000,12.193000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.959400,-1.535000,13.449200>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,90.000000,0> translate<60.959400,-1.535000,13.449200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.959400,-1.535000,12.193000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960400,-1.535000,12.193000>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<60.959400,-1.535000,12.193000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.959400,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960400,-1.535000,12.598400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<60.959400,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.959400,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960400,-1.535000,13.004800>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<60.959400,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.959400,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960400,-1.535000,13.411200>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,0.000000,0> translate<60.959400,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960400,-1.535000,10.934700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.480700,-1.535000,10.934700>}
box{<0,0,-0.203200><0.520300,0.035000,0.203200> rotate<0,0.000000,0> translate<60.960400,-1.535000,10.934700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960400,-1.535000,12.190900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960400,-1.535000,10.934700>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,-90.000000,0> translate<60.960400,-1.535000,10.934700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960400,-1.535000,13.449200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960400,-1.535000,12.193000>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,-90.000000,0> translate<60.960400,-1.535000,12.193000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.960400,-1.535000,13.449200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.480700,-1.535000,13.449200>}
box{<0,0,-0.203200><0.520300,0.035000,0.203200> rotate<0,0.000000,0> translate<60.960400,-1.535000,13.449200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.961000,-1.535000,12.191400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.961000,-1.535000,12.192400>}
box{<0,0,-0.203200><0.001000,0.035000,0.203200> rotate<0,90.000000,0> translate<60.961000,-1.535000,12.192400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.961000,-1.535000,12.191400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.217200,-1.535000,12.191400>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,0.000000,0> translate<60.961000,-1.535000,12.191400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.961000,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,12.192000>}
box{<0,0,-0.203200><4.291800,0.035000,0.203200> rotate<0,0.000000,0> translate<60.961000,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.961000,-1.535000,12.192400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.217200,-1.535000,12.192400>}
box{<0,0,-0.203200><1.256200,0.035000,0.203200> rotate<0,0.000000,0> translate<60.961000,-1.535000,12.192400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.035800,-1.535000,2.022700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.810600,-1.535000,1.701800>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,22.496453,0> translate<61.035800,-1.535000,2.022700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.035800,-1.535000,5.597200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.810600,-1.535000,5.918100>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,-22.496453,0> translate<61.035800,-1.535000,5.597200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.035800,-1.535000,60.442700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.810600,-1.535000,60.121800>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,22.496453,0> translate<61.035800,-1.535000,60.442700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.035800,-1.535000,64.017200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.810600,-1.535000,64.338100>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,-22.496453,0> translate<61.035800,-1.535000,64.017200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.189900,-1.535000,14.592300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.614600,-1.535000,14.768200>}
box{<0,0,-0.203200><0.459686,0.035000,0.203200> rotate<0,-22.496615,0> translate<61.189900,-1.535000,14.592300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.189900,-1.535000,16.903600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.614600,-1.535000,16.727700>}
box{<0,0,-0.203200><0.459686,0.035000,0.203200> rotate<0,22.496615,0> translate<61.189900,-1.535000,16.903600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.281800,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,14.630400>}
box{<0,0,-0.203200><3.971000,0.035000,0.203200> rotate<0,0.000000,0> translate<61.281800,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.480700,-1.535000,10.934700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.217200,-1.535000,11.671200>}
box{<0,0,-0.203200><1.041568,0.035000,0.203200> rotate<0,-44.997030,0> translate<61.480700,-1.535000,10.934700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.480700,-1.535000,13.449200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.217200,-1.535000,12.712700>}
box{<0,0,-0.203200><1.041568,0.035000,0.203200> rotate<0,44.997030,0> translate<61.480700,-1.535000,13.449200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.518700,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,13.411200>}
box{<0,0,-0.203200><3.734100,0.035000,0.203200> rotate<0,0.000000,0> translate<61.518700,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.518800,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,10.972800>}
box{<0,0,-0.203200><3.734000,0.035000,0.203200> rotate<0,0.000000,0> translate<61.518800,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.614600,-1.535000,14.768200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.939700,-1.535000,15.093300>}
box{<0,0,-0.203200><0.459761,0.035000,0.203200> rotate<0,-44.997030,0> translate<61.614600,-1.535000,14.768200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.614600,-1.535000,16.727700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.939700,-1.535000,16.402600>}
box{<0,0,-0.203200><0.459761,0.035000,0.203200> rotate<0,44.997030,0> translate<61.614600,-1.535000,16.727700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.679900,-1.535000,16.662400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,16.662400>}
box{<0,0,-0.203200><3.572900,0.035000,0.203200> rotate<0,0.000000,0> translate<61.679900,-1.535000,16.662400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.810600,-1.535000,1.701800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.649300,-1.535000,1.701800>}
box{<0,0,-0.203200><0.838700,0.035000,0.203200> rotate<0,0.000000,0> translate<61.810600,-1.535000,1.701800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.810600,-1.535000,5.918100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.649300,-1.535000,5.918100>}
box{<0,0,-0.203200><0.838700,0.035000,0.203200> rotate<0,0.000000,0> translate<61.810600,-1.535000,5.918100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.810600,-1.535000,60.121800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.649300,-1.535000,60.121800>}
box{<0,0,-0.203200><0.838700,0.035000,0.203200> rotate<0,0.000000,0> translate<61.810600,-1.535000,60.121800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.810600,-1.535000,64.338100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.649300,-1.535000,64.338100>}
box{<0,0,-0.203200><0.838700,0.035000,0.203200> rotate<0,0.000000,0> translate<61.810600,-1.535000,64.338100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.883200,-1.535000,15.036800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,15.036800>}
box{<0,0,-0.203200><3.369600,0.035000,0.203200> rotate<0,0.000000,0> translate<61.883200,-1.535000,15.036800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.925100,-1.535000,13.004800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,13.004800>}
box{<0,0,-0.203200><3.327700,0.035000,0.203200> rotate<0,0.000000,0> translate<61.925100,-1.535000,13.004800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.925200,-1.535000,11.379200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,11.379200>}
box{<0,0,-0.203200><3.327600,0.035000,0.203200> rotate<0,0.000000,0> translate<61.925200,-1.535000,11.379200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.939700,-1.535000,15.093300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.115600,-1.535000,15.518000>}
box{<0,0,-0.203200><0.459686,0.035000,0.203200> rotate<0,-67.497445,0> translate<61.939700,-1.535000,15.093300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<61.939700,-1.535000,16.402600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.115600,-1.535000,15.977900>}
box{<0,0,-0.203200><0.459686,0.035000,0.203200> rotate<0,67.497445,0> translate<61.939700,-1.535000,16.402600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.000500,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,16.256000>}
box{<0,0,-0.203200><3.252300,0.035000,0.203200> rotate<0,0.000000,0> translate<62.000500,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.084600,-1.535000,15.443200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,15.443200>}
box{<0,0,-0.203200><3.168200,0.035000,0.203200> rotate<0,0.000000,0> translate<62.084600,-1.535000,15.443200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.115600,-1.535000,15.518000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.115600,-1.535000,15.977900>}
box{<0,0,-0.203200><0.459900,0.035000,0.203200> rotate<0,90.000000,0> translate<62.115600,-1.535000,15.977900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.115600,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,15.849600>}
box{<0,0,-0.203200><3.137200,0.035000,0.203200> rotate<0,0.000000,0> translate<62.115600,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.217200,-1.535000,11.671200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.217200,-1.535000,12.191400>}
box{<0,0,-0.203200><0.520200,0.035000,0.203200> rotate<0,90.000000,0> translate<62.217200,-1.535000,12.191400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.217200,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,11.785600>}
box{<0,0,-0.203200><3.035600,0.035000,0.203200> rotate<0,0.000000,0> translate<62.217200,-1.535000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.217200,-1.535000,12.192400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.217200,-1.535000,12.712700>}
box{<0,0,-0.203200><0.520300,0.035000,0.203200> rotate<0,90.000000,0> translate<62.217200,-1.535000,12.712700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.217200,-1.535000,12.598400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,12.598400>}
box{<0,0,-0.203200><3.035600,0.035000,0.203200> rotate<0,0.000000,0> translate<62.217200,-1.535000,12.598400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.649300,-1.535000,1.701800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.424100,-1.535000,2.022700>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,-22.496453,0> translate<62.649300,-1.535000,1.701800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.649300,-1.535000,5.918100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.424100,-1.535000,5.597200>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,22.496453,0> translate<62.649300,-1.535000,5.918100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.649300,-1.535000,60.121800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.424100,-1.535000,60.442700>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,-22.496453,0> translate<62.649300,-1.535000,60.121800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.649300,-1.535000,64.338100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.424100,-1.535000,64.017200>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,22.496453,0> translate<62.649300,-1.535000,64.338100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.710600,-1.535000,60.147200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,60.147200>}
box{<0,0,-0.203200><2.542200,0.035000,0.203200> rotate<0,0.000000,0> translate<62.710600,-1.535000,60.147200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.955700,-1.535000,64.211200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,64.211200>}
box{<0,0,-0.203200><2.297100,0.035000,0.203200> rotate<0,0.000000,0> translate<62.955700,-1.535000,64.211200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.201100,-1.535000,5.689600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,5.689600>}
box{<0,0,-0.203200><2.051700,0.035000,0.203200> rotate<0,0.000000,0> translate<63.201100,-1.535000,5.689600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.424100,-1.535000,2.022700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.017200,-1.535000,2.615800>}
box{<0,0,-0.203200><0.838770,0.035000,0.203200> rotate<0,-44.997030,0> translate<63.424100,-1.535000,2.022700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.424100,-1.535000,5.597200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.017200,-1.535000,5.004100>}
box{<0,0,-0.203200><0.838770,0.035000,0.203200> rotate<0,44.997030,0> translate<63.424100,-1.535000,5.597200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.424100,-1.535000,60.442700>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.017200,-1.535000,61.035800>}
box{<0,0,-0.203200><0.838770,0.035000,0.203200> rotate<0,-44.997030,0> translate<63.424100,-1.535000,60.442700> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.424100,-1.535000,64.017200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.017200,-1.535000,63.424100>}
box{<0,0,-0.203200><0.838770,0.035000,0.203200> rotate<0,44.997030,0> translate<63.424100,-1.535000,64.017200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.433400,-1.535000,2.032000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,2.032000>}
box{<0,0,-0.203200><1.819400,0.035000,0.203200> rotate<0,0.000000,0> translate<63.433400,-1.535000,2.032000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.535000,-1.535000,60.553600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,60.553600>}
box{<0,0,-0.203200><1.717800,0.035000,0.203200> rotate<0,0.000000,0> translate<63.535000,-1.535000,60.553600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.636500,-1.535000,63.804800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,63.804800>}
box{<0,0,-0.203200><1.616300,0.035000,0.203200> rotate<0,0.000000,0> translate<63.636500,-1.535000,63.804800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.738100,-1.535000,5.283200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,5.283200>}
box{<0,0,-0.203200><1.514700,0.035000,0.203200> rotate<0,0.000000,0> translate<63.738100,-1.535000,5.283200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.839800,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,2.438400>}
box{<0,0,-0.203200><1.413000,0.035000,0.203200> rotate<0,0.000000,0> translate<63.839800,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<63.941400,-1.535000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,60.960000>}
box{<0,0,-0.203200><1.311400,0.035000,0.203200> rotate<0,0.000000,0> translate<63.941400,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.017200,-1.535000,2.615800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.338100,-1.535000,3.390600>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,-67.497607,0> translate<64.017200,-1.535000,2.615800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.017200,-1.535000,5.004100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.338100,-1.535000,4.229300>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,67.497607,0> translate<64.017200,-1.535000,5.004100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.017200,-1.535000,61.035800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.338100,-1.535000,61.810600>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,-67.497607,0> translate<64.017200,-1.535000,61.035800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.017200,-1.535000,63.424100>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.338100,-1.535000,62.649300>}
box{<0,0,-0.203200><0.838625,0.035000,0.203200> rotate<0,67.497607,0> translate<64.017200,-1.535000,63.424100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.027900,-1.535000,63.398400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,63.398400>}
box{<0,0,-0.203200><1.224900,0.035000,0.203200> rotate<0,0.000000,0> translate<64.027900,-1.535000,63.398400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.070000,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,4.876800>}
box{<0,0,-0.203200><1.182800,0.035000,0.203200> rotate<0,0.000000,0> translate<64.070000,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.112000,-1.535000,2.844800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,2.844800>}
box{<0,0,-0.203200><1.140800,0.035000,0.203200> rotate<0,0.000000,0> translate<64.112000,-1.535000,2.844800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.154100,-1.535000,61.366400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,61.366400>}
box{<0,0,-0.203200><1.098700,0.035000,0.203200> rotate<0,0.000000,0> translate<64.154100,-1.535000,61.366400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.196200,-1.535000,62.992000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,62.992000>}
box{<0,0,-0.203200><1.056600,0.035000,0.203200> rotate<0,0.000000,0> translate<64.196200,-1.535000,62.992000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.238300,-1.535000,4.470400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,4.470400>}
box{<0,0,-0.203200><1.014500,0.035000,0.203200> rotate<0,0.000000,0> translate<64.238300,-1.535000,4.470400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.280300,-1.535000,3.251200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,3.251200>}
box{<0,0,-0.203200><0.972500,0.035000,0.203200> rotate<0,0.000000,0> translate<64.280300,-1.535000,3.251200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.322400,-1.535000,61.772800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,61.772800>}
box{<0,0,-0.203200><0.930400,0.035000,0.203200> rotate<0,0.000000,0> translate<64.322400,-1.535000,61.772800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.338100,-1.535000,3.390600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.338100,-1.535000,4.229300>}
box{<0,0,-0.203200><0.838700,0.035000,0.203200> rotate<0,90.000000,0> translate<64.338100,-1.535000,4.229300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.338100,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,3.657600>}
box{<0,0,-0.203200><0.914700,0.035000,0.203200> rotate<0,0.000000,0> translate<64.338100,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.338100,-1.535000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,4.064000>}
box{<0,0,-0.203200><0.914700,0.035000,0.203200> rotate<0,0.000000,0> translate<64.338100,-1.535000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.338100,-1.535000,61.810600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.338100,-1.535000,62.649300>}
box{<0,0,-0.203200><0.838700,0.035000,0.203200> rotate<0,90.000000,0> translate<64.338100,-1.535000,62.649300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.338100,-1.535000,62.179200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,62.179200>}
box{<0,0,-0.203200><0.914700,0.035000,0.203200> rotate<0,0.000000,0> translate<64.338100,-1.535000,62.179200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<64.338100,-1.535000,62.585600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,62.585600>}
box{<0,0,-0.203200><0.914700,0.035000,0.203200> rotate<0,0.000000,0> translate<64.338100,-1.535000,62.585600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,65.572800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<65.252800,-1.535000,0.457100>}
box{<0,0,-0.203200><65.115700,0.035000,0.203200> rotate<0,-90.000000,0> translate<65.252800,-1.535000,0.457100> }
texture{col_pol}
}
#end
union{
cylinder{<26.670000,0.038000,3.810000><26.670000,-1.538000,3.810000>0.406400}
cylinder{<24.130000,0.038000,3.810000><24.130000,-1.538000,3.810000>0.406400}
cylinder{<12.700000,0.038000,11.430000><12.700000,-1.538000,11.430000>0.406400}
cylinder{<15.240000,0.038000,11.430000><15.240000,-1.538000,11.430000>0.406400}
cylinder{<60.960000,0.038000,15.748000><60.960000,-1.538000,15.748000>0.406400}
cylinder{<60.960000,0.038000,12.192000><60.960000,-1.538000,12.192000>0.406400}
cylinder{<53.340000,0.038000,3.810000><53.340000,-1.538000,3.810000>0.406400}
cylinder{<55.880000,0.038000,3.810000><55.880000,-1.538000,3.810000>0.406400}
cylinder{<35.560000,0.038000,13.970000><35.560000,-1.538000,13.970000>0.406400}
cylinder{<33.020000,0.038000,13.970000><33.020000,-1.538000,13.970000>0.406400}
cylinder{<46.990000,0.038000,15.240000><46.990000,-1.538000,15.240000>0.406400}
cylinder{<46.990000,0.038000,12.700000><46.990000,-1.538000,12.700000>0.406400}
cylinder{<46.990000,0.038000,10.160000><46.990000,-1.538000,10.160000>0.406400}
cylinder{<46.990000,0.038000,7.620000><46.990000,-1.538000,7.620000>0.406400}
cylinder{<54.610000,0.038000,7.620000><54.610000,-1.538000,7.620000>0.406400}
cylinder{<54.610000,0.038000,10.160000><54.610000,-1.538000,10.160000>0.406400}
cylinder{<54.610000,0.038000,12.700000><54.610000,-1.538000,12.700000>0.406400}
cylinder{<54.610000,0.038000,15.240000><54.610000,-1.538000,15.240000>0.406400}
cylinder{<10.160000,0.038000,33.020000><10.160000,-1.538000,33.020000>0.406400}
cylinder{<10.160000,0.038000,30.480000><10.160000,-1.538000,30.480000>0.406400}
cylinder{<10.160000,0.038000,27.940000><10.160000,-1.538000,27.940000>0.406400}
cylinder{<10.160000,0.038000,25.400000><10.160000,-1.538000,25.400000>0.406400}
cylinder{<10.160000,0.038000,22.860000><10.160000,-1.538000,22.860000>0.406400}
cylinder{<10.160000,0.038000,20.320000><10.160000,-1.538000,20.320000>0.406400}
cylinder{<10.160000,0.038000,17.780000><10.160000,-1.538000,17.780000>0.406400}
cylinder{<17.780000,0.038000,17.780000><17.780000,-1.538000,17.780000>0.406400}
cylinder{<17.780000,0.038000,20.320000><17.780000,-1.538000,20.320000>0.406400}
cylinder{<17.780000,0.038000,22.860000><17.780000,-1.538000,22.860000>0.406400}
cylinder{<17.780000,0.038000,25.400000><17.780000,-1.538000,25.400000>0.406400}
cylinder{<17.780000,0.038000,27.940000><17.780000,-1.538000,27.940000>0.406400}
cylinder{<17.780000,0.038000,30.480000><17.780000,-1.538000,30.480000>0.406400}
cylinder{<17.780000,0.038000,33.020000><17.780000,-1.538000,33.020000>0.406400}
cylinder{<27.940000,0.038000,33.020000><27.940000,-1.538000,33.020000>0.406400}
cylinder{<27.940000,0.038000,30.480000><27.940000,-1.538000,30.480000>0.406400}
cylinder{<27.940000,0.038000,27.940000><27.940000,-1.538000,27.940000>0.406400}
cylinder{<27.940000,0.038000,25.400000><27.940000,-1.538000,25.400000>0.406400}
cylinder{<27.940000,0.038000,22.860000><27.940000,-1.538000,22.860000>0.406400}
cylinder{<27.940000,0.038000,20.320000><27.940000,-1.538000,20.320000>0.406400}
cylinder{<27.940000,0.038000,17.780000><27.940000,-1.538000,17.780000>0.406400}
cylinder{<35.560000,0.038000,17.780000><35.560000,-1.538000,17.780000>0.406400}
cylinder{<35.560000,0.038000,20.320000><35.560000,-1.538000,20.320000>0.406400}
cylinder{<35.560000,0.038000,22.860000><35.560000,-1.538000,22.860000>0.406400}
cylinder{<35.560000,0.038000,25.400000><35.560000,-1.538000,25.400000>0.406400}
cylinder{<35.560000,0.038000,27.940000><35.560000,-1.538000,27.940000>0.406400}
cylinder{<35.560000,0.038000,30.480000><35.560000,-1.538000,30.480000>0.406400}
cylinder{<35.560000,0.038000,33.020000><35.560000,-1.538000,33.020000>0.406400}
cylinder{<17.780000,0.038000,3.810000><17.780000,-1.538000,3.810000>0.508000}
cylinder{<15.240000,0.038000,3.810000><15.240000,-1.538000,3.810000>0.508000}
cylinder{<12.700000,0.038000,3.810000><12.700000,-1.538000,3.810000>0.508000}
cylinder{<50.800000,0.038000,52.070000><50.800000,-1.538000,52.070000>0.400000}
cylinder{<45.720000,0.038000,52.070000><45.720000,-1.538000,52.070000>0.400000}
cylinder{<40.640000,0.038000,52.070000><40.640000,-1.538000,52.070000>0.400000}
cylinder{<35.560000,0.038000,52.070000><35.560000,-1.538000,52.070000>0.400000}
cylinder{<30.480000,0.038000,52.070000><30.480000,-1.538000,52.070000>0.400000}
cylinder{<25.400000,0.038000,52.070000><25.400000,-1.538000,52.070000>0.400000}
cylinder{<20.320000,0.038000,52.070000><20.320000,-1.538000,52.070000>0.400000}
cylinder{<15.240000,0.038000,52.070000><15.240000,-1.538000,52.070000>0.400000}
cylinder{<39.370000,0.038000,33.020000><39.370000,-1.538000,33.020000>0.406400}
cylinder{<39.370000,0.038000,22.860000><39.370000,-1.538000,22.860000>0.406400}
cylinder{<57.150000,0.038000,30.480000><57.150000,-1.538000,30.480000>0.406400}
cylinder{<52.070000,0.038000,30.480000><52.070000,-1.538000,30.480000>0.406400}
cylinder{<54.610000,0.038000,27.940000><54.610000,-1.538000,27.940000>0.406400}
cylinder{<54.610000,0.038000,20.320000><54.610000,-1.538000,20.320000>0.406400}
cylinder{<44.450000,0.038000,20.320000><44.450000,-1.538000,20.320000>0.406400}
cylinder{<41.910000,0.038000,7.620000><41.910000,-1.538000,7.620000>0.406400}
cylinder{<41.910000,0.038000,17.780000><41.910000,-1.538000,17.780000>0.406400}
cylinder{<6.350000,0.038000,30.480000><6.350000,-1.538000,30.480000>0.406400}
cylinder{<6.350000,0.038000,40.640000><6.350000,-1.538000,40.640000>0.406400}
cylinder{<6.350000,0.038000,27.940000><6.350000,-1.538000,27.940000>0.406400}
cylinder{<6.350000,0.038000,17.780000><6.350000,-1.538000,17.780000>0.406400}
cylinder{<10.160000,0.038000,38.100000><10.160000,-1.538000,38.100000>0.406400}
cylinder{<20.320000,0.038000,38.100000><20.320000,-1.538000,38.100000>0.406400}
cylinder{<24.130000,0.038000,33.020000><24.130000,-1.538000,33.020000>0.406400}
cylinder{<24.130000,0.038000,43.180000><24.130000,-1.538000,43.180000>0.406400}
cylinder{<27.940000,0.038000,41.910000><27.940000,-1.538000,41.910000>0.406400}
cylinder{<30.480000,0.038000,41.910000><30.480000,-1.538000,41.910000>0.406400}
cylinder{<30.480000,0.038000,44.450000><30.480000,-1.538000,44.450000>0.406400}
cylinder{<38.100000,0.038000,41.910000><38.100000,-1.538000,41.910000>0.406400}
cylinder{<40.640000,0.038000,41.910000><40.640000,-1.538000,41.910000>0.406400}
cylinder{<40.640000,0.038000,44.450000><40.640000,-1.538000,44.450000>0.406400}
cylinder{<17.780000,0.038000,41.910000><17.780000,-1.538000,41.910000>0.406400}
cylinder{<20.320000,0.038000,41.910000><20.320000,-1.538000,41.910000>0.406400}
cylinder{<20.320000,0.038000,44.450000><20.320000,-1.538000,44.450000>0.406400}
//Holes(fast)/Vias
cylinder{<24.892000,0.038000,19.304000><24.892000,-1.538000,19.304000>0.127000 }
cylinder{<37.846000,0.038000,20.828000><37.846000,-1.538000,20.828000>0.127000 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.003000,0.000000,58.310800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.731900,0.000000,58.039600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<49.731900,0.000000,58.039600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.731900,0.000000,58.039600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.731900,0.000000,57.497300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<49.731900,0.000000,57.497300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.731900,0.000000,57.497300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.003000,0.000000,57.226200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<49.731900,0.000000,57.497300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.003000,0.000000,57.226200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.274200,0.000000,57.226200>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<50.003000,0.000000,57.226200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.274200,0.000000,57.226200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.545400,0.000000,57.497300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<50.274200,0.000000,57.226200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.545400,0.000000,57.497300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.545400,0.000000,58.039600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<50.545400,0.000000,58.039600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.545400,0.000000,58.039600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.816500,0.000000,58.310800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<50.545400,0.000000,58.039600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.816500,0.000000,58.310800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.087700,0.000000,58.310800>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<50.816500,0.000000,58.310800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.087700,0.000000,58.310800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.358800,0.000000,58.039600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<51.087700,0.000000,58.310800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.358800,0.000000,58.039600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.358800,0.000000,57.497300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.358800,0.000000,57.497300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.358800,0.000000,57.497300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.087700,0.000000,57.226200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<51.087700,0.000000,57.226200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.274200,0.000000,58.863300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.087700,0.000000,58.863300>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<50.274200,0.000000,58.863300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.087700,0.000000,58.863300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.358800,0.000000,59.134400>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<51.087700,0.000000,58.863300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.358800,0.000000,59.134400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.087700,0.000000,59.405600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<51.087700,0.000000,59.405600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.087700,0.000000,59.405600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.358800,0.000000,59.676700>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<51.087700,0.000000,59.405600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.358800,0.000000,59.676700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.087700,0.000000,59.947900>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<51.087700,0.000000,59.947900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.087700,0.000000,59.947900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.274200,0.000000,59.947900>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<50.274200,0.000000,59.947900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.274200,0.000000,60.500400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.274200,0.000000,60.771500>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,90.000000,0> translate<50.274200,0.000000,60.771500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.274200,0.000000,60.771500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.358800,0.000000,60.771500>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<50.274200,0.000000,60.771500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.358800,0.000000,60.500400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.358800,0.000000,61.042700>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<51.358800,0.000000,61.042700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.460700,0.000000,60.771500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.731900,0.000000,60.771500>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,0.000000,0> translate<49.460700,0.000000,60.771500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.003000,0.000000,61.862900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.087700,0.000000,61.862900>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<50.003000,0.000000,61.862900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.087700,0.000000,61.862900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.358800,0.000000,62.134100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<51.087700,0.000000,61.862900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.274200,0.000000,61.591800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.274200,0.000000,62.134100>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<50.274200,0.000000,62.134100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.274200,0.000000,63.767800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.274200,0.000000,62.954300>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,-90.000000,0> translate<50.274200,0.000000,62.954300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.274200,0.000000,62.954300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.545400,0.000000,62.683200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<50.274200,0.000000,62.954300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.545400,0.000000,62.683200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.087700,0.000000,62.683200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<50.545400,0.000000,62.683200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.087700,0.000000,62.683200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.358800,0.000000,62.954300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<51.087700,0.000000,62.683200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.358800,0.000000,62.954300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.358800,0.000000,63.767800>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,90.000000,0> translate<51.358800,0.000000,63.767800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.731900,0.000000,64.320300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.358800,0.000000,64.320300>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<49.731900,0.000000,64.320300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.545400,0.000000,64.320300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.274200,0.000000,64.591400>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<50.274200,0.000000,64.591400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.274200,0.000000,64.591400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.274200,0.000000,65.133700>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<50.274200,0.000000,65.133700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.274200,0.000000,65.133700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.545400,0.000000,65.404900>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<50.274200,0.000000,65.133700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.545400,0.000000,65.404900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.358800,0.000000,65.404900>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<50.545400,0.000000,65.404900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.923000,0.000000,58.310800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.651900,0.000000,58.039600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<44.651900,0.000000,58.039600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.651900,0.000000,58.039600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.651900,0.000000,57.497300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.651900,0.000000,57.497300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.651900,0.000000,57.497300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.923000,0.000000,57.226200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<44.651900,0.000000,57.497300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.923000,0.000000,57.226200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.007700,0.000000,57.226200>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<44.923000,0.000000,57.226200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.007700,0.000000,57.226200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.278800,0.000000,57.497300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.007700,0.000000,57.226200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.278800,0.000000,57.497300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.278800,0.000000,58.039600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<46.278800,0.000000,58.039600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.278800,0.000000,58.039600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.007700,0.000000,58.310800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<46.007700,0.000000,58.310800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.007700,0.000000,58.310800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.465400,0.000000,58.310800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<45.465400,0.000000,58.310800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.465400,0.000000,58.310800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.465400,0.000000,57.768500>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<45.465400,0.000000,57.768500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.278800,0.000000,58.863300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.194200,0.000000,58.863300>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<45.194200,0.000000,58.863300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.194200,0.000000,58.863300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.194200,0.000000,59.676700>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<45.194200,0.000000,59.676700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.194200,0.000000,59.676700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.465400,0.000000,59.947900>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<45.194200,0.000000,59.676700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.465400,0.000000,59.947900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.278800,0.000000,59.947900>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<45.465400,0.000000,59.947900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.651900,0.000000,61.585000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.278800,0.000000,61.585000>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<44.651900,0.000000,61.585000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.278800,0.000000,61.585000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.278800,0.000000,60.771500>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.278800,0.000000,60.771500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.278800,0.000000,60.771500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.007700,0.000000,60.500400>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.007700,0.000000,60.500400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.007700,0.000000,60.500400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.465400,0.000000,60.500400>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<45.465400,0.000000,60.500400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.465400,0.000000,60.500400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.194200,0.000000,60.771500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<45.194200,0.000000,60.771500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.194200,0.000000,60.771500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.194200,0.000000,61.585000>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,90.000000,0> translate<45.194200,0.000000,61.585000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.571900,0.000000,57.226200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.927700,0.000000,57.226200>}
box{<0,0,-0.076200><1.355800,0.036000,0.076200> rotate<0,0.000000,0> translate<39.571900,0.000000,57.226200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.927700,0.000000,57.226200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.198800,0.000000,57.497300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<40.927700,0.000000,57.226200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.198800,0.000000,57.497300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.198800,0.000000,58.039600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<41.198800,0.000000,58.039600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.198800,0.000000,58.039600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.927700,0.000000,58.310800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<40.927700,0.000000,58.310800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.927700,0.000000,58.310800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.571900,0.000000,58.310800>}
box{<0,0,-0.076200><1.355800,0.036000,0.076200> rotate<0,0.000000,0> translate<39.571900,0.000000,58.310800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.741100,0.000000,58.863300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.114200,0.000000,58.863300>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<40.114200,0.000000,58.863300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.114200,0.000000,58.863300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.114200,0.000000,59.676700>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<40.114200,0.000000,59.676700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.114200,0.000000,59.676700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.385400,0.000000,59.947900>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<40.114200,0.000000,59.676700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.385400,0.000000,59.947900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.927700,0.000000,59.947900>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<40.385400,0.000000,59.947900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.927700,0.000000,59.947900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.198800,0.000000,59.676700>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<40.927700,0.000000,59.947900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.198800,0.000000,59.676700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.198800,0.000000,58.863300>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.198800,0.000000,58.863300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.145400,0.000000,57.226200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.145400,0.000000,58.310800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<25.145400,0.000000,58.310800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.603000,0.000000,57.768500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.687700,0.000000,57.768500>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<24.603000,0.000000,57.768500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.331900,0.000000,59.947900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.331900,0.000000,58.863300>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.331900,0.000000,58.863300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.331900,0.000000,58.863300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.145400,0.000000,58.863300>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<24.331900,0.000000,58.863300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.145400,0.000000,58.863300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.874200,0.000000,59.405600>}
box{<0,0,-0.076200><0.606332,0.036000,0.076200> rotate<0,63.426537,0> translate<24.874200,0.000000,59.405600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.874200,0.000000,59.405600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.874200,0.000000,59.676700>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,90.000000,0> translate<24.874200,0.000000,59.676700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.874200,0.000000,59.676700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.145400,0.000000,59.947900>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<24.874200,0.000000,59.676700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.145400,0.000000,59.947900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.687700,0.000000,59.947900>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<25.145400,0.000000,59.947900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.687700,0.000000,59.947900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.958800,0.000000,59.676700>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<25.687700,0.000000,59.947900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.958800,0.000000,59.676700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.958800,0.000000,59.134400>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.958800,0.000000,59.134400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.958800,0.000000,59.134400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.687700,0.000000,58.863300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<25.687700,0.000000,58.863300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.331900,0.000000,60.500400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.416500,0.000000,60.500400>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<24.331900,0.000000,60.500400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.416500,0.000000,60.500400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.958800,0.000000,61.042700>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<25.416500,0.000000,60.500400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.958800,0.000000,61.042700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.416500,0.000000,61.585000>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<25.416500,0.000000,61.585000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.416500,0.000000,61.585000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.331900,0.000000,61.585000>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<24.331900,0.000000,61.585000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.331900,0.000000,62.137500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.958800,0.000000,62.137500>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<24.331900,0.000000,62.137500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.958800,0.000000,62.137500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.958800,0.000000,62.950900>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<25.958800,0.000000,62.950900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.958800,0.000000,62.950900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.687700,0.000000,63.222100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<25.687700,0.000000,63.222100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.687700,0.000000,63.222100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.603000,0.000000,63.222100>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<24.603000,0.000000,63.222100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.603000,0.000000,63.222100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.331900,0.000000,62.950900>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<24.331900,0.000000,62.950900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.331900,0.000000,62.950900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.331900,0.000000,62.137500>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.331900,0.000000,62.137500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.603000,0.000000,64.859200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.331900,0.000000,64.588000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<24.331900,0.000000,64.588000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.331900,0.000000,64.588000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.331900,0.000000,64.045700>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.331900,0.000000,64.045700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.331900,0.000000,64.045700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.603000,0.000000,63.774600>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<24.331900,0.000000,64.045700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.603000,0.000000,63.774600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.687700,0.000000,63.774600>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<24.603000,0.000000,63.774600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.687700,0.000000,63.774600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.958800,0.000000,64.045700>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<25.687700,0.000000,63.774600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.958800,0.000000,64.045700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.958800,0.000000,64.588000>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<25.958800,0.000000,64.588000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.958800,0.000000,64.588000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.687700,0.000000,64.859200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<25.687700,0.000000,64.859200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.305400,0.000000,57.226200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.305400,0.000000,58.310800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<35.305400,0.000000,58.310800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.763000,0.000000,57.768500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.847700,0.000000,57.768500>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<34.763000,0.000000,57.768500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.491900,0.000000,59.947900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.491900,0.000000,58.863300>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.491900,0.000000,58.863300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.491900,0.000000,58.863300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.305400,0.000000,58.863300>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<34.491900,0.000000,58.863300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.305400,0.000000,58.863300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.034200,0.000000,59.405600>}
box{<0,0,-0.076200><0.606332,0.036000,0.076200> rotate<0,63.426537,0> translate<35.034200,0.000000,59.405600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.034200,0.000000,59.405600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.034200,0.000000,59.676700>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,90.000000,0> translate<35.034200,0.000000,59.676700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.034200,0.000000,59.676700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.305400,0.000000,59.947900>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<35.034200,0.000000,59.676700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.305400,0.000000,59.947900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.847700,0.000000,59.947900>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<35.305400,0.000000,59.947900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.847700,0.000000,59.947900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.118800,0.000000,59.676700>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<35.847700,0.000000,59.947900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.118800,0.000000,59.676700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.118800,0.000000,59.134400>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.118800,0.000000,59.134400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.118800,0.000000,59.134400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.847700,0.000000,58.863300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<35.847700,0.000000,58.863300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.491900,0.000000,60.500400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.576500,0.000000,60.500400>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<34.491900,0.000000,60.500400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.576500,0.000000,60.500400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.118800,0.000000,61.042700>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<35.576500,0.000000,60.500400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.118800,0.000000,61.042700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.576500,0.000000,61.585000>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<35.576500,0.000000,61.585000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.576500,0.000000,61.585000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.491900,0.000000,61.585000>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<34.491900,0.000000,61.585000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.491900,0.000000,62.137500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.118800,0.000000,62.137500>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<34.491900,0.000000,62.137500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.118800,0.000000,62.137500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.118800,0.000000,62.950900>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<36.118800,0.000000,62.950900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.118800,0.000000,62.950900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.847700,0.000000,63.222100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<35.847700,0.000000,63.222100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.847700,0.000000,63.222100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.763000,0.000000,63.222100>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<34.763000,0.000000,63.222100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.763000,0.000000,63.222100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.491900,0.000000,62.950900>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<34.491900,0.000000,62.950900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.491900,0.000000,62.950900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.491900,0.000000,62.137500>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.491900,0.000000,62.137500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.763000,0.000000,64.859200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.491900,0.000000,64.588000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<34.491900,0.000000,64.588000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.491900,0.000000,64.588000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.491900,0.000000,64.045700>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.491900,0.000000,64.045700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.491900,0.000000,64.045700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.763000,0.000000,63.774600>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<34.491900,0.000000,64.045700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.763000,0.000000,63.774600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.847700,0.000000,63.774600>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<34.763000,0.000000,63.774600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.847700,0.000000,63.774600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.118800,0.000000,64.045700>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<35.847700,0.000000,63.774600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.118800,0.000000,64.045700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.118800,0.000000,64.588000>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<36.118800,0.000000,64.588000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.118800,0.000000,64.588000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.847700,0.000000,64.859200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<35.847700,0.000000,64.859200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.985400,0.000000,57.226200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.985400,0.000000,58.310800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<14.985400,0.000000,58.310800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.443000,0.000000,57.768500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.527700,0.000000,57.768500>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<14.443000,0.000000,57.768500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.171900,0.000000,59.947900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.171900,0.000000,58.863300>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.171900,0.000000,58.863300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.171900,0.000000,58.863300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.985400,0.000000,58.863300>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<14.171900,0.000000,58.863300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.985400,0.000000,58.863300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714200,0.000000,59.405600>}
box{<0,0,-0.076200><0.606332,0.036000,0.076200> rotate<0,63.426537,0> translate<14.714200,0.000000,59.405600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714200,0.000000,59.405600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714200,0.000000,59.676700>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,90.000000,0> translate<14.714200,0.000000,59.676700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714200,0.000000,59.676700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.985400,0.000000,59.947900>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.714200,0.000000,59.676700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.985400,0.000000,59.947900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.527700,0.000000,59.947900>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<14.985400,0.000000,59.947900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.527700,0.000000,59.947900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.798800,0.000000,59.676700>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<15.527700,0.000000,59.947900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.798800,0.000000,59.676700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.798800,0.000000,59.134400>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.798800,0.000000,59.134400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.798800,0.000000,59.134400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.527700,0.000000,58.863300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<15.527700,0.000000,58.863300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.171900,0.000000,60.500400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.256500,0.000000,60.500400>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<14.171900,0.000000,60.500400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.256500,0.000000,60.500400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.798800,0.000000,61.042700>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<15.256500,0.000000,60.500400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.798800,0.000000,61.042700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.256500,0.000000,61.585000>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<15.256500,0.000000,61.585000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.256500,0.000000,61.585000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.171900,0.000000,61.585000>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<14.171900,0.000000,61.585000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.171900,0.000000,62.137500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.798800,0.000000,62.137500>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<14.171900,0.000000,62.137500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.798800,0.000000,62.137500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.798800,0.000000,62.950900>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<15.798800,0.000000,62.950900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.798800,0.000000,62.950900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.527700,0.000000,63.222100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<15.527700,0.000000,63.222100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.527700,0.000000,63.222100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.443000,0.000000,63.222100>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<14.443000,0.000000,63.222100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.443000,0.000000,63.222100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.171900,0.000000,62.950900>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<14.171900,0.000000,62.950900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.171900,0.000000,62.950900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.171900,0.000000,62.137500>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.171900,0.000000,62.137500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.443000,0.000000,64.859200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.171900,0.000000,64.588000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<14.171900,0.000000,64.588000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.171900,0.000000,64.588000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.171900,0.000000,64.045700>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.171900,0.000000,64.045700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.171900,0.000000,64.045700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.443000,0.000000,63.774600>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<14.171900,0.000000,64.045700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.443000,0.000000,63.774600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.527700,0.000000,63.774600>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<14.443000,0.000000,63.774600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.527700,0.000000,63.774600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.798800,0.000000,64.045700>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<15.527700,0.000000,63.774600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.798800,0.000000,64.045700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.798800,0.000000,64.588000>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<15.798800,0.000000,64.588000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.798800,0.000000,64.588000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.527700,0.000000,64.859200>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<15.527700,0.000000,64.859200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.038800,0.000000,57.768500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.411900,0.000000,57.768500>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<29.411900,0.000000,57.768500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.411900,0.000000,57.226200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.411900,0.000000,58.310800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<29.411900,0.000000,58.310800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.038800,0.000000,58.863300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.954200,0.000000,58.863300>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<29.954200,0.000000,58.863300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.496500,0.000000,58.863300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.954200,0.000000,59.405600>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<29.954200,0.000000,59.405600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.954200,0.000000,59.405600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.954200,0.000000,59.676700>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,90.000000,0> translate<29.954200,0.000000,59.676700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.954200,0.000000,60.498600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.954200,0.000000,61.040900>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<29.954200,0.000000,61.040900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.954200,0.000000,61.040900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.225400,0.000000,61.312100>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.954200,0.000000,61.040900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.225400,0.000000,61.312100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.038800,0.000000,61.312100>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<30.225400,0.000000,61.312100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.038800,0.000000,61.312100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.038800,0.000000,60.498600>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.038800,0.000000,60.498600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.038800,0.000000,60.498600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.767700,0.000000,60.227500>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<30.767700,0.000000,60.227500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.767700,0.000000,60.227500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.496500,0.000000,60.498600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<30.496500,0.000000,60.498600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.496500,0.000000,60.498600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.496500,0.000000,61.312100>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,90.000000,0> translate<30.496500,0.000000,61.312100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.038800,0.000000,61.864600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.954200,0.000000,61.864600>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<29.954200,0.000000,61.864600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.954200,0.000000,61.864600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.954200,0.000000,62.678000>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<29.954200,0.000000,62.678000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.954200,0.000000,62.678000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.225400,0.000000,62.949200>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.954200,0.000000,62.678000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.225400,0.000000,62.949200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.038800,0.000000,62.949200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<30.225400,0.000000,62.949200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.038800,0.000000,63.501700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.038800,0.000000,64.315100>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<31.038800,0.000000,64.315100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.038800,0.000000,64.315100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.767700,0.000000,64.586300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<30.767700,0.000000,64.586300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.767700,0.000000,64.586300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.496500,0.000000,64.315100>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<30.496500,0.000000,64.315100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.496500,0.000000,64.315100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.496500,0.000000,63.772800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.496500,0.000000,63.772800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.496500,0.000000,63.772800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.225400,0.000000,63.501700>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<30.225400,0.000000,63.501700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.225400,0.000000,63.501700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.954200,0.000000,63.772800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<29.954200,0.000000,63.772800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.954200,0.000000,63.772800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.954200,0.000000,64.586300>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,90.000000,0> translate<29.954200,0.000000,64.586300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.251900,0.000000,57.226200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.878800,0.000000,57.226200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,0.000000,0> translate<19.251900,0.000000,57.226200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.878800,0.000000,57.226200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.878800,0.000000,58.039600>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<20.878800,0.000000,58.039600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.878800,0.000000,58.039600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.607700,0.000000,58.310800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<20.607700,0.000000,58.310800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.607700,0.000000,58.310800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.523000,0.000000,58.310800>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,0.000000,0> translate<19.523000,0.000000,58.310800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.523000,0.000000,58.310800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.251900,0.000000,58.039600>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<19.251900,0.000000,58.039600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.251900,0.000000,58.039600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.251900,0.000000,57.226200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.251900,0.000000,57.226200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.878800,0.000000,59.134400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.878800,0.000000,59.676700>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<20.878800,0.000000,59.676700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.878800,0.000000,59.676700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.607700,0.000000,59.947900>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<20.607700,0.000000,59.947900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.607700,0.000000,59.947900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.065400,0.000000,59.947900>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<20.065400,0.000000,59.947900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.065400,0.000000,59.947900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.794200,0.000000,59.676700>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<19.794200,0.000000,59.676700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.794200,0.000000,59.676700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.794200,0.000000,59.134400>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.794200,0.000000,59.134400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.794200,0.000000,59.134400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.065400,0.000000,58.863300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<19.794200,0.000000,59.134400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.065400,0.000000,58.863300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.607700,0.000000,58.863300>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<20.065400,0.000000,58.863300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.607700,0.000000,58.863300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.878800,0.000000,59.134400>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.607700,0.000000,58.863300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.794200,0.000000,60.500400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.607700,0.000000,60.500400>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<19.794200,0.000000,60.500400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.607700,0.000000,60.500400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.878800,0.000000,60.771500>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.607700,0.000000,60.500400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.878800,0.000000,60.771500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.607700,0.000000,61.042700>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<20.607700,0.000000,61.042700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.607700,0.000000,61.042700>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.878800,0.000000,61.313800>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.607700,0.000000,61.042700> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.878800,0.000000,61.313800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.607700,0.000000,61.585000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,45.007595,0> translate<20.607700,0.000000,61.585000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.607700,0.000000,61.585000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.794200,0.000000,61.585000>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<19.794200,0.000000,61.585000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.878800,0.000000,62.137500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.794200,0.000000,62.137500>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<19.794200,0.000000,62.137500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.794200,0.000000,62.137500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.794200,0.000000,62.950900>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,90.000000,0> translate<19.794200,0.000000,62.950900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.794200,0.000000,62.950900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.065400,0.000000,63.222100>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<19.794200,0.000000,62.950900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.065400,0.000000,63.222100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.878800,0.000000,63.222100>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<20.065400,0.000000,63.222100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.336200,0.000000,37.263100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.336200,0.000000,35.636200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.336200,0.000000,35.636200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.336200,0.000000,35.636200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.149600,0.000000,35.636200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<48.336200,0.000000,35.636200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.149600,0.000000,35.636200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.420800,0.000000,35.907300>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<49.149600,0.000000,35.636200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.420800,0.000000,35.907300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.420800,0.000000,36.992000>}
box{<0,0,-0.076200><1.084700,0.036000,0.076200> rotate<0,90.000000,0> translate<49.420800,0.000000,36.992000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.420800,0.000000,36.992000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.149600,0.000000,37.263100>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<49.149600,0.000000,37.263100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.149600,0.000000,37.263100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.336200,0.000000,37.263100>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<48.336200,0.000000,37.263100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.786700,0.000000,35.636200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.244400,0.000000,35.636200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<50.244400,0.000000,35.636200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.244400,0.000000,35.636200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.973300,0.000000,35.907300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<49.973300,0.000000,35.907300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.973300,0.000000,35.907300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.973300,0.000000,36.449600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<49.973300,0.000000,36.449600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.973300,0.000000,36.449600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.244400,0.000000,36.720800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<49.973300,0.000000,36.449600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.244400,0.000000,36.720800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.786700,0.000000,36.720800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<50.244400,0.000000,36.720800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.786700,0.000000,36.720800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.057900,0.000000,36.449600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<50.786700,0.000000,36.720800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.057900,0.000000,36.449600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.057900,0.000000,36.178500>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.057900,0.000000,36.178500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.057900,0.000000,36.178500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.973300,0.000000,36.178500>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<49.973300,0.000000,36.178500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.610400,0.000000,37.263100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.881500,0.000000,37.263100>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<51.610400,0.000000,37.263100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.881500,0.000000,37.263100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.881500,0.000000,35.636200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.881500,0.000000,35.636200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.610400,0.000000,35.636200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.152700,0.000000,35.636200>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<51.610400,0.000000,35.636200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.972900,0.000000,36.720800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.515200,0.000000,36.720800>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,0.000000,0> translate<52.972900,0.000000,36.720800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.515200,0.000000,36.720800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.786400,0.000000,36.449600>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,44.997030,0> translate<53.515200,0.000000,36.720800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.786400,0.000000,36.449600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.786400,0.000000,35.636200>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.786400,0.000000,35.636200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.786400,0.000000,35.636200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.972900,0.000000,35.636200>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<52.972900,0.000000,35.636200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.972900,0.000000,35.636200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.701800,0.000000,35.907300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<52.701800,0.000000,35.907300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.701800,0.000000,35.907300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.972900,0.000000,36.178500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<52.701800,0.000000,35.907300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.972900,0.000000,36.178500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.786400,0.000000,36.178500>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<52.972900,0.000000,36.178500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.338900,0.000000,36.720800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.338900,0.000000,35.907300>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,-90.000000,0> translate<54.338900,0.000000,35.907300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.338900,0.000000,35.907300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,35.636200>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<54.338900,0.000000,35.907300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,35.636200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.423500,0.000000,35.636200>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<54.610000,0.000000,35.636200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.423500,0.000000,36.720800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.423500,0.000000,35.365100>}
box{<0,0,-0.076200><1.355700,0.036000,0.076200> rotate<0,-90.000000,0> translate<55.423500,0.000000,35.365100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.423500,0.000000,35.365100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.152300,0.000000,35.093900>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<55.152300,0.000000,35.093900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.152300,0.000000,35.093900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.881200,0.000000,35.093900>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<54.881200,0.000000,35.093900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.613100,0.000000,35.636200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.613100,0.000000,36.720800>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,90.000000,0> translate<57.613100,0.000000,36.720800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.613100,0.000000,36.720800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.155400,0.000000,37.263100>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<57.613100,0.000000,36.720800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.155400,0.000000,37.263100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.697700,0.000000,36.720800>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<58.155400,0.000000,37.263100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.697700,0.000000,36.720800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.697700,0.000000,35.636200>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,-90.000000,0> translate<58.697700,0.000000,35.636200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.613100,0.000000,36.449600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.697700,0.000000,36.449600>}
box{<0,0,-0.076200><1.084600,0.036000,0.076200> rotate<0,0.000000,0> translate<57.613100,0.000000,36.449600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.334800,0.000000,37.263100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.334800,0.000000,35.636200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.334800,0.000000,35.636200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.334800,0.000000,35.636200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.521300,0.000000,35.636200>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<59.521300,0.000000,35.636200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.521300,0.000000,35.636200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.250200,0.000000,35.907300>}
box{<0,0,-0.076200><0.383393,0.036000,0.076200> rotate<0,44.997030,0> translate<59.250200,0.000000,35.907300> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.250200,0.000000,35.907300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.250200,0.000000,36.449600>}
box{<0,0,-0.076200><0.542300,0.036000,0.076200> rotate<0,90.000000,0> translate<59.250200,0.000000,36.449600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.250200,0.000000,36.449600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.521300,0.000000,36.720800>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-45.007595,0> translate<59.250200,0.000000,36.449600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.521300,0.000000,36.720800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.334800,0.000000,36.720800>}
box{<0,0,-0.076200><0.813500,0.036000,0.076200> rotate<0,0.000000,0> translate<59.521300,0.000000,36.720800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.887300,0.000000,35.093900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.158400,0.000000,35.093900>}
box{<0,0,-0.076200><0.271100,0.036000,0.076200> rotate<0,0.000000,0> translate<60.887300,0.000000,35.093900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.158400,0.000000,35.093900>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.429600,0.000000,35.365100>}
box{<0,0,-0.076200><0.383535,0.036000,0.076200> rotate<0,-44.997030,0> translate<61.158400,0.000000,35.093900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.429600,0.000000,35.365100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.429600,0.000000,36.720800>}
box{<0,0,-0.076200><1.355700,0.036000,0.076200> rotate<0,90.000000,0> translate<61.429600,0.000000,36.720800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.429600,0.000000,37.534300>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.429600,0.000000,37.263100>}
box{<0,0,-0.076200><0.271200,0.036000,0.076200> rotate<0,-90.000000,0> translate<61.429600,0.000000,37.263100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.446200,0.000000,1.346200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.446200,0.000000,2.973100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<39.446200,0.000000,2.973100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.446200,0.000000,2.973100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.259600,0.000000,2.973100>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<39.446200,0.000000,2.973100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.259600,0.000000,2.973100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.530800,0.000000,2.702000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<40.259600,0.000000,2.973100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.530800,0.000000,2.702000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.530800,0.000000,2.159600>}
box{<0,0,-0.076200><0.542400,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.530800,0.000000,2.159600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.530800,0.000000,2.159600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.259600,0.000000,1.888500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<40.259600,0.000000,1.888500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.259600,0.000000,1.888500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.446200,0.000000,1.888500>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<39.446200,0.000000,1.888500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.083300,0.000000,2.973100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.083300,0.000000,1.346200>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.083300,0.000000,1.346200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.083300,0.000000,1.346200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.625600,0.000000,1.888500>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.083300,0.000000,1.346200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.625600,0.000000,1.888500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.167900,0.000000,1.346200>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<41.625600,0.000000,1.888500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.167900,0.000000,1.346200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.167900,0.000000,2.973100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<42.167900,0.000000,2.973100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.720400,0.000000,1.346200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.720400,0.000000,2.973100>}
box{<0,0,-0.076200><1.626900,0.036000,0.076200> rotate<0,90.000000,0> translate<42.720400,0.000000,2.973100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.720400,0.000000,2.973100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.533800,0.000000,2.973100>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<42.720400,0.000000,2.973100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.533800,0.000000,2.973100>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.805000,0.000000,2.702000>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,44.986466,0> translate<43.533800,0.000000,2.973100> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.805000,0.000000,2.702000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.805000,0.000000,2.159600>}
box{<0,0,-0.076200><0.542400,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.805000,0.000000,2.159600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.805000,0.000000,2.159600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.533800,0.000000,1.888500>}
box{<0,0,-0.076200><0.383464,0.036000,0.076200> rotate<0,-44.986466,0> translate<43.533800,0.000000,1.888500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.533800,0.000000,1.888500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.720400,0.000000,1.888500>}
box{<0,0,-0.076200><0.813400,0.036000,0.076200> rotate<0,0.000000,0> translate<42.720400,0.000000,1.888500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.262700,0.000000,1.888500>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.805000,0.000000,1.346200>}
box{<0,0,-0.076200><0.766928,0.036000,0.076200> rotate<0,44.997030,0> translate<43.262700,0.000000,1.888500> }
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,2.540000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.241000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,5.080000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.241000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.987000,0.000000,2.794000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.987000,0.000000,4.826000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.987000,0.000000,4.826000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,2.794000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.813000,0.000000,4.826000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<27.813000,0.000000,4.826000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<23.241000,0.000000,2.794000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<27.559000,0.000000,2.794000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<23.241000,0.000000,4.826000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<27.559000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.638000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.019000,0.000000,3.810000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.638000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.019000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,3.810000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.019000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.146000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.146000,0.000000,3.048000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,-90.000000,0> translate<25.146000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.146000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.146000,0.000000,4.572000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,90.000000,0> translate<25.146000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.654000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.654000,0.000000,3.810000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,90.000000,0> translate<25.654000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.654000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.654000,0.000000,4.572000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,90.000000,0> translate<25.654000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.654000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,3.810000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.654000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.162000,0.000000,3.810000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.781000,0.000000,3.810000> }
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.938000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,12.700000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.938000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,12.319000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,12.700000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.319000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,12.700000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.319000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,13.081000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.319000,0.000000,13.081000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.208000,0.000000,11.430000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.319000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.208000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.208000,0.000000,10.160000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.208000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.208000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,10.160000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.208000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,12.700000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.716000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.716000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.208000,0.000000,12.700000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.208000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.208000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.208000,0.000000,11.430000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.208000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.621000,0.000000,11.430000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.605000,0.000000,11.430000> }
difference{
cylinder{<13.970000,0,11.430000><13.970000,0.036000,11.430000>2.870200 translate<0,0.000000,0>}
cylinder{<13.970000,-0.1,11.430000><13.970000,0.135000,11.430000>2.717800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-0.000000,0> translate<14.478000,0.000000,11.430000>}
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.103000,0.000000,17.399000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.103000,0.000000,16.637000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<62.103000,0.000000,16.637000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.722000,0.000000,17.018000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.484000,0.000000,17.018000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<61.722000,0.000000,17.018000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.960000,0.000000,15.621000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.960000,0.000000,14.732000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.960000,0.000000,14.732000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.960000,0.000000,14.732000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,14.732000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<59.690000,0.000000,14.732000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,14.732000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,14.224000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.690000,0.000000,14.224000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,14.224000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,14.224000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<59.690000,0.000000,14.224000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,14.224000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,14.732000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<62.230000,0.000000,14.732000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,14.732000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.960000,0.000000,14.732000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.960000,0.000000,14.732000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.960000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.960000,0.000000,12.319000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,-90.000000,0> translate<60.960000,0.000000,12.319000> }
difference{
cylinder{<60.960000,0,13.970000><60.960000,0.036000,13.970000>4.140200 translate<0,0.000000,0>}
cylinder{<60.960000,-0.1,13.970000><60.960000,0.135000,13.970000>3.987800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-270.000000,0> translate<60.960000,0.000000,13.462000>}
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.451000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.769000,0.000000,5.080000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.451000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.769000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.451000,0.000000,2.540000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.451000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.023000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.023000,0.000000,2.794000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.023000,0.000000,2.794000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.197000,0.000000,4.826000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.197000,0.000000,2.794000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.197000,0.000000,2.794000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<56.769000,0.000000,4.826000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<52.451000,0.000000,4.826000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<56.769000,0.000000,2.794000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<52.451000,0.000000,2.794000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.991000,0.000000,3.810000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<54.991000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.991000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.864000,0.000000,3.810000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<54.864000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.864000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.864000,0.000000,4.572000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,90.000000,0> translate<54.864000,0.000000,4.572000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.864000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.864000,0.000000,3.048000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,-90.000000,0> translate<54.864000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.356000,0.000000,4.572000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.356000,0.000000,3.810000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,-90.000000,0> translate<54.356000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.356000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.356000,0.000000,3.048000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,-90.000000,0> translate<54.356000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.356000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.229000,0.000000,3.810000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<54.229000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.229000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.848000,0.000000,3.810000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.848000,0.000000,3.810000> }
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.449000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.131000,0.000000,12.700000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.131000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.131000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.449000,0.000000,15.240000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.131000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.877000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.877000,0.000000,14.986000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<31.877000,0.000000,14.986000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,14.986000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<36.703000,0.000000,14.986000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<32.131000,0.000000,12.954000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<36.449000,0.000000,12.954000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<32.131000,0.000000,14.986000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<36.449000,0.000000,14.986000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.528000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.909000,0.000000,13.970000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<33.528000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.909000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.036000,0.000000,13.970000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<33.909000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.036000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.036000,0.000000,13.208000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,-90.000000,0> translate<34.036000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.036000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.036000,0.000000,14.732000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,90.000000,0> translate<34.036000,0.000000,14.732000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.544000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.544000,0.000000,13.970000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,90.000000,0> translate<34.544000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.544000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.544000,0.000000,14.732000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,90.000000,0> translate<34.544000,0.000000,14.732000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.544000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,13.970000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.544000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.052000,0.000000,13.970000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.671000,0.000000,13.970000> }
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.721000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.721000,0.000000,16.510000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,90.000000,0> translate<53.721000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.879000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.879000,0.000000,6.350000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,-90.000000,0> translate<47.879000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.721000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.879000,0.000000,6.350000>}
box{<0,0,-0.076200><5.842000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.879000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.721000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.816000,0.000000,16.510000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.816000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.879000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.784000,0.000000,16.510000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.879000,0.000000,16.510000> }
object{ARC(1.016000,0.152400,180.000000,360.000000,0.036000) translate<50.800000,0.000000,16.510000>}
//IC2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,34.290000>}
box{<0,0,-0.076200><17.780000,0.036000,0.076200> rotate<0,90.000000,0> translate<16.891000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.049000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.049000,0.000000,16.510000>}
box{<0,0,-0.076200><17.780000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.049000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.049000,0.000000,16.510000>}
box{<0,0,-0.076200><5.842000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.049000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.986000,0.000000,34.290000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.986000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.049000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.954000,0.000000,34.290000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.049000,0.000000,34.290000> }
object{ARC(1.016000,0.152400,180.000000,360.000000,0.036000) translate<13.970000,0.000000,34.290000>}
//IC3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,34.290000>}
box{<0,0,-0.076200><17.780000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.671000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.829000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.829000,0.000000,16.510000>}
box{<0,0,-0.076200><17.780000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.829000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.829000,0.000000,16.510000>}
box{<0,0,-0.076200><5.842000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.829000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,34.290000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.766000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.829000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.734000,0.000000,34.290000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.829000,0.000000,34.290000> }
object{ARC(1.016000,0.152400,180.000000,360.000000,0.036000) translate<31.750000,0.000000,34.290000>}
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
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.520000,0.000000,11.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.420000,0.000000,11.160000>}
box{<0,0,-0.101600><2.100000,0.036000,0.101600> rotate<0,0.000000,0> translate<35.420000,0.000000,11.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.520000,0.000000,0.460000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.520000,0.000000,5.760000>}
box{<0,0,-0.101600><5.300000,0.036000,0.101600> rotate<0,90.000000,0> translate<37.520000,0.000000,5.760000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.520000,0.000000,11.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.520000,0.000000,10.460000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<37.520000,0.000000,10.460000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.520000,0.000000,0.460000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.520000,0.000000,11.160000>}
box{<0,0,-0.101600><10.700000,0.036000,0.101600> rotate<0,90.000000,0> translate<28.520000,0.000000,11.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.520000,0.000000,11.160000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.620000,0.000000,11.160000>}
box{<0,0,-0.101600><2.100000,0.036000,0.101600> rotate<0,0.000000,0> translate<28.520000,0.000000,11.160000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.520000,0.000000,0.460000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.520000,0.000000,0.460000>}
box{<0,0,-0.101600><9.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<28.520000,0.000000,0.460000> }
//J2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.340000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.340000,0.000000,46.990000>}
box{<0,0,-0.063500><8.890000,0.036000,0.063500> rotate<0,-90.000000,0> translate<53.340000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.340000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.700000,0.000000,46.990000>}
box{<0,0,-0.063500><40.640000,0.036000,0.063500> rotate<0,0.000000,0> translate<12.700000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.700000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.700000,0.000000,55.880000>}
box{<0,0,-0.063500><8.890000,0.036000,0.063500> rotate<0,90.000000,0> translate<12.700000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.700000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.970000,0.000000,55.880000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<12.700000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.970000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.510000,0.000000,55.880000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<13.970000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.510000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.050000,0.000000,55.880000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<16.510000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.050000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.590000,0.000000,55.880000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<19.050000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.590000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.130000,0.000000,55.880000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<21.590000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.130000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.670000,0.000000,55.880000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<24.130000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.670000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.210000,0.000000,55.880000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<26.670000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.210000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.750000,0.000000,55.880000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<29.210000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.750000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.290000,0.000000,55.880000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<31.750000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.290000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.830000,0.000000,55.880000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<34.290000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.830000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.370000,0.000000,55.880000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<36.830000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.370000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.910000,0.000000,55.880000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<39.370000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.910000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.450000,0.000000,55.880000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<41.910000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.450000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.990000,0.000000,55.880000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<44.450000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.990000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.530000,0.000000,55.880000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<46.990000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.530000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.070000,0.000000,55.880000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<49.530000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.070000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.340000,0.000000,55.880000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<52.070000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.070000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.970000,0.000000,48.260000>}
box{<0,0,-0.063500><38.100000,0.036000,0.063500> rotate<0,0.000000,0> translate<13.970000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.070000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.530000,0.000000,54.610000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<49.530000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.990000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.450000,0.000000,54.610000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<44.450000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.910000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.370000,0.000000,54.610000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<39.370000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.830000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.290000,0.000000,54.610000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<34.290000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.750000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.210000,0.000000,54.610000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<29.210000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.670000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.130000,0.000000,54.610000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<24.130000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.590000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.050000,0.000000,54.610000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<19.050000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.510000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.970000,0.000000,54.610000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<13.970000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.070000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.070000,0.000000,55.880000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<52.070000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.530000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.530000,0.000000,55.880000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<49.530000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.990000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.990000,0.000000,55.880000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<46.990000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.450000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<44.450000,0.000000,55.880000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<44.450000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.910000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.910000,0.000000,55.880000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<41.910000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.370000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.370000,0.000000,55.880000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<39.370000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.830000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.830000,0.000000,55.880000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<36.830000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.290000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.290000,0.000000,55.880000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<34.290000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.750000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.750000,0.000000,55.880000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<31.750000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.210000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.210000,0.000000,55.880000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<29.210000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.670000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.670000,0.000000,55.880000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<26.670000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.130000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.130000,0.000000,55.880000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<24.130000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.590000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.590000,0.000000,55.880000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<21.590000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.050000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.050000,0.000000,55.880000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<19.050000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.510000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.510000,0.000000,55.880000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<16.510000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.970000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.970000,0.000000,55.880000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<13.970000,0.000000,55.880000> }
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.370000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.370000,0.000000,23.876000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<39.370000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.370000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.370000,0.000000,32.004000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<39.370000,0.000000,32.004000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<40.259000,0.000000,30.861000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<38.481000,0.000000,30.861000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<38.481000,0.000000,25.019000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<40.259000,0.000000,25.019000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.259000,0.000000,31.115000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.481000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,30.861000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,30.480000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.513000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,30.353000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,30.480000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<40.386000,0.000000,30.353000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,0.000000,30.861000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,0.000000,30.480000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.227000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.354000,0.000000,30.353000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,0.000000,30.480000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<38.227000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,25.527000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,25.400000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<40.386000,0.000000,25.527000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,25.527000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,30.353000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<40.386000,0.000000,30.353000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.354000,0.000000,25.527000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,0.000000,25.400000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<38.227000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.354000,0.000000,25.527000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.354000,0.000000,30.353000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<38.354000,0.000000,30.353000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,25.019000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,25.400000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<40.513000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,0.000000,25.019000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.227000,0.000000,25.400000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<38.227000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.259000,0.000000,24.765000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.481000,0.000000,24.765000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<39.370000,0.000000,24.333200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<39.370000,0.000000,31.546800>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.435000,0.000000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,27.051000>}
box{<0,0,-0.076200><6.350000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.435000,0.000000,27.051000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,33.909000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,33.909000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.150000,0.000000,33.909000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.435000,0.000000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.181000,0.000000,27.305000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<51.181000,0.000000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.435000,0.000000,33.909000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.181000,0.000000,33.655000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<51.181000,0.000000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.181000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.181000,0.000000,32.004000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.181000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.181000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.181000,0.000000,30.734000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.181000,0.000000,30.734000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.181000,0.000000,30.734000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.181000,0.000000,27.305000>}
box{<0,0,-0.076200><3.429000,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.181000,0.000000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,33.909000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.039000,0.000000,33.655000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<57.785000,0.000000,33.909000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.039000,0.000000,27.305000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<57.785000,0.000000,27.051000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.039000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.039000,0.000000,30.734000>}
box{<0,0,-0.076200><3.429000,0.036000,0.076200> rotate<0,90.000000,0> translate<58.039000,0.000000,30.734000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.039000,0.000000,30.734000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.039000,0.000000,32.004000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<58.039000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.039000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.039000,0.000000,33.655000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,90.000000,0> translate<58.039000,0.000000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.848000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.086000,0.000000,30.480000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.086000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.086000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.086000,0.000000,29.718000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.086000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.086000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.848000,0.000000,29.718000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.086000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.848000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.229000,0.000000,29.337000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,44.997030,0> translate<53.848000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.229000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.229000,0.000000,28.956000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<54.229000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.229000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.991000,0.000000,28.194000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<54.229000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.991000,0.000000,28.194000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.991000,0.000000,28.956000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.991000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.991000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,29.718000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.991000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.134000,0.000000,29.718000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.372000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.134000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.134000,0.000000,30.480000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<56.134000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.134000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,30.480000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.372000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.991000,0.000000,30.861000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.372000,0.000000,30.480000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,44.997030,0> translate<54.991000,0.000000,30.861000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.991000,0.000000,30.861000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.991000,0.000000,31.242000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.991000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.991000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.229000,0.000000,32.004000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<54.229000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.229000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.229000,0.000000,31.242000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<54.229000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.229000,0.000000,30.861000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.848000,0.000000,30.480000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<53.848000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<56.388000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<56.642000,0.000000,32.131000>}
box{<0,0,-0.152400><0.359210,0.036000,0.152400> rotate<0,-44.997030,0> translate<56.388000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<52.832000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<52.578000,0.000000,32.131000>}
box{<0,0,-0.152400><0.359210,0.036000,0.152400> rotate<0,44.997030,0> translate<52.578000,0.000000,32.131000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<52.222400,0.000000,30.099000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<51.841400,0.000000,30.099000>}
box{<0,0,-0.152400><0.381000,0.036000,0.152400> rotate<0,0.000000,0> translate<51.841400,0.000000,30.099000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<52.832000,0.000000,28.448000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<52.578000,0.000000,28.194000>}
box{<0,0,-0.152400><0.359210,0.036000,0.152400> rotate<0,-44.997030,0> translate<52.578000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<54.610000,0.000000,27.762200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<54.610000,0.000000,27.381200>}
box{<0,0,-0.152400><0.381000,0.036000,0.152400> rotate<0,-90.000000,0> translate<54.610000,0.000000,27.381200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<56.515000,0.000000,28.448000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<56.769000,0.000000,28.194000>}
box{<0,0,-0.152400><0.359210,0.036000,0.152400> rotate<0,44.997030,0> translate<56.515000,0.000000,28.448000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<56.997600,0.000000,30.099000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<57.378600,0.000000,30.099000>}
box{<0,0,-0.152400><0.381000,0.036000,0.152400> rotate<0,0.000000,0> translate<56.997600,0.000000,30.099000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.229000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.991000,0.000000,28.956000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<54.229000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.229000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.229000,0.000000,28.194000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<54.229000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.991000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.991000,0.000000,29.337000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.991000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.229000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.991000,0.000000,31.242000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<54.229000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.229000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.229000,0.000000,30.861000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<54.229000,0.000000,30.861000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.991000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.991000,0.000000,32.004000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.991000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,33.909000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<57.150000,0.000000,33.909000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.626000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.594000,0.000000,33.528000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.594000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,33.909000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,33.528000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.070000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,33.909000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,33.909000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.245000,0.000000,33.909000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,33.909000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.975000,0.000000,33.909000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<53.975000,0.000000,33.909000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.975000,0.000000,33.909000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,33.909000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.070000,0.000000,33.909000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,33.909000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.435000,0.000000,33.909000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<51.435000,0.000000,33.909000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.626000,0.000000,33.528000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.626000,0.000000,33.528000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.594000,0.000000,33.528000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,33.528000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.070000,0.000000,33.528000> }
difference{
cylinder{<54.610000,0,30.099000><54.610000,0.036000,30.099000>2.108200 translate<0,0.000000,0>}
cylinder{<54.610000,-0.1,30.099000><54.610000,0.135000,30.099000>1.955800 translate<0,0.000000,0>}}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<44.450000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<45.466000,0.000000,20.320000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<44.450000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<54.610000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<53.594000,0.000000,20.320000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<53.594000,0.000000,20.320000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<52.451000,0.000000,19.431000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<52.451000,0.000000,21.209000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<46.609000,0.000000,21.209000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<46.609000,0.000000,19.431000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.705000,0.000000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.705000,0.000000,19.431000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.705000,0.000000,19.431000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.451000,0.000000,19.177000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,19.177000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.070000,0.000000,19.177000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.943000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,19.177000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<51.943000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.451000,0.000000,21.463000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,21.463000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.070000,0.000000,21.463000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.943000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,21.463000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<51.943000,0.000000,21.336000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,19.177000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.990000,0.000000,19.177000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,0.000000,19.304000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.943000,0.000000,19.304000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.117000,0.000000,19.304000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,21.463000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<46.990000,0.000000,21.463000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.117000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.943000,0.000000,21.336000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.117000,0.000000,21.336000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,19.177000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,19.177000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.609000,0.000000,19.177000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.609000,0.000000,21.463000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,21.463000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.609000,0.000000,21.463000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,21.209000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,19.431000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.355000,0.000000,19.431000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<45.923200,0.000000,20.320000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-180.000000,0> translate<53.136800,0.000000,20.320000>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.910000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.910000,0.000000,16.764000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<41.910000,0.000000,16.764000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.910000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.910000,0.000000,8.636000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<41.910000,0.000000,8.636000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<41.021000,0.000000,9.779000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<42.799000,0.000000,9.779000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<42.799000,0.000000,15.621000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<41.021000,0.000000,15.621000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,9.525000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.021000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,9.779000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,10.160000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<40.767000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.894000,0.000000,10.287000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,10.160000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<40.767000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,9.779000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,10.160000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<43.053000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.926000,0.000000,10.287000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,10.160000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<42.926000,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.894000,0.000000,15.113000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,15.240000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<40.767000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.894000,0.000000,15.113000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.894000,0.000000,10.287000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.894000,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.926000,0.000000,15.113000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,15.240000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<42.926000,0.000000,15.113000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.926000,0.000000,15.113000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.926000,0.000000,10.287000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.926000,0.000000,10.287000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,15.621000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,15.240000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.767000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,15.621000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.053000,0.000000,15.240000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.053000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,15.875000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.021000,0.000000,15.875000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<41.910000,0.000000,16.306800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<41.910000,0.000000,9.093200>}
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<6.350000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<6.350000,0.000000,39.624000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<6.350000,0.000000,39.624000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<6.350000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<6.350000,0.000000,31.496000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<6.350000,0.000000,31.496000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<5.461000,0.000000,32.639000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<7.239000,0.000000,32.639000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<7.239000,0.000000,38.481000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<5.461000,0.000000,38.481000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.239000,0.000000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.461000,0.000000,32.385000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.461000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,32.639000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,33.020000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<5.207000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.334000,0.000000,33.147000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,33.020000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<5.207000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.493000,0.000000,32.639000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.493000,0.000000,33.020000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<7.493000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.366000,0.000000,33.147000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.493000,0.000000,33.020000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<7.366000,0.000000,33.147000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.334000,0.000000,37.973000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,38.100000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<5.207000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.334000,0.000000,37.973000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.334000,0.000000,33.147000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.334000,0.000000,33.147000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.366000,0.000000,37.973000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.493000,0.000000,38.100000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<7.366000,0.000000,37.973000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.366000,0.000000,37.973000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.366000,0.000000,33.147000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.366000,0.000000,33.147000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,38.481000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,38.100000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.207000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.493000,0.000000,38.481000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.493000,0.000000,38.100000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.493000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.239000,0.000000,38.735000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.461000,0.000000,38.735000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.461000,0.000000,38.735000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<6.350000,0.000000,39.166800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<6.350000,0.000000,31.953200>}
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<6.350000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<6.350000,0.000000,18.796000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<6.350000,0.000000,18.796000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<6.350000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<6.350000,0.000000,26.924000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<6.350000,0.000000,26.924000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<7.239000,0.000000,25.781000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<5.461000,0.000000,25.781000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<5.461000,0.000000,19.939000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<7.239000,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.461000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.239000,0.000000,26.035000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.461000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.493000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.493000,0.000000,25.400000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.493000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.366000,0.000000,25.273000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.493000,0.000000,25.400000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<7.366000,0.000000,25.273000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,25.400000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.207000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.334000,0.000000,25.273000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,25.400000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<5.207000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.366000,0.000000,20.447000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.493000,0.000000,20.320000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<7.366000,0.000000,20.447000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.366000,0.000000,20.447000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.366000,0.000000,25.273000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<7.366000,0.000000,25.273000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.334000,0.000000,20.447000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,20.320000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<5.207000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.334000,0.000000,20.447000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.334000,0.000000,25.273000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<5.334000,0.000000,25.273000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.493000,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.493000,0.000000,20.320000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<7.493000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,20.320000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<5.207000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.461000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.239000,0.000000,19.685000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.461000,0.000000,19.685000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<6.350000,0.000000,19.253200>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-270.000000,0> translate<6.350000,0.000000,26.466800>}
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<20.320000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<19.304000,0.000000,38.100000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<19.304000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<10.160000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<11.176000,0.000000,38.100000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,0.000000,0> translate<10.160000,0.000000,38.100000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<12.319000,0.000000,38.989000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<12.319000,0.000000,37.211000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<18.161000,0.000000,37.211000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<18.161000,0.000000,38.989000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.065000,0.000000,38.989000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.065000,0.000000,38.989000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,39.243000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,39.243000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.319000,0.000000,39.243000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.827000,0.000000,39.116000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,39.243000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<12.700000,0.000000,39.243000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,36.957000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,36.957000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.319000,0.000000,36.957000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.827000,0.000000,37.084000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,36.957000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<12.700000,0.000000,36.957000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,0.000000,39.116000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,39.243000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<17.653000,0.000000,39.116000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,0.000000,39.116000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.827000,0.000000,39.116000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.827000,0.000000,39.116000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,0.000000,37.084000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,36.957000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<17.653000,0.000000,37.084000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,0.000000,37.084000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.827000,0.000000,37.084000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.827000,0.000000,37.084000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,39.243000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,39.243000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.780000,0.000000,39.243000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,36.957000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,36.957000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.780000,0.000000,36.957000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,38.989000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<18.415000,0.000000,38.989000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<18.846800,0.000000,38.100000>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-0.000000,0> translate<11.633200,0.000000,38.100000>}
//R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<24.130000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<24.130000,0.000000,42.164000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,-90.000000,0> translate<24.130000,0.000000,42.164000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<24.130000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<24.130000,0.000000,34.036000>}
box{<0,0,-0.304800><1.016000,0.036000,0.304800> rotate<0,90.000000,0> translate<24.130000,0.000000,34.036000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<23.241000,0.000000,35.179000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<25.019000,0.000000,35.179000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<25.019000,0.000000,41.021000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<23.241000,0.000000,41.021000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.019000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,34.925000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.241000,0.000000,34.925000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.987000,0.000000,35.179000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.987000,0.000000,35.560000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.987000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.114000,0.000000,35.687000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.987000,0.000000,35.560000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.987000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.273000,0.000000,35.179000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.273000,0.000000,35.560000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<25.273000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,35.687000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.273000,0.000000,35.560000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<25.146000,0.000000,35.687000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.114000,0.000000,40.513000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.987000,0.000000,40.640000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<22.987000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.114000,0.000000,40.513000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.114000,0.000000,35.687000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.114000,0.000000,35.687000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,40.513000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.273000,0.000000,40.640000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<25.146000,0.000000,40.513000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,40.513000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,35.687000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.146000,0.000000,35.687000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.987000,0.000000,41.021000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.987000,0.000000,40.640000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.987000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.273000,0.000000,41.021000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.273000,0.000000,40.640000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.273000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.019000,0.000000,41.275000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,41.275000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.241000,0.000000,41.275000> }
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<24.130000,0.000000,41.706800>}
box{<-0.431800,0,-0.304800><0.431800,0.036000,0.304800> rotate<0,-90.000000,0> translate<24.130000,0.000000,34.493200>}
//T1 silk screen
object{ARC(2.413000,0.050800,22.641418,67.358582,0.036000) translate<29.210000,0.000000,43.180000>}
object{ARC(2.413000,0.050800,292.641418,337.358582,0.036000) translate<29.210000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.273000,0.000000,42.672000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.273000,0.000000,43.688000>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,90.000000,0> translate<25.273000,0.000000,43.688000> }
object{ARC(2.413100,0.050800,67.359496,202.640504,0.036000) translate<29.210100,0.000000,43.180000>}
object{ARC(2.413000,0.050800,202.641418,247.358582,0.036000) translate<29.210000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.273000,0.000000,42.672000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.333500,0.000000,42.672000>}
box{<0,0,-0.063500><1.060500,0.036000,0.063500> rotate<0,0.000000,0> translate<25.273000,0.000000,42.672000> }
object{ARC(2.413000,0.050800,247.358582,292.641418,0.036000) translate<29.210000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.273000,0.000000,43.688000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.333500,0.000000,43.688000>}
box{<0,0,-0.063500><1.060500,0.036000,0.063500> rotate<0,0.000000,0> translate<25.273000,0.000000,43.688000> }
object{ARC(2.413000,0.050800,337.358582,382.641418,0.036000) translate<29.210000,0.000000,43.180000>}
difference{
cylinder{<29.210000,0,43.180000><29.210000,0.036000,43.180000>2.984500 translate<0,0.000000,0>}
cylinder{<29.210000,-0.1,43.180000><29.210000,0.135000,43.180000>2.857500 translate<0,0.000000,0>}}
//T2 silk screen
object{ARC(2.413000,0.050800,22.641418,67.358582,0.036000) translate<39.370000,0.000000,43.180000>}
object{ARC(2.413000,0.050800,292.641418,337.358582,0.036000) translate<39.370000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.433000,0.000000,42.672000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.433000,0.000000,43.688000>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,90.000000,0> translate<35.433000,0.000000,43.688000> }
object{ARC(2.413100,0.050800,67.359496,202.640504,0.036000) translate<39.370100,0.000000,43.180000>}
object{ARC(2.413000,0.050800,202.641418,247.358582,0.036000) translate<39.370000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.433000,0.000000,42.672000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.493500,0.000000,42.672000>}
box{<0,0,-0.063500><1.060500,0.036000,0.063500> rotate<0,0.000000,0> translate<35.433000,0.000000,42.672000> }
object{ARC(2.413000,0.050800,247.358582,292.641418,0.036000) translate<39.370000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.433000,0.000000,43.688000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.493500,0.000000,43.688000>}
box{<0,0,-0.063500><1.060500,0.036000,0.063500> rotate<0,0.000000,0> translate<35.433000,0.000000,43.688000> }
object{ARC(2.413000,0.050800,337.358582,382.641418,0.036000) translate<39.370000,0.000000,43.180000>}
difference{
cylinder{<39.370000,0,43.180000><39.370000,0.036000,43.180000>2.984500 translate<0,0.000000,0>}
cylinder{<39.370000,-0.1,43.180000><39.370000,0.135000,43.180000>2.857500 translate<0,0.000000,0>}}
//T3 silk screen
object{ARC(2.413000,0.050800,22.641418,67.358582,0.036000) translate<19.050000,0.000000,43.180000>}
object{ARC(2.413000,0.050800,292.641418,337.358582,0.036000) translate<19.050000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.113000,0.000000,42.672000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.113000,0.000000,43.688000>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,90.000000,0> translate<15.113000,0.000000,43.688000> }
object{ARC(2.413100,0.050800,67.359496,202.640504,0.036000) translate<19.050100,0.000000,43.180000>}
object{ARC(2.413000,0.050800,202.641418,247.358582,0.036000) translate<19.050000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.113000,0.000000,42.672000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.173500,0.000000,42.672000>}
box{<0,0,-0.063500><1.060500,0.036000,0.063500> rotate<0,0.000000,0> translate<15.113000,0.000000,42.672000> }
object{ARC(2.413000,0.050800,247.358582,292.641418,0.036000) translate<19.050000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.113000,0.000000,43.688000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.173500,0.000000,43.688000>}
box{<0,0,-0.063500><1.060500,0.036000,0.063500> rotate<0,0.000000,0> translate<15.113000,0.000000,43.688000> }
object{ARC(2.413000,0.050800,337.358582,382.641418,0.036000) translate<19.050000,0.000000,43.180000>}
difference{
cylinder{<19.050000,0,43.180000><19.050000,0.036000,43.180000>2.984500 translate<0,0.000000,0>}
cylinder{<19.050000,-0.1,43.180000><19.050000,0.135000,43.180000>2.857500 translate<0,0.000000,0>}}
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
object{  GEAR_INDICATOR_V1_0(-32.855000,0,-33.015000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
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
