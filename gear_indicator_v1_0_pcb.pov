//POVRay-File created by 3d41.ulp v20110101
//Z:/Projects/simulator/Gear_Indicator/gear_indicator_v1_0.brd
//1/18/2012 9:52:14 PM

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
#declare global_seed=seed(901);
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
cylinder{<41.910000,0.095000,4.525000><41.910000,-1.595000,4.525000>1.498600 texture{col_hls}}
cylinder{<41.910000,0.095000,10.525000><41.910000,-1.595000,10.525000>1.498600 texture{col_hls}}
cylinder{<46.610000,0.095000,7.525000><46.610000,-1.595000,7.525000>1.498600 texture{col_hls}}
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<17.780000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<17.780000,0,11.430000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<12.700000,0,8.255000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<10.160000,0,8.255000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<43.688000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<40.132000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_C4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<50.800000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_C4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<50.800000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_C5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<33.020000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_C5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<33.020000,0,17.780000> texture{col_thl}}
#ifndef(global_pack_C6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<15.240000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_C6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<15.240000,0,36.830000> texture{col_thl}}
#ifndef(global_pack_C7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<29.210000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_C7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<29.210000,0,36.830000> texture{col_thl}}
#ifndef(global_pack_C8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<43.180000,0,46.990000> texture{col_thl}}
#ifndef(global_pack_C8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<40.640000,0,46.990000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<39.370000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<39.370000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<39.370000,0,17.780000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<39.370000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<46.990000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<46.990000,0,17.780000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<46.990000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_IC1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<46.990000,0,22.860000> texture{col_thl}}
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
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(4.013200,2.997200,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<41.910000,0,4.525000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(4.013200,2.997200,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<46.610000,0,7.525000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(4.013200,2.997200,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<41.910000,0,10.525000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.200000,0.800000,1,16,0+global_tmp,0) rotate<0,-270.000000,0>translate<45.720000,0,54.610000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.200000,0.800000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<40.640000,0,54.610000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.200000,0.800000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<35.560000,0,54.610000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.200000,0.800000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<30.480000,0,54.610000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.200000,0.800000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<25.400000,0,54.610000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.200000,0.800000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<20.320000,0,54.610000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.200000,0.800000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<15.240000,0,54.610000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.200000,0.800000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<10.160000,0,54.610000> texture{col_thl}}
#ifndef(global_pack_LED1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<30.480000,0,3.810000> texture{col_thl}}
#ifndef(global_pack_LED1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<33.020000,0,3.810000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<33.020000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<33.020000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<52.070000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<46.990000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<49.530000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<43.180000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<35.560000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<35.560000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<35.560000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<7.620000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<7.620000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<31.750000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<31.750000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<11.430000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<11.430000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<21.590000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<21.590000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_R9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<50.800000,0,54.610000> texture{col_thl}}
#ifndef(global_pack_R9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<50.800000,0,46.990000> texture{col_thl}}
#ifndef(global_pack_R10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<27.940000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_R10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<35.560000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<25.400000,0,46.990000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<23.495000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<25.400000,0,44.450000> texture{col_thl}}
#ifndef(global_pack_T2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<35.560000,0,46.990000> texture{col_thl}}
#ifndef(global_pack_T2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<33.655000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_T2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<35.560000,0,44.450000> texture{col_thl}}
#ifndef(global_pack_T3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<15.240000,0,46.990000> texture{col_thl}}
#ifndef(global_pack_T3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<13.335000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_T3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<15.240000,0,44.450000> texture{col_thl}}
//Pads/Vias
#end
#if(pcb_wires=on)
union{
//Signals
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.305000,-1.535000,10.525000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,-1.535000,10.525000>}
box{<0,0,-0.152400><13.605000,0.035000,0.152400> rotate<0,0.000000,0> translate<28.305000,-1.535000,10.525000> }
}cylinder{<41.910000,1,10.525000><41.910000,-2.500000,10.525000>1.498600 texture{col_thl}}}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.540000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.540000,0.000000,43.180000>}
box{<0,0,-0.152400><29.210000,0.035000,0.152400> rotate<0,90.000000,0> translate<2.540000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.810000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.810000,-1.535000,20.320000>}
box{<0,0,-0.152400><10.160000,0.035000,0.152400> rotate<0,-90.000000,0> translate<3.810000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.540000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.080000,0.000000,11.430000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,44.997030,0> translate<2.540000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.080000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.080000,-1.535000,26.670000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,-90.000000,0> translate<5.080000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.080000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.080000,0.000000,29.210000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,-90.000000,0> translate<5.080000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.540000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.080000,0.000000,45.720000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,-44.997030,0> translate<2.540000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.810000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.350000,-1.535000,17.780000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,44.997030,0> translate<3.810000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.080000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.350000,-1.535000,25.400000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<5.080000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.080000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.350000,0.000000,27.940000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<5.080000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.080000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.350000,-1.535000,31.750000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<5.080000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.350000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.620000,-1.535000,17.780000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<6.350000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.350000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.620000,-1.535000,25.400000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<6.350000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.350000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.620000,0.000000,27.940000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<6.350000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.350000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.620000,-1.535000,31.750000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<6.350000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.080000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.620000,0.000000,34.290000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,-44.997030,0> translate<5.080000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.620000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.620000,0.000000,34.290000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,-90.000000,0> translate<7.620000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.080000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.620000,0.000000,45.720000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,0.000000,0> translate<5.080000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.620000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.890000,-1.535000,20.320000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<7.620000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.620000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.890000,0.000000,27.940000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<7.620000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.620000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.160000,-1.535000,30.480000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,0.000000,0> translate<7.620000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.620000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.160000,0.000000,48.260000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,-44.997030,0> translate<7.620000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.620000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.160000,-1.535000,48.260000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,-44.997030,0> translate<7.620000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.160000,-1.535000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.160000,-1.535000,48.260000>}
box{<0,0,-0.152400><6.350000,0.035000,0.152400> rotate<0,-90.000000,0> translate<10.160000,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.160000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.160000,0.000000,54.610000>}
box{<0,0,-0.152400><6.350000,0.035000,0.152400> rotate<0,90.000000,0> translate<10.160000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.080000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,0.000000,11.430000>}
box{<0,0,-0.152400><6.350000,0.035000,0.152400> rotate<0,0.000000,0> translate<5.080000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,0.000000,20.320000>}
box{<0,0,-0.152400><5.080000,0.035000,0.152400> rotate<0,-90.000000,0> translate<11.430000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.620000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,-1.535000,22.860000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,0.000000,0> translate<7.620000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.890000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,0.000000,25.400000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,44.997030,0> translate<8.890000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.160000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,-1.535000,29.210000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<10.160000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.810000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,-1.535000,38.100000>}
box{<0,0,-0.152400><10.776307,0.035000,0.152400> rotate<0,-44.997030,0> translate<3.810000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.620000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,-1.535000,41.910000>}
box{<0,0,-0.152400><5.388154,0.035000,0.152400> rotate<0,-44.997030,0> translate<7.620000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.160000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,0.000000,55.880000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<10.160000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.700000,-1.535000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.700000,-1.535000,3.810000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,90.000000,0> translate<12.700000,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.700000,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.700000,-1.535000,8.255000>}
box{<0,0,-0.152400><4.445000,0.035000,0.152400> rotate<0,90.000000,0> translate<12.700000,-1.535000,8.255000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.700000,0.000000,10.160000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<11.430000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.700000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.700000,0.000000,10.160000>}
box{<0,0,-0.152400><1.905000,0.035000,0.152400> rotate<0,90.000000,0> translate<12.700000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.890000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.700000,-1.535000,16.510000>}
box{<0,0,-0.152400><5.388154,0.035000,0.152400> rotate<0,44.997030,0> translate<8.890000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.700000,-1.535000,24.130000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<11.430000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.335000,-1.535000,45.720000>}
box{<0,0,-0.152400><1.905000,0.035000,0.152400> rotate<0,0.000000,0> translate<11.430000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.700000,-1.535000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.970000,-1.535000,1.270000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<12.700000,-1.535000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.970000,0.000000,17.780000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,44.997030,0> translate<11.430000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.970000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.970000,0.000000,33.020000>}
box{<0,0,-0.152400><6.350000,0.035000,0.152400> rotate<0,-90.000000,0> translate<13.970000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.620000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.970000,0.000000,39.370000>}
box{<0,0,-0.152400><8.980256,0.035000,0.152400> rotate<0,44.997030,0> translate<7.620000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.970000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.240000,0.000000,17.780000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<13.970000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.240000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.240000,-1.535000,30.480000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,-90.000000,0> translate<15.240000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.970000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.240000,0.000000,31.750000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<13.970000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.240000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.240000,0.000000,31.750000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,90.000000,0> translate<15.240000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.620000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.240000,-1.535000,39.370000>}
box{<0,0,-0.152400><10.776307,0.035000,0.152400> rotate<0,-44.997030,0> translate<7.620000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.240000,-1.535000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.240000,-1.535000,46.990000>}
box{<0,0,-0.152400><7.620000,0.035000,0.152400> rotate<0,-90.000000,0> translate<15.240000,-1.535000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.510000,-1.535000,29.210000>}
box{<0,0,-0.152400><5.080000,0.035000,0.152400> rotate<0,0.000000,0> translate<11.430000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.780000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.780000,-1.535000,3.810000>}
box{<0,0,-0.152400><5.080000,0.035000,0.152400> rotate<0,-90.000000,0> translate<17.780000,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.700000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.780000,-1.535000,24.130000>}
box{<0,0,-0.152400><5.080000,0.035000,0.152400> rotate<0,0.000000,0> translate<12.700000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.510000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.780000,-1.535000,27.940000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<16.510000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.240000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.050000,-1.535000,15.240000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.240000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.700000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.050000,-1.535000,16.510000>}
box{<0,0,-0.152400><6.350000,0.035000,0.152400> rotate<0,0.000000,0> translate<12.700000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.240000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.050000,-1.535000,17.780000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.240000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.240000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.050000,0.000000,20.320000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.240000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.780000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.050000,-1.535000,22.860000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<17.780000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.050000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.320000,-1.535000,16.510000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<19.050000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.050000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.320000,-1.535000,17.780000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<19.050000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.050000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.320000,0.000000,19.050000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<19.050000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.320000,0.000000,55.880000>}
box{<0,0,-0.152400><8.890000,0.035000,0.152400> rotate<0,0.000000,0> translate<11.430000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.320000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.320000,0.000000,55.880000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,90.000000,0> translate<20.320000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.970000,-1.535000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.590000,-1.535000,1.270000>}
box{<0,0,-0.152400><7.620000,0.035000,0.152400> rotate<0,0.000000,0> translate<13.970000,-1.535000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.780000,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.590000,-1.535000,3.810000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,0.000000,0> translate<17.780000,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.320000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.590000,-1.535000,17.780000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<20.320000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.050000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.590000,-1.535000,20.320000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,-44.997030,0> translate<19.050000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.050000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.590000,-1.535000,22.860000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,0.000000,0> translate<19.050000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.780000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.590000,-1.535000,27.940000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,0.000000,0> translate<17.780000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.590000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.590000,-1.535000,30.480000>}
box{<0,0,-0.152400><7.620000,0.035000,0.152400> rotate<0,-90.000000,0> translate<21.590000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.320000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.860000,-1.535000,16.510000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,0.000000,0> translate<20.320000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.590000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.860000,-1.535000,25.400000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<21.590000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.590000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.860000,-1.535000,30.480000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<21.590000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.590000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.495000,-1.535000,45.720000>}
box{<0,0,-0.152400><1.905000,0.035000,0.152400> rotate<0,0.000000,0> translate<21.590000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.590000,-1.535000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.130000,-1.535000,3.810000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,-44.997030,0> translate<21.590000,-1.535000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.320000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.130000,0.000000,19.050000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,0.000000,0> translate<20.320000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.590000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.130000,0.000000,20.320000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,0.000000,0> translate<21.590000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.860000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.130000,-1.535000,26.670000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<22.860000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.860000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.130000,-1.535000,29.210000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<22.860000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.130000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.130000,-1.535000,29.210000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,90.000000,0> translate<24.130000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.240000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.130000,-1.535000,39.370000>}
box{<0,0,-0.152400><8.890000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.240000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.130000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.400000,-1.535000,38.100000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<24.130000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.400000,-1.535000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.400000,-1.535000,46.990000>}
box{<0,0,-0.152400><7.620000,0.035000,0.152400> rotate<0,-90.000000,0> translate<25.400000,-1.535000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.130000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.670000,0.000000,17.780000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,44.997030,0> translate<24.130000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.130000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.940000,0.000000,15.240000>}
box{<0,0,-0.152400><5.388154,0.035000,0.152400> rotate<0,44.997030,0> translate<24.130000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.240000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.940000,0.000000,31.750000>}
box{<0,0,-0.152400><12.700000,0.035000,0.152400> rotate<0,0.000000,0> translate<15.240000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.590000,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.305000,-1.535000,10.525000>}
box{<0,0,-0.152400><9.496444,0.035000,0.152400> rotate<0,-44.997030,0> translate<21.590000,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.940000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,0.000000,15.240000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<27.940000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.670000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,0.000000,17.780000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,0.000000,0> translate<26.670000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.860000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,-1.535000,22.860000>}
box{<0,0,-0.152400><8.980256,0.035000,0.152400> rotate<0,-44.997030,0> translate<22.860000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.940000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,0.000000,30.480000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<27.940000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,-1.535000,30.480000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,-90.000000,0> translate<29.210000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.320000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,0.000000,55.880000>}
box{<0,0,-0.152400><8.890000,0.035000,0.152400> rotate<0,0.000000,0> translate<20.320000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.130000,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.480000,-1.535000,3.810000>}
box{<0,0,-0.152400><6.350000,0.035000,0.152400> rotate<0,0.000000,0> translate<24.130000,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.480000,-1.535000,29.210000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<29.210000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.480000,0.000000,54.610000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<29.210000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.400000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.750000,-1.535000,38.100000>}
box{<0,0,-0.152400><6.350000,0.035000,0.152400> rotate<0,0.000000,0> translate<25.400000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,-1.535000,15.240000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,0.000000,0> translate<29.210000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,-1.535000,20.320000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,0.000000,0> translate<29.210000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,-1.535000,20.320000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,-90.000000,0> translate<33.020000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.480000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,-1.535000,29.210000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,0.000000,0> translate<30.480000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.750000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.655000,-1.535000,45.720000>}
box{<0,0,-0.152400><1.905000,0.035000,0.152400> rotate<0,0.000000,0> translate<31.750000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.290000,-1.535000,3.810000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<33.020000,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.290000,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.560000,-1.535000,5.080000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<34.290000,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.560000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.560000,-1.535000,7.620000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,90.000000,0> translate<35.560000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.560000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.560000,0.000000,17.780000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,-90.000000,0> translate<35.560000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.560000,-1.535000,29.210000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,0.000000,0> translate<33.020000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.560000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.560000,-1.535000,29.210000>}
box{<0,0,-0.152400><8.890000,0.035000,0.152400> rotate<0,-90.000000,0> translate<35.560000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.560000,-1.535000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.560000,-1.535000,46.990000>}
box{<0,0,-0.152400><7.620000,0.035000,0.152400> rotate<0,-90.000000,0> translate<35.560000,-1.535000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.560000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.100000,0.000000,15.240000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,44.997030,0> translate<35.560000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.130000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.100000,-1.535000,26.670000>}
box{<0,0,-0.152400><13.970000,0.035000,0.152400> rotate<0,0.000000,0> translate<24.130000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.560000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.100000,-1.535000,29.210000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,0.000000,0> translate<35.560000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.100000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.370000,0.000000,15.240000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<38.100000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.370000,-1.535000,20.320000>}
box{<0,0,-0.152400><6.350000,0.035000,0.152400> rotate<0,0.000000,0> translate<33.020000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.370000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.640000,-1.535000,17.780000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<39.370000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.640000,-1.535000,41.910000>}
box{<0,0,-0.152400><29.210000,0.035000,0.152400> rotate<0,0.000000,0> translate<11.430000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.640000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,-1.535000,19.050000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<40.640000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.100000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,-1.535000,22.860000>}
box{<0,0,-0.152400><5.388154,0.035000,0.152400> rotate<0,44.997030,0> translate<38.100000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,-1.535000,22.860000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,90.000000,0> translate<41.910000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.640000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.180000,-1.535000,44.450000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,-44.997030,0> translate<40.640000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.180000,-1.535000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.180000,-1.535000,44.450000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,-90.000000,0> translate<43.180000,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.100000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.450000,-1.535000,22.860000>}
box{<0,0,-0.152400><8.980256,0.035000,0.152400> rotate<0,44.997030,0> translate<38.100000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.990000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.990000,-1.535000,17.780000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,-90.000000,0> translate<46.990000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.450000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.990000,-1.535000,22.860000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,0.000000,0> translate<44.450000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.688000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.990000,-1.535000,30.480000>}
box{<0,0,-0.152400><3.302000,0.035000,0.152400> rotate<0,0.000000,0> translate<43.688000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.180000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.990000,-1.535000,38.100000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,0.000000,0> translate<43.180000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.990000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.530000,-1.535000,17.780000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,0.000000,0> translate<46.990000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.990000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.530000,-1.535000,33.020000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,-44.997030,0> translate<46.990000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.530000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.530000,-1.535000,35.560000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,90.000000,0> translate<49.530000,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.990000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.800000,-1.535000,15.240000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,0.000000,0> translate<46.990000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.180000,-1.535000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.800000,-1.535000,46.990000>}
box{<0,0,-0.152400><7.620000,0.035000,0.152400> rotate<0,0.000000,0> translate<43.180000,-1.535000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.720000,-1.535000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.800000,-1.535000,54.610000>}
box{<0,0,-0.152400><5.080000,0.035000,0.152400> rotate<0,0.000000,0> translate<45.720000,-1.535000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.530000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.070000,-1.535000,20.320000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,-44.997030,0> translate<49.530000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.070000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.070000,-1.535000,20.320000>}
box{<0,0,-0.152400><5.080000,0.035000,0.152400> rotate<0,-90.000000,0> translate<52.070000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.990000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.070000,-1.535000,25.400000>}
box{<0,0,-0.152400><7.184205,0.035000,0.152400> rotate<0,44.997030,0> translate<46.990000,-1.535000,30.480000> }
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
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.270000,-1.535000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.270000,-1.535000,62.230000>}
box{<0,0,-0.127000><60.960000,0.035000,0.127000> rotate<0,90.000000,0> translate<1.270000,-1.535000,62.230000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.270000,-1.535000,1.270000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.610000,-1.535000,1.270000>}
box{<0,0,-0.127000><53.340000,0.035000,0.127000> rotate<0,0.000000,0> translate<1.270000,-1.535000,1.270000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.270000,-1.535000,62.230000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.610000,-1.535000,62.230000>}
box{<0,0,-0.127000><53.340000,0.035000,0.127000> rotate<0,0.000000,0> translate<1.270000,-1.535000,62.230000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.610000,-1.535000,62.230000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.610000,-1.535000,1.270000>}
box{<0,0,-0.127000><60.960000,0.035000,0.127000> rotate<0,-90.000000,0> translate<54.610000,-1.535000,1.270000> }
texture{col_pol}
}
#end
union{
cylinder{<17.780000,0.038000,8.890000><17.780000,-1.538000,8.890000>0.406400}
cylinder{<17.780000,0.038000,11.430000><17.780000,-1.538000,11.430000>0.406400}
cylinder{<12.700000,0.038000,8.255000><12.700000,-1.538000,8.255000>0.406400}
cylinder{<10.160000,0.038000,8.255000><10.160000,-1.538000,8.255000>0.406400}
cylinder{<43.688000,0.038000,30.480000><43.688000,-1.538000,30.480000>0.406400}
cylinder{<40.132000,0.038000,30.480000><40.132000,-1.538000,30.480000>0.406400}
cylinder{<50.800000,0.038000,15.240000><50.800000,-1.538000,15.240000>0.406400}
cylinder{<50.800000,0.038000,12.700000><50.800000,-1.538000,12.700000>0.406400}
cylinder{<33.020000,0.038000,15.240000><33.020000,-1.538000,15.240000>0.406400}
cylinder{<33.020000,0.038000,17.780000><33.020000,-1.538000,17.780000>0.406400}
cylinder{<15.240000,0.038000,34.290000><15.240000,-1.538000,34.290000>0.406400}
cylinder{<15.240000,0.038000,36.830000><15.240000,-1.538000,36.830000>0.406400}
cylinder{<29.210000,0.038000,34.290000><29.210000,-1.538000,34.290000>0.406400}
cylinder{<29.210000,0.038000,36.830000><29.210000,-1.538000,36.830000>0.406400}
cylinder{<43.180000,0.038000,46.990000><43.180000,-1.538000,46.990000>0.406400}
cylinder{<40.640000,0.038000,46.990000><40.640000,-1.538000,46.990000>0.406400}
cylinder{<39.370000,0.038000,22.860000><39.370000,-1.538000,22.860000>0.406400}
cylinder{<39.370000,0.038000,20.320000><39.370000,-1.538000,20.320000>0.406400}
cylinder{<39.370000,0.038000,17.780000><39.370000,-1.538000,17.780000>0.406400}
cylinder{<39.370000,0.038000,15.240000><39.370000,-1.538000,15.240000>0.406400}
cylinder{<46.990000,0.038000,15.240000><46.990000,-1.538000,15.240000>0.406400}
cylinder{<46.990000,0.038000,17.780000><46.990000,-1.538000,17.780000>0.406400}
cylinder{<46.990000,0.038000,20.320000><46.990000,-1.538000,20.320000>0.406400}
cylinder{<46.990000,0.038000,22.860000><46.990000,-1.538000,22.860000>0.406400}
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
cylinder{<30.480000,0.038000,3.810000><30.480000,-1.538000,3.810000>0.406400}
cylinder{<33.020000,0.038000,3.810000><33.020000,-1.538000,3.810000>0.406400}
cylinder{<33.020000,0.038000,29.210000><33.020000,-1.538000,29.210000>0.406400}
cylinder{<33.020000,0.038000,21.590000><33.020000,-1.538000,21.590000>0.406400}
cylinder{<52.070000,0.038000,38.100000><52.070000,-1.538000,38.100000>0.406400}
cylinder{<46.990000,0.038000,38.100000><46.990000,-1.538000,38.100000>0.406400}
cylinder{<49.530000,0.038000,35.560000><49.530000,-1.538000,35.560000>0.406400}
cylinder{<43.180000,0.038000,38.100000><43.180000,-1.538000,38.100000>0.406400}
cylinder{<35.560000,0.038000,38.100000><35.560000,-1.538000,38.100000>0.406400}
cylinder{<35.560000,0.038000,21.590000><35.560000,-1.538000,21.590000>0.406400}
cylinder{<35.560000,0.038000,29.210000><35.560000,-1.538000,29.210000>0.406400}
cylinder{<7.620000,0.038000,38.100000><7.620000,-1.538000,38.100000>0.406400}
cylinder{<7.620000,0.038000,45.720000><7.620000,-1.538000,45.720000>0.406400}
cylinder{<31.750000,0.038000,38.100000><31.750000,-1.538000,38.100000>0.406400}
cylinder{<31.750000,0.038000,45.720000><31.750000,-1.538000,45.720000>0.406400}
cylinder{<11.430000,0.038000,38.100000><11.430000,-1.538000,38.100000>0.406400}
cylinder{<11.430000,0.038000,45.720000><11.430000,-1.538000,45.720000>0.406400}
cylinder{<21.590000,0.038000,38.100000><21.590000,-1.538000,38.100000>0.406400}
cylinder{<21.590000,0.038000,45.720000><21.590000,-1.538000,45.720000>0.406400}
cylinder{<50.800000,0.038000,54.610000><50.800000,-1.538000,54.610000>0.406400}
cylinder{<50.800000,0.038000,46.990000><50.800000,-1.538000,46.990000>0.406400}
cylinder{<27.940000,0.038000,7.620000><27.940000,-1.538000,7.620000>0.406400}
cylinder{<35.560000,0.038000,7.620000><35.560000,-1.538000,7.620000>0.406400}
cylinder{<25.400000,0.038000,46.990000><25.400000,-1.538000,46.990000>0.406400}
cylinder{<23.495000,0.038000,45.720000><23.495000,-1.538000,45.720000>0.406400}
cylinder{<25.400000,0.038000,44.450000><25.400000,-1.538000,44.450000>0.406400}
cylinder{<35.560000,0.038000,46.990000><35.560000,-1.538000,46.990000>0.406400}
cylinder{<33.655000,0.038000,45.720000><33.655000,-1.538000,45.720000>0.406400}
cylinder{<35.560000,0.038000,44.450000><35.560000,-1.538000,44.450000>0.406400}
cylinder{<15.240000,0.038000,46.990000><15.240000,-1.538000,46.990000>0.406400}
cylinder{<13.335000,0.038000,45.720000><13.335000,-1.538000,45.720000>0.406400}
cylinder{<15.240000,0.038000,44.450000><15.240000,-1.538000,44.450000>0.406400}
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
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.716200,0.000000,44.248188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.716200,0.000000,42.621200>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.716200,0.000000,42.621200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.716200,0.000000,42.621200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.529694,0.000000,42.621200>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<40.716200,0.000000,42.621200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.529694,0.000000,42.621200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.800859,0.000000,42.892363>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.996700,0> translate<41.529694,0.000000,42.621200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.800859,0.000000,42.892363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.800859,0.000000,43.977025>}
box{<0,0,-0.076200><1.084663,0.036000,0.076200> rotate<0,90.000000,0> translate<41.800859,0.000000,43.977025> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.800859,0.000000,43.977025>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.529694,0.000000,44.248188>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,44.996700,0> translate<41.529694,0.000000,44.248188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.529694,0.000000,44.248188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.716200,0.000000,44.248188>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,0.000000,0> translate<40.716200,0.000000,44.248188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.166850,0.000000,42.621200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.624519,0.000000,42.621200>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<42.624519,0.000000,42.621200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.624519,0.000000,42.621200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.353356,0.000000,42.892363>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<42.353356,0.000000,42.892363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.353356,0.000000,42.892363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.353356,0.000000,43.434694>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,90.000000,0> translate<42.353356,0.000000,43.434694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.353356,0.000000,43.434694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.624519,0.000000,43.705859>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.997360,0> translate<42.353356,0.000000,43.434694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.624519,0.000000,43.705859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.166850,0.000000,43.705859>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<42.624519,0.000000,43.705859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.166850,0.000000,43.705859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.438016,0.000000,43.434694>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,44.997030,0> translate<43.166850,0.000000,43.705859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.438016,0.000000,43.434694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.438016,0.000000,43.163528>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.438016,0.000000,43.163528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.438016,0.000000,43.163528>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.353356,0.000000,43.163528>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,0.000000,0> translate<42.353356,0.000000,43.163528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.990513,0.000000,44.248188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.261675,0.000000,44.248188>}
box{<0,0,-0.076200><0.271163,0.036000,0.076200> rotate<0,0.000000,0> translate<43.990513,0.000000,44.248188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.261675,0.000000,44.248188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.261675,0.000000,42.621200>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.261675,0.000000,42.621200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.990513,0.000000,42.621200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.532841,0.000000,42.621200>}
box{<0,0,-0.076200><0.542328,0.036000,0.076200> rotate<0,0.000000,0> translate<43.990513,0.000000,42.621200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.353113,0.000000,43.705859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.895444,0.000000,43.705859>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<45.353113,0.000000,43.705859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.895444,0.000000,43.705859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.166609,0.000000,43.434694>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,44.997030,0> translate<45.895444,0.000000,43.705859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.166609,0.000000,43.434694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.166609,0.000000,42.621200>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.166609,0.000000,42.621200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.166609,0.000000,42.621200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.353113,0.000000,42.621200>}
box{<0,0,-0.076200><0.813497,0.036000,0.076200> rotate<0,0.000000,0> translate<45.353113,0.000000,42.621200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.353113,0.000000,42.621200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.081950,0.000000,42.892363>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<45.081950,0.000000,42.892363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.081950,0.000000,42.892363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.353113,0.000000,43.163528>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.997360,0> translate<45.081950,0.000000,42.892363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.353113,0.000000,43.163528>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.166609,0.000000,43.163528>}
box{<0,0,-0.076200><0.813497,0.036000,0.076200> rotate<0,0.000000,0> translate<45.353113,0.000000,43.163528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.719106,0.000000,43.705859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.719106,0.000000,42.892363>}
box{<0,0,-0.076200><0.813497,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.719106,0.000000,42.892363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.719106,0.000000,42.892363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990269,0.000000,42.621200>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<46.719106,0.000000,42.892363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990269,0.000000,42.621200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.803766,0.000000,42.621200>}
box{<0,0,-0.076200><0.813497,0.036000,0.076200> rotate<0,0.000000,0> translate<46.990269,0.000000,42.621200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.803766,0.000000,43.705859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.803766,0.000000,42.350037>}
box{<0,0,-0.076200><1.355822,0.036000,0.076200> rotate<0,-90.000000,0> translate<47.803766,0.000000,42.350037> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.803766,0.000000,42.350037>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.532600,0.000000,42.078872>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,-44.997030,0> translate<47.532600,0.000000,42.078872> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.532600,0.000000,42.078872>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.261434,0.000000,42.078872>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,0.000000,0> translate<47.261434,0.000000,42.078872> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.993419,0.000000,42.621200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.993419,0.000000,43.705859>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,90.000000,0> translate<49.993419,0.000000,43.705859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.993419,0.000000,43.705859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.535747,0.000000,44.248188>}
box{<0,0,-0.076200><0.766968,0.036000,0.076200> rotate<0,-44.997030,0> translate<49.993419,0.000000,43.705859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.535747,0.000000,44.248188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.078078,0.000000,43.705859>}
box{<0,0,-0.076200><0.766970,0.036000,0.076200> rotate<0,44.996865,0> translate<50.535747,0.000000,44.248188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.078078,0.000000,43.705859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.078078,0.000000,42.621200>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.078078,0.000000,42.621200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.993419,0.000000,43.434694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.078078,0.000000,43.434694>}
box{<0,0,-0.076200><1.084659,0.036000,0.076200> rotate<0,0.000000,0> translate<49.993419,0.000000,43.434694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.715234,0.000000,44.248188>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.715234,0.000000,42.621200>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.715234,0.000000,42.621200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.715234,0.000000,42.621200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.901738,0.000000,42.621200>}
box{<0,0,-0.076200><0.813497,0.036000,0.076200> rotate<0,0.000000,0> translate<51.901738,0.000000,42.621200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.901738,0.000000,42.621200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.630575,0.000000,42.892363>}
box{<0,0,-0.076200><0.383482,0.036000,0.076200> rotate<0,44.997030,0> translate<51.630575,0.000000,42.892363> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.630575,0.000000,42.892363>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.630575,0.000000,43.434694>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,90.000000,0> translate<51.630575,0.000000,43.434694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.630575,0.000000,43.434694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.901738,0.000000,43.705859>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.997360,0> translate<51.630575,0.000000,43.434694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.901738,0.000000,43.705859>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.715234,0.000000,43.705859>}
box{<0,0,-0.076200><0.813497,0.036000,0.076200> rotate<0,0.000000,0> translate<51.901738,0.000000,43.705859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.267731,0.000000,42.078872>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.538894,0.000000,42.078872>}
box{<0,0,-0.076200><0.271162,0.036000,0.076200> rotate<0,0.000000,0> translate<53.267731,0.000000,42.078872> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.538894,0.000000,42.078872>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.810059,0.000000,42.350037>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,-44.997030,0> translate<53.538894,0.000000,42.078872> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.810059,0.000000,42.350037>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.810059,0.000000,43.705859>}
box{<0,0,-0.076200><1.355822,0.036000,0.076200> rotate<0,90.000000,0> translate<53.810059,0.000000,43.705859> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.810059,0.000000,44.519353>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.810059,0.000000,44.248188>}
box{<0,0,-0.076200><0.271166,0.036000,0.076200> rotate<0,-90.000000,0> translate<53.810059,0.000000,44.248188> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.626800,0.000000,0.879725>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.999813,0.000000,0.879725>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,0.000000,0> translate<34.999813,0.000000,0.879725> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.999813,0.000000,0.879725>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.999813,0.000000,1.693219>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,90.000000,0> translate<34.999813,0.000000,1.693219> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.999813,0.000000,1.693219>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.270975,0.000000,1.964384>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.997360,0> translate<34.999813,0.000000,1.693219> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.270975,0.000000,1.964384>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.813306,0.000000,1.964384>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<35.270975,0.000000,1.964384> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.813306,0.000000,1.964384>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.084472,0.000000,1.693219>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,44.997030,0> translate<35.813306,0.000000,1.964384> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.084472,0.000000,1.693219>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.084472,0.000000,0.879725>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.084472,0.000000,0.879725> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.999813,0.000000,2.516881>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.626800,0.000000,2.516881>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,0.000000,0> translate<34.999813,0.000000,2.516881> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.626800,0.000000,2.516881>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.084472,0.000000,3.059209>}
box{<0,0,-0.076200><0.766968,0.036000,0.076200> rotate<0,44.997030,0> translate<36.084472,0.000000,3.059209> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.084472,0.000000,3.059209>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.626800,0.000000,3.601541>}
box{<0,0,-0.076200><0.766970,0.036000,0.076200> rotate<0,-44.997195,0> translate<36.084472,0.000000,3.059209> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.626800,0.000000,3.601541>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.999813,0.000000,3.601541>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,0.000000,0> translate<34.999813,0.000000,3.601541> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.626800,0.000000,4.154038>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.999813,0.000000,4.154038>}
box{<0,0,-0.076200><1.626987,0.036000,0.076200> rotate<0,0.000000,0> translate<34.999813,0.000000,4.154038> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.999813,0.000000,4.154038>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.999813,0.000000,4.967531>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,90.000000,0> translate<34.999813,0.000000,4.967531> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.999813,0.000000,4.967531>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.270975,0.000000,5.238697>}
box{<0,0,-0.076200><0.383484,0.036000,0.076200> rotate<0,-44.997360,0> translate<34.999813,0.000000,4.967531> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.270975,0.000000,5.238697>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.813306,0.000000,5.238697>}
box{<0,0,-0.076200><0.542331,0.036000,0.076200> rotate<0,0.000000,0> translate<35.270975,0.000000,5.238697> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.813306,0.000000,5.238697>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.084472,0.000000,4.967531>}
box{<0,0,-0.076200><0.383486,0.036000,0.076200> rotate<0,44.997030,0> translate<35.813306,0.000000,5.238697> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.084472,0.000000,4.967531>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.084472,0.000000,4.154038>}
box{<0,0,-0.076200><0.813494,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.084472,0.000000,4.154038> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.084472,0.000000,4.696366>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.626800,0.000000,5.238697>}
box{<0,0,-0.076200><0.766970,0.036000,0.076200> rotate<0,-44.997195,0> translate<36.084472,0.000000,4.696366> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.957544,0.000000,19.579584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.834672,0.000000,19.456713>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<53.834672,0.000000,19.456713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.834672,0.000000,19.456713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.834672,0.000000,19.210969>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<53.834672,0.000000,19.210969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.834672,0.000000,19.210969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.957544,0.000000,19.088100>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<53.834672,0.000000,19.210969> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.957544,0.000000,19.088100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.449031,0.000000,19.088100>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,0.000000,0> translate<53.957544,0.000000,19.088100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.449031,0.000000,19.088100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,19.210969>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<54.449031,0.000000,19.088100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,19.210969>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,19.456713>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<54.571900,0.000000,19.456713> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,19.456713>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.449031,0.000000,19.579584>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<54.449031,0.000000,19.579584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.449031,0.000000,19.579584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.203288,0.000000,19.579584>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<54.203288,0.000000,19.579584> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.203288,0.000000,19.579584>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.203288,0.000000,19.333841>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<54.203288,0.000000,19.333841> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,20.205128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,19.959384>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<54.571900,0.000000,19.959384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,19.959384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.449031,0.000000,19.836516>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<54.449031,0.000000,19.836516> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.449031,0.000000,19.836516>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.203288,0.000000,19.836516>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<54.203288,0.000000,19.836516> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.203288,0.000000,19.836516>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,19.959384>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<54.080416,0.000000,19.959384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,19.959384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,20.205128>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<54.080416,0.000000,20.205128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,20.205128>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.203288,0.000000,20.328000>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<54.080416,0.000000,20.205128> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.203288,0.000000,20.328000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.326159,0.000000,20.328000>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<54.203288,0.000000,20.328000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.326159,0.000000,20.328000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.326159,0.000000,19.836516>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,-90.000000,0> translate<54.326159,0.000000,19.836516> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,20.707800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,20.953544>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<54.080416,0.000000,20.953544> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,20.953544>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.203288,0.000000,21.076416>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<54.080416,0.000000,20.953544> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.203288,0.000000,21.076416>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,21.076416>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<54.203288,0.000000,21.076416> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,21.076416>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,20.707800>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,-90.000000,0> translate<54.571900,0.000000,20.707800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,20.707800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.449031,0.000000,20.584931>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<54.449031,0.000000,20.584931> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.449031,0.000000,20.584931>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.326159,0.000000,20.707800>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<54.326159,0.000000,20.707800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.326159,0.000000,20.707800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.326159,0.000000,21.076416>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,90.000000,0> translate<54.326159,0.000000,21.076416> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,21.333347>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,21.333347>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<54.080416,0.000000,21.333347> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.326159,0.000000,21.333347>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,21.579087>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.996666,0> translate<54.080416,0.000000,21.579087> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,21.579087>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,21.701959>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<54.080416,0.000000,21.701959> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,22.705441>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,22.951181>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,90.000000,0> translate<54.571900,0.000000,22.951181> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,22.828309>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.834672,0.000000,22.828309>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,0.000000,0> translate<53.834672,0.000000,22.828309> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.834672,0.000000,22.705441>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.834672,0.000000,22.951181>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,90.000000,0> translate<53.834672,0.000000,22.951181> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,23.204384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,23.204384>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<54.080416,0.000000,23.204384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,23.204384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,23.572997>}
box{<0,0,-0.038100><0.368613,0.036000,0.038100> rotate<0,90.000000,0> translate<54.080416,0.000000,23.572997> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,23.572997>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.203288,0.000000,23.695869>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<54.080416,0.000000,23.572997> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.203288,0.000000,23.695869>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,23.695869>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<54.203288,0.000000,23.695869> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.834672,0.000000,24.444284>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,24.444284>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,0.000000,0> translate<53.834672,0.000000,24.444284> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,24.444284>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,24.075669>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,-90.000000,0> translate<54.571900,0.000000,24.075669> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,24.075669>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.449031,0.000000,23.952800>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<54.449031,0.000000,23.952800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.449031,0.000000,23.952800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.203288,0.000000,23.952800>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<54.203288,0.000000,23.952800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.203288,0.000000,23.952800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,24.075669>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<54.080416,0.000000,24.075669> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,24.075669>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,24.444284>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,90.000000,0> translate<54.080416,0.000000,24.444284> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,24.701216>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,24.824084>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,90.000000,0> translate<54.080416,0.000000,24.824084> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,24.824084>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,24.824084>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<54.080416,0.000000,24.824084> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,24.701216>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,24.946956>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,90.000000,0> translate<54.571900,0.000000,24.946956> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.711800,0.000000,24.824084>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.834672,0.000000,24.824084>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,0.000000,0> translate<53.711800,0.000000,24.824084> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,25.691644>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,25.323028>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,-90.000000,0> translate<54.080416,0.000000,25.323028> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,25.323028>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.203288,0.000000,25.200159>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<54.080416,0.000000,25.323028> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.203288,0.000000,25.200159>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.449031,0.000000,25.200159>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<54.203288,0.000000,25.200159> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.449031,0.000000,25.200159>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,25.323028>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<54.449031,0.000000,25.200159> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,25.323028>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,25.691644>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,90.000000,0> translate<54.571900,0.000000,25.691644> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,26.071444>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,26.317188>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<54.080416,0.000000,26.317188> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,26.317188>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.203288,0.000000,26.440059>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<54.080416,0.000000,26.317188> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.203288,0.000000,26.440059>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,26.440059>}
box{<0,0,-0.038100><0.368612,0.036000,0.038100> rotate<0,0.000000,0> translate<54.203288,0.000000,26.440059> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,26.440059>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,26.071444>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,-90.000000,0> translate<54.571900,0.000000,26.071444> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,26.071444>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.449031,0.000000,25.948575>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<54.449031,0.000000,25.948575> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.449031,0.000000,25.948575>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.326159,0.000000,26.071444>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<54.326159,0.000000,26.071444> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.326159,0.000000,26.071444>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.326159,0.000000,26.440059>}
box{<0,0,-0.038100><0.368616,0.036000,0.038100> rotate<0,90.000000,0> translate<54.326159,0.000000,26.440059> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.957544,0.000000,26.819859>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.449031,0.000000,26.819859>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,0.000000,0> translate<53.957544,0.000000,26.819859> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.449031,0.000000,26.819859>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,26.942731>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,-44.997759,0> translate<54.449031,0.000000,26.819859> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,26.696991>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,26.942731>}
box{<0,0,-0.038100><0.245741,0.036000,0.038100> rotate<0,90.000000,0> translate<54.080416,0.000000,26.942731> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,27.318803>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,27.564547>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<54.571900,0.000000,27.564547> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,27.564547>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.449031,0.000000,27.687419>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<54.449031,0.000000,27.687419> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.449031,0.000000,27.687419>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.203288,0.000000,27.687419>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<54.203288,0.000000,27.687419> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.203288,0.000000,27.687419>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,27.564547>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<54.080416,0.000000,27.564547> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,27.564547>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,27.318803>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<54.080416,0.000000,27.318803> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,27.318803>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.203288,0.000000,27.195934>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<54.080416,0.000000,27.318803> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.203288,0.000000,27.195934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.449031,0.000000,27.195934>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,0.000000,0> translate<54.203288,0.000000,27.195934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.449031,0.000000,27.195934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,27.318803>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<54.449031,0.000000,27.195934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,27.944350>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,27.944350>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,0.000000,0> translate<54.080416,0.000000,27.944350> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.326159,0.000000,27.944350>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,28.190091>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.996666,0> translate<54.080416,0.000000,28.190091> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,28.190091>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,28.312963>}
box{<0,0,-0.038100><0.122872,0.036000,0.038100> rotate<0,90.000000,0> translate<54.080416,0.000000,28.312963> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,29.316444>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,29.562184>}
box{<0,0,-0.038100><0.549496,0.036000,0.038100> rotate<0,-26.563152,0> translate<54.080416,0.000000,29.316444> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,29.562184>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,29.807928>}
box{<0,0,-0.038100><0.549497,0.036000,0.038100> rotate<0,26.563444,0> translate<54.080416,0.000000,29.807928> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.080416,0.000000,30.064859>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.834672,0.000000,30.310600>}
box{<0,0,-0.038100><0.347532,0.036000,0.038100> rotate<0,44.996666,0> translate<53.834672,0.000000,30.310600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.834672,0.000000,30.310600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,30.310600>}
box{<0,0,-0.038100><0.737228,0.036000,0.038100> rotate<0,0.000000,0> translate<53.834672,0.000000,30.310600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,30.064859>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,30.556344>}
box{<0,0,-0.038100><0.491484,0.036000,0.038100> rotate<0,90.000000,0> translate<54.571900,0.000000,30.556344> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,30.813275>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.449031,0.000000,30.813275>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<54.449031,0.000000,30.813275> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.449031,0.000000,30.813275>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.449031,0.000000,30.936144>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,90.000000,0> translate<54.449031,0.000000,30.936144> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.449031,0.000000,30.936144>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,30.936144>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,0.000000,0> translate<54.449031,0.000000,30.936144> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,30.936144>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,30.813275>}
box{<0,0,-0.038100><0.122869,0.036000,0.038100> rotate<0,-90.000000,0> translate<54.571900,0.000000,30.813275> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.449031,0.000000,31.187481>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.957544,0.000000,31.187481>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,0.000000,0> translate<53.957544,0.000000,31.187481> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.957544,0.000000,31.187481>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.834672,0.000000,31.310350>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.996302,0> translate<53.834672,0.000000,31.310350> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.834672,0.000000,31.310350>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.834672,0.000000,31.556094>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,90.000000,0> translate<53.834672,0.000000,31.556094> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.834672,0.000000,31.556094>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.957544,0.000000,31.678966>}
box{<0,0,-0.038100><0.173767,0.036000,0.038100> rotate<0,-44.997030,0> translate<53.834672,0.000000,31.556094> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.957544,0.000000,31.678966>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.449031,0.000000,31.678966>}
box{<0,0,-0.038100><0.491488,0.036000,0.038100> rotate<0,0.000000,0> translate<53.957544,0.000000,31.678966> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.449031,0.000000,31.678966>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,31.556094>}
box{<0,0,-0.038100><0.173765,0.036000,0.038100> rotate<0,44.997759,0> translate<54.449031,0.000000,31.678966> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,31.556094>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,31.310350>}
box{<0,0,-0.038100><0.245744,0.036000,0.038100> rotate<0,-90.000000,0> translate<54.571900,0.000000,31.310350> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.571900,0.000000,31.310350>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.449031,0.000000,31.187481>}
box{<0,0,-0.038100><0.173763,0.036000,0.038100> rotate<0,-44.997030,0> translate<54.449031,0.000000,31.187481> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<54.449031,0.000000,31.187481>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.957544,0.000000,31.678966>}
box{<0,0,-0.038100><0.695066,0.036000,0.038100> rotate<0,44.996848,0> translate<53.957544,0.000000,31.678966> }
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,8.128000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,8.509000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<16.510000,0.000000,8.509000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.891000,0.000000,8.509000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,8.509000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.510000,0.000000,8.509000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,8.509000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,8.890000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<16.510000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,8.509000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.129000,0.000000,8.509000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.129000,0.000000,8.509000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,8.509000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,9.398000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,90.000000,0> translate<17.780000,0.000000,9.398000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,9.398000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,9.398000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.780000,0.000000,9.398000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,9.398000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,9.906000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<19.050000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,9.906000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,9.906000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.510000,0.000000,9.906000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,9.906000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,9.398000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.510000,0.000000,9.398000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,9.398000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,9.398000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.510000,0.000000,9.398000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,11.811000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<17.780000,0.000000,11.811000> }
difference{
cylinder{<17.780000,0,10.160000><17.780000,0.036000,10.160000>2.870200 translate<0,0.000000,0>}
cylinder{<17.780000,-0.1,10.160000><17.780000,0.135000,10.160000>2.717800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-90.000000,0> translate<17.780000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.908150,0.000000,11.430813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.717488,0.000000,11.621475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<21.717488,0.000000,11.621475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.717488,0.000000,11.621475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.336163,0.000000,11.621475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<21.336163,0.000000,11.621475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.336163,0.000000,11.621475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.145500,0.000000,11.430813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<21.145500,0.000000,11.430813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.145500,0.000000,11.430813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.145500,0.000000,10.668163>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,-90.000000,0> translate<21.145500,0.000000,10.668163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.145500,0.000000,10.668163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.336163,0.000000,10.477500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<21.145500,0.000000,10.668163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.336163,0.000000,10.477500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.717488,0.000000,10.477500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<21.336163,0.000000,10.477500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.717488,0.000000,10.477500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.908150,0.000000,10.668163>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<21.717488,0.000000,10.477500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.314897,0.000000,11.240150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.696222,0.000000,11.621475>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,-44.997030,0> translate<22.314897,0.000000,11.240150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.696222,0.000000,11.621475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.696222,0.000000,10.477500>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,-90.000000,0> translate<22.696222,0.000000,10.477500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.314897,0.000000,10.477500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.077547,0.000000,10.477500>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<22.314897,0.000000,10.477500> }
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.589000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.271000,0.000000,6.985000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.271000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.271000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.589000,0.000000,9.525000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.271000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,0.000000,7.239000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.017000,0.000000,9.271000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<9.017000,0.000000,9.271000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.843000,0.000000,7.239000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.843000,0.000000,9.271000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.843000,0.000000,9.271000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<9.271000,0.000000,7.239000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<13.589000,0.000000,7.239000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<9.271000,0.000000,9.271000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<13.589000,0.000000,9.271000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.668000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.049000,0.000000,8.255000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.668000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.049000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.176000,0.000000,8.255000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.049000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.176000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.176000,0.000000,7.493000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,-90.000000,0> translate<11.176000,0.000000,7.493000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.176000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.176000,0.000000,9.017000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,90.000000,0> translate<11.176000,0.000000,9.017000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.684000,0.000000,7.493000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.684000,0.000000,8.255000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,90.000000,0> translate<11.684000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.684000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.684000,0.000000,9.017000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,90.000000,0> translate<11.684000,0.000000,9.017000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.684000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.811000,0.000000,8.255000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.684000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.811000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.192000,0.000000,8.255000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.811000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.430150,0.000000,8.382812>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.239488,0.000000,8.573475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<7.239488,0.000000,8.573475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.239488,0.000000,8.573475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.858163,0.000000,8.573475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<6.858163,0.000000,8.573475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.858163,0.000000,8.573475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.667500,0.000000,8.382812>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<6.667500,0.000000,8.382812> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.667500,0.000000,8.382812>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.667500,0.000000,7.620163>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,-90.000000,0> translate<6.667500,0.000000,7.620163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.667500,0.000000,7.620163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.858163,0.000000,7.429500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<6.667500,0.000000,7.620163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.858163,0.000000,7.429500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.239488,0.000000,7.429500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<6.858163,0.000000,7.429500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.239488,0.000000,7.429500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.430150,0.000000,7.620163>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<7.239488,0.000000,7.429500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.599547,0.000000,7.429500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.836897,0.000000,7.429500>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<7.836897,0.000000,7.429500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.836897,0.000000,7.429500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.599547,0.000000,8.192150>}
box{<0,0,-0.063500><1.078550,0.036000,0.063500> rotate<0,-44.997030,0> translate<7.836897,0.000000,7.429500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.599547,0.000000,8.192150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.599547,0.000000,8.382812>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,90.000000,0> translate<8.599547,0.000000,8.382812> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.599547,0.000000,8.382812>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.408884,0.000000,8.573475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<8.408884,0.000000,8.573475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.408884,0.000000,8.573475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.027559,0.000000,8.573475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<8.027559,0.000000,8.573475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.027559,0.000000,8.573475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.836897,0.000000,8.382812>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<7.836897,0.000000,8.382812> }
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.339000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.577000,0.000000,29.337000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.577000,0.000000,29.337000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.958000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.958000,0.000000,28.956000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.958000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.561000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.672000,0.000000,30.480000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.672000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.672000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.672000,0.000000,31.750000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<42.672000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.672000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,31.750000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.164000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,29.210000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.164000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.672000,0.000000,29.210000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.164000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.672000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.672000,0.000000,30.480000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<42.672000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.259000,0.000000,30.480000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.259000,0.000000,30.480000> }
difference{
cylinder{<41.910000,0,30.480000><41.910000,0.036000,30.480000>5.156200 translate<0,0.000000,0>}
cylinder{<41.910000,-0.1,30.480000><41.910000,0.135000,30.480000>5.003800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-180.000000,0> translate<41.402000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.070150,0.000000,31.115813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.879488,0.000000,31.306475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<47.879488,0.000000,31.306475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.879488,0.000000,31.306475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.498162,0.000000,31.306475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<47.498162,0.000000,31.306475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.498162,0.000000,31.306475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.307500,0.000000,31.115813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<47.307500,0.000000,31.115813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.307500,0.000000,31.115813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.307500,0.000000,30.353162>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,-90.000000,0> translate<47.307500,0.000000,30.353162> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.307500,0.000000,30.353162>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.498162,0.000000,30.162500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<47.307500,0.000000,30.353162> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.498162,0.000000,30.162500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.879488,0.000000,30.162500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<47.498162,0.000000,30.162500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.879488,0.000000,30.162500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.070150,0.000000,30.353162>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<47.879488,0.000000,30.162500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.476897,0.000000,31.115813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.667559,0.000000,31.306475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<48.476897,0.000000,31.115813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.667559,0.000000,31.306475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.048884,0.000000,31.306475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<48.667559,0.000000,31.306475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.048884,0.000000,31.306475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.239547,0.000000,31.115813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<49.048884,0.000000,31.306475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.239547,0.000000,31.115813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.239547,0.000000,30.925150>}
box{<0,0,-0.063500><0.190662,0.036000,0.063500> rotate<0,-90.000000,0> translate<49.239547,0.000000,30.925150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.239547,0.000000,30.925150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.048884,0.000000,30.734488>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<49.048884,0.000000,30.734488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.048884,0.000000,30.734488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.858222,0.000000,30.734488>}
box{<0,0,-0.063500><0.190662,0.036000,0.063500> rotate<0,0.000000,0> translate<48.858222,0.000000,30.734488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.048884,0.000000,30.734488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.239547,0.000000,30.543825>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<49.048884,0.000000,30.734488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.239547,0.000000,30.543825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.239547,0.000000,30.353162>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,-90.000000,0> translate<49.239547,0.000000,30.353162> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.239547,0.000000,30.353162>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.048884,0.000000,30.162500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<49.048884,0.000000,30.162500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.048884,0.000000,30.162500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.667559,0.000000,30.162500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<48.667559,0.000000,30.162500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.667559,0.000000,30.162500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.476897,0.000000,30.353162>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<48.476897,0.000000,30.353162> }
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,16.129000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,11.811000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.070000,0.000000,11.811000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,11.811000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,16.129000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,90.000000,0> translate<49.530000,0.000000,16.129000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.816000,0.000000,11.557000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.784000,0.000000,11.557000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<49.784000,0.000000,11.557000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.816000,0.000000,16.383000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.784000,0.000000,16.383000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<49.784000,0.000000,16.383000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<51.816000,0.000000,11.811000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<51.816000,0.000000,16.129000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<49.784000,0.000000,11.811000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<49.784000,0.000000,16.129000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,13.589000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<50.800000,0.000000,13.589000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,13.716000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,90.000000,0> translate<50.800000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<50.800000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<51.562000,0.000000,13.716000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<50.800000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<50.800000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<50.038000,0.000000,13.716000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<50.038000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<51.562000,0.000000,14.224000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<50.800000,0.000000,14.224000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<50.800000,0.000000,14.224000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<50.800000,0.000000,14.224000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<50.038000,0.000000,14.224000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<50.038000,0.000000,14.224000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,14.224000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,14.351000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,90.000000,0> translate<50.800000,0.000000,14.351000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,14.351000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.800000,0.000000,14.732000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<50.800000,0.000000,14.732000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.245150,0.000000,17.780812>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.054488,0.000000,17.971475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<51.054488,0.000000,17.971475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.054488,0.000000,17.971475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.673163,0.000000,17.971475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<50.673163,0.000000,17.971475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.673163,0.000000,17.971475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.482500,0.000000,17.780812>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<50.482500,0.000000,17.780812> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.482500,0.000000,17.780812>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.482500,0.000000,17.018163>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,-90.000000,0> translate<50.482500,0.000000,17.018163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.482500,0.000000,17.018163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.673163,0.000000,16.827500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<50.482500,0.000000,17.018163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.673163,0.000000,16.827500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.054488,0.000000,16.827500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<50.673163,0.000000,16.827500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.054488,0.000000,16.827500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.245150,0.000000,17.018163>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<51.054488,0.000000,16.827500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.223884,0.000000,16.827500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.223884,0.000000,17.971475>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,90.000000,0> translate<52.223884,0.000000,17.971475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.223884,0.000000,17.971475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.651897,0.000000,17.399487>}
box{<0,0,-0.063500><0.808912,0.036000,0.063500> rotate<0,-44.997030,0> translate<51.651897,0.000000,17.399487> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.651897,0.000000,17.399487>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.414547,0.000000,17.399487>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<51.651897,0.000000,17.399487> }
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
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.830150,0.000000,13.335813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.639488,0.000000,13.526475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<32.639488,0.000000,13.526475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.639488,0.000000,13.526475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.258163,0.000000,13.526475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<32.258163,0.000000,13.526475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.258163,0.000000,13.526475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.067500,0.000000,13.335813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<32.067500,0.000000,13.335813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.067500,0.000000,13.335813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.067500,0.000000,12.573163>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,-90.000000,0> translate<32.067500,0.000000,12.573163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.067500,0.000000,12.573163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.258163,0.000000,12.382500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<32.067500,0.000000,12.573163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.258163,0.000000,12.382500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.639488,0.000000,12.382500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<32.258163,0.000000,12.382500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.639488,0.000000,12.382500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.830150,0.000000,12.573163>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<32.639488,0.000000,12.382500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.999547,0.000000,13.526475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.236897,0.000000,13.526475>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<33.236897,0.000000,13.526475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.236897,0.000000,13.526475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.236897,0.000000,12.954488>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,-90.000000,0> translate<33.236897,0.000000,12.954488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.236897,0.000000,12.954488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.618222,0.000000,13.145150>}
box{<0,0,-0.063500><0.426334,0.036000,0.063500> rotate<0,-26.563298,0> translate<33.236897,0.000000,12.954488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.618222,0.000000,13.145150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.808884,0.000000,13.145150>}
box{<0,0,-0.063500><0.190662,0.036000,0.063500> rotate<0,0.000000,0> translate<33.618222,0.000000,13.145150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.808884,0.000000,13.145150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.999547,0.000000,12.954488>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<33.808884,0.000000,13.145150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.999547,0.000000,12.954488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.999547,0.000000,12.573163>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<33.999547,0.000000,12.573163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.999547,0.000000,12.573163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.808884,0.000000,12.382500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<33.808884,0.000000,12.382500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.808884,0.000000,12.382500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.427559,0.000000,12.382500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<33.427559,0.000000,12.382500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.427559,0.000000,12.382500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.236897,0.000000,12.573163>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<33.236897,0.000000,12.573163> }
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,33.401000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.970000,0.000000,37.719000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.970000,0.000000,37.719000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,37.719000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,33.401000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.510000,0.000000,33.401000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.224000,0.000000,37.973000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,37.973000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.224000,0.000000,37.973000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.224000,0.000000,33.147000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,33.147000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.224000,0.000000,33.147000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<14.224000,0.000000,37.719000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<14.224000,0.000000,33.401000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<16.256000,0.000000,37.719000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<16.256000,0.000000,33.401000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,36.322000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,35.941000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.240000,0.000000,35.941000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,35.941000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,35.814000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.240000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.240000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.478000,0.000000,35.814000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<14.478000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.240000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.002000,0.000000,35.814000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<15.240000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.478000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.240000,0.000000,35.306000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<14.478000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.240000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.002000,0.000000,35.306000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<15.240000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,35.179000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.240000,0.000000,35.179000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,35.179000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,34.798000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.240000,0.000000,34.798000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.144188,0.000000,35.370150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.953525,0.000000,35.179488>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<16.953525,0.000000,35.179488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.953525,0.000000,35.179488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.953525,0.000000,34.798163>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<16.953525,0.000000,34.798163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.953525,0.000000,34.798163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.144188,0.000000,34.607500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<16.953525,0.000000,34.798163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.144188,0.000000,34.607500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.906838,0.000000,34.607500>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<17.144188,0.000000,34.607500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.906838,0.000000,34.607500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.097500,0.000000,34.798163>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<17.906838,0.000000,34.607500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.097500,0.000000,34.798163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.097500,0.000000,35.179488>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<18.097500,0.000000,35.179488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.097500,0.000000,35.179488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.906838,0.000000,35.370150>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<17.906838,0.000000,35.370150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.953525,0.000000,36.539547>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.144188,0.000000,36.158222>}
box{<0,0,-0.063500><0.426334,0.036000,0.063500> rotate<0,63.430762,0> translate<16.953525,0.000000,36.539547> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.144188,0.000000,36.158222>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.525513,0.000000,35.776897>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,44.997030,0> translate<17.144188,0.000000,36.158222> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.525513,0.000000,35.776897>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.906838,0.000000,35.776897>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<17.525513,0.000000,35.776897> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.906838,0.000000,35.776897>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.097500,0.000000,35.967559>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<17.906838,0.000000,35.776897> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.097500,0.000000,35.967559>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.097500,0.000000,36.348884>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<18.097500,0.000000,36.348884> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.097500,0.000000,36.348884>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.906838,0.000000,36.539547>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<17.906838,0.000000,36.539547> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.906838,0.000000,36.539547>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.716175,0.000000,36.539547>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,0.000000,0> translate<17.716175,0.000000,36.539547> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.716175,0.000000,36.539547>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.525513,0.000000,36.348884>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<17.525513,0.000000,36.348884> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.525513,0.000000,36.348884>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.525513,0.000000,35.776897>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,-90.000000,0> translate<17.525513,0.000000,35.776897> }
//C7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,33.401000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.940000,0.000000,37.719000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,90.000000,0> translate<27.940000,0.000000,37.719000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.480000,0.000000,37.719000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.480000,0.000000,33.401000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.480000,0.000000,33.401000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.194000,0.000000,37.973000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,37.973000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.194000,0.000000,37.973000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.194000,0.000000,33.147000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,33.147000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.194000,0.000000,33.147000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<28.194000,0.000000,37.719000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<28.194000,0.000000,33.401000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<30.226000,0.000000,37.719000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<30.226000,0.000000,33.401000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,36.322000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,35.941000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.210000,0.000000,35.941000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,35.941000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,35.814000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.210000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.210000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.448000,0.000000,35.814000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<28.448000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.210000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.972000,0.000000,35.814000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<29.210000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.448000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.210000,0.000000,35.306000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<28.448000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.210000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.972000,0.000000,35.306000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<29.210000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,35.179000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.210000,0.000000,35.179000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,35.179000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,34.798000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.210000,0.000000,34.798000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.669187,0.000000,36.005150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.478525,0.000000,35.814487>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<26.478525,0.000000,35.814487> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.478525,0.000000,35.814487>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.478525,0.000000,35.433163>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<26.478525,0.000000,35.433163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.478525,0.000000,35.433163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.669187,0.000000,35.242500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<26.478525,0.000000,35.433163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.669187,0.000000,35.242500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.431838,0.000000,35.242500>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<26.669187,0.000000,35.242500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.431838,0.000000,35.242500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.622500,0.000000,35.433163>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<27.431838,0.000000,35.242500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.622500,0.000000,35.433163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.622500,0.000000,35.814487>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<27.622500,0.000000,35.814487> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.622500,0.000000,35.814487>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.431838,0.000000,36.005150>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<27.431838,0.000000,36.005150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.478525,0.000000,36.411897>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.478525,0.000000,37.174547>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,90.000000,0> translate<26.478525,0.000000,37.174547> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.478525,0.000000,37.174547>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.669187,0.000000,37.174547>}
box{<0,0,-0.063500><0.190662,0.036000,0.063500> rotate<0,0.000000,0> translate<26.478525,0.000000,37.174547> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.669187,0.000000,37.174547>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.431838,0.000000,36.411897>}
box{<0,0,-0.063500><1.078550,0.036000,0.063500> rotate<0,44.997030,0> translate<26.669187,0.000000,37.174547> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.431838,0.000000,36.411897>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.622500,0.000000,36.411897>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,0.000000,0> translate<27.431838,0.000000,36.411897> }
//C8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.069000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.751000,0.000000,45.720000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.751000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.751000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.069000,0.000000,48.260000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.751000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,45.974000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.497000,0.000000,48.006000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<39.497000,0.000000,48.006000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,45.974000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.323000,0.000000,48.006000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.323000,0.000000,48.006000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<39.751000,0.000000,45.974000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<44.069000,0.000000,45.974000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<39.751000,0.000000,48.006000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<44.069000,0.000000,48.006000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.148000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.529000,0.000000,46.990000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.148000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.529000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,46.990000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.529000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.656000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.656000,0.000000,46.228000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,-90.000000,0> translate<41.656000,0.000000,46.228000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.656000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.656000,0.000000,47.752000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,90.000000,0> translate<41.656000,0.000000,47.752000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.164000,0.000000,46.228000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.164000,0.000000,46.990000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,90.000000,0> translate<42.164000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.164000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.164000,0.000000,47.752000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,90.000000,0> translate<42.164000,0.000000,47.752000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,46.990000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.164000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.672000,0.000000,46.990000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.291000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.165150,0.000000,47.625813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.974488,0.000000,47.816475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<45.974488,0.000000,47.816475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.974488,0.000000,47.816475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.593163,0.000000,47.816475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<45.593163,0.000000,47.816475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.593163,0.000000,47.816475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.402500,0.000000,47.625813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<45.402500,0.000000,47.625813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.402500,0.000000,47.625813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.402500,0.000000,46.863163>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,-90.000000,0> translate<45.402500,0.000000,46.863163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.402500,0.000000,46.863163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.593163,0.000000,46.672500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<45.402500,0.000000,46.863163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.593163,0.000000,46.672500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.974488,0.000000,46.672500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<45.593163,0.000000,46.672500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.974488,0.000000,46.672500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.165150,0.000000,46.863163>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<45.974488,0.000000,46.672500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.571897,0.000000,47.625813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.762559,0.000000,47.816475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<46.571897,0.000000,47.625813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.762559,0.000000,47.816475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.143884,0.000000,47.816475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<46.762559,0.000000,47.816475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.143884,0.000000,47.816475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.334547,0.000000,47.625813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<47.143884,0.000000,47.816475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.334547,0.000000,47.625813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.334547,0.000000,47.435150>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,-90.000000,0> translate<47.334547,0.000000,47.435150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.334547,0.000000,47.435150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.143884,0.000000,47.244488>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<47.143884,0.000000,47.244488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.143884,0.000000,47.244488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.334547,0.000000,47.053825>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<47.143884,0.000000,47.244488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.334547,0.000000,47.053825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.334547,0.000000,46.863163>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,-90.000000,0> translate<47.334547,0.000000,46.863163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.334547,0.000000,46.863163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.143884,0.000000,46.672500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<47.143884,0.000000,46.672500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.143884,0.000000,46.672500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.762559,0.000000,46.672500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<46.762559,0.000000,46.672500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.762559,0.000000,46.672500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.571897,0.000000,46.863163>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<46.571897,0.000000,46.863163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.571897,0.000000,46.863163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.571897,0.000000,47.053825>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,90.000000,0> translate<46.571897,0.000000,47.053825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.571897,0.000000,47.053825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.762559,0.000000,47.244488>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<46.571897,0.000000,47.053825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.762559,0.000000,47.244488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.571897,0.000000,47.435150>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<46.571897,0.000000,47.435150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.571897,0.000000,47.435150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.571897,0.000000,47.625813>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,90.000000,0> translate<46.571897,0.000000,47.625813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.762559,0.000000,47.244488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.143884,0.000000,47.244488>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<46.762559,0.000000,47.244488> }
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,24.130000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,90.000000,0> translate<46.101000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.259000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.259000,0.000000,13.970000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.259000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.259000,0.000000,13.970000>}
box{<0,0,-0.076200><5.842000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.259000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,0.000000,24.130000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.196000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.259000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,24.130000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.259000,0.000000,24.130000> }
object{ARC(1.016000,0.152400,180.000000,360.000000,0.036000) translate<43.180000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.037500,0.000000,24.447500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.418825,0.000000,24.447500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<46.037500,0.000000,24.447500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.228163,0.000000,24.447500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.228163,0.000000,25.591475>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,90.000000,0> translate<46.228163,0.000000,25.591475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.037500,0.000000,25.591475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.418825,0.000000,25.591475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<46.037500,0.000000,25.591475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.579747,0.000000,25.400813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.389084,0.000000,25.591475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<47.389084,0.000000,25.591475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.389084,0.000000,25.591475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.007759,0.000000,25.591475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<47.007759,0.000000,25.591475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.007759,0.000000,25.591475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.817097,0.000000,25.400813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<46.817097,0.000000,25.400813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.817097,0.000000,25.400813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.817097,0.000000,24.638162>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,-90.000000,0> translate<46.817097,0.000000,24.638162> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.817097,0.000000,24.638162>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.007759,0.000000,24.447500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<46.817097,0.000000,24.638162> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.007759,0.000000,24.447500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.389084,0.000000,24.447500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<47.007759,0.000000,24.447500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.389084,0.000000,24.447500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.579747,0.000000,24.638162>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<47.389084,0.000000,24.447500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.986494,0.000000,25.210150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.367819,0.000000,25.591475>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,-44.997030,0> translate<47.986494,0.000000,25.210150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.367819,0.000000,25.591475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.367819,0.000000,24.447500>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,-90.000000,0> translate<48.367819,0.000000,24.447500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.986494,0.000000,24.447500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.749144,0.000000,24.447500>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<47.986494,0.000000,24.447500> }
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
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.715500,0.000000,32.194500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.096825,0.000000,32.194500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<9.715500,0.000000,32.194500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.906163,0.000000,32.194500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.906163,0.000000,33.338475>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,90.000000,0> translate<9.906163,0.000000,33.338475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.715500,0.000000,33.338475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.096825,0.000000,33.338475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<9.715500,0.000000,33.338475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.257747,0.000000,33.147813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.067084,0.000000,33.338475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<11.067084,0.000000,33.338475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.067084,0.000000,33.338475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.685759,0.000000,33.338475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<10.685759,0.000000,33.338475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.685759,0.000000,33.338475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.495097,0.000000,33.147813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<10.495097,0.000000,33.147813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.495097,0.000000,33.147813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.495097,0.000000,32.385162>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,-90.000000,0> translate<10.495097,0.000000,32.385162> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.495097,0.000000,32.385162>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.685759,0.000000,32.194500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<10.495097,0.000000,32.385162> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.685759,0.000000,32.194500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.067084,0.000000,32.194500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<10.685759,0.000000,32.194500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.067084,0.000000,32.194500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.257747,0.000000,32.385162>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<11.067084,0.000000,32.194500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.427144,0.000000,32.194500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.664494,0.000000,32.194500>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<11.664494,0.000000,32.194500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.664494,0.000000,32.194500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.427144,0.000000,32.957150>}
box{<0,0,-0.063500><1.078550,0.036000,0.063500> rotate<0,-44.997030,0> translate<11.664494,0.000000,32.194500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.427144,0.000000,32.957150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.427144,0.000000,33.147813>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,90.000000,0> translate<12.427144,0.000000,33.147813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.427144,0.000000,33.147813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.236481,0.000000,33.338475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<12.236481,0.000000,33.338475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.236481,0.000000,33.338475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.855156,0.000000,33.338475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<11.855156,0.000000,33.338475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.855156,0.000000,33.338475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.664494,0.000000,33.147813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<11.664494,0.000000,33.147813> }
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
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.685500,0.000000,32.194500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.066825,0.000000,32.194500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<23.685500,0.000000,32.194500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.876162,0.000000,32.194500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.876162,0.000000,33.338475>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,90.000000,0> translate<23.876162,0.000000,33.338475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.685500,0.000000,33.338475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.066825,0.000000,33.338475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<23.685500,0.000000,33.338475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.227747,0.000000,33.147813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.037084,0.000000,33.338475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<25.037084,0.000000,33.338475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.037084,0.000000,33.338475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.655759,0.000000,33.338475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<24.655759,0.000000,33.338475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.655759,0.000000,33.338475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.465097,0.000000,33.147813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<24.465097,0.000000,33.147813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.465097,0.000000,33.147813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.465097,0.000000,32.385162>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,-90.000000,0> translate<24.465097,0.000000,32.385162> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.465097,0.000000,32.385162>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.655759,0.000000,32.194500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<24.465097,0.000000,32.385162> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.655759,0.000000,32.194500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.037084,0.000000,32.194500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<24.655759,0.000000,32.194500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.037084,0.000000,32.194500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.227747,0.000000,32.385162>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.037084,0.000000,32.194500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.634494,0.000000,33.147813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.825156,0.000000,33.338475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.634494,0.000000,33.147813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.825156,0.000000,33.338475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.206481,0.000000,33.338475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<25.825156,0.000000,33.338475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.206481,0.000000,33.338475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.397144,0.000000,33.147813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<26.206481,0.000000,33.338475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.397144,0.000000,33.147813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.397144,0.000000,32.957150>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,-90.000000,0> translate<26.397144,0.000000,32.957150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.397144,0.000000,32.957150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.206481,0.000000,32.766488>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<26.206481,0.000000,32.766488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.206481,0.000000,32.766488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.015819,0.000000,32.766488>}
box{<0,0,-0.063500><0.190662,0.036000,0.063500> rotate<0,0.000000,0> translate<26.015819,0.000000,32.766488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.206481,0.000000,32.766488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.397144,0.000000,32.575825>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<26.206481,0.000000,32.766488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.397144,0.000000,32.575825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.397144,0.000000,32.385162>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,-90.000000,0> translate<26.397144,0.000000,32.385162> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.397144,0.000000,32.385162>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.206481,0.000000,32.194500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<26.206481,0.000000,32.194500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.206481,0.000000,32.194500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.825156,0.000000,32.194500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<25.825156,0.000000,32.194500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.825156,0.000000,32.194500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.634494,0.000000,32.385162>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<25.634494,0.000000,32.385162> }
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
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.131300,0.000000,2.025103>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.131300,0.000000,2.406428>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<9.131300,0.000000,2.406428> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.131300,0.000000,2.215766>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.987325,0.000000,2.215766>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<7.987325,0.000000,2.215766> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.987325,0.000000,2.025103>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.987325,0.000000,2.406428>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<7.987325,0.000000,2.406428> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.177988,0.000000,3.567350>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.987325,0.000000,3.376688>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<7.987325,0.000000,3.376688> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.987325,0.000000,3.376688>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.987325,0.000000,2.995363>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<7.987325,0.000000,2.995363> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.987325,0.000000,2.995363>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.177988,0.000000,2.804700>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<7.987325,0.000000,2.995363> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.177988,0.000000,2.804700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.940638,0.000000,2.804700>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<8.177988,0.000000,2.804700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.940638,0.000000,2.804700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.131300,0.000000,2.995363>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<8.940638,0.000000,2.804700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.131300,0.000000,2.995363>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.131300,0.000000,3.376688>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<9.131300,0.000000,3.376688> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.131300,0.000000,3.376688>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.940638,0.000000,3.567350>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<8.940638,0.000000,3.567350> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.131300,0.000000,4.546084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.987325,0.000000,4.546084>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<7.987325,0.000000,4.546084> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.987325,0.000000,4.546084>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.559313,0.000000,3.974097>}
box{<0,0,-0.063500><0.808912,0.036000,0.063500> rotate<0,44.997030,0> translate<7.987325,0.000000,4.546084> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.559313,0.000000,3.974097>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.559313,0.000000,4.736747>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,90.000000,0> translate<8.559313,0.000000,4.736747> }
//J1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.410000,0.000000,10.525000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.310000,0.000000,10.525000>}
box{<0,0,-0.101600><2.100000,0.036000,0.101600> rotate<0,0.000000,0> translate<44.310000,0.000000,10.525000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.410000,0.000000,10.525000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.410000,0.000000,9.825000>}
box{<0,0,-0.101600><0.700000,0.036000,0.101600> rotate<0,-90.000000,0> translate<46.410000,0.000000,9.825000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.410000,0.000000,10.525000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.510000,0.000000,10.525000>}
box{<0,0,-0.101600><2.100000,0.036000,0.101600> rotate<0,0.000000,0> translate<37.410000,0.000000,10.525000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.770800,0.000000,12.310697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.965697,0.000000,12.115800>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,44.997030,0> translate<45.770800,0.000000,12.310697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.965697,0.000000,12.115800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.160597,0.000000,12.115800>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<45.965697,0.000000,12.115800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.160597,0.000000,12.115800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.355497,0.000000,12.310697>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.996571,0> translate<46.160597,0.000000,12.115800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.355497,0.000000,12.310697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.355497,0.000000,13.285197>}
box{<0,0,-0.050800><0.974500,0.036000,0.050800> rotate<0,90.000000,0> translate<46.355497,0.000000,13.285197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.160597,0.000000,13.285197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.550397,0.000000,13.285197>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<46.160597,0.000000,13.285197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.940197,0.000000,12.895397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.329994,0.000000,13.285197>}
box{<0,0,-0.050800><0.551258,0.036000,0.050800> rotate<0,-44.997260,0> translate<46.940197,0.000000,12.895397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.329994,0.000000,13.285197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.329994,0.000000,12.115800>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,-90.000000,0> translate<47.329994,0.000000,12.115800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.940197,0.000000,12.115800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.719794,0.000000,12.115800>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,0.000000,0> translate<46.940197,0.000000,12.115800> }
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
//LED1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.324800,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.324800,0.000000,5.080000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,90.000000,0> translate<33.324800,0.000000,5.080000> }
object{ARC(1.524000,0.152400,140.196236,179.999846,0.036000) translate<31.750000,0.000000,3.809997>}
object{ARC(1.524000,0.152400,179.997604,221.630812,0.036000) translate<31.750000,0.000000,3.809938>}
object{ARC(1.524000,0.152400,0.000537,40.601702,0.036000) translate<31.750000,0.000000,3.809984>}
object{ARC(1.524000,0.152400,320.196236,359.999846,0.036000) translate<31.750000,0.000000,3.810003>}
object{ARC(1.524000,0.152400,35.537354,89.998691,0.036000) translate<31.749966,0.000000,3.810000>}
object{ARC(1.524000,0.152400,90.000000,143.130102,0.036000) translate<31.750000,0.000000,3.810000>}
object{ARC(1.524000,0.152400,270.000307,322.127183,0.036000) translate<31.749991,0.000000,3.810000>}
object{ARC(1.524000,0.152400,217.872817,269.999693,0.036000) translate<31.750009,0.000000,3.810000>}
object{ARC(0.635000,0.152400,90.000000,180.000000,0.036000) translate<31.750000,0.000000,3.810000>}
object{ARC(1.016000,0.152400,90.000000,180.000000,0.036000) translate<31.750000,0.000000,3.810000>}
object{ARC(0.635000,0.152400,270.000000,360.000000,0.036000) translate<31.750000,0.000000,3.810000>}
object{ARC(1.016000,0.152400,270.000000,360.000000,0.036000) translate<31.750000,0.000000,3.810000>}
object{ARC(2.032000,0.254000,39.807234,90.000342,0.036000) translate<31.750013,0.000000,3.810000>}
object{ARC(2.032000,0.254000,90.001692,151.928641,0.036000) translate<31.750059,0.000000,3.810000>}
object{ARC(2.032000,0.254000,269.998944,319.761966,0.036000) translate<31.750038,0.000000,3.810000>}
object{ARC(2.032000,0.254000,209.746365,270.001580,0.036000) translate<31.749944,0.000000,3.810000>}
object{ARC(2.032000,0.254000,151.698217,179.999918,0.036000) translate<31.750000,0.000000,3.809997>}
object{ARC(2.032000,0.254000,179.997652,211.605872,0.036000) translate<31.750000,0.000000,3.809916>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.828500,0.000000,5.398475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.828500,0.000000,4.254500>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,-90.000000,0> translate<24.828500,0.000000,4.254500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.828500,0.000000,4.254500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.591150,0.000000,4.254500>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<24.828500,0.000000,4.254500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.760547,0.000000,5.398475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.997897,0.000000,5.398475>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<25.997897,0.000000,5.398475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.997897,0.000000,5.398475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.997897,0.000000,4.254500>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,-90.000000,0> translate<25.997897,0.000000,4.254500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.997897,0.000000,4.254500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.760547,0.000000,4.254500>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<25.997897,0.000000,4.254500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.997897,0.000000,4.826487>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.379222,0.000000,4.826487>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<25.997897,0.000000,4.826487> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.167294,0.000000,5.398475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.167294,0.000000,4.254500>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,-90.000000,0> translate<27.167294,0.000000,4.254500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.167294,0.000000,4.254500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.739281,0.000000,4.254500>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,0.000000,0> translate<27.167294,0.000000,4.254500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.739281,0.000000,4.254500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.929944,0.000000,4.445163>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<27.739281,0.000000,4.254500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.929944,0.000000,4.445163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.929944,0.000000,5.207813>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,90.000000,0> translate<27.929944,0.000000,5.207813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.929944,0.000000,5.207813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.739281,0.000000,5.398475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<27.739281,0.000000,5.398475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.739281,0.000000,5.398475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.167294,0.000000,5.398475>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,0.000000,0> translate<27.167294,0.000000,5.398475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.336691,0.000000,5.017150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.718016,0.000000,5.398475>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,-44.997030,0> translate<28.336691,0.000000,5.017150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.718016,0.000000,5.398475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.718016,0.000000,4.254500>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,-90.000000,0> translate<28.718016,0.000000,4.254500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.336691,0.000000,4.254500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.099341,0.000000,4.254500>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<28.336691,0.000000,4.254500> }
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.020000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.020000,0.000000,28.829000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<33.020000,0.000000,28.829000> }
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
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.020000,0.000000,21.971000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<33.020000,0.000000,21.590000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<33.020000,0.000000,21.590000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-270.000000,0> translate<33.020000,0.000000,28.702000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-270.000000,0> translate<33.020000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.210500,0.000000,30.617703>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.066525,0.000000,30.617703>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<32.066525,0.000000,30.617703> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.066525,0.000000,30.617703>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.066525,0.000000,31.189691>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,90.000000,0> translate<32.066525,0.000000,31.189691> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.066525,0.000000,31.189691>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.257188,0.000000,31.380353>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<32.066525,0.000000,31.189691> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.257188,0.000000,31.380353>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.638513,0.000000,31.380353>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<32.257188,0.000000,31.380353> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.638513,0.000000,31.380353>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.829175,0.000000,31.189691>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<32.638513,0.000000,31.380353> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.829175,0.000000,31.189691>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.829175,0.000000,30.617703>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,-90.000000,0> translate<32.829175,0.000000,30.617703> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.829175,0.000000,30.999028>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.210500,0.000000,31.380353>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,-44.997030,0> translate<32.829175,0.000000,30.999028> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.447850,0.000000,31.787100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.066525,0.000000,32.168425>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,44.997030,0> translate<32.066525,0.000000,32.168425> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.066525,0.000000,32.168425>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.210500,0.000000,32.168425>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<32.066525,0.000000,32.168425> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.210500,0.000000,31.787100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.210500,0.000000,32.549750>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,90.000000,0> translate<33.210500,0.000000,32.549750> }
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,34.671000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.705000,0.000000,34.671000>}
box{<0,0,-0.076200><6.350000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.355000,0.000000,34.671000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.705000,0.000000,41.529000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,41.529000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.070000,0.000000,41.529000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,34.671000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,34.925000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<46.101000,0.000000,34.925000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,41.529000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,41.275000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.101000,0.000000,41.275000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,41.275000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,39.624000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.101000,0.000000,39.624000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,38.354000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.101000,0.000000,38.354000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,38.354000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.101000,0.000000,34.925000>}
box{<0,0,-0.076200><3.429000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.101000,0.000000,34.925000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.705000,0.000000,41.529000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,41.275000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<52.705000,0.000000,41.529000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.705000,0.000000,34.671000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,34.925000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<52.705000,0.000000,34.671000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,38.354000>}
box{<0,0,-0.076200><3.429000,0.036000,0.076200> rotate<0,90.000000,0> translate<52.959000,0.000000,38.354000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,38.354000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,39.624000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<52.959000,0.000000,39.624000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,41.275000>}
box{<0,0,-0.076200><1.651000,0.036000,0.076200> rotate<0,90.000000,0> translate<52.959000,0.000000,41.275000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.768000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.006000,0.000000,38.100000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.006000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.006000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.006000,0.000000,37.338000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.006000,0.000000,37.338000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.006000,0.000000,37.338000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.768000,0.000000,37.338000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.006000,0.000000,37.338000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.768000,0.000000,37.338000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.149000,0.000000,36.957000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,44.997030,0> translate<48.768000,0.000000,37.338000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.149000,0.000000,36.957000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.149000,0.000000,36.576000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<49.149000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.149000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.911000,0.000000,35.814000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<49.149000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.911000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.911000,0.000000,36.576000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<49.911000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.911000,0.000000,36.957000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.292000,0.000000,37.338000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<49.911000,0.000000,36.957000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.292000,0.000000,37.338000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054000,0.000000,37.338000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.292000,0.000000,37.338000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054000,0.000000,37.338000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054000,0.000000,38.100000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<51.054000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.054000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.292000,0.000000,38.100000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.292000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.911000,0.000000,38.481000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.292000,0.000000,38.100000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,44.997030,0> translate<49.911000,0.000000,38.481000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.911000,0.000000,38.481000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.911000,0.000000,38.862000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<49.911000,0.000000,38.862000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.911000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.149000,0.000000,39.624000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<49.149000,0.000000,39.624000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.149000,0.000000,39.624000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.149000,0.000000,38.862000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<49.149000,0.000000,38.862000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.149000,0.000000,38.481000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.768000,0.000000,38.100000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<48.768000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<51.308000,0.000000,39.497000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<51.562000,0.000000,39.751000>}
box{<0,0,-0.152400><0.359210,0.036000,0.152400> rotate<0,-44.997030,0> translate<51.308000,0.000000,39.497000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<47.752000,0.000000,39.497000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<47.498000,0.000000,39.751000>}
box{<0,0,-0.152400><0.359210,0.036000,0.152400> rotate<0,44.997030,0> translate<47.498000,0.000000,39.751000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<47.142400,0.000000,37.719000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<46.761400,0.000000,37.719000>}
box{<0,0,-0.152400><0.381000,0.036000,0.152400> rotate<0,0.000000,0> translate<46.761400,0.000000,37.719000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<47.752000,0.000000,36.068000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<47.498000,0.000000,35.814000>}
box{<0,0,-0.152400><0.359210,0.036000,0.152400> rotate<0,-44.997030,0> translate<47.498000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<49.530000,0.000000,35.382200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<49.530000,0.000000,35.001200>}
box{<0,0,-0.152400><0.381000,0.036000,0.152400> rotate<0,-90.000000,0> translate<49.530000,0.000000,35.001200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<51.435000,0.000000,36.068000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<51.689000,0.000000,35.814000>}
box{<0,0,-0.152400><0.359210,0.036000,0.152400> rotate<0,44.997030,0> translate<51.435000,0.000000,36.068000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<51.917600,0.000000,37.719000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<52.298600,0.000000,37.719000>}
box{<0,0,-0.152400><0.381000,0.036000,0.152400> rotate<0,0.000000,0> translate<51.917600,0.000000,37.719000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.149000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.911000,0.000000,36.576000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<49.149000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.149000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.149000,0.000000,35.814000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<49.149000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.911000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.911000,0.000000,36.957000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<49.911000,0.000000,36.957000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.149000,0.000000,38.862000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.911000,0.000000,38.862000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<49.149000,0.000000,38.862000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.149000,0.000000,38.862000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.149000,0.000000,38.481000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<49.149000,0.000000,38.481000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.911000,0.000000,38.862000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.911000,0.000000,39.624000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<49.911000,0.000000,39.624000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,41.148000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,41.529000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<52.070000,0.000000,41.529000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.546000,0.000000,41.148000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,41.148000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.514000,0.000000,41.148000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,41.529000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,41.148000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.990000,0.000000,41.148000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,41.529000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,41.529000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.165000,0.000000,41.529000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,41.529000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,41.529000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<48.895000,0.000000,41.529000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,41.529000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,41.529000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.990000,0.000000,41.529000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,41.529000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,41.529000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.355000,0.000000,41.529000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,41.148000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.546000,0.000000,41.148000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.546000,0.000000,41.148000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.514000,0.000000,41.148000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,41.148000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<46.990000,0.000000,41.148000> }
difference{
cylinder{<49.530000,0,37.719000><49.530000,0.036000,37.719000>2.108200 translate<0,0.000000,0>}
cylinder{<49.530000,-0.1,37.719000><49.530000,0.135000,37.719000>1.955800 translate<0,0.000000,0>}}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.429703,0.000000,33.083500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.429703,0.000000,34.227475>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,90.000000,0> translate<50.429703,0.000000,34.227475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.429703,0.000000,34.227475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.001691,0.000000,34.227475>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,0.000000,0> translate<50.429703,0.000000,34.227475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.001691,0.000000,34.227475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.192353,0.000000,34.036813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<51.001691,0.000000,34.227475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.192353,0.000000,34.036813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.192353,0.000000,33.655487>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<51.192353,0.000000,33.655487> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.192353,0.000000,33.655487>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.001691,0.000000,33.464825>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<51.001691,0.000000,33.464825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.001691,0.000000,33.464825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.429703,0.000000,33.464825>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,0.000000,0> translate<50.429703,0.000000,33.464825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.811028,0.000000,33.464825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.192353,0.000000,33.083500>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,44.997030,0> translate<50.811028,0.000000,33.464825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.361750,0.000000,33.083500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.599100,0.000000,33.083500>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<51.599100,0.000000,33.083500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.599100,0.000000,33.083500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.361750,0.000000,33.846150>}
box{<0,0,-0.063500><1.078550,0.036000,0.063500> rotate<0,-44.997030,0> translate<51.599100,0.000000,33.083500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.361750,0.000000,33.846150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.361750,0.000000,34.036813>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,90.000000,0> translate<52.361750,0.000000,34.036813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.361750,0.000000,34.036813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.171088,0.000000,34.227475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<52.171088,0.000000,34.227475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.171088,0.000000,34.227475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.789763,0.000000,34.227475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<51.789763,0.000000,34.227475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.789763,0.000000,34.227475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.599100,0.000000,34.036813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<51.599100,0.000000,34.036813> }
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<43.180000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<42.799000,0.000000,38.100000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<42.799000,0.000000,38.100000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<42.291000,0.000000,37.211000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<42.291000,0.000000,38.989000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<36.449000,0.000000,38.989000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<36.449000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,38.989000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,37.211000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.545000,0.000000,37.211000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,36.957000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,36.957000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.910000,0.000000,36.957000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,37.084000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,36.957000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<41.783000,0.000000,37.084000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,39.243000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,39.243000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.910000,0.000000,39.243000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,39.116000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,39.243000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.783000,0.000000,39.116000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,37.084000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,36.957000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.830000,0.000000,36.957000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,37.084000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,37.084000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.957000,0.000000,37.084000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,39.116000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,39.243000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<36.830000,0.000000,39.243000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.957000,0.000000,39.116000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.783000,0.000000,39.116000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.957000,0.000000,39.116000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.449000,0.000000,36.957000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,36.957000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.449000,0.000000,36.957000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.449000,0.000000,39.243000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,39.243000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.449000,0.000000,39.243000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,38.989000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,37.211000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.195000,0.000000,37.211000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<35.941000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<35.560000,0.000000,38.100000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<35.560000,0.000000,38.100000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-180.000000,0> translate<42.672000,0.000000,38.100000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-180.000000,0> translate<36.068000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.925500,0.000000,39.687500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.925500,0.000000,40.831475>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,90.000000,0> translate<38.925500,0.000000,40.831475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.925500,0.000000,40.831475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.497488,0.000000,40.831475>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,0.000000,0> translate<38.925500,0.000000,40.831475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.497488,0.000000,40.831475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.688150,0.000000,40.640813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<39.497488,0.000000,40.831475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.688150,0.000000,40.640813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.688150,0.000000,40.259487>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<39.688150,0.000000,40.259487> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.688150,0.000000,40.259487>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.497488,0.000000,40.068825>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<39.497488,0.000000,40.068825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.497488,0.000000,40.068825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<38.925500,0.000000,40.068825>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,0.000000,0> translate<38.925500,0.000000,40.068825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.306825,0.000000,40.068825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.688150,0.000000,39.687500>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,44.997030,0> translate<39.306825,0.000000,40.068825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.094897,0.000000,40.640813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.285559,0.000000,40.831475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<40.094897,0.000000,40.640813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.285559,0.000000,40.831475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.666884,0.000000,40.831475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<40.285559,0.000000,40.831475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.666884,0.000000,40.831475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.857547,0.000000,40.640813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<40.666884,0.000000,40.831475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.857547,0.000000,40.640813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.857547,0.000000,40.450150>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,-90.000000,0> translate<40.857547,0.000000,40.450150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.857547,0.000000,40.450150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.666884,0.000000,40.259487>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<40.666884,0.000000,40.259487> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.666884,0.000000,40.259487>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.476222,0.000000,40.259487>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,0.000000,0> translate<40.476222,0.000000,40.259487> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.666884,0.000000,40.259487>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.857547,0.000000,40.068825>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<40.666884,0.000000,40.259487> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.857547,0.000000,40.068825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.857547,0.000000,39.878163>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,-90.000000,0> translate<40.857547,0.000000,39.878163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.857547,0.000000,39.878163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.666884,0.000000,39.687500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<40.666884,0.000000,39.687500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.666884,0.000000,39.687500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.285559,0.000000,39.687500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<40.285559,0.000000,39.687500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.285559,0.000000,39.687500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.094897,0.000000,39.878163>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<40.094897,0.000000,39.878163> }
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<35.560000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<35.560000,0.000000,21.971000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<35.560000,0.000000,21.971000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<34.671000,0.000000,22.479000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<36.449000,0.000000,22.479000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<36.449000,0.000000,28.321000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<34.671000,0.000000,28.321000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.449000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,22.225000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.671000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.417000,0.000000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.417000,0.000000,22.860000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.417000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.544000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.417000,0.000000,22.860000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.417000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,22.860000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<36.703000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.576000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,22.860000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<36.576000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.544000,0.000000,27.813000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.417000,0.000000,27.940000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<34.417000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.544000,0.000000,27.813000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.544000,0.000000,22.987000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.544000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.576000,0.000000,27.813000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,27.940000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.576000,0.000000,27.813000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.576000,0.000000,27.813000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.576000,0.000000,22.987000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.576000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.417000,0.000000,28.321000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.417000,0.000000,27.940000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.417000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,28.321000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,27.940000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.703000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.449000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,28.575000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.671000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<35.560000,0.000000,28.829000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<35.560000,0.000000,29.210000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<35.560000,0.000000,29.210000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<35.560000,0.000000,22.098000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<35.560000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.750500,0.000000,30.617703>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.606525,0.000000,30.617703>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<34.606525,0.000000,30.617703> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.606525,0.000000,30.617703>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.606525,0.000000,31.189691>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,90.000000,0> translate<34.606525,0.000000,31.189691> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.606525,0.000000,31.189691>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.797187,0.000000,31.380353>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<34.606525,0.000000,31.189691> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.797187,0.000000,31.380353>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.178513,0.000000,31.380353>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<34.797187,0.000000,31.380353> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.178513,0.000000,31.380353>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.369175,0.000000,31.189691>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<35.178513,0.000000,31.380353> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.369175,0.000000,31.189691>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.369175,0.000000,30.617703>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,-90.000000,0> translate<35.369175,0.000000,30.617703> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.369175,0.000000,30.999028>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.750500,0.000000,31.380353>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,-44.997030,0> translate<35.369175,0.000000,30.999028> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.750500,0.000000,32.359088>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.606525,0.000000,32.359088>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<34.606525,0.000000,32.359088> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.606525,0.000000,32.359088>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.178513,0.000000,31.787100>}
box{<0,0,-0.063500><0.808912,0.036000,0.063500> rotate<0,44.997030,0> translate<34.606525,0.000000,32.359088> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.178513,0.000000,31.787100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.178513,0.000000,32.549750>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,90.000000,0> translate<35.178513,0.000000,32.549750> }
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<7.620000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<7.620000,0.000000,38.481000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<7.620000,0.000000,38.481000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<6.731000,0.000000,38.989000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<8.509000,0.000000,38.989000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<8.509000,0.000000,44.831000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<6.731000,0.000000,44.831000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.509000,0.000000,38.735000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.731000,0.000000,38.735000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.731000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,0.000000,38.989000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,0.000000,39.370000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.477000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,39.497000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,0.000000,39.370000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<6.477000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,0.000000,38.989000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,0.000000,39.370000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<8.763000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.636000,0.000000,39.497000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,0.000000,39.370000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<8.636000,0.000000,39.497000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,44.323000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,0.000000,44.450000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<6.477000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,44.323000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.604000,0.000000,39.497000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.604000,0.000000,39.497000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.636000,0.000000,44.323000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,0.000000,44.450000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<8.636000,0.000000,44.323000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.636000,0.000000,44.323000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.636000,0.000000,39.497000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.636000,0.000000,39.497000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,0.000000,44.831000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.477000,0.000000,44.450000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.477000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,0.000000,44.831000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.763000,0.000000,44.450000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.763000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.509000,0.000000,45.085000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.731000,0.000000,45.085000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.731000,0.000000,45.085000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<7.620000,0.000000,45.339000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<7.620000,0.000000,45.720000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<7.620000,0.000000,45.720000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<7.620000,0.000000,38.608000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<7.620000,0.000000,45.212000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.032500,0.000000,41.465500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.888525,0.000000,41.465500>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<4.888525,0.000000,41.465500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.888525,0.000000,41.465500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.888525,0.000000,42.037488>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,90.000000,0> translate<4.888525,0.000000,42.037488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.888525,0.000000,42.037488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.079188,0.000000,42.228150>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<4.888525,0.000000,42.037488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.079188,0.000000,42.228150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.460513,0.000000,42.228150>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<5.079188,0.000000,42.228150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.460513,0.000000,42.228150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.651175,0.000000,42.037488>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<5.460513,0.000000,42.228150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.651175,0.000000,42.037488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.651175,0.000000,41.465500>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,-90.000000,0> translate<5.651175,0.000000,41.465500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.651175,0.000000,41.846825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.032500,0.000000,42.228150>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,-44.997030,0> translate<5.651175,0.000000,41.846825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.888525,0.000000,43.397547>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.888525,0.000000,42.634897>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,-90.000000,0> translate<4.888525,0.000000,42.634897> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.888525,0.000000,42.634897>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.460513,0.000000,42.634897>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,0.000000,0> translate<4.888525,0.000000,42.634897> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.460513,0.000000,42.634897>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.269850,0.000000,43.016222>}
box{<0,0,-0.063500><0.426334,0.036000,0.063500> rotate<0,63.430762,0> translate<5.269850,0.000000,43.016222> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.269850,0.000000,43.016222>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.269850,0.000000,43.206884>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,90.000000,0> translate<5.269850,0.000000,43.206884> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.269850,0.000000,43.206884>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.460513,0.000000,43.397547>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<5.269850,0.000000,43.206884> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.460513,0.000000,43.397547>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.841838,0.000000,43.397547>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<5.460513,0.000000,43.397547> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.841838,0.000000,43.397547>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.032500,0.000000,43.206884>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<5.841838,0.000000,43.397547> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.032500,0.000000,43.206884>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.032500,0.000000,42.825559>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<6.032500,0.000000,42.825559> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.032500,0.000000,42.825559>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.841838,0.000000,42.634897>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<5.841838,0.000000,42.634897> }
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<31.750000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<31.750000,0.000000,38.481000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<31.750000,0.000000,38.481000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<30.861000,0.000000,38.989000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<32.639000,0.000000,38.989000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<32.639000,0.000000,44.831000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<30.861000,0.000000,44.831000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.639000,0.000000,38.735000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.861000,0.000000,38.735000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.861000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.607000,0.000000,38.989000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.607000,0.000000,39.370000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<30.607000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.734000,0.000000,39.497000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.607000,0.000000,39.370000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<30.607000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,38.989000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,39.370000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<32.893000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,39.497000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,39.370000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<32.766000,0.000000,39.497000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.734000,0.000000,44.323000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.607000,0.000000,44.450000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<30.607000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.734000,0.000000,44.323000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.734000,0.000000,39.497000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.734000,0.000000,39.497000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,44.323000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,44.450000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<32.766000,0.000000,44.323000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,44.323000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,39.497000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.766000,0.000000,39.497000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.607000,0.000000,44.831000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.607000,0.000000,44.450000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.607000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,44.831000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.893000,0.000000,44.450000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.893000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.639000,0.000000,45.085000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.861000,0.000000,45.085000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.861000,0.000000,45.085000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<31.750000,0.000000,45.339000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<31.750000,0.000000,45.720000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<31.750000,0.000000,45.720000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<31.750000,0.000000,38.608000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<31.750000,0.000000,45.212000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.162500,0.000000,40.195500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.018525,0.000000,40.195500>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<29.018525,0.000000,40.195500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.018525,0.000000,40.195500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.018525,0.000000,40.767488>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,90.000000,0> translate<29.018525,0.000000,40.767488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.018525,0.000000,40.767488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.209188,0.000000,40.958150>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<29.018525,0.000000,40.767488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.209188,0.000000,40.958150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.590513,0.000000,40.958150>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<29.209188,0.000000,40.958150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.590513,0.000000,40.958150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.781175,0.000000,40.767488>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<29.590513,0.000000,40.958150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.781175,0.000000,40.767488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.781175,0.000000,40.195500>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,-90.000000,0> translate<29.781175,0.000000,40.195500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.781175,0.000000,40.576825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.162500,0.000000,40.958150>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,-44.997030,0> translate<29.781175,0.000000,40.576825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.018525,0.000000,42.127547>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.209188,0.000000,41.746222>}
box{<0,0,-0.063500><0.426334,0.036000,0.063500> rotate<0,63.430762,0> translate<29.018525,0.000000,42.127547> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.209188,0.000000,41.746222>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.590513,0.000000,41.364897>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,44.997030,0> translate<29.209188,0.000000,41.746222> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.590513,0.000000,41.364897>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.971838,0.000000,41.364897>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<29.590513,0.000000,41.364897> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.971838,0.000000,41.364897>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.162500,0.000000,41.555559>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<29.971838,0.000000,41.364897> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.162500,0.000000,41.555559>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.162500,0.000000,41.936884>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<30.162500,0.000000,41.936884> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.162500,0.000000,41.936884>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.971838,0.000000,42.127547>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<29.971838,0.000000,42.127547> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.971838,0.000000,42.127547>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.781175,0.000000,42.127547>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,0.000000,0> translate<29.781175,0.000000,42.127547> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.781175,0.000000,42.127547>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.590513,0.000000,41.936884>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<29.590513,0.000000,41.936884> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.590513,0.000000,41.936884>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.590513,0.000000,41.364897>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,-90.000000,0> translate<29.590513,0.000000,41.364897> }
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<11.430000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<11.430000,0.000000,38.481000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<11.430000,0.000000,38.481000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<10.541000,0.000000,38.989000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<12.319000,0.000000,38.989000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<12.319000,0.000000,44.831000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<10.541000,0.000000,44.831000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,38.735000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.541000,0.000000,38.735000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.541000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,0.000000,38.989000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,0.000000,39.370000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<10.287000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,39.497000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,0.000000,39.370000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<10.287000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,0.000000,38.989000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,0.000000,39.370000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.573000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,0.000000,39.497000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,0.000000,39.370000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<12.446000,0.000000,39.497000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,44.323000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,0.000000,44.450000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<10.287000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,44.323000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.414000,0.000000,39.497000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.414000,0.000000,39.497000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,0.000000,44.323000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,0.000000,44.450000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<12.446000,0.000000,44.323000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,0.000000,44.323000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.446000,0.000000,39.497000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.446000,0.000000,39.497000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,0.000000,44.831000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.287000,0.000000,44.450000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.287000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,0.000000,44.831000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,0.000000,44.450000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<12.573000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.319000,0.000000,45.085000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.541000,0.000000,45.085000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.541000,0.000000,45.085000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<11.430000,0.000000,45.339000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<11.430000,0.000000,45.720000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<11.430000,0.000000,45.720000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<11.430000,0.000000,38.608000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<11.430000,0.000000,45.212000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.287500,0.000000,40.830500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.143525,0.000000,40.830500>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<13.143525,0.000000,40.830500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.143525,0.000000,40.830500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.143525,0.000000,41.402487>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,90.000000,0> translate<13.143525,0.000000,41.402487> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.143525,0.000000,41.402487>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.334188,0.000000,41.593150>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<13.143525,0.000000,41.402487> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.334188,0.000000,41.593150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.715513,0.000000,41.593150>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<13.334188,0.000000,41.593150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.715513,0.000000,41.593150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.906175,0.000000,41.402487>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<13.715513,0.000000,41.593150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.906175,0.000000,41.402487>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.906175,0.000000,40.830500>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,-90.000000,0> translate<13.906175,0.000000,40.830500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.906175,0.000000,41.211825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.287500,0.000000,41.593150>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,-44.997030,0> translate<13.906175,0.000000,41.211825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.143525,0.000000,41.999897>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.143525,0.000000,42.762547>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,90.000000,0> translate<13.143525,0.000000,42.762547> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.143525,0.000000,42.762547>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.334188,0.000000,42.762547>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,0.000000,0> translate<13.143525,0.000000,42.762547> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.334188,0.000000,42.762547>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.096838,0.000000,41.999897>}
box{<0,0,-0.063500><1.078550,0.036000,0.063500> rotate<0,44.997030,0> translate<13.334188,0.000000,42.762547> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.096838,0.000000,41.999897>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.287500,0.000000,41.999897>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,0.000000,0> translate<14.096838,0.000000,41.999897> }
//R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.590000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.590000,0.000000,38.481000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<21.590000,0.000000,38.481000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<20.701000,0.000000,38.989000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<22.479000,0.000000,38.989000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<22.479000,0.000000,44.831000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<20.701000,0.000000,44.831000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.479000,0.000000,38.735000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,38.735000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.701000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,0.000000,38.989000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,0.000000,39.370000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.447000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.574000,0.000000,39.497000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,0.000000,39.370000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.447000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,38.989000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,39.370000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.733000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,39.497000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,39.370000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<22.606000,0.000000,39.497000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.574000,0.000000,44.323000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,0.000000,44.450000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<20.447000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.574000,0.000000,44.323000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.574000,0.000000,39.497000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.574000,0.000000,39.497000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,44.323000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,44.450000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.606000,0.000000,44.323000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,44.323000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,39.497000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.606000,0.000000,39.497000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,0.000000,44.831000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.447000,0.000000,44.450000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.447000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,44.831000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,44.450000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.733000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.479000,0.000000,45.085000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,45.085000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.701000,0.000000,45.085000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.590000,0.000000,45.339000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.590000,0.000000,45.720000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<21.590000,0.000000,45.720000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<21.590000,0.000000,38.608000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<21.590000,0.000000,45.212000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.002500,0.000000,40.195500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.858525,0.000000,40.195500>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<18.858525,0.000000,40.195500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.858525,0.000000,40.195500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.858525,0.000000,40.767488>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,90.000000,0> translate<18.858525,0.000000,40.767488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.858525,0.000000,40.767488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.049188,0.000000,40.958150>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<18.858525,0.000000,40.767488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.049188,0.000000,40.958150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.430513,0.000000,40.958150>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<19.049188,0.000000,40.958150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.430513,0.000000,40.958150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.621175,0.000000,40.767488>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<19.430513,0.000000,40.958150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.621175,0.000000,40.767488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.621175,0.000000,40.195500>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,-90.000000,0> translate<19.621175,0.000000,40.195500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.621175,0.000000,40.576825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.002500,0.000000,40.958150>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,-44.997030,0> translate<19.621175,0.000000,40.576825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.049188,0.000000,41.364897>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.858525,0.000000,41.555559>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<18.858525,0.000000,41.555559> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.858525,0.000000,41.555559>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.858525,0.000000,41.936884>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<18.858525,0.000000,41.936884> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.858525,0.000000,41.936884>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.049188,0.000000,42.127547>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<18.858525,0.000000,41.936884> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.049188,0.000000,42.127547>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.239850,0.000000,42.127547>}
box{<0,0,-0.063500><0.190662,0.036000,0.063500> rotate<0,0.000000,0> translate<19.049188,0.000000,42.127547> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.239850,0.000000,42.127547>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.430513,0.000000,41.936884>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<19.239850,0.000000,42.127547> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.430513,0.000000,41.936884>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.621175,0.000000,42.127547>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<19.430513,0.000000,41.936884> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.621175,0.000000,42.127547>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.811837,0.000000,42.127547>}
box{<0,0,-0.063500><0.190662,0.036000,0.063500> rotate<0,0.000000,0> translate<19.621175,0.000000,42.127547> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.811837,0.000000,42.127547>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.002500,0.000000,41.936884>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<19.811837,0.000000,42.127547> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.002500,0.000000,41.936884>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.002500,0.000000,41.555559>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<20.002500,0.000000,41.555559> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.002500,0.000000,41.555559>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.811837,0.000000,41.364897>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<19.811837,0.000000,41.364897> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.811837,0.000000,41.364897>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.621175,0.000000,41.364897>}
box{<0,0,-0.063500><0.190662,0.036000,0.063500> rotate<0,0.000000,0> translate<19.621175,0.000000,41.364897> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.621175,0.000000,41.364897>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.430513,0.000000,41.555559>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<19.430513,0.000000,41.555559> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.430513,0.000000,41.555559>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.239850,0.000000,41.364897>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<19.239850,0.000000,41.364897> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.239850,0.000000,41.364897>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.049188,0.000000,41.364897>}
box{<0,0,-0.063500><0.190662,0.036000,0.063500> rotate<0,0.000000,0> translate<19.049188,0.000000,41.364897> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.430513,0.000000,41.555559>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.430513,0.000000,41.936884>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<19.430513,0.000000,41.936884> }
//R9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<50.800000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<50.800000,0.000000,54.229000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<50.800000,0.000000,54.229000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<51.689000,0.000000,53.721000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<49.911000,0.000000,53.721000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<49.911000,0.000000,47.879000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<51.689000,0.000000,47.879000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.911000,0.000000,53.975000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.689000,0.000000,53.975000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<49.911000,0.000000,53.975000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.943000,0.000000,53.721000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.943000,0.000000,53.340000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.943000,0.000000,53.340000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.816000,0.000000,53.213000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.943000,0.000000,53.340000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<51.816000,0.000000,53.213000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.657000,0.000000,53.721000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.657000,0.000000,53.340000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<49.657000,0.000000,53.340000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.784000,0.000000,53.213000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.657000,0.000000,53.340000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<49.657000,0.000000,53.340000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.816000,0.000000,48.387000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.943000,0.000000,48.260000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<51.816000,0.000000,48.387000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.816000,0.000000,48.387000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.816000,0.000000,53.213000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<51.816000,0.000000,53.213000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.784000,0.000000,48.387000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.657000,0.000000,48.260000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<49.657000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.784000,0.000000,48.387000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.784000,0.000000,53.213000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,90.000000,0> translate<49.784000,0.000000,53.213000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.943000,0.000000,47.879000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.943000,0.000000,48.260000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<51.943000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.657000,0.000000,47.879000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.657000,0.000000,48.260000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<49.657000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.911000,0.000000,47.625000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.689000,0.000000,47.625000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<49.911000,0.000000,47.625000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<50.800000,0.000000,47.371000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<50.800000,0.000000,46.990000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,-90.000000,0> translate<50.800000,0.000000,46.990000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-270.000000,0> translate<50.800000,0.000000,54.102000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-270.000000,0> translate<50.800000,0.000000,47.498000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.403500,0.000000,51.064703>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.259525,0.000000,51.064703>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,0.000000,0> translate<52.259525,0.000000,51.064703> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.259525,0.000000,51.064703>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.259525,0.000000,51.636691>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,90.000000,0> translate<52.259525,0.000000,51.636691> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.259525,0.000000,51.636691>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.450188,0.000000,51.827353>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<52.259525,0.000000,51.636691> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.450188,0.000000,51.827353>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.831513,0.000000,51.827353>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<52.450188,0.000000,51.827353> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.831513,0.000000,51.827353>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.022175,0.000000,51.636691>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<52.831513,0.000000,51.827353> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.022175,0.000000,51.636691>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.022175,0.000000,51.064703>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,-90.000000,0> translate<53.022175,0.000000,51.064703> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.022175,0.000000,51.446028>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.403500,0.000000,51.827353>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,-44.997030,0> translate<53.022175,0.000000,51.446028> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.212837,0.000000,52.234100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.403500,0.000000,52.424762>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<53.212837,0.000000,52.234100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.403500,0.000000,52.424762>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.403500,0.000000,52.806088>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,90.000000,0> translate<53.403500,0.000000,52.806088> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.403500,0.000000,52.806088>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.212837,0.000000,52.996750>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<53.212837,0.000000,52.996750> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.212837,0.000000,52.996750>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.450188,0.000000,52.996750>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<52.450188,0.000000,52.996750> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.450188,0.000000,52.996750>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.259525,0.000000,52.806088>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<52.259525,0.000000,52.806088> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.259525,0.000000,52.806088>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.259525,0.000000,52.424762>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<52.259525,0.000000,52.424762> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.259525,0.000000,52.424762>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.450188,0.000000,52.234100>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<52.259525,0.000000,52.424762> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.450188,0.000000,52.234100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.640850,0.000000,52.234100>}
box{<0,0,-0.063500><0.190662,0.036000,0.063500> rotate<0,0.000000,0> translate<52.450188,0.000000,52.234100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.640850,0.000000,52.234100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.831513,0.000000,52.424762>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<52.640850,0.000000,52.234100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.831513,0.000000,52.424762>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.831513,0.000000,52.996750>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,90.000000,0> translate<52.831513,0.000000,52.996750> }
//R10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<27.940000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<28.321000,0.000000,7.620000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<27.940000,0.000000,7.620000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<28.829000,0.000000,8.509000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<28.829000,0.000000,6.731000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<34.671000,0.000000,6.731000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<34.671000,0.000000,8.509000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,8.509000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.575000,0.000000,8.509000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.829000,0.000000,8.763000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,8.763000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.829000,0.000000,8.763000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.337000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,8.763000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<29.210000,0.000000,8.763000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.829000,0.000000,6.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,6.477000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.829000,0.000000,6.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.337000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,6.477000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.210000,0.000000,6.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,8.763000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.163000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,8.636000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.337000,0.000000,8.636000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.337000,0.000000,8.636000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,6.477000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<34.163000,0.000000,6.604000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.163000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.337000,0.000000,6.604000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.337000,0.000000,6.604000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,8.763000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,8.763000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.290000,0.000000,8.763000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,6.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,6.477000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.290000,0.000000,6.477000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,6.731000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,8.509000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.925000,0.000000,8.509000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<35.179000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<35.560000,0.000000,7.620000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<35.179000,0.000000,7.620000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-0.000000,0> translate<28.448000,0.000000,7.620000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-0.000000,0> translate<35.052000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.273500,0.000000,9.080500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.273500,0.000000,10.224475>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,90.000000,0> translate<29.273500,0.000000,10.224475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.273500,0.000000,10.224475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.845488,0.000000,10.224475>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,0.000000,0> translate<29.273500,0.000000,10.224475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.845488,0.000000,10.224475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.036150,0.000000,10.033812>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<29.845488,0.000000,10.224475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.036150,0.000000,10.033812>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.036150,0.000000,9.652488>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<30.036150,0.000000,9.652488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.036150,0.000000,9.652488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.845488,0.000000,9.461825>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<29.845488,0.000000,9.461825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.845488,0.000000,9.461825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.273500,0.000000,9.461825>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,0.000000,0> translate<29.273500,0.000000,9.461825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.654825,0.000000,9.461825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.036150,0.000000,9.080500>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,44.997030,0> translate<29.654825,0.000000,9.461825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.442897,0.000000,9.843150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.824222,0.000000,10.224475>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,-44.997030,0> translate<30.442897,0.000000,9.843150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.824222,0.000000,10.224475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.824222,0.000000,9.080500>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,-90.000000,0> translate<30.824222,0.000000,9.080500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.442897,0.000000,9.080500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.205547,0.000000,9.080500>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<30.442897,0.000000,9.080500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.612294,0.000000,9.271163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.612294,0.000000,10.033812>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,90.000000,0> translate<31.612294,0.000000,10.033812> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.612294,0.000000,10.033812>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.802956,0.000000,10.224475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<31.612294,0.000000,10.033812> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.802956,0.000000,10.224475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.184281,0.000000,10.224475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<31.802956,0.000000,10.224475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.184281,0.000000,10.224475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.374944,0.000000,10.033812>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<32.184281,0.000000,10.224475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.374944,0.000000,10.033812>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.374944,0.000000,9.271163>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,-90.000000,0> translate<32.374944,0.000000,9.271163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.374944,0.000000,9.271163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.184281,0.000000,9.080500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<32.184281,0.000000,9.080500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.184281,0.000000,9.080500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.802956,0.000000,9.080500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<31.802956,0.000000,9.080500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.802956,0.000000,9.080500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.612294,0.000000,9.271163>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<31.612294,0.000000,9.271163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.612294,0.000000,9.271163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.374944,0.000000,10.033812>}
box{<0,0,-0.063500><1.078550,0.036000,0.063500> rotate<0,-44.997030,0> translate<31.612294,0.000000,9.271163> }
//T1 silk screen
object{ARC(2.667022,0.127000,275.463924,308.244924,0.036000) translate<25.400050,0.000000,45.720003>}
object{ARC(2.667025,0.127000,197.146908,275.465408,0.036000) translate<25.399981,0.000000,45.720000>}
object{ARC(2.666953,0.127000,51.752892,162.852892,0.036000) translate<25.400009,0.000000,45.720013>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.051000,0.000000,43.625500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.051000,0.000000,47.814500>}
box{<0,0,-0.063500><4.189000,0.036000,0.063500> rotate<0,90.000000,0> translate<27.051000,0.000000,47.814500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.654000,0.000000,43.466300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.654000,0.000000,45.433700>}
box{<0,0,-0.063500><1.967400,0.036000,0.063500> rotate<0,90.000000,0> translate<25.654000,0.000000,45.433700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.654000,0.000000,43.065100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.654000,0.000000,43.466300>}
box{<0,0,-0.063500><0.401200,0.036000,0.063500> rotate<0,90.000000,0> translate<25.654000,0.000000,43.466300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.654000,0.000000,45.433700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.654000,0.000000,46.006300>}
box{<0,0,-0.063500><0.572600,0.036000,0.063500> rotate<0,90.000000,0> translate<25.654000,0.000000,46.006300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.654000,0.000000,47.973700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.654000,0.000000,48.374900>}
box{<0,0,-0.063500><0.401200,0.036000,0.063500> rotate<0,90.000000,0> translate<25.654000,0.000000,48.374900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.654000,0.000000,46.006300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.654000,0.000000,47.973700>}
box{<0,0,-0.063500><1.967400,0.036000,0.063500> rotate<0,90.000000,0> translate<25.654000,0.000000,47.973700> }
object{ARC(2.667044,0.127000,162.853200,197.146800,0.036000) translate<25.400000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.749825,0.000000,47.053500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.749825,0.000000,48.197475>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,90.000000,0> translate<27.749825,0.000000,48.197475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.368500,0.000000,48.197475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.131150,0.000000,48.197475>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<27.368500,0.000000,48.197475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.537897,0.000000,47.816150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.919222,0.000000,48.197475>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,-44.997030,0> translate<28.537897,0.000000,47.816150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.919222,0.000000,48.197475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.919222,0.000000,47.053500>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,-90.000000,0> translate<28.919222,0.000000,47.053500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.537897,0.000000,47.053500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.300547,0.000000,47.053500>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<28.537897,0.000000,47.053500> }
//T2 silk screen
object{ARC(2.667022,0.127000,275.463924,308.244924,0.036000) translate<35.560050,0.000000,45.720003>}
object{ARC(2.667025,0.127000,197.146908,275.465408,0.036000) translate<35.559981,0.000000,45.720000>}
object{ARC(2.666953,0.127000,51.752892,162.852892,0.036000) translate<35.560009,0.000000,45.720013>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.211000,0.000000,43.625500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<37.211000,0.000000,47.814500>}
box{<0,0,-0.063500><4.189000,0.036000,0.063500> rotate<0,90.000000,0> translate<37.211000,0.000000,47.814500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.814000,0.000000,43.466300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.814000,0.000000,45.433700>}
box{<0,0,-0.063500><1.967400,0.036000,0.063500> rotate<0,90.000000,0> translate<35.814000,0.000000,45.433700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.814000,0.000000,43.065100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.814000,0.000000,43.466300>}
box{<0,0,-0.063500><0.401200,0.036000,0.063500> rotate<0,90.000000,0> translate<35.814000,0.000000,43.466300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.814000,0.000000,45.433700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.814000,0.000000,46.006300>}
box{<0,0,-0.063500><0.572600,0.036000,0.063500> rotate<0,90.000000,0> translate<35.814000,0.000000,46.006300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.814000,0.000000,47.973700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.814000,0.000000,48.374900>}
box{<0,0,-0.063500><0.401200,0.036000,0.063500> rotate<0,90.000000,0> translate<35.814000,0.000000,48.374900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.814000,0.000000,46.006300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.814000,0.000000,47.973700>}
box{<0,0,-0.063500><1.967400,0.036000,0.063500> rotate<0,90.000000,0> translate<35.814000,0.000000,47.973700> }
object{ARC(2.667044,0.127000,162.853200,197.146800,0.036000) translate<35.560000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.559825,0.000000,47.053500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.559825,0.000000,48.197475>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,90.000000,0> translate<31.559825,0.000000,48.197475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.178500,0.000000,48.197475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.941150,0.000000,48.197475>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<31.178500,0.000000,48.197475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.110547,0.000000,47.053500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.347897,0.000000,47.053500>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<32.347897,0.000000,47.053500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.347897,0.000000,47.053500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.110547,0.000000,47.816150>}
box{<0,0,-0.063500><1.078550,0.036000,0.063500> rotate<0,-44.997030,0> translate<32.347897,0.000000,47.053500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.110547,0.000000,47.816150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.110547,0.000000,48.006813>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,90.000000,0> translate<33.110547,0.000000,48.006813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.110547,0.000000,48.006813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.919884,0.000000,48.197475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<32.919884,0.000000,48.197475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.919884,0.000000,48.197475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.538559,0.000000,48.197475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<32.538559,0.000000,48.197475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.538559,0.000000,48.197475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.347897,0.000000,48.006813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<32.347897,0.000000,48.006813> }
//T3 silk screen
object{ARC(2.667022,0.127000,275.463924,308.244924,0.036000) translate<15.240050,0.000000,45.720003>}
object{ARC(2.667025,0.127000,197.146908,275.465408,0.036000) translate<15.239981,0.000000,45.720000>}
object{ARC(2.666953,0.127000,51.752892,162.852892,0.036000) translate<15.240009,0.000000,45.720013>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.891000,0.000000,43.625500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.891000,0.000000,47.814500>}
box{<0,0,-0.063500><4.189000,0.036000,0.063500> rotate<0,90.000000,0> translate<16.891000,0.000000,47.814500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.494000,0.000000,43.466300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.494000,0.000000,45.433700>}
box{<0,0,-0.063500><1.967400,0.036000,0.063500> rotate<0,90.000000,0> translate<15.494000,0.000000,45.433700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.494000,0.000000,43.065100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.494000,0.000000,43.466300>}
box{<0,0,-0.063500><0.401200,0.036000,0.063500> rotate<0,90.000000,0> translate<15.494000,0.000000,43.466300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.494000,0.000000,45.433700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.494000,0.000000,46.006300>}
box{<0,0,-0.063500><0.572600,0.036000,0.063500> rotate<0,90.000000,0> translate<15.494000,0.000000,46.006300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.494000,0.000000,47.973700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.494000,0.000000,48.374900>}
box{<0,0,-0.063500><0.401200,0.036000,0.063500> rotate<0,90.000000,0> translate<15.494000,0.000000,48.374900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.494000,0.000000,46.006300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.494000,0.000000,47.973700>}
box{<0,0,-0.063500><1.967400,0.036000,0.063500> rotate<0,90.000000,0> translate<15.494000,0.000000,47.973700> }
object{ARC(2.667044,0.127000,162.853200,197.146800,0.036000) translate<15.240000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.589825,0.000000,47.053500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.589825,0.000000,48.197475>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,90.000000,0> translate<17.589825,0.000000,48.197475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.208500,0.000000,48.197475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.971150,0.000000,48.197475>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<17.208500,0.000000,48.197475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.377897,0.000000,48.006813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.568559,0.000000,48.197475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<18.377897,0.000000,48.006813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.568559,0.000000,48.197475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.949884,0.000000,48.197475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<18.568559,0.000000,48.197475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.949884,0.000000,48.197475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.140547,0.000000,48.006813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<18.949884,0.000000,48.197475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.140547,0.000000,48.006813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.140547,0.000000,47.816150>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,-90.000000,0> translate<19.140547,0.000000,47.816150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.140547,0.000000,47.816150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.949884,0.000000,47.625488>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<18.949884,0.000000,47.625488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.949884,0.000000,47.625488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.759222,0.000000,47.625488>}
box{<0,0,-0.063500><0.190662,0.036000,0.063500> rotate<0,0.000000,0> translate<18.759222,0.000000,47.625488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.949884,0.000000,47.625488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.140547,0.000000,47.434825>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<18.949884,0.000000,47.625488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.140547,0.000000,47.434825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.140547,0.000000,47.244163>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,-90.000000,0> translate<19.140547,0.000000,47.244163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.140547,0.000000,47.244163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.949884,0.000000,47.053500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<18.949884,0.000000,47.053500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.949884,0.000000,47.053500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.568559,0.000000,47.053500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<18.568559,0.000000,47.053500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.568559,0.000000,47.053500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.377897,0.000000,47.244163>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<18.377897,0.000000,47.244163> }
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
