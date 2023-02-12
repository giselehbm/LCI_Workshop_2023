
// ===============================
// AUTHOR : Gisele Miranda 
// CREATE DATE : 2023 - 02 - 06
// PURPOSE : LCI Microscopy course - Image Analysis workshop - 
// 			 Evaluating image artifacts - bleedtrough, saturation, underexposure and soft focus
// ===============================

/**
 * Choose parameters: overlap, grid size and file name of the input sequence
 */
overlap = 10;
grid_size_x = 9;
grid_size_y = 6;
file_name = "C3-BrainSection";
 
// Select input folder
uncorrec_path = getDirectory("Choose a Directory");
path = replace(uncorrec_path, "uncorrected/", "");
correc_path = replace(uncorrec_path, "uncorrected", "corrected");

// open image sequence and start processing
File.openSequence(uncorrec_path);
rename("uncorrected");
// run BaSiC plugin
run("BaSiC ", "processing_stack=uncorrected flat-field=None dark-field=None shading_estimation=[Estimate shading profiles] shading_model=[Estimate both flat-field and dark-field] setting_regularisationparametes=Automatic temporal_drift=Ignore correction_options=[Compute shading and correct images] lambda_flat=0.50 lambda_dark=0.50");
rename("corrected");
// save corrected image sequence
run("Image Sequence... ", "select=["+correc_path+"] dir=["+correc_path+"] format=TIFF name="+file_name+" start=1");

// stich corrected image sequence and save
run("Grid/Collection stitching", "type=[Grid: snake by rows] order=[Left & Down] grid_size_x="+grid_size_x+" grid_size_y="+grid_size_y+" tile_overlap="+overlap+" first_file_index_i=1 directory=["+correc_path+"] file_names="+file_name+"{iiii}.tif output_textfile_name=TileConfiguration.txt fusion_method=[Linear Blending] regression_threshold=0.30 max/avg_displacement_threshold=2.50 absolute_displacement_threshold=3.50 compute_overlap invert_x subpixel_accuracy computation_parameters=[Save memory (but be slower)] image_output=[Fuse and display]");
saveAs("Tiff", path+"Fused_corrected.tif");

// stich uncorrected image sequence and save for comparison
selectWindow("uncorrected");
run("Grid/Collection stitching", "type=[Grid: snake by rows] order=[Left & Down] grid_size_x="+grid_size_x+" grid_size_y="+grid_size_y+" tile_overlap="+overlap+" first_file_index_i=1 directory=["+uncorrec_path+"] file_names="+file_name+"{iiii}.tif output_textfile_name=TileConfiguration.txt fusion_method=[Linear Blending] regression_threshold=0.30 max/avg_displacement_threshold=2.50 absolute_displacement_threshold=3.50 compute_overlap invert_x subpixel_accuracy computation_parameters=[Save memory (but be slower)] image_output=[Fuse and display]");
saveAs("Tiff", path+"Fused_uncorrected.tif");

