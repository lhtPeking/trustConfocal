// ImageJ Macro to save all open images as DV format
dir = "/Users/haotianli/Library/CloudStorage/OneDrive-Personal/MouseData/condensateID/SIM data/SIM after BC adjust and after crop/";
fileType = ".tif";

imageIDs = getList("image.titles");  // 获取所有打开的图像标题列表

for (i = 0; i < imageIDs.length; i++) {
    selectWindow(imageIDs[i]);  
    title = getTitle();  
    saveAs("Tiff", dir + title + fileType);  // 保存为指定格式，DV格式以Tiff保存
    }
