//This template can be used to batch process all images in a firectory (i.e. a folder) (images should be in the .tif format).
//Processed images are saved as .tif files in an output folder with a user defined pre-fix.
//The program opens a user interface, in which the output directory and pre-fix can be defined before each run.
//For more detailed information on how to batch process images in Fiji please refer to https://imagej.nih.gov/ij/docs/pdfs/ImageJBatchProcessing.pdf

//How to:
//1. Paste this template into the Fiji editor: Plugins>New>Macro
//2. Open an example image that you would like to process
//3. Start the ImageJ recorder: Plugins>Macros>Record
//4. Process your example image
//5. Copy-paste the recorded code into this template (do not copy lines which contain the image title and are therefore specific to your example image. 
//	 The code should contain only general commands to be applied to all images.)
//6. Save the Macro 
//7. Run the macro on all of them using Plugins>Macros>Run... 

//---------------------------------------------------------------------------------------------------------------------------------------------------------------


//Macro Template For Batch Processing All Open TIFF Images

//get parameters from user
#@ File (label="Input directory", style="directory") dir_in
#@ File (label="Output directory", style="directory") dir_out
#@ String (label="Prefix for processed images", description="Name field") prefix

dir_in = dir_in+"\\"

//Loop over the list of images in the directory. Everything between the {} after 'for' is excecuted on all images ending in "tif".
filelist = getFileList(dir_in);
len = lengthOf(filelist);

for (i = 0; i < len; i++) {


	open(dir_in+"/"+filelist[i]);
	title = getTitle();
	
	//INSERT RECORDED MACRO HERE
	
	run("Save");
}









list = getList("image.titles");

setBatchMode("hide");

//Loop over the list of open images. Everything between the {} after 'for' is excecuted on all open images.
for (i = 0; i < lengthOf(list); i++) {
	selectWindow(list[i]);
	title = getTitle();
	if (endsWith(title, "tif")) {
        	
	
	
	saveAs("Tiff", dir_out+"/"+prefix+title);
	}
}

run("Close All");
print("Done. Great work today!");