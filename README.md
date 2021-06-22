### 3D Human pose estimation from a single depth image

This repository contains code for 3D human pose estimation using a single depth image as a part of the paper 
[An investigation of 3D human pose estimation for learning Tai Chi: A human factor perspective](https://www.tandfonline.com/doi/abs/10.1080/10447318.2018.1543081) (the pose estimation technique used in the paper). Further evaluation on the Human3.6 dataset is mentioned in the chapter 3 of the [thesis](https://cdmd.cnki.com.cn/Article/CDMD-10248-1020727900.htm)
### Rquirements
Matlab 2016a or above
[MatConvNet](https://www.vlfeat.org/matconvnet/) toolbox CNN matlab library
### Overview
### Datasets
- [human3.6m dataset](http://vision.imar.ro/human3.6m/description.php)
- Collected dataset from Kinect v2
### Preprocessing
The preprocessing consists of normalisiing the images and the body poses.

#### Images normalisation
![image](https://user-images.githubusercontent.com/50513215/122835919-2979e780-d2e9-11eb-9c7c-f8cf91218c98.png)

#### Pose normalisation
![image](https://user-images.githubusercontent.com/50513215/122835975-41ea0200-d2e9-11eb-9356-e86ee3283056.png)


### Model
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

