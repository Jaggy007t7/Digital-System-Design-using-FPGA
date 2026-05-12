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
