# ImageJ_batch
Template Macros for Batch Processing

These templates can be used to batch process all images currently open in Fiji or that are in a directory (i.e. a folder). Note: (images should be in the .tif format).
Processed images are saved as .tif files in an output folder with a user defined pre-fix.
The program opens a user interface, in which the output directory and pre-fix can be defined before each run.
For more detailed information on how to batch process images in Fiji, please refer to the following guide by Alex Herbert https://imagej.nih.gov/ij/docs/pdfs/ImageJBatchProcessing.pdf .

HOW TO:
   1. Paste one of the templates into the Fiji editor: Plugins>New>Macro
   2. Open an example image that you would like to process
   3. Start the ImageJ recorder: Plugins>Macros>Record
   4. Process your example image
   5. Copy-paste the recorded code into this template (do not copy lines which contain the image title and are therefore specific to your example image. 
      The code should contain only general commands to be applied to all images.)
   6. Save the Macro 
   7. Run the macro using Plugins>Macros>Run... 
