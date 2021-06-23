function [GlobalComp ,LocalComp, AngleComp FinalDecesion] =Comparison(Global1 ,Local1 ,angle1,Global2 ,Local2 ,angle2,nframes,tab3,tabp,tabg)

global GlobalAnglePerce;

GlobalComp=[];

LocalComp=[];

AngleComp=[];

percjoint=[];



 %{ 
                 
ThGRot=20    ;
ThLRot=10;
ThGTrans=20;
ThLTrans=10;
ThAngle=5;        

         
PerGRot=6;
PerLRot=6;

PerGTrans=10;          
PerLTrans=10;

PerAngle1=10;
PerAngle2=10;

PerAngle3=15;
PerAngle4=15;

PerAngle5=10;
PerAngle6=10;

PerAngle7=15;
PerAngle8=15;

%}


ThGRot=60 ;
ThLRot=40;
ThGTrans=60;
ThLTrans=40;


ThAngle1=12;
ThAngle2=12;
ThAngle3=10;                              
ThAngle4=10;
ThAngle5=8;
ThAngle6=5;
ThAngle7=8;
ThAngle8=5;


          
                   %%%%%%%%%%% percentage corresponding to importance in
                   %%%%%%%%%%% movement
PerGRot=10 ;
PerLRot=6;
PerGTrans=10;          
PerLTrans=6;

PerAngle1=5;
PerAngle2=5;
PerAngle3=10;
PerAngle4=10;
PerAngle5=15;
PerAngle6=20;
PerAngle7=15;
PerAngle8=20;

for j=1:nframes  

  for i = 1 :17
  
          %%%%%%%%%%%%%%%%%%% Rotation angles  Global
          GlobalComp(1,1,i,j)  = distance(Global2(1,1,i,j), Global1(1,1,i,j));
          GlobalComp(2,1,i,j)  = distance(Global2(2,1,i,j) , Global1(2,1,i,j));
          GlobalComp(3,1,i,j)  = distance(Global2(3,1,i,j) , Global1(3,1,i,j)); 
          
          %%%%%%%%%%%%%%%%%% Translation Glogal
          GlobalComp(1,2,i,j)  = distance(Global2(1,2,i,j) , Global1(1,2,i,j));
          GlobalComp(2,2,i,j)  = distance(Global2(2,2,i,j) , Global1(2,2,i,j));
          GlobalComp(3,2,i,j)  = distance(Global2(3,2,i,j) , Global1(3,2,i,j)); 
          
          %%%%%%%%%%%%%%%%%% Rotation angles  Local
          LocalComp(1,1,i,j)  = distance(Local2(1,1,i,j) , Local1(1,1,i,j));
          LocalComp(2,1,i,j)  = distance(Local2(2,1,i,j) , Local1(2,1,i,j));
          LocalComp(3,1,i,j)  = distance(Local2(3,1,i,j) , Local1(3,1,i,j)); 
          
          %%%%%%%%%%%%%%%%%% Translation Local
          LocalComp(1,2,i,j)  = distance(Local2(1,2,i,j) , Local1(1,2,i,j));
          LocalComp(2,2,i,j)  = distance(Local2(2,2,i,j) , Local1(2,2,i,j));
          LocalComp(3,2,i,j)  = distance(Local2(3,2,i,j) , Local1(3,2,i,j)); 
          
          
  end 
  
  
      AngleComp(1,j)=distance(angle2(1,j),angle1(1,j));
      AngleComp(2,j)=distance(angle2(2,j),angle1(2,j));
      AngleComp(3,j)=distance(angle2(3,j),angle1(3,j));
      AngleComp(4,j)=distance(angle2(4,j),angle1(4,j));
      AngleComp(5,j)=distance(angle2(5,j),angle1(5,j));
      AngleComp(6,j)=distance(angle2(6,j),angle1(6,j));
      AngleComp(7,j)=distance(angle2(7,j),angle1(7,j));
      AngleComp(8,j)=distance(angle2(8,j),angle1(8,j));
      
end
  



for j=1:nframes  

  for i = 1 :17
  
         if GlobalComp(1,1,i,j) <= ThGRot
             percjointGlobal(1,1,i,j)=PerGRot;
        
         else
             percjointGlobal(1,1,i,j)=0;
         end 
         
         
         
         if GlobalComp(2,1,i,j)<= ThGRot 
             percjointGlobal(2,1,i,j)=PerGRot;
         else
             percjointGlobal(2,1,i,j)=0;
         end 
         
         
         if GlobalComp(3,1,i,j) <= ThGRot
             percjointGlobal(3,1,i,j)=PerGRot; 
          else
           percjointGlobal(3,1,i,j)=0; 
         end 
       
               
         if GlobalComp(1,2,i,j)  <=  ThGTrans
             percjointGlobal(1,2,i,j)=PerGTrans;
          else
            percjointGlobal(1,2,i,j)=0;
         end   
          
          
         if GlobalComp(2,2,i,j)<=   ThGTrans 
             percjointGlobal(2,2,i,j) =  PerGTrans;
          else
             percjointGlobal(2,2,i,j) =  0;
         end 
         
         
         if GlobalComp(3,2,i,j)  <=  ThGTrans
             percjointGlobal(3,2,i,j) =  PerGTrans;
          else
            percjointGlobal(3,2,i,j) =  0;
         end 
        
        
          
         if LocalComp(1,1,i,j)  <= ThLRot
            percjointLocal(1,1,i,j) =  PerLRot;
          else
            percjointLocal(1,1,i,j) =  0;
         end   
      
          
         if LocalComp(2,1,i,j)<= ThLRot 
            percjointLocal(2,1,i,j)= PerLRot;
          else
            percjointLocal(2,1,i,j)= 0;
         end 
        
         
         if LocalComp(3,1,i,j) <= ThLRot
            percjointLocal(3,1,i,j)=PerLRot;
          else
            percjointLocal(3,1,i,j)=0;
         end 
         
              
         if LocalComp(1,2,i,j)  <=  ThLTrans
            percjointLocal(1,2,i,j)=PerLTrans;
          else
            percjointLocal(1,2,i,j)=0;
         end   
        
         
         if LocalComp(2,2,i,j)<=   ThLTrans 
            percjointLocal(2,2,i,j)=PerLTrans;
          else
            percjointLocal(2,2,i,j)=0;
         end 
      
         
         if LocalComp(3,2,i,j)  <=  ThLTrans
            percjointLocal(3,2,i,j)=PerLTrans;
          else
            percjointLocal(3,2,i,j)=0;
         end 
       
  end 
          

  
      if (AngleComp(1,j) <=  ThAngle1)   
          
       percjointAngle(1,j)=PerAngle1;
      
      else
        percjointAngle(1,j)=0;
      end
    
      
       if (AngleComp(2,j) <=  ThAngle2)   
       percjointAngle(2,j)=PerAngle2;
       else
        percjointAngle(2,j)=0;
      end    
      
      
       if (AngleComp(3,j) <=  ThAngle3)   
       percjointAngle(3,j)=PerAngle3;
       else
        percjointAngle(3,j)=0;
      end  
    
      
       if (AngleComp(4,j) <=  ThAngle4)   
       percjointAngle(4,j)=PerAngle4;
       else
        percjointAngle(4,j)=0;
      end    
      
      
       if (AngleComp(5,j) <=  ThAngle5)   
        percjointAngle(5,j)=PerAngle5;
       else
        percjointAngle(5,j)=0;
      end    
      
      
       if (AngleComp(6,j) <=  ThAngle6)   
        percjointAngle(6,j)=PerAngle6;
       else
       percjointAngle(6,j)=0;
       end    
   
      
       if (AngleComp(7,j) <=  ThAngle7)   
       percjointAngle(7,j)=PerAngle7;
       else
       percjointAngle(7,j)=0;
       end    
     
      
       if (AngleComp(8,j) <=  ThAngle8)   
        percjointAngle(8,j)=PerAngle8;
       else
        percjointAngle(8,j)=0;
      end   
    
          
end;
      



   old_data=[];
   old_datap=[];
  
  for j=1:nframes
   
    
   ang=1;
   for i=1:17
       
       
       
        sumRT(i,j) = percjointGlobal(1,1,i,j)+ percjointGlobal(2,1,i,j)+ percjointGlobal(3,1,i,j)+ percjointGlobal(1,2,i,j) +percjointGlobal(2,2,i,j)+ percjointGlobal(3,2,i,j)+ percjointLocal(1,1,i,j) + percjointLocal(2,1,i,j)+  percjointLocal(3,1,i,j)+  percjointLocal(1,2,i,j)+ percjointLocal(2,2,i,j)+ percjointLocal(3,2,i,j)+ 4; 
         dp = {j i percjointGlobal(1,1,i,j) percjointGlobal(2,1,i,j) percjointGlobal(3,1,i,j) percjointGlobal(1,2,i,j) percjointGlobal(2,2,i,j) percjointGlobal(3,2,i,j) percjointLocal(1,1,i,j)  percjointLocal(2,1,i,j)  percjointLocal(3,1,i,j)  percjointLocal(1,2,i,j) percjointLocal(2,2,i,j) percjointLocal(3,2,i,j) sumRT(i,j)};       
      if (ang<=8)
            d =  {j i GlobalComp(1,1,i,j) GlobalComp(2,1,i,j) GlobalComp(3,1,i,j) GlobalComp(1,2,i,j) GlobalComp(2,2,i,j) GlobalComp(3,2,i,j) LocalComp(1,1,i,j)  LocalComp(2,1,i,j)  LocalComp(3,1,i,j)  LocalComp(1,2,i,j) LocalComp(2,2,i,j) LocalComp(3,2,i,j)  AngleComp(ang,j)};
            GlobalAnglePerce(j)=percjointAngle(1,j)+percjointAngle(2,j)+percjointAngle(3,j)+percjointAngle(4,j)+percjointAngle(5,j)+percjointAngle(6,j)+percjointAngle(7,j)+percjointAngle(8,j);
            
           
  
            
            
            ang=ang+1;        
      else
         
        d =  {j i GlobalComp(1,1,i,j) GlobalComp(2,1,i,j) GlobalComp(3,1,i,j) GlobalComp(1,2,i,j) GlobalComp(2,2,i,j) GlobalComp(3,2,i,j) LocalComp(1,1,i,j)  LocalComp(2,1,i,j)  LocalComp(3,1,i,j)  LocalComp(1,2,i,j) LocalComp(2,2,i,j) LocalComp(3,2,i,j)  'NaN'};
        
     
       end
         set(tab3, 'data',[old_data;d]);
         set(tabp, 'data',[old_datap;dp]);     
         old_data=get(tab3,'data');
         old_datap=get(tabp,'data');
   end
   
        
  end

   old_datag=[];
  
   sumAllJoints=zeros(nframes);
  
   for j=1:nframes
       
    s=0;
    
     for i=1:17
         
       s=s+sumRT(i,j);
      
     end
     
       sumAllJoints(j)=(s*100)/1700;
       
       
                GlobalFrameRate(j)=(sumAllJoints(j)+ GlobalAnglePerce(j))*100/200;
     
                if GlobalAnglePerce(j) <= 50
           
                GlobalFrameRate(j)=0;   
               
                end
       
       %{
              if GlobalFrameRate(j)<50;
                GlobalFrameRate(j)=0;
                
            end
               if GlobalFrameRate(j)<60;
                GlobalFrameRate(j)=GlobalFrameRate(j)/3;
                
               end
              if GlobalFrameRate(j)<70;
                GlobalFrameRate(j)=GlobalFrameRate(j)/2;
                
             end
       %}
       
  
       d =  {j sumAllJoints(j) GlobalAnglePerce(j) GlobalFrameRate(j)};
       set(tabg, 'data',[old_datag;d]);
       old_datag=get(tabg,'data');
   end
  
   
   fin=0;
   
    for j=1:nframes
        
       fin=fin+GlobalFrameRate(j) ;
       
       
    end
   
   FinalDecesion = (fin *100)/(nframes*100) ;

end


