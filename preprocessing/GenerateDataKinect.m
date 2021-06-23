

[skeleton,time]= loadbvh('F:\3.6\code\kinect\v');
 tab2=zeros(length(time),51); 
for ff = 1:length(time)           
% cla reset;
 %hold on
% view(3);
        %[1 2 3 4 5 6 7 8   9 10 11 12 13 14 15 16 17]
        %[1 2 3 4 6 7 8 10 13 14 15 37 38 39 60 61 62]        
        k=1;
  for n2=[1 6 7 8 2 3 4 10 13 14 15 37 38 39 60 61 62]% real order like 3.6
      
       % plot3(skeleton(n2).Dxyz(1,ff),skeleton(n2).Dxyz(3,ff),skeleton(n2).Dxyz(2,ff),'.','markersize',40);  
        tab2(ff,k)=skeleton(n2).Dxyz(1,ff);
        tab2(ff,k+1)=skeleton(n2).Dxyz(3,ff);
        tab2(ff,k+2)=skeleton(n2).Dxyz(2,ff);
        k=k+3;
  end          
  
  %view(-165,30)
%  axis equal on
  %drawnow
 % rotate3d on
%  grid on
  

%pause;
end

   size(tab2,1)       
for i = 1:size(tab2,1) %%%%% number of subjects 
    
 
 t=1;
  
  max1=0;
  max2=0;
  max3=0;
  z=1; 
 for ss = 1:17
        
        if abs(tab2(i,z)) > max1
             max1=abs(tab2(i,z));
        end
        
        if abs(tab2(i,z+1)) > max2
             max2=abs(tab2(i,z+1));
        end
        
        if abs(tab2(i,z+2)) > max3
             max3=abs(tab2(i,z+2));
        end
        
        z=z+3;
 end        
    % cla reset;
 %hold on;
 %view(3);
 
    k=1;
      
  for h=1:17
       % plot3(tab2(i,k)/max1,tab2(i,k+1)/max2,tab2(i,k+2)/max3,'.','markersize',40);
        tab2(i,k)=tab2(i,k)/max1;
        tab2(i,k+1)=tab2(i,k+1)/max2;
        tab2(i,k+2)=tab2(i,k+2)/max3;
        k=k+3;
  end  
  
 % view(170,60)
  %axis equal on
  %drawnow
  %rotate3d on
  %grid on

end


