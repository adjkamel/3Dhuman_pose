function readcamera(devicenum)
 
for i = 1:10
       
  vid = videoinput('winvideo', devicenum);
  set(vid, 'ReturnedColorSpace', 'gray');
  img = getsnapshot(vid);
  imshow(img)
end  
end