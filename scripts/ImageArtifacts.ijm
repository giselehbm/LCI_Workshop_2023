
// ===============================
// AUTHOR : Gisele Miranda 
// CREATE DATE : 2023 - 02 - 03
// PURPOSE : LCI Microscopy course - Image Analysis workshop - 
// 			 Evaluating image artifacts - bleedtrough, saturation, underexposure and soft focus
// ===============================

/**
 * Open image of interest then press the 'Run' buttom
 */

rename("Original");
run("Split Channels");

// segment green channel and retrieve area and intensity measures
selectWindow("C1-Original");
measuresC1 = segment("C1-Original");
measuresC1 = split(measuresC1," ");
print("Total segmented area in the green channel: " + measuresC1[0]);
print("Average intensity of the green channel: " + measuresC1[1]);

// segment red channel and retrieve area and intensity measures
selectWindow("C2-Original");
measuresC2 = segment("C2-Original");
measuresC2 = split(measuresC2," ");
print("Total segmented area in the red channel: " + measuresC2[0]);
print("Average intensity of the red channel: " + measuresC2[1]);

/** 
 * function that performs segmentation and returns measures 
 */
function segment(img) {
	// duplicate image to create mask
	run("Duplicate...", "mask_"+img);
	rename("mask_"+img);
	
	// segment by thresholding
	setAutoThreshold("Otsu dark");
	setOption("BlackBackground", true);
	run("Convert to Mask");
	
	// define measures
	run("Set Measurements...", "area mean standard redirect="+img+" decimal=2");
	run("Analyze Particles...", "clear summarize");
	
	Table.rename("Summary", "Results");
	tot_area = getResult("Total Area", 0);
	avg_intensity = getResult("Mean", 0);
	
	//close("mask");
	selectWindow("Results");
	run("Close");
	
	measures = d2s(tot_area,4) + " " + d2s(avg_intensity,4);
	return measures; 
}

