function h = Ostu_Thresholding(im)

  [T,SM] = graythresh(im)
  h = im2bw (im, T) ;

end
