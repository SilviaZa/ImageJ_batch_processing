# ImageJ_batch
Template Macros for Batch Processing

These templates can be used to batch process all images currently open in Fiji or that are in a directory (i.e. a folder). Note: (images should be in the .tif format).
Processed images are saved as .tif files in an output folder with a user defined prefix.
The program opens a user interface, in which the output directory and prefix can be defined before each run.
For more detailed information on how to batch process images in Fiji, please refer to the following guide by Alex Herbert https://imagej.nih.gov/ij/docs/pdfs/ImageJBatchProcessing.pdf .

HOW TO:
   1. Paste one of the templates into the Fiji editor: Plugins>New>Macro
   2. Open an example image that you would like to process
   3. Start the ImageJ recorder: Plugins>Macros>Record
   4. Process your example image
   5. Copy-paste the recorded code into the template in the editor (do not copy lines which contain the image title and are therefore specific to your example image. 
      The code should contain only general commands to be applied to all images).
   6. Save the macro 
   7. Run the macro using Plugins>Macros>Run... 



# Processing Incucyte images into a movie

This macro works super well to take Incucyte images and align them into a respectable movie.
To use it, I recommend exporting all the Incucyte images with the following name strucure:

ReplicateNumber_CellType_channel_well_ImagePanel_timepoint.tif  (ImagePanel is used as the number of the image that was taken in the well)

Here's a practical example: 
R2_MDF_green_B2_1_00d00h00m.tif

<strong>  BEFORE YOU RUN THE MACRO YOU NEED TO INSTALL A PLUGIN <strong>
   
To install the plugin:
1. go to Help > Update in Fiji
2. Click 'Manage update sites'
3. Tick the box for 'PTBIOP'
4. restart Fiji

As USER INPUT you give information on the pattern of how your images are called (see instructions abaove).
input directory: Folder in which you stashed all the individual images taken by incucyte. 
*Please have all images from all channels corresponding to the same movie in the same folder!*
output directory: Folder in which you want the movie to be saved
Replicate: ReplicateNumber 
Cell type: CellType 
Well: well
Position number: ImagePanel 
Rolling background radius: this is for the green channel only and allows you to set the rolling ball radius manually

Example: 
<img width="291" alt="Capture" src="https://user-images.githubusercontent.com/87492099/149831113-2f0993aa-4f4f-4e47-9b2b-ac22b0fb894c.PNG">



ENJOY!
