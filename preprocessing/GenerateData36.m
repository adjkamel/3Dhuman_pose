       
h36=[];
ind1=1;
ind2=1;

%{ 
%['Walking 1.58860488', 'Walking 1.60457274', 'Walking.54138969','Walking.55011271', 'Walking.58860488', 'Walking.60457274']  

st= strcat('F:\3.6\code\S8\MySegmentsMat\depth_pure\Directions 1.58860488.mat');

load(st);

for j = 1:length(Feat)
I=mat2gray(Feat{j});
opBaseFileName = sprintf('%d.png', j);
opFullFileName = fullfile('F:\3.6\code\h36m Directions', opBaseFileName);
imwrite(I,opFullFileName,'png');
ind2=ind2+1;
end
%}
stp= strcat('F:\3.6\code\S8\MyPoseFeatures\D3_Positions_mono\Waiting 1.58860488.cdf');
tmp = cdfread(stp);
tab=tmp{1,1};
tab2=zeros(1612,51);
for i = 1:size(tab,1)
 t=1;
  max1=0;
  max2=0;
  max3=0;
  z=1; 
 for ss = 1:32 
        if abs(tab(i,z)) > max1
             max1=abs(tab(i,z));
        end
        if abs(tab(i,z+1)) > max2
             max2=abs(tab(i,z+1));
        end
        if abs(tab(i,z+2)) > max3
             max3=abs(tab(i,z+2));
        end
        z=z+3;
 end        
    %cla reset; 
    %hold on;
    %view(3);
    %[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17]
      k=1;
  for n1 = [1 4 7 10 19 22 25 37 40 43 46 52 55 58 76 79 82]
        %plot3(tab(i,n1)/max1,tab(i,n1+1)/max2,tab(i,n1+2)/max3,'.','markersize',40);
        tab2(i,k)= tab(i,n1)/max1;
        tab2(i,k+1)= tab(i,n1+1)/max2;
        tab2(i,k+2)= tab(i,n1+2)/max3;
        k=k+3;
  end  
  h36(ind1,:)= tab2(i,:);
  ind1=ind1+1;
  
 % view(170,60)
 % axis equal on
 % drawnow
 % rotate3d on
 % grid on

end

