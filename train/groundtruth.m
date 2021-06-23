function varargout = groundtruth(varargin)
%      GROUNDTRUTH MATLAB code for groundtruth.fig
%      GROUNDTRUTH, by itself, creates a new GROUNDTRUTH or raises the existing
%      singleton*.
%
%      H = GROUNDTRUTH returns the handle to a new GROUNDTRUTH or the handle to
%      the existing singleton*.
%
%      GROUNDTRUTH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GROUNDTRUTH.M with the given input arguments.
%
%      GROUNDTRUTH('Property','Value',...) creates a new GROUNDTRUTH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before groundtruth_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to groundtruth_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
%      See also: GUIDE, GUIDATA, GUIHANDLES

%      Edit the above text to modify the response to help groundtruth

%      Last Modified by GUIDE v2.5 09-Sep-2016 08:37:54

%      Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @groundtruth_OpeningFcn, ...
                   'gui_OutputFcn',  @groundtruth_OutputFcn, ...
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


% --- Executes just before groundtruth is made visible.
function groundtruth_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to groundtruth (see VARARGIN)

% Choose default command line output for groundtruth
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes groundtruth wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = groundtruth_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

allItems = get(handles.popupmenu2,'string');
selectedIndex = get(handles.popupmenu2,'Value');
selectedItem = allItems{selectedIndex};

switch selectedItem
    
   case 'Training'
   optitrack('data\train',handles.axes1,handles.axes8);
  
   case 'Validation'
   optitrack('data\val',handles.axes1,handles.axes8);

    case 'User'
   optitrack('data\test',handles.axes1,handles.axes8);

   
   case 'Movement1'
   optitrack('data\test1',handles.axes1,handles.axes8);
  
   case 'Movement2'
   optitrack('data\test2',handles.axes1,handles.axes8);
  
   case 'Movement3'
   optitrack('data\test3',handles.axes1,handles.axes8);
  
   case 'Movement4'
   optitrack('data\test4',handles.axes1,handles.axes8);  
 
   case 'Movement5'    
   optitrack('data\test5',handles.axes1,handles.axes8);
   
     otherwise h = msgbox('File Not Found');

end



% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)


% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
global Globalu ;
global Localu ; 
global angleu;
global Globalt;
global Localt; 
global anglet;
global nframest;

 optitrack('data\test',handles.axes2,handles.axes8) 
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)







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
