
// ===============================
// AUTHOR : Gisele Miranda 
// CREATE DATE : 2023 - 02 - 03
// PURPOSE : LCI Microscopy course - Image Analysis workshop - Noise handling
// ===============================


// change look-up table to Grays
run("Grays");
rename("Original");
// duplicate image to create mask
run("Duplicate...", "mask");
rename("mask");
// subtract background to correct uneven illumination - you can change the 'rolling' value
run("Subtract Background...", "rolling=70");
// adjust brightness & contrast for better visualization
run("Enhance Contrast", "saturated=0.35");
// filter to reduce noise
run("Median...", "radius=4");
// apply Otsu threshold
setAutoThreshold("Otsu dark");
setOption("BlackBackground", true);
run("Convert to Mask");
// Set measures & Analyze particles
run("Set Measurements...", "area mean standard redirect=[Original] decimal=2");
run("Analyze Particles...", "  show=Nothing display exclude clear summarize add");