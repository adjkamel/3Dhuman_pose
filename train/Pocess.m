function newframe=Pocess(im,bac)



  

  
     currFrame=im-bac;
     currFrame=currFrame(:,:,1);

     
     x1=size(currFrame,1); 
     y1=size(currFrame,2); 
    

      
   se = strel('disk',2);
 currFrame = imopen(currFrame,se);
 

  
originalMinValue = double(min(min(currFrame)));  
originalMaxValue = double(max(max(currFrame)));
originalRange = originalMaxValue - originalMinValue;
   
desiredMin = 0;
desiredMax = 1;
desiredRange = desiredMax - desiredMin;
currFrame = desiredRange * (double(currFrame) - originalMinValue) /originalRange + desiredMin;
   

% currFrame=histeq(currFrame);

%currFrame=currFrame(:,:,1);
   
%currFrame=drawregionboundaries(l, currFrame, [255 2 0]);
   

bin=im2bw(currFrame,0.05);

BW2 = bwareaopen(bin,3000);


for k=1 : x1
    
 for l=1 : y1

    if BW2(k,l)==0

     currFrame(k,l)=0;
 
    end 
end
    
end



for x=1 : x1
    
 
    if max(currFrame(x,:))>0
     break;
     
    end 
    
end

for y=1 : y1
    
    if max(currFrame(:,y))>0
        break;
    end 
      
end
 
for z= x1 :-1: 1
      
    
    if max(currFrame(z,:))>0
        break;
    end    

end
 
 
 for w=y1 :-1: 1
    
      if max(currFrame(:,w))>0
        break;
      end    

 end
 
    currFrame = imcrop(currFrame,[y-15 x-15 (w-y)+30 (z-x)+30]);
    
 
    x1=size(currFrame,1); 
    y1=size(currFrame,2);    
   
    padx =450-x1;
    pady =400-y1;
   
    
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

      
      
    currFrame=padarray(currFrame,[padx pady]);
     
    currFrame=currFrame.*1/double(max(max(currFrame))) ;
      
    image_size = [112 112];
  
    
    newframe=imresize(currFrame, image_size);
    
    % currFrame=currFrame ./ max(max(currFrame));
     
    %currFrame=imresize(currFrame, image_size);
    
    

   


 



end



