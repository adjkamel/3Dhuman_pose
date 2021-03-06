function varargout = training(varargin)

global Globalu ;
global Localu ; 
global angleu;
global Globalt;
global Localt; 
global anglet;
global nframest;
global Epoc;
global nFTrain;
global JntRslt;


% TRAINING MATLAB code for training.fig
%      TRAINING, by itself, creates a new TRAINING or raises the existing
%      singleton*.
%
%      H = TRAINING returns the handle to a new TRAINING or the handle to
%      the existing singleton*.
%
%      TRAINING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRAINING.M with the given input arguments.
%
%      TRAINING('Property','Value',...) creates a new TRAINING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before training_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to training_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help training

% Last Modified by GUIDE v2.5 24-Aug-2017 10:15:03

% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @training_OpeningFcn, ...
                   'gui_OutputFcn',  @training_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before training is made visible.
function training_OpeningFcn(hObject, eventdata, handles, varargin)

set(handles.figure1, 'Name', 'Training');
 tested=0;
 save('tested.mat','tested');
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to training (see VARARGIN)

% Choose default command line output for training
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes training wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = training_OutputFcn(hObject, eventdata, handles) 

% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)

% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)

% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)




% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)

 


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)

global Globalu ;
global Localu ; 
global angleu;
global Globalt;
global Localt; 
global anglet;
global nframest;
global Epoc;
global nFTrain;
global JntRslt;
 tab3=handles.uitable8;
 
[GlobalComp LocalComp AngleComp] =Comparison(Globalu ,Localu ,angleu,Globalt ,Localt ,anglet,nframest,tab3);



% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)

  
 
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)

preview;
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
global Globalu ;
global Localu ; 
global angleu;
global Globalt;
global Localt; 
global anglet;
global nframest;
global Epoc;
global nFTrain;
global JntRslt;


set(handles.edit4, 'String',  '');

sec =get(handles.popupmenu6,'String') ;
valu =get(handles.popupmenu6,'value') ;


bac= getdepthback;      %%%%%%% back

set(handles.edit4, 'ForegroundColor','red');
set(handles.edit4, 'FontSize',14);
%imshow(bac);

   disp(nFTrain);
for i = str2double(sec(valu)) :-1: 0
    
   set(handles.edit4, 'String',  int2str(i));

     pause(1);
   
    
end


 
set(handles.edit4, 'ForegroundColor','red');
set(handles.edit4, 'FontSize',14);
set(handles.edit4, 'String',  'Rec...');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

imaqreset;
imaqhwinfo;
vid2 = videoinput('kinect',2);

vid2.FramesPerTrigger = 1;
vid2.TriggerRepeat = nFTrain;
triggerconfig(vid2,'manual');
start(vid2);

  s=pwd;
for i = 1:nFTrain

    trigger(vid2);
    
    [imgDepth] = getdata(vid2);
  
    fram=Pocess(bac,imgDepth);
    
   % se = strel('disk',3);
    
   % bac = imerode(bac,se);
    
  %  se = strel('disk',3);
    
   % imgDepth = imerode(imgDepth,se);
    
    %fram=bac-imgDepth;
    
    
  %  se = strel('disk',3);
    
  %  fram = imerode(fram,se);
    
%originalMinValue = double(min(min(fram)));  
%originalMaxValue = double(max(max(fram)));
%originalRange = originalMaxValue - originalMinValue;
   
%desiredMin = 0;
%desiredMax = 1;
%desiredRange = desiredMax - desiredMin;
%fram = desiredRange * (double(fram) - originalMinValue) /originalRange + desiredMin;
    
      %fram=fram.*1/double(max(max(fram))) ;
    
       
    %image_size = [112 112];
  
    
   % fram=imresize(fram, image_size);
    
    
    opBaseFileName = sprintf('%d.png', i);
   
    opFullFileName = fullfile('data\test', opBaseFileName);
   
    imwrite(fram, opFullFileName, 'png');   
    
    %saving as 'png' file
    % figure(1);
    % imshow(imgDepth);
    
end

stop(vid2);


 
set(handles.edit4, 'ForegroundColor','red');
set(handles.edit4, 'FontSize',20);
set(handles.edit4, 'String',  '');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







tab=handles.uitable10;

   
 [Globalu ,Localu ,angleu, nframesu]=testshow(strcat('net-epoch-',num2str(Epoc)),15,'data\test',handles.axes53,handles.axes54,tab);
 set(handles.edit4, 'String',  '');
 
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
global Globalu ;
global Localu ; 
global angleu;
global Globalt;
global Localt; 
global anglet;
global nframest;
global Epoc;
global nFTrain;
global JntRslt;


 tab3=handles.uitable11;
 tabp=handles.uitable12;
 tabg=handles.uitable14;
 
[GlobalComp LocalComp AngleComp FinalDecesion] =Comparison(Globalu ,Localu ,angleu,Globalt ,Localt ,anglet,nframest,tab3,tabp,tabg);
 
save('final.mat','FinalDecesion');

set(handles.edit1,'string',num2str(FinalDecesion));

if (FinalDecesion>=50)
    
       set(handles.edit2,'string', 'Good Performance');

else
 
       set(handles.edit2,'string','Bad Performance');
    
end
JntRslt = zeros(1,17);

retreivedata = get(handles.uitable12,'data');


 %h = findall(0,'Tag','traineval');
 %testdata = guidata(h);
 for i = 1:17
     sum=0;
     k=1;
   for j = i: nFTrain 
    
   sum = sum + retreivedata{k,15}(1);
      k=k+17;
   end
   JntRslt(i) = sum/nFTrain;
 end
tested=1;
 save('tested.mat','tested');
 save('JntRslt.mat','JntRslt')
% set(testdata.edit+int2str(i),'string',  int2str(av));

% h = findobj('Tag','traineval');

  %  testdata = guidata(h);
  
 %set(testdata.edit1,'String'));
  

 

% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)

global Globalu ;
global Localu ; 
global angleu;
global Globalt;
global Localt; 
global anglet;
global nframest;
global Epoc;
global nFTrain;
global JntRslt;

tab=handles.uitable9;

 switch get(handles.popupmenu3,'Value')   
  case 1
      
    fold='data\test1';
    d = dir('data\test1\*.png');
    nFTrain = length(d);
 
  case 2
   fold='data\test2';   
   d = dir('data\test2\*.png');
    nFTrain = length(d);
  case 3
    fold='data\test3';  
    d = dir('data\test3\*.png');
    nFTrain = length(d);
  case 4
    fold='data\test4'; 
    d = dir('data\test4\*.png');
    nFTrain = length(d);
  case 5  
   fold='data\test5';
   d = dir('data\test5\*.png');
    nFTrain = length(d);
  otherwise h = msgbox('File Not Found');
 end 

 
 [Globalt ,Localt ,anglet, nframest]=testshow(strcat('net-epoch-',num2str(Epoc)),15,fold,handles.axes48,handles.axes54,tab);
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
groundtruth;
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)

allItems = get(handles.popupmenu4,'string');
selectedIndex = get(handles.popupmenu4,'Value');
selectedItem = allItems{selectedIndex};

switch selectedItem
    
   case 'Training'
  Pocess('data\train','v.avi');
  
   case 'Validation'
   Pocess('data\val','v.avi');

    case 'User'
   Pocess('data\test','v.avi');
   
   case 'Movement1'
   Pocess('data\test1','v.avi');
  
   case 'Movement2'
   Pocess('data\test2','v.avi');
  
   case 'Movement3'
   Pocess('data\test3','v.avi');
  
   case 'Movement4'
   Pocess('data\test4','v.avi');  
 
   case 'Movement5'    
   Pocess('data\test5','v.avi');
   
     otherwise h = msgbox('File Not Found');

end

h = msgbox('Done!');% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)

switch get(handles.popupmenu3,'Value')   
  case 1
   implay('data\test1\v.avi');
  case 2
  implay('data\test2\v.avi');
  case 3
 implay('data\test3\v.avi');
  case 4
   implay('data\test4\v.avi');
  
  otherwise h = msgbox('File Not Found');
end 
 
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton27.
function pushbutton27_Callback(hObject, eventdata, handles)
cnn();
% hObject    handle to pushbutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5


% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton29.
function pushbutton29_Callback(hObject, eventdata, handles)

global Globalu ;
global Localu ; 
global angleu;
global Globalt;
global Localt; 
global anglet;
global nframest;
global Epoc;
global nFTrain;
global JntRslt;


Epoc =get(handles.popupmenu5,'Value') ;

 h = msgbox('Epoch Selected');


% hObject    handle to pushbutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu6.
function popupmenu6_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu6


% --- Executes during object creation, after setting all properties.
function popupmenu6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object deletion, before destroying properties.
function edit4_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton30.
function pushbutton30_Callback(hObject, eventdata, handles)
global Globalu ;
global Localu ; 
global angleu;
global Globalt;
global Localt; 
global anglet;
global nframest;
global Epoc;
global nFTrain;
global JntRslt;
 %tab=handles.uitable10;
 [Globalu ,Localu ,angleu, nframesu]=testshow(strcat('net-epoch-',num2str(Epoc)),15,'data\test',handles.axes48,handles.axes54);
 set(handles.edit4, 'String',  '');
 
% hObject    handle to pushbutton30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton31.
function pushbutton31_Callback(hObject, eventdata, handles)
help;
% hObject    handle to pushbutton31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when entered data in editable cell(s) in uitable12.
function uitable12_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable12 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
