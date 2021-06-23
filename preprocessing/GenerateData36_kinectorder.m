       

 
%['Walking 1.58860488', 'Walking 1.60457274', 'Walking.54138969','Walking.55011271', 'Walking.58860488', 'Walking.60457274']  
st= strcat('F:\3.6\code\S8\MySegmentsMat\depth_pure\Discussion 1.60457274.mat');
load(st);
ff=1;
for j = 1:length(Feat)
    
I=mat2gray(Feat{j});
opBaseFileName = sprintf('%d.png', ff);
opFullFileName = fullfile('F:\3.6\code\Discussion 1.60457274', opBaseFileName);
imwrite(I,opFullFileName,'png');

ff=ff+1;
end


stp= strcat('F:\3.6\code\S8\MyPoseFeatures\D3_Positions_mono\Discussion 1.60457274.cdf');
tmp = cdfread(stp);
tab=tmp{1,1};
tab2=zeros(length(tmp),51);
tab3=zeros(length(tmp),51);

for i = 1:size(tab,1)

 
  %  cla reset; 
  %  hold on;
  %  view(3);
    %[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17]
    
      k=1;
      
  for n1 = [1 4 7 10 19 22 25 37 40 43 46 52 55 58 76 79 82]
      
        %plot3(tab(i,n1),tab(i,n1+1),tab(i,n1+2),'.','markersize',40);
        
        tab2(i,k)= tab(i,n1);
        tab2(i,k+1)= tab(i,n1+1);
        tab2(i,k+2)= tab(i,n1+2);
        k=k+3;
        
  end  
  
 % view(170,60)
 % axis equal on
 % drawnow
 % rotate3d on
 % grid on

end




for i = 1:size(tab2,1)

   % cla reset; 
   % hold on;
   % view(3);
     
  k=1;
  
  for n1 = [1 5 6 7 2 3 4 8 12 13 14 15 16 17 9 10 11]
      
        %plot3(tab2(i,n1*3-2),tab2(i,n1*3-1),tab2(i,n1*3),'.','markersize',40);
        
        tab3(i,k)= tab2(i,n1*3-2);
        tab3(i,k+1)= tab2(i,n1*3-1);
        tab3(i,k+2)= tab2(i,n1*3);
        k=k+3;
        
  end  
  
 % view(10,10)
 % axis equal on
 % drawnow
 % rotate3d on
 % grid on

end







