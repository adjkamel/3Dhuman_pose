


  

%s=pwd;

%PocessVideoFrames('data\train','train.avi','rgb')%train
%PocessVideoFrames('data\val','val.avi','rgb')%validate


%PocessVideoFrames('data\test','test.avi','rgb')

%cnn();% batch epoch
%optitrack();

%clear;


%[Skeleton1 GR1 GT1 GMT1 LMT1 Global1 Local1 angle1 nframes]=RotationTranslationAngles('data\test');
%[Skeleton2 GR2 GT2 GMT2 LMT2 Global2 Local2 angle2 nframes]=RotationTranslationAngles('data\test1');
%[GlobalComp LocalComp AngleComp]=Comparison(Skeleton1 ,GR1 ,GT1 ,GMT1 ,LMT1 ,Global1 ,Local1 ,angle1,Skeleton2 ,GR2 ,GT2 ,GMT2 ,LMT2 ,Global2 ,Local2 ,angle2,nframes);
%final=Decision(GlobalComp,LocalComp,AngleComp,nframes,'man');

%pause;

%end;

%res= test('net-epoch-250',15);
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% final 

%input from camera
% background substraction
% output  and draw skeleton frame by frame


