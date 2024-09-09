importClass(Packages.java.util.Random);
randomGenerator = new Random();

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
		
		threshold = 20;
		getWidthAndHeight(width, height);
		
		for (y = 0; y < height; y++) {
			for (x = 0; x < width; x++) {
				setCursor(x, y);
				getPixel(pixelValue);

				if (pixelValue < threshold) {
					putPixel(x, y, 0);
				}else {
					probability = pixelValue / 255;
					if (randomGenerator.nextFloat() > probability) {
						putPixel(x, y, 0);
					}
				}
				
			}
		}
		
		
	}
}