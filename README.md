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

<p>This macro works super well to take Incucyte images and align them into a respectable movie.
To use it, I recommend exporting all the Incucyte images with the following name strucure:</p>

<p>ReplicateNumber_CellType_channel_well_ImagePanel_timepoint.tif&nbsp;&nbsp;;(ImagePanel is used as the number of the image that was taken in the well)</p>

<p><i>Here's a practical example:</i><br>
R2_MDF_green_B2_1_00d00h00m.tif</p>

<br>
<p><strong> ! BEFORE YOU RUN THE MACRO YOU NEED TO INSTALL A PLUGIN ! </strong> <br>  
To install the plugin:<br>
1. go to Help > Update in Fiji<br>
2. Click 'Manage update sites'<br>
3. Tick the box for 'PTBIOP'<br>
4. restart Fiji</p><br>
<br>

<p>As USER INPUT you give information on the pattern of how your images are called (see instructions abaove).<br><br>
<b><i>input directory:</i></b>&nbsp;&nbsp;Folder in which you stashed all the individual images taken by incucyte. 
<i>Please have all images from all channels corresponding to the same movie in the same folder!</i> <br>
<b><i>output directory:</i></b>&nbsp;&nbsp;Folder in which you want the movie to be saved <br>
<b><i>Replicate:</i></b>&nbsp;&nbsp;ReplicateNumber <br>
<b><i>Cell type:</i></b>&nbsp;&nbsp;CellType <br>
<b><i>Well:</i></b>&nbsp;&nbsp;well<br>
<b><i>Position number:</i></b>&nbsp;&nbsp;ImagePanel <br>
<b><i>Rolling background radius:</i></b>&nbsp;&nbsp;this is for the green channel only and allows you to set the rolling ball radius manually</p>
<br>

<p>Example: <br>
<img width="291" alt="Capture" src="https://user-images.githubusercontent.com/87492099/149831113-2f0993aa-4f4f-4e47-9b2b-ac22b0fb894c.PNG">
</p>


<p>ENJOY!</p>
