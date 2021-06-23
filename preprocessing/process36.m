imagefiles = dir('F:\3.6\code\Discussion 1.60457274\*.png');      
nfiles = length(imagefiles);    % Number of files found


for ii=1:nfiles
    
   currentimage = imread(strcat('F:\3.6\code\Discussion 1.60457274\',num2str(ii),'.png'));
  
   x1=size(currentimage,1); 
   y1=size(currentimage,2); 
   
for x=1 : x1
    
 
    if max(currentimage(x,:))>0
     break;
     
    end 
    
end

for y=1 : y1
    
    if max(currentimage(:,y))>0
        break;
    end 
      
end
 
for z= x1 :-1: 1
     
    if max(currentimage(z,:))>0
        break;
    end    

end

for w=y1 :-1: 1
    
      if max(currentimage(:,w))>0
        break;
      end
      
end

currentimage = imcrop(currentimage,[y-15 x-15 (w-y)+30 (z-x)+30]);


    x1=size(currentimage,1); 
    y1=size(currentimage,2);    
   
    padx =600-x1;
    pady =600-y1;
   
    
       if  mod(padx,2)==1    
            padx = padx/2-0.5;
       else
            padx = padx/2;  
       end
   
       
       if  mod(pady,2)==1 
             pady = pady/2-0.5; 
       else   
             pady = pady/2;
       end

      
      
    currentimage=padarray(currentimage,[padx pady]);
    currentimage = imadjust(currentimage,[0.2 0.9],[]);
  

opBaseFileName = sprintf('%d.png', ii);
opFullFileName = fullfile('F:\3.6\code\Discussion 1.60457274 Process\', opBaseFileName);
imwrite(currentimage,opFullFileName,'png');
  
end





    
 