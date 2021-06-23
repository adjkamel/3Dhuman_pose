


function imdb = cnn_data()

    s=pwd;

    foldertrain=fullfile(s,'data\train');
    folderval=fullfile(s,'data\val');

    total_imagestrain = dir( fullfile( foldertrain,  '*.png') );
    total_imagesval = dir( fullfile( folderval,  '*.png') );
    total_images = length(total_imagestrain) + length(total_imagesval);
   
   
    image_size = [112 112];
    nametrain = fullfile( foldertrain,  'v');
    nameval = fullfile( folderval,  'v');
    [skeletontrain] = loadbvh(nametrain);
    [skeletonval]   = loadbvh(nameval);
    
    imdb.images.data     = zeros(image_size(1), image_size(2), 1, total_images, 'single');
    imdb.images.labels   = zeros(1,1,51, total_images, 'double');
    imdb.images.set      = zeros(1, total_images, 'uint8');
    
    st= 'data\train\human36';
    load(st);
    
    mem1=zeros(17);
    mem2=zeros(17);
    mem3=zeros(17);
%{
 arr(1)= 1;

 arr(2)= 2;

 arr(3)= 3;

 arr(4)= 4;


 arr(5)= 6;

 arr(6)= 7;

 arr(7)= 8;

 
 arr(8)= 10;

 
 arr(9)= 13;

 arr(10)= 14;

 arr(11)= 15;
 
 
 arr(12)= 37;

 arr(13)= 38;

 arr(14)= 39;

 
 arr(15)= 60;

 arr(16)= 61;

 arr(17)= 62;
%}
    
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% R=j-jp
 

 arr(1,1)= 1;
 arr(1,2)=0;
 arr(2,1)= 2;
 arr(2,2)=1;
 arr(3,1)= 3;
 arr(3,2)=2;
 arr(4,1)= 4;
 arr(4,2)=3;
 arr(5,1)= 6;
 arr(5,2)=1;
 arr(6,1)= 7;
 arr(6,2)=6;
 arr(7,1)= 8;
 arr(7,2)=7;
 arr(8,1)= 10;
 arr(8,2)=1;
 arr(9,1)= 13;
 arr(9,2)=60;%%%%%%%%%%%%%% left arm to neck
 arr(10,1)= 14;
 arr(10,2)=13;
 arr(11,1)= 15;
 arr(11,2)=14 ;
 arr(12,1)= 37;
 arr(12,2)=60; %%%%%%% right arm to neck
 arr(13,1)= 38;
 arr(13,2)=37;
 arr(14,1)= 39;
 arr(14,2)=38;
 arr(15,1)= 60;
 arr(15,2)=10;
 arr(16,1)= 61;
 arr(16,2)=60;
 arr(17,1)= 62;
 arr(17,2)=61;
 
 
 %%%%%%%%%%%%%%%%%%%%%%%  kinect order
 arr36(1)= 0;
 arr36(2)= 1;
 arr36(3)= 2;
 arr36(4)= 3;
 arr36(5)= 1;
 arr36(6)= 5;
 arr36(7)= 6;
 arr36(8)= 1;
 arr36(9)= 15;
 arr36(10)= 9;
 arr36(11)= 10;
 arr36(12)= 15;
 arr36(13)= 12;
 arr36(14)= 13;
 arr36(15)= 8;
 arr36(16)= 15;
 arr36(17)= 16;

 
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% train
               
      image_counter = 0;
      
        for i = 1:9544%length(total_imagestrain)
            k=1;       
            for  nn =1:length(skeletontrain)
             
                if ismember(nn, arr(:,1))
                    
                    [occ,parind]=ismember(nn,arr(:,1)); %search for parent in founded case arr(:,1).
                    %disp(nn);
                    %disp(parind);
                    %disp(arr(parind,2));
                    %disp('--------------------------------------');

                   if (arr(parind,2) == 0) % hip ist the parent of all the skeleton
                     
                   A(1,1,k)=   0;     %i =ff
                   A(1,1,k+1)=  0;   %i =ff; 
                   A(1,1,k+2)=   0;   %i =ff;  skeletontrain(nn).Dxyz(2,i)

                   k=k+3;

                   else
                   
                   A(1,1,k)=      skeletontrain(nn).Dxyz(1,i)-skeletontrain(arr(parind,2)).Dxyz(1,i); %i =ff
                   A(1,1,k+1)=  -(skeletontrain(nn).Dxyz(3,i)-skeletontrain(arr(parind,2)).Dxyz(3,i)); %i =ff;   %%%%************************************************* minus
                   A(1,1,k+2)=    skeletontrain(nn).Dxyz(2,i)-skeletontrain(arr(parind,2)).Dxyz(2,i); %i =ff;
                  
                   k=k+3; 
                   
              
                   end
                
                end  
               
                
                
                
            end
            
                k=1;

                 for ss = 1:17

                        mem1(ss)=A(1,1,k);
                        mem2(ss)=A(1,1,k+1);
                        mem3(ss)=A(1,1,k+2);
                        
                        k=k+3;
                 end        
                  
                 
                 max1=max(abs(mem1(:)));
                 
                 max2=max(abs(mem2(:)));
                 
                 max3=max(abs(mem3(:)));
                 
                 k=1;
                 for ss = 1:17
                     
                 A(1,1,k)=A(1,1,k)/max1;
                 A(1,1,k+1)=A(1,1,k+1)/max2;
                 A(1,1,k+2)=A(1,1,k+2)/max3;
                 
                  k=k+3;
                 end
           
            
                    
                %{      
             k=1;
                     
              cla reset;
              hold on;
              view(3); %whitebg('white')
              
                  for ss = 1:17

                            plot3(A(1,1,k), A(1,1,k+2), A(1,1,k+1),'.','markersize',30);
                             
                            k=k+3; 
                            
                     end            
               
           
              view(10,30)
              axis equal on
              grid on
              axis on
              drawnow
              rotate3d on
               
                     %}
                     
            total_imagestrain(i).name = strcat(num2str(i),'.png');
            
            cur_image = imread(fullfile(foldertrain, total_imagestrain(i).name)); 
            cur_image =cur_image(:,:,1);      
            cur_image = single(cur_image); 
            cur_image=cur_image/max(abs(max(abs(cur_image))));
            cur_image = imresize(cur_image, image_size); 

      
            image_counter = image_counter + 1;
            imdb.images.data(:,:,:,image_counter) = cur_image;
            
            imdb.images.labels(:,:,:,image_counter) = A;
        imdb.images.set(1,image_counter) = 1; %1 for train, 2 for test (val?)      
     
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 3.6
        
            for li = 1:6709
              
               k=1; 

                for  nn =1:17
                
                   if (arr36(nn) == 0)    
                       
                   A(1,1,k)=   0;     
                   A(1,1,k+1)=  0;   
                   A(1,1,k+2)=   0;   
                
                   else
                       
                   A(1,1,k)=     (tab3(li,k)-tab3(li,(arr36(nn)*3)-2))/50;
                   A(1,1,k+1)=    (tab3(li,k+2)-tab3(li,arr36(nn)*3))/50;
                   A(1,1,k+2)=   -(tab3(li,k+1)-tab3(li,(arr36(nn)*3)-1))/50;
                   
                   end

                   k=k+3;
                   
                end
                
           k=1;

                 for ss = 1:17

                        mem1(ss)=A(1,1,k);
                        mem2(ss)=A(1,1,k+1);
                        mem3(ss)=A(1,1,k+2);
                        
                        k=k+3;
                 end        
                  
                 
            
                 max1=max(abs(mem1(:)));

                 max2=max(abs(mem2(:)));
 
                 max3=max(abs(mem3(:)));
                 
                 k=1;
                 for ss = 1:17
                     
                 A(1,1,k)=A(1,1,k)/max1;
                 A(1,1,k+1)=A(1,1,k+1)/max2;
                 A(1,1,k+2)=A(1,1,k+2)/max3;
                 
                  k=k+3;
                 end
             
             i=i+1;
            
           
            
                     
              %{      
              k=1;
                     
              cla reset;
              hold on;
              view(3); 
              
                  for ss = 1:17

                            plot3(A(1,1,k), A(1,1,k+1), A(1,1,k+2),'.','markersize',30);
                             
                            k=k+3; 
                 end            
               
            
             view(10,30)
             axis equal on
             grid on
             axis on
             drawnow
             rotate3d on
             %}
           
             
             
            total_imagestrain(i).name = strcat(num2str(i),'.png');
            cur_image = imread(fullfile(foldertrain, total_imagestrain(i).name)); 
            cur_image =cur_image(:,:,1);      
            cur_image = single(cur_image); 
            cur_image=cur_image/max(abs(max(abs(cur_image))));
            cur_image = imresize(cur_image, image_size); 
      
            image_counter = image_counter + 1;
            imdb.images.data(:,:,:,image_counter) = cur_image;
            
            imdb.images.labels(:,:,:,image_counter) = A;
        imdb.images.set(1,image_counter) = 1; %1 for train, 2 for test (val?)      
     
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% validation
  
      %image_counter = continue
   
        for i = 1:length(total_imagesval)  
            k=1; 
            for  nn =1:length(skeletonval)
                if ismember(nn, arr(:,1))
                    [occ,parind]=ismember(nn,arr(:,1)); %search for parent in founded case arr(:,1).
                  % disp(nn);
                  % disp(parind);
                  % disp(arr(parind,2));
                  % pause;
                   
                  if (arr(parind,2) == 0) % hip ist the parent of all the skeleton
                     
                   A(1,1,k)=   0;     %i =ff
                   A(1,1,k+1)=  0;   %i =ff; 
                   A(1,1,k+2)=   0;   %i =ff;  skeletontrain(nn).Dxyz(2,i)
                   %i =ff;
                    k=k+3;
      
                 else
                    
                   A(1,1,k)=    skeletontrain(nn).Dxyz(1,i)-skeletontrain(arr(parind,2)).Dxyz(1,i); %i =ff
                   A(1,1,k+1)=   -(skeletontrain(nn).Dxyz(3,i)-skeletontrain(arr(parind,2)).Dxyz(3,i)); %i =ff;  %%%%************************************************* minus
                   A(1,1,k+2)=   skeletontrain(nn).Dxyz(2,i)-skeletontrain(arr(parind,2)).Dxyz(2,i); %i =ff;
                   k=k+3; 
                   
                end
            end
            end  
            
                    k=1;

                 for ss = 1:17

                        mem1(ss)=A(1,1,k);
                        mem2(ss)=A(1,1,k+1);
                        mem3(ss)=A(1,1,k+2);
                        
                        k=k+3;
                 end        
                  
                 
                   max1=max(abs(mem1(:)));

                 max2=max(abs(mem2(:)));
 
                 max3=max(abs(mem3(:)));
                 
                 k=1;
                 for ss = 1:17
                     
                 A(1,1,k)=A(1,1,k)/max1;
                 A(1,1,k+1)=A(1,1,k+1)/max2;
                 A(1,1,k+2)=A(1,1,k+2)/max3;
                 
                  k=k+3;
                 end
                 
                 
            
          total_imagesval(i).name = strcat(num2str(i),'.png');
            cur_image = imread(fullfile(folderval, total_imagesval(i).name));
            cur_image =cur_image(:,:,1);      
            cur_image = single(cur_image); 
            cur_image=cur_image/max(abs(max(abs(cur_image))));
            cur_image = imresize(cur_image, image_size); 
      
            image_counter = image_counter + 1;
            imdb.images.data(:,:,:,image_counter) = cur_image;            
          
            imdb.images.labels(:,:,:,image_counter) = A;
        imdb.images.set(1,image_counter) = 2;     % 2 for test (val?)      
    
            
        end 
          
        
end


