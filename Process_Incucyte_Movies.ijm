//clear workspace
run("Close All");
setBatchMode("hide");

//get parameters from user
#@ File (label="Input directory", style="directory") dir_in
#@ File (label="Output directory", style="directory") dir_out
#@ String (label="Replicate", description="Name field") rep
#@ String (label="Cell type", description="Name field") cellt
#@ String (label="Well", description="Name field") well
#@ String (label="Position number", description="Name field") img
#@ int (label="Rolling background radius") nm

dir_in = dir_in+"\\"
//Convert images into a movie and remove green background

	// import all images from one position as movie
	//green
	run("Image Sequence...", "dir=" +dir_in+ "filter=(^"+rep+"_"+cellt+"_green_"+well+"_"+img+") sort");
	rename(rep+"_"+cellt+"_green_"+well+"_"+img);
	//subtract green background
	run("Subtract Background...", "rolling="+nm+" stack");
	
	// phase
	run("Image Sequence...", "dir=" +dir_in+ "filter=(^"+rep+"_"+cellt+"_phase_"+well+"_"+img+") sort");
	rename(rep+"_"+cellt+"_phase_"+well+"_"+img);
	
	//red
	run("Image Sequence...", "dir=" +dir_in+ "filter=(^"+rep+"_"+cellt+"_red_"+well+"_"+img+") sort");
	rename(rep+"_"+cellt+"_red_"+well+"_"+img);
	
	//merge channels
	run("Merge Channels...", "c1="+rep+"_"+cellt+"_red_"+well+"_"+img+" c2="+rep+"_"+cellt+"_green_"+well+"_"+img+" c4="+rep+"_"+cellt+"_phase_"+well+"_"+img+" create");
	rename(cellt+"_TSZ_"+well+"_Tile_"+img);

// convert z to t (make the stack a movie)
selectWindow(cellt+"_TSZ_"+well+"_Tile_"+img);

slices = nSlices/3
run("Properties...", "channels=3 slices=1 frames="+slices+" pixel_width=1.0000 pixel_height=1.0000 voxel_depth=1.0000");

run("Linear Stack Alignment with SIFT MultiChannel", "registration_channel=3 initial_gaussian_blur=1 steps_per_scale_octave=3 minimum_image_size=64 maximum_image_size=1410 feature_descriptor_size=4 feature_descriptor_orientation_bins=8 closest/next_closest_ratio=0.92 maximal_alignment_error=25 inlier_ratio=0.05 expected_transformation=Similarity interpolate");

if (cellt.contains("HT")){
		saveAs("Tiff", dir_out+"/"+cellt+"_TSZ_"+well+"_Tile_"+img+".tif");
	} else {
		saveAs("Tiff", dir_out+"/"+cellt+"_TZ_"+well+"_Tile_"+img+".tif");
		}

run("Close All");
print("Done :) you look gorgeous btw");




