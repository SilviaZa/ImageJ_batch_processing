//This template can be used to batch process all images in a directory (i.e. a folder) (images should be in the .tif format).
//Processed images are saved as .tif files in an output folder with a user defined pre-fix.
//The program opens a user interface, in which the output directory and pre-fix can be defined before each run.
//For more detailed information on how to batch process images in Fiji please refer to https://imagej.nih.gov/ij/docs/pdfs/ImageJBatchProcessing.pdf

//HOW TO:
//1. Paste this template into the Fiji editor: Plugins>New>Macro
//2. Open an example image that you would like to process
//3. Start the ImageJ recorder: Plugins>Macros>Record
//4. Process your example image
//5. Copy-paste the recorded code into this template (open in the editor from step 1.). Do not copy lines which contain the image title and 
//   are therefore specific to your example image. The code should contain only general commands to be applied to all images.
//6. Save the macro 
//7. Run the macro on all of them using Plugins>Macros>Run... 

//---------------------------------------------------------------------------------------------------------------------------------------------------------------


//Macro Template For Batch Processing All TIFF Images In A Folder

//get parameters from user
#@ File (label="Input directory", style="directory") dir_in
#@ File (label="Output directory", style="directory") dir_out
#@ String (label="Prefix for processed images", description="Name field") prefix

dir_in = dir_in+"\\"

filelist = getFileList(dir_in);
len = lengthOf(filelist);

//Loop over the list of images in the directory. Everything between the {} after 'for' is excecuted on all images ending in "tif".
for (i = 0; i < len; i++) {
	open(dir_in+filelist[i]);
	title = getTitle();
	if (endsWith(title, "tif")) {
        	
	//INSERT RECORDED MACRO HERE
	
	saveAs("Tiff", dir_out+"/"+prefix+title);
	}
}
	
run("Close All");
print("Done. Amazingly good");

