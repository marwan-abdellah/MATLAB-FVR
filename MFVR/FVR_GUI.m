function varargout = FVR_GUI(varargin)
% FVR_GUI MATLAB code for FVR_GUI.fig
%      FVR_GUI, by itself, creates a new FVR_GUI or raises the existing
%      singleton*.
%
%      H = FVR_GUI returns the handle to a new FVR_GUI or the handle to
%      the existing singleton*.
%
%      FVR_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FVR_GUI.M with the given input arguments.
%
%      FVR_GUI('Property','Value',...) creates a new FVR_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FVR_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FVR_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FVR_GUI

% Last Modified by GUIDE v2.5 14-Jun-2014 02:22:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FVR_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @FVR_GUI_OutputFcn, ...
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


% --- Executes just before FVR_GUI is made visible.
function FVR_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FVR_GUI (see VARARGIN)

% Choose default command line output for FVR_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FVR_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = FVR_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on slider movement.
function xSlider_Callback(hObject, eventdata, handles)
% hObject    handle to xSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% Declare global variables 
global N;
global realVolume;
global imagVolume;
global image;
global scaleFactor;

fprintf('X-axis rotation %f degree \n',  get(hObject,'Value'));
rotAngle = get(hObject,'Value');
image = FVR_RenderingLoop(realVolume, imagVolume, N, 'X', rotAngle);
image = image * scaleFactor;
imshow(image, 'parent', handles.projectionDisplayWidget)

% --- Executes during object creation, after setting all properties.
function xSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function ySlider_Callback(hObject, eventdata, handles)
% hObject    handle to ySlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% Declare global variables 
global N;
global realVolume;
global imagVolume;
global image;
global scaleFactor; 

fprintf('Y-axis rotation %f degree \n',  get(hObject,'Value'));
rotAngle = get(hObject,'Value');
image = FVR_RenderingLoop(realVolume, imagVolume, N, 'Y', rotAngle);
image = image * scaleFactor;
imshow(image, 'parent', handles.projectionDisplayWidget)

% --- Executes during object creation, after setting all properties.
function ySlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ySlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function zSlider_Callback(hObject, eventdata, handles)
% hObject    handle to zSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% Declare global variables 
global N;
global realVolume;
global imagVolume;
global image;
global scaleFactor;

fprintf('Z-axis rotation %f degree \n',  get(hObject,'Value'));
rotAngle = get(hObject,'Value');
image = FVR_RenderingLoop(realVolume, imagVolume, N, 'Z', rotAngle);
image = image * scaleFactor;
imshow(image, 'parent', handles.projectionDisplayWidget)

% --- Executes during object creation, after setting all properties.
function zSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function dataPathTextBox_Callback(hObject, eventdata, handles)
% hObject    handle to dataPathTextBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of dataPathTextBox as text
% str2double(get(hObject,'String')) returns contents of dataPathTextBox as a double


% Declare global variables 
global dataPath;

dataPath = get(hObject,'String');

% --- Executes during object creation, after setting all properties.
function dataPathTextBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dataPathTextBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in loadVolumeButton.
function loadVolumeButton_Callback(hObject, eventdata, handles)
% hObject    handle to loadVolumeButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global N;
global dataPath;
global spectrum;
global realVolume;
global imagVolume;
global image;
global scaleFactor;

scaleFactor = 1e-4;
fprintf('The volume is being loaded from %s \n', dataPath);
[spectrum, realVolume, imagVolume, N] = FVR_PrepareSpectrum(dataPath);
image = FVR_RenderingLoop(realVolume, imagVolume, N, 'X', 0);
image = image * scaleFactor;
imshow(image, 'parent', handles.projectionDisplayWidget)


% --- Executes on key press with focus on loadVolumeButton and none of its controls.
function loadVolumeButton_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to loadVolumeButton (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function projectionDisplayWidget_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to projectionDisplayWidget (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in fileLoader.
function fileLoader_Callback(hObject, eventdata, handles)
% hObject    handle to fileLoader (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global N;
global dataPath;
global realVolume;
global imagVolume;
global scaleFactor;
global spectrum;

scaleFactor = 1e-4;

% Open UI and get the dataPath from it, and the file name with extension.
[fileNameWithExtension, dataPath] = uigetfile;

% Remove the extension from the fileNameWithExtension variable. 
%volumePrefix =  strrep(fileNameWithExtension, '.hdr', '');
%dataPath = strcat(dataPath, volumePrefix);
%fprintf('The data will be loaded from %s \n', dataPath);

% Load the data and prepare the spectrum fro slicing
[spectrum, realVolume, imagVolume, N] = FVR_PrepareSpectrum('Z:/Datasets/H2ATOM/H2ATOM');
image = FVR_RenderingLoop(realVolume, imagVolume, N, 'X', 0);
image = image * scaleFactor;
image = imcomplement(image);
imshow(image, 'parent', handles.projectionDisplayWidget)


% --- Executes during object creation, after setting all properties.
function valuesTable_CreateFcn(hObject, eventdata, handles)
% hObject    handle to valuesTable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object deletion, before destroying properties.
function valuesTable_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to valuesTable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in invertColor.
function invertColor_Callback(hObject, eventdata, handles)
% hObject    handle to invertColor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of invertColor
