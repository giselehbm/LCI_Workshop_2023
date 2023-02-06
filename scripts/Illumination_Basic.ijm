
// ===============================
// AUTHOR : Gisele Miranda 
// CREATE DATE : 2023 - 02 - 06
// PURPOSE : LCI Microscopy course - Image Analysis workshop - 
// 			 Evaluating image artifacts - bleedtrough, saturation, underexposure and soft focus
// ===============================

/**
 * Open input folder
 */
uncorrec_path = getDirectory("Choose a Directory");
path = replace(uncorrec_path, "uncorrected/", "");
correc_path = replace(uncorrec_path, "uncorrected", "corrected");

// choose overlap
overlap = 5;
// choose grid size
grid_size_x = 3;
grid_size_y = 3;

print(uncorrec_path);
print(path);
print(correc_path);

// open image sequence and start processing
File.openSequence(uncorrec_path);
// run BaSiC plugin
run("BaSiC ", "processing_stack=uncorrected flat-field=None dark-field=None shading_estimation=[Estimate shading profiles] shading_model=[Estimate both flat-field and dark-field] setting_regularisationparametes=Automatic temporal_drift=Ignore correction_options=[Compute shading and correct images] lambda_flat=0.50 lambda_dark=0.50");
rename("corrected");
// save corrected image sequence
run("Image Sequence... ", "select=["+correc_path+"] dir=["+correc_path+"] format=TIFF name=img start=1");

// stich corrected image sequence and save
run("Grid/Collection stitching", "type=[Grid: snake by rows] order=[Right & Down                ] grid_size_x="+grid_size_x+" grid_size_y="+grid_size_y+" tile_overlap="+overlap+" first_file_index_i=1 directory=["+correc_path+"] file_names=img{iiii}.tif output_textfile_name=TileConfiguration.txt fusion_method=[Linear Blending] regression_threshold=0.30 max/avg_displacement_threshold=2.50 absolute_displacement_threshold=3.50 compute_overlap subpixel_accuracy computation_parameters=[Save memory (but be slower)] image_output=[Fuse and display]");
saveAs("Tiff", path+"Fused_corrected.tif");

// stich uncorrected image sequence and save for comparison
selectWindow("uncorrected");
run("Grid/Collection stitching", "type=[Grid: snake by rows] order=[Right & Down                ] grid_size_x="+grid_size_x+" grid_size_y="+grid_size_y+" tile_overlap="+overlap+" first_file_index_i=1 directory=["+uncorrec_path+"] file_names=img{iiii}.tif output_textfile_name=TileConfiguration.txt fusion_method=[Linear Blending] regression_threshold=0.30 max/avg_displacement_threshold=2.50 absolute_displacement_threshold=3.50 compute_overlap subpixel_accuracy computation_parameters=[Save memory (but be slower)] image_output=[Fuse and display]");
saveAs("Tiff", path+"Fused_uncorrected.tif");


