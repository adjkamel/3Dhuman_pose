imagefiles = dir('F:\3.6\code\kinectall\*.png');      
nfiles = length(imagefiles);    % Number of files found

 arr(1)= 0;
 arr(2)= 1;
 arr(3)= 2;
 arr(4)= 3;
 arr(5)= 1;
 arr(6)= 5;
 arr(7)= 6;
 arr(8)= 1;
 arr(9)= 8;
 arr(10)= 9;
 arr(11)= 10;
 arr(12)= 9;
 arr(13)= 12;
 arr(14)= 13;
 arr(15)= 9;
 arr(16)= 15;
 arr(17)= 16;
 
load('F:\3.6\code\kinectall\kinect');

for ii=1:nfiles
    
cur_image = imread(strcat('F:\3.6\code\kinectall\',num2str(ii),'.png'));
cur_image =cur_image(:,:,1);      
            cur_image = single(cur_image); 
         
            cur_image=cur_image/max(abs(max(abs(cur_image))));
figure(1);
imshow(cur_image);
   





figure(3);

 cla reset;
 hold on;
 view(3);
   
  k=1;
 
  for n1= 1:17
      
       
        if n1==1
            plot3(0,0,0,'.','markersize',40,'color','black'); 
        else
            if n1==8
             plot3(tab(ii,k)-tab(ii,1),tab(ii,k+1)-tab(ii,2),tab(ii,k+2)-tab(ii,3),'.','markersize',40,'color','red'); 
            else
             plot3(tab(ii,k)-tab(ii,1),tab(ii,k+1)-tab(ii,2),tab(ii,k+2)-tab(ii,3),'.','markersize',40,'color','black');    
            end
        end
        k=k+3;
   
  end  
 
  view(170,60)
  axis equal on
  drawnow
  rotate3d on
  grid on



end