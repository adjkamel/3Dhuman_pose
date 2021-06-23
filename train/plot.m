
function pl=plot()





s=pwd;

 folderexp=fullfile(s,'data\exp');
 foldetest=fullfile(s,'data\test');
 




image_size = [112 112];



Files = dir(fullfile(foldetest,'*.png'));


NumFiles= size(Files,1);
 net = load(fullfile(folderexp,'net-epoch-8805')) ; 
 



 

   
for i = 1 : NumFiles
    
 
 
 
cur_image=imread(fullfile(foldetest, Files(i).name));
  cur_image =cur_image(:,:,1);
cur_image = single(cur_image);
 

cur_image = imresize(cur_image, image_size);
 

res = vl_simplenn(net.net, cur_image) ;
%disp(res(11).x);

 arr(1)= 0; % parent joint in new order
 arr(2)= 1;
 arr(3)= 2;
 arr(4)= 3;

 arr(5)= 1;
 arr(6)= 5;
 arr(7)= 6;

 arr(8)= 1; 
 
 arr(9)= 15;
 arr(10)= 9;
 arr(11)= 10;

 arr(12)= 15;
 arr(13)= 12;
 arr(14)= 13;

 arr(15)= 8;
 arr(16)= 15;
 arr(17)= 16;



  

  
  
  
     
     for nn = 1:17
        
        c=nn; % order same as indeces
        p=arr(nn);
        
          c1=(c*3-2);
        p1=(p*3-2);
        
       if p > 0
         
           if (c ~= 15)  
           
          plot3(res(15).x(:,:,c1)+res(15).x(:,:,p1), res(15).x(:,:,c1+1)+res(15).x(:,:,p1+1),res(15).x(:,:,c1+2)+res(15).x(:,:,p1+2),'.','markersize',50);  
         
          plot3([ res(15).x(:,:,p1)  res(15).x(:,:,c1)+res(15).x(:,:,p1)],...
                   [ res(15).x(:,:,p1+1)  res(15).x(:,:,c1+1)+res(15).x(:,:,p1+1)],...
                   [ res(15).x(:,:,p1+2)  res(15).x(:,:,c1+2)+res(15).x(:,:,p1+2)],'LineWidth',2); 
               
               
            
               res(15).x(:,:,c1) =res(15).x(:,:,c1)+res(15).x(:,:,p1);
                   res(15).x(:,:,c1+1) = res(15).x(:,:,c1+1)+res(15).x(:,:,p1+1);
                   res(15).x(:,:,c1+2) = res(15).x(:,:,c1+2)+res(15).x(:,:,p1+2);
           end
                   
          if (c==8) 
         
                   res(15).x(:,:,43) =res(15).x(:,:,c1)+ res(15).x(:,:,43);
                   res(15).x(:,:,44) = res(15).x(:,:,c1+1)+ res(15).x(:,:,44);
                   res(15).x(:,:,45) = res(15).x(:,:,c1+2)+ res(15).x(:,:,45);      
          
                   plot3([ res(15).x(:,:,c1)  res(15).x(:,:,43)],...
                   [ res(15).x(:,:,c1+1)  res(15).x(:,:,44)],...
                   [ res(15).x(:,:,c1+2)  res(15).x(:,:,45)],'LineWidth',2);
                   
                   
                   plot3(res(15).x(:,:,43), res(15).x(:,:,44),res(15).x(:,:,45),'.','markersize',50);
         
          end
       else
             plot3(res(15).x(:,:,c1), res(15).x(:,:,c1+1),res(15).x(:,:,c1+2),'.','markersize',50);
          
       end   
             
     end 

     result(i,:)=res(15).x; %%%%%%%%% dete this to see animation
     
 
  view(-30,30)
  axis equal on
  drawnow
  rotate3d on
  grid on
     
  subplot(2,1,2);

  imshow(cur_image);
  
  
 

 
            
end;  
