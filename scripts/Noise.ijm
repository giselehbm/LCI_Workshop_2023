

// change look-up table to Grays
run("Grays");
// subtract background to correct uneven illumination - you can change the 'rolling' value
run("Subtract Background...", "rolling=70");
// adjust brightness & contrast for better visualization
run("Enhance Contrast", "saturated=0.35");
// filter to reduce noise
run("Median...", "radius=4");
// duplicate image to create mask
run("Duplicate...", "mask");
rename("mask");
// apply Otsu threshold
setAutoThreshold("Otsu dark");
setOption("BlackBackground", true);
run("Convert to Mask");
// Analyze particles
run("Analyze Particles...", "  show=Nothing display exclude clear summarize add");
//run("glasbey_inverted");