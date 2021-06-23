

function fr = getdepthback


%{

imaqreset;

% Check if Kinect is connected
imaqhwinfo


vid = videoinput('kinect',1);
vid2 = videoinput('kinect',2);

srcDepth = getselectedsource(vid2);

vid.FramesPerTrigger = 1;
vid2.FramesPerTrigger = 1;

vid.TriggerRepeat = 200;
vid2.TriggerRepeat = 200;

triggerconfig([vid vid2],'manual');

start([vid vid2]);

% Trigger 200 times to get the frames.
for i = 1:200
    % Trigger both objects.
    trigger([vid vid2])
    % Get the acquired frames and metadata.
    [imgColor, ts_color, metaData_Color] = getdata(vid);
 
    [imgDepth, ts_depth, metaData_Depth] = getdata(vid2);
    
end

%}


    imaqreset;

    imaqhwinfo

    vid2 = videoinput('kinect',2);

    srcDepth = getselectedsource(vid2);

    vid2.FramesPerTrigger = 1;

    vid2.TriggerRepeat = 1;

    triggerconfig(vid2,'manual');

    start(vid2);

  



    trigger(vid2)
  


    [fr] = getdata(vid2);
    
   
    

  
    
    
    stop(vid2);





