function PocessVideoFrames(fol,v,p)


 s=pwd;

 file=fullfile(s,fol, v);
 folder=fullfile(s,fol);
 mov = VideoReader(file);
 read(mov, Inf);
 numFrames = mov.NumberOfFrames;

   numFramesWritten = 0;
   back = read(mov, 1);

   

   
   
   if p=='bin'  
         for t = 1 : numFrames
    
   currFrame = read(mov, t);    %reading individual frames
   I = currFrame
   f3=im2double(I); 
   b=rgb2gray(I);
   bin=im2bw(b,0.2);
   f=imfill(bin,'holes');
   openBW=bwareaopen(f, 50);
   se = strel('disk',3);
   closeBW = imclose(openBW,se);
   closeBW=imresize(closeBW, [224 224]);
   closeBW = bwmorph(closeBW,'spur',3);
     closeBW=bwareaopen(closeBW, 50);
  

   closeBW = bwmorph(closeBW,'spur',3);
   bound=bounding (closeBW);
   
   opBaseFileName = sprintf('%4.3d.png', t);
   opFullFileName = fullfile(folder, opBaseFileName);
   imwrite(bound, opFullFileName, 'png');   %saving as 'png' file
   numFramesWritten = numFramesWritten + 1;
   
       end
 elseif p=='rgb'
     

         for t = 1 : numFrames
   currFrame = read(mov, t);    %reading individual frames
   currFrame=imresize(currFrame, [112 112]);  %%%%%%%%%%%% 224
   opBaseFileName = sprintf('%3.3d.png', t);
   opFullFileName = fullfile(folder, opBaseFileName);
   imwrite(currFrame, opFullFileName, 'png');   %saving as 'png' file
  
   
       end 

 
 else
     
     numFramesWritten = 0;
         for t = 1 : numFrames
    I = read(mov, t);    %reading individual frames 
    currFrame=imresize(I, [224 224]);
    
    sub=imread('C:\matconvnet-1.0-beta18\matlab\data\sub.png'); 
    fff=imsubtract(sub,currFrame);
    fff=rgb2gray(fff);
   fff=im2bw(fff,0.1);
   fff=bwareaopen(fff, 50);
  
 %  fff = bwmorph(fff,'skel',1);
   %fff = bwmorph(fff,'spur',3);
  %fff = bwmorph(fff,'skel',1);
   fff = bwmorph(fff,'spur',3);
   
   opBaseFileName = sprintf('%3.3d.png', t);
   opFullFileName = fullfile(folder, opBaseFileName);
   imwrite(fff, opFullFileName, 'png');   %saving as 'png' file
   numFramesWritten = numFramesWritten + 1;

     
  end
    
     
 end
 



function im=bounding (y)
    
 
% //Calculate all bounding boxes
s=regionprops(y, 'BoundingBox');

%// Obtain all of the bounding box co-ordinates
bboxCoords = reshape([s.BoundingBox], 4, []).';

% // Calculate top left corner
topLeftCoords = bboxCoords(:,1:2);

% // Calculate top right corner
topRightCoords = [topLeftCoords(:,1) + bboxCoords(:,3) topLeftCoords(:,2)];

% // Calculate bottom left corner
bottomLeftCoords = [topLeftCoords(:,1) topLeftCoords(:,2) + bboxCoords(:,4)];

% // Calculate bottom right corner
bottomRightCoords = [topLeftCoords(:,1) + bboxCoords(:,3) ...
    topLeftCoords(:,2) + bboxCoords(:,4)];

% // Calculating the minimum and maximum X and Y values
finalCoords = [topLeftCoords; topRightCoords; bottomLeftCoords; bottomRightCoords];
minX = min(finalCoords(:,1));
maxX = max(finalCoords(:,1));
minY = min(finalCoords(:,2));
maxY = max(finalCoords(:,2));

% Draw the rectangle on the screen
width = (maxX - minX + 1);
height = (maxY - minY + 1);
rect = [minX minY width height];

% // Show the image
y= uint8(255 * y);
y = insertShape(y,'Rectangle',rect)
im=im2bw(y);

        
    end






end


