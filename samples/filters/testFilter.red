Red [
	Title:   "Convolution tests "
	Author:  "Francois Jouen"
	File: 	 %testFilter.red
	Needs:	 'View
]


; last Red Master required!
#include %../../libs/redcv.red ; for redCV functions
margins: 10x10
img1: rcvLoadImage %../../images/lena.jpg
dst:  rcvCreateImage img1/size


noFilter: [0.0 0.0 0.0
		  0.0 1.0 0.0 
		  0.0 0.0 0.0]

removal: [-1.0 -1.0 -1.0
		  -1.0 9.0 -1.0 
		 -1.0 -1.0 -1.0]

laplacian: [-1.0 0.0 -1.0
		    0.0 4.0 0.0 
		    -1.0 0.0 -1.0]
		    
gaussian: [0.0 0.2 0.0
		   0.2 0.2 0.2 
		   0.0 0.2 0.0]
		   
sobelH: [1.0 2.0 1.0
		 0.0 0.0 0.0      		   
		-1.0 -2.0 -1.0]   
		
embossV: [0.0 -1.0 0.0
		  0.0 0.0 0.0 
		  0.0 1.0 0.0]
		  
		  
; ***************** Test Program ****************************
view win: layout [
		title "2D Filter Tests"
		origin margins space margins
		button 60 "No Filter" 	[rcvFastFilter2D img1 dst noFilter]
		button 60 "Laplacian" 	[rcvFastFilter2D img1 dst laplacian];
		button 60 "Gaussian" 	[rcvFastFilter2D img1 dst gaussian];
		button 60 "Sobel H" 	[rcvFastFilter2D img1 dst sobelH];
		button 60 "Mean" 		[rcvFastFilter2D img1 dst removal];
		button 60 "Emboss V" 	[rcvFastFilter2D img1 dst embossV];
		button 80 "Quit" 		[rcvReleaseImage img1 rcvReleaseImage dst Quit]
		return 
		button 60 "No Filter" 	[rcvFilter2D img1 dst noFilter 0]
		button 60 "Laplacian" 	[rcvFilter2D img1 dst laplacian 128];
		button 60 "Gaussian" 	[rcvFilter2D img1 dst gaussian 0];
		button 60 "Sobel H" 	[rcvFilter2D img1 dst sobelH 127];
		button 60 "Mean" 		[rcvFilter2D img1 dst removal 0];
		button 60 "Emboss V" 	[rcvFilter2D img1 dst embossV 127];
		return 
		button 60 "No Filter" 	[rcvConvolve img1 dst noFilter 1.0 0.0]
		button 60 "Laplacian" 	[rcvConvolve img1 dst laplacian 2.0 128.0];
		button 60 "Gaussian" 	[rcvConvolve img1 dst gaussian 2.0 0.0];
		button 60 "Sobel H" 	[rcvConvolve img1 dst sobelH 2.0 127.0 ];
		button 60 "Mean" 		[rcvConvolve img1 dst removal 2.0 0.0];
		button 60 "Emboss V" 	[rcvConvolve img1 dst embossV 2.0 127.0 ];
		return
		canvas: base 512x512 dst	
		do [rcvCopyImage img1 dst]
]
