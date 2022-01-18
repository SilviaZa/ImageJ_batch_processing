--------- README -----------------------------------------------------------------------------------------------------------------
/*
Ok hello everyone, this macro works super well to take images and align them into a beautiful movie.
To use it, I recommend exporting all the Incucyte images with the following name strucure:

ReplicateNumber_CellType_channel_well_ImagePanel_timepoint.tif  (ImagePanel is used as the number of the image that was taken in the well)

Here's a practical example: 
R2_MDF_green_B2_1_00d00h00m.tif

!!! BEFORE YOU RUN THE MACRO YOU NEED TO INSTALL A PLUGIN !!!
To install the plugin, 
1. go to Help > Update in Fiji
2. Click 'Manage update sites'
3. Tick the box for 'PTBIOP'
4. restart Fiji
!!!     !!!   !!!   !!!  !!!   !!!  !!!!   !!!  !!!!   !!!   !!!  !!

As USER INPUT you give information on the pattern of how your images are called (see instructions abaove).
input directory: Folder in which you stashed all the individual images taken by incucyte. 
*Please have all images from all channels corresponding to the same movie in the same folder!*
output directory: Folder in which you want the movie to be saved
Replicate: ReplicateNumber (R2 in the example above)
Cell type: CellType (MDF in the example above)
Well: B2 in the example
Position number: ImagePanel (1 in the example above) 
Rolling background radius: this is for the green channel only and allows you to set the rolling ball radius manually


ENJOY!

*/
---------- MACRO ---------------------------------------------------------------------------------------------------------------------
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
	rename(cellt+"_proc_"+well+"_Tile_"+img);

// convert z to t (make the stack a movie)
selectWindow(cellt+"_proc_"+well+"_Tile_"+img);

slices = nSlices/3
run("Properties...", "channels=3 slices=1 frames="+slices+" pixel_width=1.0000 pixel_height=1.0000 voxel_depth=1.0000");

run("Linear Stack Alignment with SIFT MultiChannel", "registration_channel=3 initial_gaussian_blur=1 steps_per_scale_octave=3 minimum_image_size=64 maximum_image_size=1410 feature_descriptor_size=4 feature_descriptor_orientation_bins=8 closest/next_closest_ratio=0.92 maximal_alignment_error=25 inlier_ratio=0.05 expected_transformation=Similarity interpolate");

saveAs("Tiff", dir_out+"/"+rep+"_"+cellt+"_"+well+"_Tile_"+img+".tif");

run("Close All");
print("Done :) keep up the good work!");




