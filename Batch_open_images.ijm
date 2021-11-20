//This template can be used to batch process all images currently open in Fiji (images should be in the .tif format).
//Processed images are saved as .tif files in an output directory (i.e. folder) with a user defined pre-fix.
//The program opens a user interface, in which the output directory and pre-fix can be defined before each run.

//How to:
//1. Upload this template to the Fiji editor: Plugins>New>Macro
//2. Open an example image that you would like to process
//3. Start the ImageJ recorder: Plugins>Macros>Record
//4. Process your example image
//5. Copy-paste the recorded code into this template (do not copy lines which contain the image title and are therefore specific to your example image. 
//	 The code should contain only general commands to be applied to all images.)


//get parameters from user
#@ File (label="Output directory", style="directory") dir_out
#@ String (label="Cell type", description="Name field") prefix

list = getList("image.titles");

setBatchMode("hide");

for (i = 0; i < lengthOf(list); i++) {
	selectWindow(list[i]);
	title = getTitle();
	
	//Insert Macro here
	
	saveAs("Tiff", dir_out+"/"+prefix+title);
	
}

run("Close All");
print("Done. Great work today!");