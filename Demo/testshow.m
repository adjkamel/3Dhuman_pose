function [Glob ,Loc ,angle]=testshow(epoch,lay,fold,ax1,ax2,jh)

 global Local;
 global Global;
 global  arr;
 
 



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

old_data=[];
s=pwd;

folderexp=fullfile(s,'data\exp');

foldetest=fullfile(s,fold);
 
image_size = [112 112];

%Files = dir(fullfile(foldetest,'*.png'));

%NumFiles= size(Files,1);

net = load(fullfile(folderexp,epoch)) ; 


         skeletonTab= test(epoch,lay,fold,jh);
   
 j = 1 %%%%%%%% same as number of frames  and number of transformation.                                       
  
  i=1;
  
  for k = 1 :3: 51
   Skeleton(1,i,j) = skeletonTab(j,k); 
   Skeleton(2,i,j) = skeletonTab(j,k+1); 
   Skeleton(3,i,j) = skeletonTab(j,k+2); 
   i=i+1;
  end
  
  
 
  
 %  (j= nframes-1) and j=j
b=[0 0 0 1];  

if j>2    %%% we should have 3 frames to start calculate transformation.
     
  for i = 1 :17
      
   if j== 3  %%%%%%%%%%%% j=3 calculate transformation of the previous frame
       
    [r,t]=Kabsch([Skeleton(1,i,j-2),Skeleton(2,i,j-2),Skeleton(3,i,j-2);Skeleton(1,i,j-1),Skeleton(2,i,j-1),Skeleton(3,i,j-1)]', [Skeleton(1,i,j-1),Skeleton(2,i,j-1),Skeleton(3,i,j-1);Skeleton(1,i,j),Skeleton(2,i,j),Skeleton(3,i,j)]');
    GR(:,:,i,2) =r;    %%%% 2 number of transformation
    GT(:,i,2)=t;
    GMT(:,:,i,2)=[GR(:,:,i,2) GT(:,i,2);b];    
 
    GMT(:,:,i,1)=0;   %%%%%%%first transformation =0  1 number of transformation
   end
                    %%%%%%%%%%%%% j=3 or more
                    
    [r,t] = Kabsch([Skeleton(1,i,j-2),Skeleton(2,i,j-2),Skeleton(3,i,j-2);Skeleton(1,i,j-1),Skeleton(2,i,j-1),Skeleton(3,i,j-1)]', [Skeleton(1,i,j-1),Skeleton(2,i,j-1),Skeleton(3,i,j-1);Skeleton(1,i,j),Skeleton(2,i,j),Skeleton(3,i,j)]');
    GR(:,:,i,j) =r; 
    
    
    
    GT(:,i,j)=t;   
    GMT(:,:,i,j)=[GR(:,:,i,j) GT(:,i,j);b];     
   
    
  end %%%%%%%%%%%end for i
  
   
  if j== 3
            
       
            LMT(:,:,2,2)  = GMT(:,:,2,2); %%%%% number of transformation
            LMT(:,:,5,2)  = GMT(:,:,5,2); 
            LMT(:,:,8,2)  = GMT(:,:,8,2);
            LMT(:,:,3,2)  = GMT(:,:,3,2)*inv(LMT(:,:,2,2));
            LMT(:,:,4,2)  = GMT(:,:,4,2)*inv(LMT(:,:,3,2)*LMT(:,:,2,2));
            LMT(:,:,6,2)  = GMT(:,:,6,2)*inv(LMT(:,:,5,2));
            LMT(:,:,7,2)  = GMT(:,:,7,2)*inv(LMT(:,:,6,2)*LMT(:,:,5,2));
            LMT(:,:,15,2) = GMT(:,:,15,2)*inv(LMT(:,:,8,2));
            LMT(:,:,9,2)  = GMT(:,:,9,2)*inv(LMT(:,:,15,2)*LMT(:,:,8,2));
            LMT(:,:,12,2) = GMT(:,:,12,2)*inv(LMT(:,:,15,2)*LMT(:,:,8,2));
            LMT(:,:,10,2) = GMT(:,:,10,2)*inv(LMT(:,:,9,2)*LMT(:,:,15,2)*LMT(:,:,8,2));
            LMT(:,:,13,2) = GMT(:,:,13,2)*inv(LMT(:,:,12,2)*LMT(:,:,15,2)*LMT(:,:,8,2));
            LMT(:,:,11,2) = GMT(:,:,11,2)*inv(LMT(:,:,10,2)*LMT(:,:,9,2)*LMT(:,:,15,2)*LMT(:,:,8,2));
            LMT(:,:,14,2) = GMT(:,:,14,2)*inv(LMT(:,:,13,2)*LMT(:,:,12,2)*LMT(:,:,15,2)*LMT(:,:,8,2));
            LMT(:,:,16,2) = GMT(:,:,16,2)*inv(LMT(:,:,15,2)*LMT(:,:,8,2));
            LMT(:,:,17,2) = GMT(:,:,17,2)*inv(LMT(:,:,16,2)*LMT(:,:,15,2)*LMT(:,:,8,2)); 
        LMT(:,:,:,1)=0;     
  end                   
                                              %%%%%%%%%%%% if j==3 or more
            LMT(:,:,2,j)  = GMT(:,:,2,j);
            LMT(:,:,5,j)  = GMT(:,:,5,j); 
            LMT(:,:,8,j)  = GMT(:,:,8,j);
            LMT(:,:,3,j)  = GMT(:,:,3,j)*inv(LMT(:,:,2,j));
            LMT(:,:,4,j)  = GMT(:,:,4,j)*inv(LMT(:,:,3,j)*LMT(:,:,2,j));
            LMT(:,:,6,j)  = GMT(:,:,6,j)*inv(LMT(:,:,5,j));
            LMT(:,:,7,j)  = GMT(:,:,7,j)*inv(LMT(:,:,6,j)*LMT(:,:,5,j));
            LMT(:,:,15,j) = GMT(:,:,15,j)*inv(LMT(:,:,8,j));
            LMT(:,:,9,j)  = GMT(:,:,9,j)*inv(LMT(:,:,15,j)*LMT(:,:,8,j));
            LMT(:,:,12,j) = GMT(:,:,12,j)*inv(LMT(:,:,15,j)*LMT(:,:,8,j));
            LMT(:,:,10,j) = GMT(:,:,10,j)*inv(LMT(:,:,9,j)*LMT(:,:,15,j)*LMT(:,:,8,j));
            LMT(:,:,13,j) = GMT(:,:,13,j)*inv(LMT(:,:,12,j)*LMT(:,:,15,j)*LMT(:,:,8,j));
            LMT(:,:,11,j) = GMT(:,:,11,j)*inv(LMT(:,:,10,j)*LMT(:,:,9,j)*LMT(:,:,15,j)*LMT(:,:,8,j));
            LMT(:,:,14,j) = GMT(:,:,14,j)*inv(LMT(:,:,13,j)*LMT(:,:,12,j)*LMT(:,:,15,j)*LMT(:,:,8,j));
            LMT(:,:,16,j) = GMT(:,:,16,j)*inv(LMT(:,:,15,j)*LMT(:,:,8,j));
            LMT(:,:,17,j) = GMT(:,:,17,j)*inv(LMT(:,:,16,j)*LMT(:,:,15,j)*LMT(:,:,8,j)); 
  
  
  
   if j== 3
                              
        Global(:,:,:,1)=0;   %%%%%%%%%% first frame
        Local(:,:,:,1)=0;
          
        for i = 1 :17        %%%%%%% second frame
           
              
             eulZYXglobal =  rot2eul(GMT(1:3,1:3,i,2));
             eulZYXlocal  =  rot2eul(LMT(1:3,1:3,i,2));
            
              gtetax=eulZYXglobal(3); 
              gtetay=eulZYXglobal(2); 
              gtetaz=eulZYXglobal(1);
          
              ltetax=eulZYXlocal(3); 
              ltetay=eulZYXlocal(2); 
              ltetaz=eulZYXlocal(1);
          
          %%%%%%%%%%%%%%%%%%% Rotation angles  Global
          Global(1,1,i,2) = gtetax;
          Global(2,1,i,2) = gtetay;
          Global(3,1,i,2) = gtetaz;
          
          %%%%%%%%%%%%%%%%%% Translation
          Global(1,2,i,2) = GMT(1,4,i,2);
          Global(2,2,i,2) = GMT(2,4,i,2); 
          Global(3,2,i,2) = GMT(3,4,i,2); 
          
          %%%%%%%%%%%%%%%%%%% Rotation angles  Local
          Local(1,1,i,2) = ltetax;
          Local(2,1,i,2) = ltetay;
          Local(3,1,i,2) = ltetaz;
          
          %%%%%%%%%%%%%%%%%% Translation
          Local(1,2,i,2) = LMT(1,4,i,2);
          Local(2,2,i,2) = LMT(2,4,i,2); 
          Local(3,2,i,2) = LMT(3,4,i,2); 
           
        end     
   end
                       %%%%%%%%%%%% if j==3 or more
       for i = 1 :17
   
      
          [gtetax gtetay gtetaz]= GetEulerAngles(GMT(1:3,1:3,i,j));
          [ltetax ltetay ltetaz]= GetEulerAngles(LMT(1:3,1:3,i,j));
          
          %%%%%%%%%%%%%%%%%%% Rotation angles  Global
          Global(1,1,i,j) = gtetax;
          Global(2,1,i,j) = gtetay;
          Global(3,1,i,j) = gtetaz;
          
          %%%%%%%%%%%%%%%%%% Translation
          Global(1,2,i,j) = GMT(1,4,i,j);
          Global(2,2,i,j) = GMT(2,4,i,j); 
          Global(3,2,i,j) = GMT(3,4,i,j); 
          
          %%%%%%%%%%%%%%%%%%% Rotation angles  Local
          Local(1,1,i,j) = ltetax;
          Local(2,1,i,j) = ltetay;
          Local(3,1,i,j) = ltetaz;
          
          %%%%%%%%%%%%%%%%%% Translation
          Local(1,2,i,j) = LMT(1,4,i,j);
          Local(2,2,i,j) = LMT(2,4,i,j); 
          Local(3,2,i,j) = LMT(3,4,i,j); 
          
       end
    
   %%%%%%%%%%%%%%%%%% there is no rotation or translation in the first frame    
   
end     

   %%%%%%%%%% angle 1;
   
   A=  sqrt( (Skeleton(1,1,j)-Skeleton(1,2,j))^2+(Skeleton(2,1,j)-Skeleton(2,2,j))^2+ (Skeleton(3,1,j)-Skeleton(3,2,j))^2 ) ;      % joint1 - joint2
   B=  sqrt( (Skeleton(1,3,j)-Skeleton(1,1,j))^2+(Skeleton(2,3,j)-Skeleton(2,1,j))^2+ (Skeleton(3,3,j)-Skeleton(3,1,j))^2 ) ;      % joint3 - joint1
   C=  sqrt( (Skeleton(1,3,j)-Skeleton(1,2,j))^2+(Skeleton(2,3,j)-Skeleton(2,2,j))^2+ (Skeleton(3,3,j)-Skeleton(3,2,j))^2 ) ;      % joint1 - joint3    
   angle(1,j)=acosd((A^2+C^2- B^2)/(2*A*C));
 
   %%%%%%%%%% angle 2;
   
   A=  sqrt( (Skeleton(1,1,j)-Skeleton(1,5,j))^2+(Skeleton(2,1,j)-Skeleton(2,5,j))^2+ (Skeleton(3,1,j)-Skeleton(3,5,j))^2 ) ;      % joint1 - joint5
   B=  sqrt( (Skeleton(1,6,j)-Skeleton(1,1,j))^2+(Skeleton(2,6,j)-Skeleton(2,1,j))^2+ (Skeleton(3,6,j)-Skeleton(3,1,j))^2 ) ;      % joint6 - joint1
   C=  sqrt( (Skeleton(1,6,j)-Skeleton(1,5,j))^2+(Skeleton(2,6,j)-Skeleton(2,5,j))^2+ (Skeleton(3,6,j)-Skeleton(3,5,j))^2 ) ;      % joint1 - joint6    
   angle(2,j)=acosd((A^2+C^2- B^2)/(2*A*C));   
   
   %%%%%%%%%% angle 3;
   
   A=  sqrt( (Skeleton(1,2,j)-Skeleton(1,3,j))^2+(Skeleton(2,2,j)-Skeleton(2,3,j))^2+ (Skeleton(3,2,j)-Skeleton(3,3,j))^2 ) ;      % joint2 - joint3
   B=  sqrt( (Skeleton(1,4,j)-Skeleton(1,2,j))^2+(Skeleton(2,4,j)-Skeleton(2,2,j))^2+ (Skeleton(3,4,j)-Skeleton(3,2,j))^2 ) ;      % joint4 - joint2
   C=  sqrt( (Skeleton(1,4,j)-Skeleton(1,3,j))^2+(Skeleton(2,4,j)-Skeleton(2,3,j))^2+ (Skeleton(3,4,j)-Skeleton(3,3,j))^2 ) ;      % joint2 - joint4     
   angle(3,j)=acosd((A^2+C^2- B^2)/(2*A*C));   
   
   %%%%%%%%%% angle 4;
   
   A=  sqrt( (Skeleton(1,5,j)-Skeleton(1,6,j))^2+(Skeleton(2,5,j)-Skeleton(2,6,j))^2+ (Skeleton(3,5,j)-Skeleton(3,6,j))^2 ) ;      % joint5 - joint6
   B=  sqrt( (Skeleton(1,7,j)-Skeleton(1,5,j))^2+(Skeleton(2,7,j)-Skeleton(2,5,j))^2+ (Skeleton(3,7,j)-Skeleton(3,5,j))^2 ) ;      % joint7 - joint5
   C=  sqrt( (Skeleton(1,7,j)-Skeleton(1,6,j))^2+(Skeleton(2,7,j)-Skeleton(2,6,j))^2+ (Skeleton(3,7,j)-Skeleton(3,6,j))^2 ) ;      % joint5 - joint7    
   angle(4,j)=acosd((A^2+C^2- B^2)/(2*A*C));   
   
   %%%%%%%%%% angle 5;
   
   A=  sqrt( (Skeleton(1,15,j)-Skeleton(1,9,j))^2+(Skeleton(2,15,j)-Skeleton(2,9,j))^2+ (Skeleton(3,15,j)-Skeleton(3,9,j))^2 ) ;      % joint15 - joint9
   B=  sqrt( (Skeleton(1,10,j)-Skeleton(1,15,j))^2+(Skeleton(2,10,j)-Skeleton(2,15,j))^2+ (Skeleton(3,10,j)-Skeleton(3,15,j))^2 ) ;   % joint10 - joint15
   C=  sqrt( (Skeleton(1,10,j)-Skeleton(1,9,j))^2+(Skeleton(2,10,j)-Skeleton(2,9,j))^2+ (Skeleton(3,10,j)-Skeleton(3,9,j))^2 ) ;      % joint15 - joint10     
   angle(5,j)=acosd((A^2+C^2- B^2)/(2*A*C));   
    
   %%%%%%%%%% angle 6;
   
   A=  sqrt( (Skeleton(1,15,j)-Skeleton(1,12,j))^2+(Skeleton(2,15,j)-Skeleton(2,12,j))^2+ (Skeleton(3,15,j)-Skeleton(3,12,j))^2 ) ;      % joint15 - joint12
   B=  sqrt( (Skeleton(1,13,j)-Skeleton(1,15,j))^2+(Skeleton(2,13,j)-Skeleton(2,15,j))^2+ (Skeleton(3,13,j)-Skeleton(3,15,j))^2 ) ;      % joint13 - joint15
   C=  sqrt( (Skeleton(1,13,j)-Skeleton(1,12,j))^2+(Skeleton(2,13,j)-Skeleton(2,12,j))^2+ (Skeleton(3,13,j)-Skeleton(3,12,j))^2 ) ;      % joint15 - joint13   
   angle(6,j)=acosd((A^2+C^2- B^2)/(2*A*C)); 
   
   %%%%%%%%%% angle 7;
   
   A=  sqrt( (Skeleton(1,9,j)-Skeleton(1,10,j))^2+(Skeleton(2,9,j)-Skeleton(2,10,j))^2+ (Skeleton(3,9,j)-Skeleton(3,10,j))^2 ) ;      % joint9 - joint10
   B=  sqrt( (Skeleton(1,11,j)-Skeleton(1,9,j))^2+(Skeleton(2,11,j)-Skeleton(2,9,j))^2+ (Skeleton(3,11,j)-Skeleton(3,9,j))^2 ) ;      % joint11 - joint9
   C=  sqrt( (Skeleton(1,11,j)-Skeleton(1,10,j))^2+(Skeleton(2,11,j)-Skeleton(2,10,j))^2+ (Skeleton(3,11,j)-Skeleton(3,10,j))^2 ) ;   % joint9 - joint11     
   angle(7,j)=acosd((A^2+C^2- B^2)/(2*A*C));    
   
   %%%%%%%%%% angle 8;
   
   A=  sqrt( (Skeleton(1,12,j)-Skeleton(1,13,j))^2+(Skeleton(2,12,j)-Skeleton(2,13,j))^2+ (Skeleton(3,12,j)-Skeleton(3,13,j))^2 ) ;      % joint12 - joint13
   B=  sqrt( (Skeleton(1,14,j)-Skeleton(1,12,j))^2+(Skeleton(2,14,j)-Skeleton(2,12,j))^2+ (Skeleton(3,14,j)-Skeleton(3,12,j))^2 ) ;      % joint14 - joint12
   C=  sqrt( (Skeleton(1,14,j)-Skeleton(1,13,j))^2+(Skeleton(2,14,j)-Skeleton(2,13,j))^2+ (Skeleton(3,14,j)-Skeleton(3,13,j))^2 ) ;      % joint12 - joint14    
   angle(8,j)=acosd((A^2+C^2- B^2)/(2*A*C)); 
   

  
  
  
 col='red';



 j = jh  %%%%%%%% same as number of frames  and number of transformation.

 
Filename=strcat(num2str(j),'.png'); 
cur_image=imread(fullfile(foldetest, Filename));
sh=cur_image;

   
            cur_image =cur_image(:,:,1);      
            cur_image = single(cur_image); 
            cur_image=cur_image/max(abs(max(abs(cur_image))));
            cur_image = imresize(cur_image, image_size); 

 

res = vl_simplenn(net.net, cur_image) ;
%disp(res(11).x);

 
                     
cla reset;
  
  
  hold on;

   
  view(3); %whitebg('white')
               text(0, 0,85,num2str(j));
  
               
     for nn = 1:17
        
          
          
        c=nn; % order same as indeces
        p=arr(nn);
        
          c1=(c*3-2);
        p1=(p*3-2);
        
        if ( c==2 | c==3 | c==4 | c==9 | c==10 | c==11 ) 
               col='red'
        else
        
           if (c ==5 | c==6 | c==7 | c==12 | c==13 | c==14 | c==15 ) 
                col='blue'
           else
               col=[0 0.75 0.6]
           end
        end
       
       if p > 0
           
           

           if (c ~= 15)  
           
          plot3(ax2,res(lay).x(:,:,c1)+res(lay).x(:,:,p1), res(lay).x(:,:,c1+1)+res(lay).x(:,:,p1+1),res(lay).x(:,:,c1+2)+res(lay).x(:,:,p1+2),'.','markersize',30,'Color',col);  
          
          %text(double(res(lay).x(:,:,c1)+res(lay).x(:,:,p1)), double(res(lay).x(:,:,c1+1)+res(lay).x(:,:,p1+1))+0.5,double(res(lay).x(:,:,c1+2)+res(lay).x(:,:,p1+2)),num2str(c));
          
          plot3(ax2,[res(lay).x(:,:,p1)     res(lay).x(:,:,c1)+res(lay).x(:,:,p1)],...
                   [ res(lay).x(:,:,p1+1)  (res(lay).x(:,:,c1+1)+res(lay).x(:,:,p1+1))],...
                   [ res(lay).x(:,:,p1+2)   res(lay).x(:,:,c1+2)+res(lay).x(:,:,p1+2)],'LineWidth',1.3,'Color',col);  
               
               
            
               res(lay).x(:,:,c1) =res(lay).x(:,:,c1)+res(lay).x(:,:,p1);
                   res(lay).x(:,:,c1+1) = res(lay).x(:,:,c1+1)+res(lay).x(:,:,p1+1);
                   res(lay).x(:,:,c1+2) = res(lay).x(:,:,c1+2)+res(lay).x(:,:,p1+2);
           end
                   
          if (c==8) 
         
                   res(lay).x(:,:,43) =res(lay).x(:,:,c1)+ res(lay).x(:,:,43);
                   res(lay).x(:,:,44) = res(lay).x(:,:,c1+1)+ res(lay).x(:,:,44);
                   res(lay).x(:,:,45) = res(lay).x(:,:,c1+2)+ res(lay).x(:,:,45);      
          
                   plot3(ax2,[ res(lay).x(:,:,c1)  res(lay).x(:,:,43)],...
                   [ res(lay).x(:,:,c1+1)  res(lay).x(:,:,44)],...
                   [ res(lay).x(:,:,c1+2)  res(lay).x(:,:,45)],'LineWidth',1.3,'Color',col);  
                   
                   
                   plot3(ax2,res(lay).x(:,:,43), res(lay).x(:,:,44),res(lay).x(:,:,45),'.','markersize',30,'Color',col);
                  % text(double(res(lay).x(:,:,43)),  double(res(lay).x(:,:,44))+0.5,double(res(lay).x(:,:,45)) ,'8');
         
          end
       else
             plot3(ax2,res(lay).x(:,:,c1), res(lay).x(:,:,c1+1),res(lay).x(:,:,c1+2),'.','markersize',30,'Color',col);
             %text(double(res(lay).x(:,:,c1)), double(res(lay).x(:,:,c1+1))+0.5,double(res(lay).x(:,:,c1+2)) ,num2str(c));
         
       end   
           
     end 
   
  view(10,10)
 %axis equal on
 %grid on
 % axis off
  drawnow
  rotate3d on
  
  
  
  imshow(sh,'Parent', ax1);
  
  pause(1);
%{
   ang=1;
   
   for i=1:17
       
     if (ang<=8)
       d =  {j i Global(1,1,i,j) Global(2,1,i,j) Global(3,1,i,j) Global(1,2,i,j) Global(2,2,i,j) Global(3,2,i,j) Local(1,1,i,j)  Local(2,1,i,j)  Local(3,1,i,j)  Local(1,2,i,j) Local(2,2,i,j) Local(3,2,i,j) Skeleton(1,i,j) Skeleton(2,i,j) Skeleton(3,i,j) angle(ang,j)};
                
            ang=ang+1;
     else      
       d =  {j i Global(1,1,i,j) Global(2,1,i,j) Global(3,1,i,j) Global(1,2,i,j) Global(2,2,i,j) Global(3,2,i,j) Local(1,1,i,j)  Local(2,1,i,j)  Local(3,1,i,j)  Local(1,2,i,j) Local(2,2,i,j) Local(3,2,i,j) Skeleton(1,i,j) Skeleton(2,i,j) Skeleton(3,i,j) 'NaN'};          
     end
     
       set(tab, 'data',[old_data;d]);
        
        old_data=get(tab,'data');
  end;
 
  
             
 
end

%}

Glob=Global;

Loc=Local;
 




