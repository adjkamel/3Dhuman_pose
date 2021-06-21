
function ground36plot(ax2,jh)      

     
    
        
     
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


        s=pwd;


	    load('data\test\human36');
	    
	    mem1=zeros(17);
	    mem2=zeros(17);
	    mem3=zeros(17);


     
        i = jh
              
      

               %%%%%%%%%%%%%%%%%%%%%%%%%%%% GT

               k=1; 

                for  nn =1:17
                
                   if (arr(nn) == 0)    
                       
                   A(k)=   0;     
                   A(k+1)=  0;   
                   A(k+2)=   0;   
                
                   else
                       
                   A(k)=     (tab3(i,k)-tab3(i,(arr(nn)*3)-2))/50;
                   A(k+1)=    (tab3(i,k+2)-tab3(i,arr(nn)*3))/50;
                   A(k+2)=   -(tab3(i,k+1)-tab3(i,(arr(nn)*3)-1))/50;
                   
                   end

                   k=k+3;
                   
                end
                
                 k=1;

                 for ss = 1:17

                        mem1(ss)=A(k);
                        mem2(ss)=A(k+1);
                        mem3(ss)=A(k+2);
                        
                        k=k+3;
                 end        
                  
                 
            
                 max1=max(abs(mem1(:)));

                 max2=max(abs(mem2(:)));
 
                 max3=max(abs(mem3(:)));
                 
                 k=1;
                 for ss = 1:17
                     
                 A(k)=A(k)/max1;
                 A(k+1)=A(k+1)/max2;
                 A(k+2)=A(k+2)/max3;
                 
                  k=k+3;
                 end
         

              
                 
                 
                 
                            
cla reset;
  
  
  hold on;

   
  view(3); %whitebg('white')
            
               
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
           
          plot3(ax2,A(c1)+A(p1), A(c1+1)+A(p1+1),A(c1+2)+A(p1+2),'.','markersize',30,'Color',col);  
     
               plot3(ax2,[A(p1)     A(c1)+A(p1)],...
                   [ A(p1+1)  (A(c1+1)+A(p1+1))],...
                    [ A(p1+2)   A(c1+2)+A(p1+2)],'LineWidth',1.3,'Color',col);  
               
               
            
                   A(c1) =A(c1)+A(p1);
                   A(c1+1) = A(c1+1)+A(p1+1);
                   A(c1+2) = A(c1+2)+A(p1+2);
           end
                   
          if (c==8) 
         
                   A(43) =A(c1)+ A(43);
                   A(44) = A(c1+1)+ A(44);
                   A(45) = A(c1+2)+ A(45);      
          
                   plot3(ax2,[ A(c1)    A(43)],...
                             [ A(c1+1)  A(44)],...
                             [ A(c1+2)  A(45)],'LineWidth',1.3,'Color',col);  
                   
                   
                   plot3(ax2,A(43), A(44),A(45),'.','markersize',30,'Color',col);
            
         
          end
       else
             plot3(ax2,A(c1), A(c1+1), A(c1+2),'.','markersize',30,'Color',col);
             
         
       end   
           
     end 
   
  view(10,10)
 %axis equal on
 %grid on
 % axis off
  drawnow
  rotate3d on
  
  
  pause(1);
  
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 

   


  
   
   
end