minValue = 2578;
maxValue = 20107;

imageIDs = getList("image.titles");
dir = "/Users/haotianli/Library/CloudStorage/OneDrive-Personal/MouseData/condensateID/SIM data/SIM after BC adjust/"
fileType = ".tif";

for (i = 0; i < imageIDs.length; i++) {
	selectWindow(imageIDs[i]);
	run("Duplicate...", "title=Backup_" + i);
}

allTitles = getList("image.titles");

for (i = 0; i < allTitles.length; i++) {
	if(startsWith(allTitles[i], "Backup_")){
		selectWindow(allTitles[i]);
		setMinAndMax(minValue, maxValue);
		title = getTitle();  
    	saveAs("Tiff", dir + title + fileType);
	}
}
