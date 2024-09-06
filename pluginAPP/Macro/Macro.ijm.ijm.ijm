imageTitles = getList("image.titles");

for (i = 0; i < imageTitles.length; i++) {
	selectWindow(imageTitles[i]);
	run("Duplicate...", "title=Backup_" + i);
}

allTitles = getList("image.titles");

for (i = 0; i < allTitles.length; i++) {
	if(startsWith(allTitles[i], "Backup_")){
		selectWindow(allTitles[i]);
		
		// run("Gaussian Blur...", "sigma=1");
		
		setThreshold(20, 255);
		run("Create Selection");
		
		getStatistics(area, mean, min, max, std, histogram);
		
		totalPixelNum = 0;
		for (j = 0; j < histogram.length; j++) {
			totalPixelNum += histogram[j];
		}
		
		cumulativeSum = 0;
		threshold = 0;
		for (j = histogram.length - 1; j >= 0; j--) {
			cumulativeSum += histogram[j];
			if (cumulativeSum >= totalPixelNum * 0.25) {
				threshold = j;
				break;
			}
		}
		
		// print("Threshold for " + allTitles[i] + ": " + threshold);
		// print("Histogram for " + allTitles[i] + ": " + Arrays.toString(histogram));
		setThreshold(threshold, max);
		run("Convert to Mask");
		
		run("Analyze Particles...", "size=0.03-Infinity circularity=0.2-1.0 display summarize add exclude");
		
		resetThreshold();
	}
}

selectWindow("Results")
saveAs("Results", "/Users/haotianli/Library/CloudStorage/OneDrive-Personal/MouseData/condensateID/Prox1/tables/results.csv");
