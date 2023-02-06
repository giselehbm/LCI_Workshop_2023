# :microscope: LCI Image Analysis Workshop 2023

Welcome to the image analysis workshop organized by the Live Cell Imaging facility at the Karolinska Institute! During this workshop you will:

- [x] See typical examples of what can be done with image analysis and the limitations of each example
- [x] Understand which image artefacts can be corrected by image analysis in some cases but are easier to correct before acquisition, e.g., uneven illumination
- [x] Understand which image artefacts cannot be corrected by image analysis, e.g., saturation, underexposure, bleedthrough

In order to follow-up the examples presented in this workshop, download the code available in this GitHub page (you can do that by clicking on the green buttom above). In addition, you also have to download Fiji from the following [link](https://fiji.sc/). The installation of additional required plugins will be detailed in the next sessions.

**Tip**: To open a script in Fiji, go to "Plugins->Macros->Edit...". Then browse the code to be used in each session.

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

Images to be used in session are located in "../images/noise/"

Instructions to run the script and generate results: 
* Open the image of interest in Fiji;
* Open and run the scrip "Noise.ijm";
* Copy the measures from Summary table to the shared file 
* Inspect the Results table and the Roi Manager tool
* Take some time to analyze the script!

*Testing the Median filter*: uncomment line #20 of the script (by removing the "//" at beggining of the line), the re-run the script for the same reference image. Copy the measures to the shared file and compare both results (with and without median filter).

:bulb: What happens as the size of the averaging filter increases?

:bulb: What happens as if we don't use the median filter 


## 3) Image artifacts that cannot be fixed by image analysis


