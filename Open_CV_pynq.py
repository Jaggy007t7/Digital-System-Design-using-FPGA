from PIL import Image as PIL_image 
img_path = "boy.png"

img = PIL_image.open(img_path)
img

# Converting Image to greyscale.
bw = img.convert("L")  
bw

# For rotating image:-
rot_img = img.rotate(360)
rot_img

# Uisng computer vision:-
import cv2
from matplotlib import pyplot as plt
img = cv2.imread("boy.png")

# the defualt colour scheme of the cv2 is BGR
plt.subplot(1,2,1),plt.imshow(img)
#converting image to BGR
plt.subplot(1,2,2),plt.imshow(cv2.cvtColor(img,cv2.COLOR_BGR2RGB))

import matplotlib.image as mpimg
img2 = mpimg.imread("boy.png")
plt.imshow(img2)

#
import cv2
import numpy as np 
from matplotlib import pyplot as plt
import matplotlib.image as mpimg

img  = cv2.imread("boy.png")
img2 = mpimg.imread("boy.png")
img3 = mpimg.imread("Blurr.jpg")

plt.subplot(1,2,1),plt.imshow(img2)
plt.title('MP_image')
plt.subplot(1,2,2),plt.imshow(cv2.cvtColor(img,cv2.COLOR_BGR2RGB))
plt.title('open_CV')

blur = cv2.blur(img,(5,5))
plt.imshow(blur)

# Gaussian Blurr:-
blur2 = cv2.GaussianBlur(img,(5,5),0)
plt.imshow(blur2)

median = cv2.medianBlur(img2,5)
plt.imshow(median)

New_blur = cv2.bilateralFilter(img3,9,75,75)
plt.subplot(1,2,1),plt.imshow(New_blur)
plt.subplot(1,2,2),plt.imshow(img3)
