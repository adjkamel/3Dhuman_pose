### 3D Human pose estimation from a single depth image

This repository contains code for 3D human pose estimation using a single depth image as a part of the paper 
[An investigation of 3D human pose estimation for learning Tai Chi: A human factor perspective](https://www.tandfonline.com/doi/abs/10.1080/10447318.2018.1543081) (the pose estimation technique used in the paper)
### Rquirements
Matlab 2016a or above
[MatConvNet](https://www.vlfeat.org/matconvnet/) toolbox CNN matlab library
### Overview
### Datasets

### Preprocessing

The preprocessing consists of normalisiing the images and the body poses.

#### Images normalisation

#### Pose normalisation


### Model
![image](https://user-images.githubusercontent.com/50513215/122834392-6abcc800-d2e6-11eb-9479-5847163c431a.png)

### Evaluation results
#### Qualitative results
![image](https://user-images.githubusercontent.com/50513215/122834544-abb4dc80-d2e6-11eb-962b-7b624be319b8.png)
![image](https://user-images.githubusercontent.com/50513215/122834578-be2f1600-d2e6-11eb-93fb-c4a320a08c56.png)

#### Quantitative results
The number of training data, the number of testing data, and the number of iterations required for each of our three ConvNet models to get the minimum loss value
![image](https://user-images.githubusercontent.com/50513215/122835150-c3409500-d2e7-11eb-8a2f-80b51d66eaec.png)

### Demo
To run the demo like the following animation, open the folder ./demo with matlab and run main.m 
![ezgif com-gif-maker](https://user-images.githubusercontent.com/50513215/122835059-a1471280-d2e7-11eb-964c-6be706b7cd22.gif)

