# :microscope: LCI Image Analysis Workshop 2023

Welcome to the image analysis workshop organized by the Live Cell Imaging facility at the Karolinska Institute! During this workshop you will:

- [x] See typical examples of what can be done with image analysis and the limitations of each example
- [x] Understand which image artefacts can be corrected by image analysis in some cases but are easier to correct before acquisition, e.g., uneven illumination
- [x] Understand which image artefacts cannot be corrected by image analysis, e.g., saturation, underexposure, bleedthrough

In order to follow-up the examples presented in this workshop, download the code available in this GitHub page (you can do that by clicking on the green buttom above). In addition, you also have to download Fiji from the following [link](https://fiji.sc/). The installation of additional required plugins will be detailed in the next sessions.

:bookmark: **Tip**: To open a script in Fiji, go to "File->Open". Then browse the image of interest. If the Bio-Formats plugin interface appears, then check the import options and press "OK"

:bookmark: **Tip**: You can open an image in Fiji by dragging and droping a file in the main interface or through "Plugins->Macros->Edit...". Then browse the code to be used in each session.

:people_holding_hands: **Group work**: For each activity you will be radomly assigned to breakout rooms to work in groups. Results should be reported in the following shared document.

## :alarm_clock: Schedule

* **10:00-11:00** Correction of uneven illumination
* **11:10-12:00** Handling noise
* **12:00-13.00** Lunch break
* **13:00-14:20** Image artifacts that cannot be fixed
* **14:20-15:00** Show-case image analysis tasks using the students images

## :muscle: Let's start!

## 1) Uneven illumination - how to correct

Uneven illumation can be due to different factors, e.g., microscope settings, samples artifacts (amples that are not flat), etc. 

## 2) Handling noise

Each group should take a specific reference image and generate the output measures using the script "Noise.ijm" script.

-> Images to be used in this session are located in "../images/noise/"

-> Instructions to run the script and generate the measures: 
* Open the image of interest in Fiji;
* Open and run the script "Noise.ijm";
* Copy the measures from the "Summary" table to the shared file 
* Inspect the Results table and the Roi Manager tool
* Take some time to analyze the script!

**Testing the Median filter**: uncomment line #20 of the script (by removing the "//" at beggining of the line, see below). Then re-run the script for the same reference image. Copy the measures to the shared file and compare the new measures with the previous values.

```
run("Median...", "radius=4");
```

:bulb: What happens as the size of the averaging filter increases?

:bulb: What happens if we don't use the median filter?


## 3) Image artifacts

Some image artifacts cannot be fixed by image analysis and may compromise intensity and shape measurements. Examples can be seen in the images below, such as, bleedtrough, saturation, underexposure and soft focus.

![](images/bleedtrough.png?raw=true "Screenshot")

<img src="images/saturation_vs_underexposure.png" height=60% width=60% ></a>

You will work in groups to investigate how each artifact can affect image quantification.

-> Images to be used in this session are located in "../images/image_artifacts/"

-> Instructions to run the script: 
* Open the image of interest in Fiji;
* Open and run the script "ImageArtifacts.ijm";
* From the "Log" window copy the values of the "total segmented area" and "average intensity" of each channel (green and red)
* Take some time to analyze the script!

Wait for all the groups to complete the task and summarize results in the shared file. Then discuss:

:bulb: How are the measures affected by each artifact?

:bulb: How to avoid such artifacts during acquisition?

## 4) Extra task: Nuclei & Cell Segmentation

The segmentation of nuclei and cells are the starting point of several image analysis tasks in microscopy.

