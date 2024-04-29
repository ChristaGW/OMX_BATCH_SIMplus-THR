//SIM Threshold batch macro (created by C. Walther)
//it automates the Threshold function in the Plugin SIM check which therefore you will need 
//to install first. You need to place all files to be worked on into a separate folder 
//(called e.g. input) and create a folder for the output. 
//Those folders you will need to direct the macro to when it asks for them. 

run("Bio-Formats Macro Extensions");  // open BioFormats Extension to be able to open image files in batch

dir1 = getDirectory("Choose Source Directory "); // Select Directory where dv files are - dv files only!!!
dir2 = getDirectory("Choose Destination Directory "); // Select Directory files are saved - make output folder first
list = getFileList(dir1); // how many files are there
setBatchMode(true); // stops images being opened 


for (i=0; i<list.length; i++) { 
	showProgress(i+1, list.length);
	Ext.openImagePlus(dir1+list[i]);
	run("Threshold and 16-bit Conversion", "auto-scale"); //part of SIM check
	name = getTitle;
	selectWindow(name);
	saveAs ("TIFF", dir2 + name);
	close();
}


