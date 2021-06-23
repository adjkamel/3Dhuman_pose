
folder='train\Discussion';
actName='Discussion';

list=[1,5,6,7,8];
%list=[9,11]; 



counterPose=1;
counterImg=1;





sizepose=0;

for LSub= list
       
            FileNamesPose =dir( fullfile(strcat('F:\3.6\code\all\S',num2str(LSub),'\MyPoseFeatures\D3_Positions_mono\'),'*.cdf') );
            NNP={FileNamesPose.name};
          
            for fni=1: numel(NNP)      
                       if strfind(NNP{fni}, actName)
                           %NNP{fni}
                           stpo= strcat('F:\3.6\code\all\S',num2str(LSub),'\MyPoseFeatures\D3_Positions_mono\',NNP{fni});
                           tmppp = cdfread(stpo);
                           %size(tmppp{1},1)
                           sizepose=sizepose+size(tmppp{1},1);       
                       end    
            end




end

tab3=zeros(sizepose,51);
size(tab3)







for LSub= list
    
            listActionsDepth={};
            listActionsPose={};
            
            FileNamesPose =dir( fullfile(strcat('F:\3.6\code\all\S',num2str(LSub),'\MyPoseFeatures\D3_Positions_mono\'),'*.cdf') );
            NNP={FileNamesPose.name};
           
            FileNamesDepth =dir( fullfile(strcat('F:\3.6\code\all\S',num2str(LSub),'\MySegmentsMat\depth_pure\'),'*.mat') );
            NND={FileNamesDepth.name};
          
          
            for fni=1: numel(NNP)      
                       if strfind(NNP{fni}, actName)
                           
                         listActionsPose=  [listActionsPose , NNP{fni}];     
                         listActionsDepth= [listActionsDepth , NND{fni}];
                         
                       end    
            end
          
   
        
                        listActionsPose
                        listActionsDepth

           for LFile= listActionsDepth  
                  
                        st= strcat('F:\3.6\code\all\S',num2str(LSub),'\MySegmentsMat\depth_pure\',LFile);
                        load(st{1});

                        for j = 1:length(Feat)

                                I=mat2gray(Feat{j});
                                opBaseFileName = sprintf('%d.png', counterImg);
                                currentimage=I;
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

                                if padx<0
                                     padx=0; 
                                end

                                if pady<0
                                     pady=0;
                                end

                                currentimage=padarray(currentimage,[padx pady]);
                                currentimage = imadjust(currentimage,[0.2 0.9],[]);

                                opFullFileName = fullfile('F:\3.6\code\POSE_36\',folder, opBaseFileName);
                                imwrite(currentimage,opFullFileName,'png');

                                counterImg=counterImg+1;


                        end  % end depth image process
                        
                        
                        disp('------------ end file depth')
                        disp(LSub)
                        disp(LFile{1})

                        [path,name,ext] = fileparts(LFile{1});
                        
                        stp= strcat('F:\3.6\code\all\S',num2str(LSub),'\MyPoseFeatures\D3_Positions_mono\',name,'.cdf');
                        tmp = cdfread(stp);
                        
                        tab=tmp{1,1};
                        
                        tab2=zeros(length(tmp),51);

                        for i = 1:size(tab,1)


                              %  cla reset; 
                              %  hold on;
                              %  view(3);
                              %  [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17]

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

                        end  % end pose process



                        for i = 1:size(tab2,1)

                               % cla reset; 
                               % hold on;
                               % view(3);

                               k=1;

                               for n1 = [1 5 6 7 2 3 4 8 12 13 14 15 16 17 9 10 11]

                                    %plot3(tab2(i,n1*3-2),tab2(i,n1*3-1),tab2(i,n1*3),'.','markersize',40);

                                    tab3(counterPose,k)= tab2(i,n1*3-2);
                                    tab3(counterPose,k+1)= tab2(i,n1*3-1);
                                    tab3(counterPose,k+2)= tab2(i,n1*3);
                                    k=k+3;

                               end  

                               counterPose=counterPose+1;

                               % view(10,10)
                               % axis equal on
                               % drawnow
                               % rotate3d on
                               % grid on

                        end % end pose normalise

            
           end   % end Lfile
           
            disp('------------ end file Pose')
            disp(LSub)
            disp(LFile{1})

end  % end LSub




