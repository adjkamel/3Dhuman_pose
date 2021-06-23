### 3D Human pose estimation from a single depth image

This repository contains code for 3D human pose estimation using a single depth image as a part of the paper 
[An investigation of 3D human pose estimation for learning Tai Chi: A human factor perspective](https://www.tandfonline.com/doi/abs/10.1080/10447318.2018.1543081) (the pose estimation technique used in the paper). Further evaluation on the Human3.6 dataset is mentioned in the chapter 3 of the [thesis](https://cdmd.cnki.com.cn/Article/CDMD-10248-1020727900.htm)
### Rquirements
Matlab 2016a or above
[MatConvNet](https://www.vlfeat.org/matconvnet/) toolbox CNN matlab library
### Overview
From the idea that depth images provide stronger features for 3D pose estimation than RGB images, and from the fact that ConvNet models are a powerful technique for feature extraction and regression, also, from the belief that a well-trained model with the appro- priate parameters with a large amount of normalised data can effectively predict accurate pose locations, we redesign the model to regress directly the input depth image to the joints coordinates in a single learning task from a single depth image without using the detection phase. Our objective is to improve the 3D pose estimation accuracy using a different strategy from the three previously mentioned techniques in term of model training, data preprocessing, loss function, model layers, and data normalisation. We train the model using images and 3D poses from the public Human3.6M dataset, and we also used a private dataset collected by means of Microsoft Kinect v2. Our framework can be summarized in three steps. First, a preprocessing step to remove the background and get only the foreground silhouette body is required to learn the model with only body features. Since the Human3.6M [125] dataset provides segmented body silhouette, we use this step only with our Kinect data to remove the recorded background. Second, data normalisation for both depth images and the 3D poses are conducted to produce a uniform training data. The third step is training the
model under a well defined parameters decided during the experiments to get the best per-
formance by checking the loss function behaviour. In the end, we test the trained model
on new unseen images and we check the pose estimation accuracy. We compared the pose
estimation results of our method with the ground truth, and with some RGB-based 3D
pose estimation methods that used the same Human3.6M dataset.

### Datasets
- [human3.6m dataset](http://vision.imar.ro/human3.6m/description.php)
- Collected dataset from Kinect v2
### Preprocessing
The preprocessing consists of normalisiing the images and the body poses.

#### Images normalisation

- Kinect Data: Depth images collected by Kinect were recorded with a background
behind the user, which requires background removing to get only the silhouette of the
human body. Unlike RGB images where it is difficult to distinguish the background from
the foreground. We can subtract the background based on a depth threshold. While we
recorded the body motion of users standing far from the background, we remove it by
assigning zero values (black color) to the pixels of far depth. Figure bellow illustrates the
preprocessing steps from the raw depth image with the background until the normalised image. As the figure shows, after removing the background based on the depth threshold,
some of the small regions may still be considered as part of the foreground. The resulting
depth image is transformed into a binary image to remove the small isolated regions using
morphologic operations. After that, the region of interest is cropped to take only the
body area, then the image is padded again with black pixels with the same size from
the top, the bottom, the left and the right sides of the image to center the body in the
middle of the image. In the end, the image is resized to 112x112 to fit the input size of
the ConvNet model for training.

- Human3.6M [125] Data: The case of the data obtained from the Human3.6M dataset
is different. The dataset provides depth silhouettes of the human body (without a back-
ground). Only the region of interest is cropped, then the image is padded and resized
to 112x122 (steps: 7,8, and 9 of Figure 3.1). Examples of depth images from the Hu-
man3.6M dataset after the preprocessing are shown in Figure 3.3.

- The final step of the normalisation process is dividing the pixels of each image by the
maximum value of all the pixels to get pixels values between 0 and 1.


![image](https://user-images.githubusercontent.com/50513215/122835919-2979e780-d2e9-11eb-9c7c-f8cf91218c98.png)



#### Pose normalisation

 From the joints provided by the Kinect and Human3.6M dataset, we selected the most informative 17 joints for
dimensionality reduction to minimise training and testing computation. The 3D joints co-
ordinates of both sources are collected by different sensors, where the Human3.6M dataset
coordinates values are larger than the Kinect coordinates values. However, even the nor-
malisation by dividing the joints coordinates values on the maximum value is not efficient
because we can find two depth images of the same body position (for example, standing
position) but they have different joints coordinates values. For the sake of having a robust
normalisation, we first use the relative joints instead of using absolute joints directly provided by the datasets, then we divide each joint coordinates by the maximum absolute
value of the same axis to create a new interval of coordinates between 0 and 1. Figure bellow
shows the transformation from the absolute joints to the relative joints of the left leg. We
consider the hip center joint as the origin of the coordinates system, then the new joints
coordinates represent the limb length, which is calculated by the substraction between each
joint and its parent joint. The relative joints are efficient to handle the difference in body heights by considering the distance between joints, which relatively does not change much
from a person to another.

![image](https://user-images.githubusercontent.com/50513215/123167860-0aa55d80-d46f-11eb-86c6-bfa8123275f9.png)


![image](https://user-images.githubusercontent.com/50513215/122835975-41ea0200-d2e9-11eb-9356-e86ee3283056.png)


### Model
The model composed of four convolutional layers
for feature extraction. Each of the three first convolutional layers is followed by a 2x2
pooling layer. We use 32 filters of size 9x9 in the first convolutional layer, 64 filters of
size 5x5 in the second convolutional layer, and 128 filters for the third convolutional layer.
However, The fourth convolutional layer compromise 128 filters of size 10x10. After that,
two consecutive fully connected layers of size 1024 and 2048, respectively are used. The
last layer of the model is a vector of 51 elements which represent the coordinates of the
seventeen predicted joints. 

We trained three versions of the model using the same parameters but different training
strategies in term of data.
The models’ results will be discussed in the result section.
Each model is optimized during training using the gradient descent algorithm based on the
Euclidian loss function that calculates the difference between the predicted joint location
and the ground truth. During our experiments, we found that the appropriate learning
rate for the loss function to get the minimum value is 10−7. We also found that training the model with one image in the forward pass instead of using a batch of images is more
efficient.
The model is trained on a machine with Intel(R) Core(TM) i7-6700 CPU @
3.40GHz 3.40GHz with 8 GB of RAM and an operating system of 64 bits. The model was
designed and trained using MatConvNet deep learning package

![image](https://user-images.githubusercontent.com/50513215/123168192-8c958680-d46f-11eb-84eb-8ebd7f3eaaaa.png)


![image](https://user-images.githubusercontent.com/50513215/122834392-6abcc800-d2e6-11eb-9479-5847163c431a.png)

### Evaluation results
#### Qualitative results
![image](https://user-images.githubusercontent.com/50513215/122835640-ae183600-d2e8-11eb-8722-edcfd491a1e7.png)
![image](https://user-images.githubusercontent.com/50513215/122835791-ef104a80-d2e8-11eb-838b-25589aced41b.png)

#### Quantitative results
The number of training data, the number of testing data, and the number of iterations required for each of our three ConvNet models to get the minimum loss value
![image](https://user-images.githubusercontent.com/50513215/122835150-c3409500-d2e7-11eb-8a2f-80b51d66eaec.png)
3D pose estimation comparison results with RGB-based methods on Human3.6m dataset using MPJPE metric
![image](https://user-images.githubusercontent.com/50513215/122835392-26cac280-d2e8-11eb-8293-5b3841dfb9f2.png)


### Demo
To run the demo like the following animation, open the folder ./demo with matlab and run main.m 
![ezgif com-gif-maker](https://user-images.githubusercontent.com/50513215/122835059-a1471280-d2e7-11eb-964c-6be706b7cd22.gif)

