function result= test(epoch,lay,test,jh)

 s=pwd; 
 
 folderexp=fullfile(s,'data\exp');
 foldetest=fullfile(s,test);
 
image_size = [112 112];


Files = dir(fullfile(foldetest,'*.png'));


NumFiles= size(Files,1);
net = load(fullfile(folderexp,epoch)) ; 

 i = 1;
 
  
  
cur_image=imread(fullfile(foldetest, strcat(num2str(jh),'.png')));
    
            cur_image =cur_image(:,:,1);      
            cur_image = single(cur_image); 
            cur_image=cur_image/max(abs(max(abs(cur_image))));
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
                   res(lay).x(:,:,c1) =res(lay).x(:,:,c1)+res(lay).x(:,:,p1);
                   res(lay).x(:,:,c1+1) = res(lay).x(:,:,c1+1)+res(lay).x(:,:,p1+1);
                   res(lay).x(:,:,c1+2) = res(lay).x(:,:,c1+2)+res(lay).x(:,:,p1+2);
           end
           
           if (c==8)        
                   res(lay).x(:,:,43) =res(lay).x(:,:,c1)+ res(lay).x(:,:,43);
                   res(lay).x(:,:,44) = res(lay).x(:,:,c1+1)+ res(lay).x(:,:,44);
                   res(lay).x(:,:,45) = res(lay).x(:,:,c1+2)+ res(lay).x(:,:,45);      
          
                
         
           end
       
             
       end 
     
       

     result(i,:) = res(lay).x; %%%%%%%%% dete this to see animation
     
  
 

            
end;  


