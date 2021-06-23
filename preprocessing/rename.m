
a ='F:\3.6\code\all\train\WalkingPP - Copy';

fileNames =dir( fullfile(a, '*.png') );


N=natsortfiles({fileNames.name});




%{
for iFile = 1 : numel( A )
    
  fileNames{iFile}
    
  newName = fullfile(a, sprintf( '%2d.png', iFile ) );
  
  movefile( fullfile(a, fileNames{iFile}), newName ); 
  
  
end
%}

  ind=69397;
  
for iFile = 1 : numel( N )
    
  %N{iFile}
  
  newName = fullfile(a, sprintf( '%2d.png', ind ) );
  
  movefile( fullfile(a, N{iFile}), newName ); 
  iFile
  ind
  ind=ind+1;
  
end

