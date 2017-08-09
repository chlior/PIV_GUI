function varargout = piv_gui00(varargin)
% PIV_GUI00 MATLAB code for piv_gui00.fig
%      PIV_GUI00, by itself, creates a new PIV_GUI00 or raises the existing
%      singleton*.
%
%      H = PIV_GUI00 returns the handle to a new PIV_GUI00 or the handle to
%      the existing singleton*.
%
%      PIV_GUI00('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PIV_GUI00.M with the given input arguments.
%
%      PIV_GUI00('Property','Value',...) creates a new PIV_GUI00 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before piv_gui00_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to piv_gui00_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

addpath('../functions')
% % also make sure we use the same Matpiv: if necessary remove matpiv from
% % the path and then add it again which matpiv
% addpath('../MatPIV/src/')
% 
% % add path to the set of general Matlab files that do not change i.e.
% % functions that used by all scripts
% addpath('../Matlab')

% Edit the above text to modify the response to help piv_gui00

% Last Modified by GUIDE v2.5 03-Aug-2017 23:54:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @piv_gui00_OpeningFcn, ...
                   'gui_OutputFcn',  @piv_gui00_OutputFcn, ...
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


% --- Executes just before piv_gui00 is made visible.
function piv_gui00_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to piv_gui00 (see VARARGIN)

% Choose default command line output for piv_gui00
handles.output = hObject;
set(handles.text15,'String','Please Load file...');drawnow;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes piv_gui00 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = piv_gui00_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in PB_Load_video.
function PB_Load_video_Callback(hObject, eventdata, handles)
% hObject    handle to PB_Load_video (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.video=uigetfile('*.avi','Select video to analyse');
% info = mmfileinfo(video);
% info.Video
if handles.video==0
uiwait(msgbox('Load video first!'));
return
end

handles.vidObj = VideoReader(handles.video);
display=VideoReader(handles.video);
imshow(readFrame(display))


set(handles.text_video,'BackgroundColor','green');
set(handles.text_images,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.text15,'String','Video Loaded');drawnow;
handles.isvideo=1;
guidata(hObject,handles)




function edit_Winsize_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Winsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hints: get(hObject,'String') returns contents of edit_Winsize as text
%        str2double(get(hObject,'String')) returns contents of edit_Winsize as a double


% --- Executes during object creation, after setting all properties.
function edit_Winsize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Winsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_deltaT_Callback(hObject, eventdata, handles)
% hObject    handle to edit_deltaT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_deltaT as text
%        str2double(get(hObject,'String')) returns contents of edit_deltaT as a double


% --- Executes during object creation, after setting all properties.
function edit_deltaT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_deltaT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_overlap_Callback(hObject, eventdata, handles)
% hObject    handle to edit_overlap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_overlap as text
%        str2double(get(hObject,'String')) returns contents of edit_overlap as a double


% --- Executes during object creation, after setting all properties.
function edit_overlap_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_overlap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_method.
function popupmenu_method_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_method contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_method


% --- Executes during object creation, after setting all properties.
function popupmenu_method_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PB_Load_Create_Mask.
function PB_Load_Create_Mask_Callback(hObject, eventdata, handles)
% hObject    handle to PB_Load_Create_Mask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Construct a questdlg with three options
choice = questdlg('Do you already have a Maskfile?', ...
	'Maskfile','Yes','No','What is Maskfile','Yes');
% Handle response
switch choice
    case 'Yes'
        handles.maskfile = uigetfile('Select mask.mat')         
        if ischar(handles.maskfile)     %two type of mask exist
            mss = load(handles.maskfile)
            maske = mss.maske
            1
        elseif isstruct(handles.maskfile) 
            maske = handles.maskfile;
            2 
        end    
        set(handles.text15,'String','Maskfile is loaded');drawnow;
    case 'No'
        choice1 = questdlg('create one','choos your answer','yes','no','no');
        switch choice1
            case 'yes'
               str1 = 'Mark your polygon points with the left mouse button.';
               str2 = 'Double press the middle button when you are finished.';
               str3 = 'Press <BACKSPACE> or <DELETE> to remove the previously selected vertex.';
               str = strcat(str1,str2,str3);
               uiwait(msgbox(str))
               handles.maskfile = maskGui2(hObject, eventdata, handles)
%              handles.maskfile=maskGui(handles.image{1},'worldco.mat')
               set(handles.text15,'String','Maskfile is ready');drawnow;
            case 'no'
               handles.maskfile=[]; 
               set(handles.text15,'String','Empty mask');
        end
    case 'What is Maskfile'
        uiwait(msgbox('Maskfile is...'))       
end
guidata(hObject,handles)

% --- Executes on button press in maskGui.
function [maske]=maskGui2(hObject, eventdata, handles)  %,x,y,u,v
% hObject    handle to PB_Load_Create_Mask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% based on mask()
if isfield(handles,'image')==0
uiwait(msgbox('Load pair of images first!'));
return
end

ima=handles.image{1};

if ischar(ima)
  [A,p1]=imread(ima);
  if isrgb(A), A=rgb2gray(A); end
  if ~isempty(p1), A=ind2gray(A,p1); end
  
  if nargin==1
      wocofile='';
  end
else
    A=ima;
end
  inp=1;
  tel=1;
  while inp~=0,      
 
      [maske(tel).msk,maske(tel).idx,maske(tel).idy]=roipoly(A);  

      hold on
      %in=inpolygon(A,double(idx),double(idy));
      [py,px]=find(maske(tel).msk==1);
      h1=plot(px(1:4:end),py(1:4:end),'.r');
      
      choice = questdlg('Do you whish to add another field to mask?', ...
	'More polygons','Yes','No', 'Yes');
        % Handle response
        switch choice
            case 'Yes'
               inp=1; 
            case 'No'
               inp=0; 
        end

%       inp=input('Do you whish to add another field to mask? (1 = yes, 0 = no) >> ');
      tel=tel+1;
  end
imshow(A), hold on  % clf, 31.7.2017 

  for i=1:length(maske)
      [py,px]=find(maske(i).msk==1);
      h1=plot(px(1:6:end),py(1:6:end),'.r');
  end
  
[filename, pathname] = uiputfile( 'polymask.mat',  'Save Maskfile name');
 if filename==0; filename='empty'; end
  
fullname = fullfile(pathname,filename);

[maske(:).idxw] = maske.idx;
[maske(:).idyw] = maske.idy;
   save(fullname, 'maske')
% save polymask.mat maske

  



% --- Executes on button press in PB_run_check.
function PB_run_check_Callback(hObject, eventdata, handles)
% hObject    handle to PB_run_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hold off
set(handles.text15,'String','Wait: Loading parameters');drawnow;
sizeFactor = str2num(get(handles.edit_sizeFactor1,'string'))
wins = str2num(get(handles.edit_Winsize,'string'))
deltaT = str2num(get(handles.edit_deltaT,'string'))
overlap = str2num(get(handles.edit_overlap,'string'))
val = get(handles.popupmenu_method, 'string'); % Determine the selected data set.
str = get(handles.popupmenu_method, 'Value');
switch str;
    case 1
    method = val(str) 
    case 2
    method = val(str) 
    case 3
    method = val(str)
    case 4
    method = val(str)
end

if isfield(handles,'maskfile')==0
handles.maskfile=[];
end
maskfile = handles.maskfile;

piv = struct('sizeFactor',sizeFactor,'wins',wins,'deltaT',deltaT,'overlap',overlap,'method',method,'woco',[],'maskfile',maskfile);

% IMAGE
if handles.isvideo==0 

if isfield(handles,'image')==0
uiwait(msgbox('Load pair of images first!'));
return
end

if isfield(handles,'maskfile')==0
handles.maskfile=[];
end

set(handles.text15,'String','Wait: Correlation');drawnow;

[x,y,u,v,snr,pkh] = matpiv(handles.image{1},handles.image{2},transpose(wins),deltaT,overlap,method,[],handles.maskfile);
 imshow(handles.image{1});   hold on;
 handles.fig=quiver(x,y,u,v,sizeFactor);
 xlabel('pixel');
 ylabel('pixel');
 axis on
 zoom on
 
handles.x = x; handles.y = y; handles.u = u; handles.v = v; handles.snr = snr; handles.pkh = pkh;
handles.xS = x; handles.yS = y; handles.uS = u; handles.vS = v; handles.snrS = snr; handles.pkhS = pkh; % S for Save
guidata(hObject, handles) 
set(handles.text15,'String','Finished');

%  VIDEO
elseif handles.isvideo==1

folder = 'C:\Users\Lior\Documents';
    
video = handles.video;
fps = str2num(get(handles.edit_frameRate,'string'))
stime = str2num(get(handles.edit_strartTime,'string'))+1
etime = str2num(get(handles.edit_endTime,'string'))    
playback = struct('fps',fps,'stime',stime,'etime',etime)

set(handles.text15,'String','Wait: Correlate frame by frame');drawnow;
[m] = video_rawData(video, piv, playback, folder, handles)    
handles.m = m;
set(handles.text15,'String','Finished');
guidata(hObject, handles) 
end   

  




% --- Executes on button press in PB_Load_pair.
function PB_Load_pair_Callback(hObject, eventdata, handles)
% hObject    handle to PB_Load_pair (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname, filterindex] = uigetfile( ...
 {'*.jpg;*.bmp','Use Shift key'} ,'Pick two images, use shift button','Pick pair of images', 'MultiSelect', 'on');
%Tip imcontrast()
imagefile = fullfile(char(pathname), char(filename(1)));
im1=imread(imagefile);
if ndims(im1) == 3, im1 = rgb2gray(im1); end
handles.image{1} = im1;
imshow(im1);

imagefile = fullfile(char(pathname), char(filename(2)));
im2=imread(imagefile);
if ndims(im2) == 3, im2 = rgb2gray(im2); end
handles.image{2} = im2;
handles.isvideo=0;
guidata(hObject, handles)
set(handles.text_video,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.text_images,'BackgroundColor','green');
set(handles.text15,'String','Pair loaded');drawnow;


function edit_filterChoose_Callback(hObject, eventdata, handles)
% hObject    handle to edit_filterChoose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_filterChoose as text
%        str2double(get(hObject,'String')) returns contents of edit_filterChoose as a double


% --- Executes during object creation, after setting all properties.
function edit_filterChoose_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_filterChoose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_globalThreshold_Callback(hObject, eventdata, handles)
% hObject    handle to edit_globalThreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_globalThreshold as text
%        str2double(get(hObject,'String')) returns contents of edit_globalThreshold as a double


% --- Executes during object creation, after setting all properties.
function edit_globalThreshold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_globalThreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PB_run_postprocess.
function PB_run_postprocess_Callback(hObject, eventdata, handles)
% hObject    handle to PB_run_postprocess (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hold off
set(handles.text15,'String','Wait: Loading parameters'); drawnow;
sizeFactor = str2num(get(handles.edit_sizeFactor2,'string'))
wins = str2num(get(handles.edit_Winsize,'string'))
deltaT = str2num(get(handles.edit_deltaT,'string'))
overlap = str2num(get(handles.edit_overlap,'string'))
val = get(handles.popupmenu_method, 'string'); % Determine the selected data set.
str = get(handles.popupmenu_method, 'Value');
switch str;
    case 1
    method = val(str) 
    case 2
end

filterChoose = str2num(get(handles.edit_filterChoose,'string'))
globtrld = str2num(get(handles.edit_globalThreshold,'string'))
loctrld = str2num(get(handles.edit_localThreshold,'string'))
snrtrld = str2num(get(handles.edit_snrThreshold,'string'))

if isfield(handles,'image')==0
uiwait(msgbox('Load pair of images first!'));
return
end

if isfield(handles,'maskfile')==0
handles.maskfile=[];
end


x = handles.x; y = handles.y; u = handles.u; v = handles.v; snr = handles.snr; pkh = handles.pkh;
 
imshow(handles.image{1});   hold on; 
 set(handles.text15,'String','Wait: Filtering');drawnow;
 for choice=filterChoose    
     switch choice
        case 1
            [u,v] = globfilt(x,y,u,v,globtrld);
        case 2
            [u,v] = localfilt(x,y,u,v,loctrld,'median');
        case 3
            [u,v] = snrfilt(x,y,u,v,snr,snrtrld);
     end
 end
 
 handles.fig=quiver(x,y,u,v,sizeFactor); 
 zoom on
 handles.xS = x; handles.yS = y; handles.uS = u; handles.vS = v; handles.snrS = snr; handles.pkhS = pkh;
 set(handles.text15,'String','Finished');drawnow;
 guidata(hObject, handles)
 
function edit_localThreshold_Callback(hObject, eventdata, handles)
% hObject    handle to edit_localThreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_localThreshold as text
%        str2double(get(hObject,'String')) returns contents of edit_localThreshold as a double


% --- Executes during object creation, after setting all properties.
function edit_localThreshold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_localThreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_snrThreshold_Callback(hObject, eventdata, handles)
% hObject    handle to edit_snrThreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_snrThreshold as text
%        str2double(get(hObject,'String')) returns contents of edit_snrThreshold as a double


% --- Executes during object creation, after setting all properties.
function edit_snrThreshold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_snrThreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_channelWidth_Callback(hObject, eventdata, handles)
% hObject    handle to edit_channelWidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_channelWidth as text
%        str2double(get(hObject,'String')) returns contents of edit_channelWidth as a double


% --- Executes during object creation, after setting all properties.
function edit_channelWidth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_channelWidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_channelOrientation_Callback(hObject, eventdata, handles)
% hObject    handle to edit_channelOrientation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_channelOrientation as text
%        str2double(get(hObject,'String')) returns contents of edit_channelOrientation as a double


% --- Executes during object creation, after setting all properties.
function edit_channelOrientation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_channelOrientation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_vectorSizeRun2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_vectorSizeRun2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_vectorSizeRun2 as text
%        str2double(get(hObject,'String')) returns contents of edit_vectorSizeRun2 as a double


% --- Executes during object creation, after setting all properties.
function edit_vectorSizeRun2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_vectorSizeRun2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_vectorSizeRun1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_vectorSizeRun1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_vectorSizeRun1 as text
%        str2double(get(hObject,'String')) returns contents of edit_vectorSizeRun1 as a double


% --- Executes during object creation, after setting all properties.
function edit_vectorSizeRun1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_vectorSizeRun1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function [uavg,umaxLineAvg]=avgVelocity(hObject, eventdata, handles)
hold off
x = handles.x; y = handles.y; u = handles.u; v = handles.v;
channelWidth = str2num(get(handles.edit_channelWidth,'string'))

uTempHor = zeros(1,size(x(1,:),2));
uTempVer = zeros(size(y(:,1),1),1);
row = zeros(size(y(:,1),1),size(x(1,:),2));
colum = zeros(size(y(:,1),1),size(x(1,:),2));

val = get(handles.popupmenu_along, 'string'); % Determine the selected data set.
str = get(handles.popupmenu_along, 'Value');
switch str;
    case 1
        
    for yi=1:(size(y,1))
     for xi=1:(size(x,2))
       if isnan(u(yi,xi))==0 
        uTempHor(yi) = uTempHor(yi) + u(yi,xi);
       end
     end
     row(yi,:)= ones(1,size(x(1,:),2)).*uTempHor(yi);
    end
    uLineAvg=row./size(x,2);   
    handles.fig=plot(uLineAvg(:,1),y(:,1));  
    uavg = trapz(y(:,1),uLineAvg(:,1))/channelWidth; % u  avrage
     xlabel('Velocity average [um/sec]');
     ylabel('Position [um]');
%      str = sprintf('Avarage Velocity along x.''u'' direction , Uavg= %0.2f [um/sec]' , handles.uavg)
%      title(str); 
     umaxLineAvg= max(max(uLineAvg));
    case 2
    
     for xi=1:(size(x,1))
     for yi=1:(size(y,1))
         if isnan(u(yi,xi))==0 
          uTempVer(xi) = uTempVer(xi) +  u(yi,xi);
         end
     end
    colum(:,xi)= ones(size(y(:,1),1),1).*uTempVer(xi);
    end
    uLineAvg=colum./size(y,1);
    handles.fig = plot(x(1,:),uLineAvg(1,:));
    uavg = trapz(y(:,1),uLineAvg(:,1))/channelWidth; % u  avrage
     ylabel('Velocity average [um/sec]');
     xlabel('Position [um]');
%     title('Avarage Velocity along y. ''u'' direction');    
    umaxLineAvg= max(max(uLineAvg));
    end



function [uavg,umaxLineAvg]=avgVelocityV(hObject, eventdata, handles)
hold off
x = handles.x; y = handles.y; u = handles.u; v = handles.v;
channelWidth = str2num(get(handles.edit_channelWidth,'string'))

uTempHor = zeros(1,size(x(1,:),2));
uTempVer = zeros(size(y(:,1),1),1);
row = zeros(size(y(:,1),1),size(x(1,:),2));
colum = zeros(size(y(:,1),1),size(x(1,:),2));

val = get(handles.popupmenu_along, 'string'); % Determine the selected data set.
str = get(handles.popupmenu_along, 'Value');
switch str;
    case 1
        
    for yi=1:(size(y,1))
     for xi=1:(size(x,2))
       if isnan(v(yi,xi))==0 
        uTempHor(yi) = uTempHor(yi) + v(yi,xi);
       end
     end
     row(yi,:)= ones(1,size(x(1,:),2)).*uTempHor(yi);
    end
    uLineAvg=row./size(x,2);   
    handles.fig=plot(uLineAvg(:,1),y(:,1));  
    uavg = trapz(y(:,1),uLineAvg(:,1))/channelWidth; % u  avrage
     xlabel('Velocity average [um/sec]');
     ylabel('Position [um]');
%      str = sprintf('Avarage Velocity along x.''u'' direction , Uavg= %0.2f [um/sec]' , handles.uavg)
%      title(str); 
     umaxLineAvg= max(max(uLineAvg));
    case 2
    
     for xi=1:(size(x,1))
     for yi=1:(size(y,1))
         if isnan(v(yi,xi))==0 
          uTempVer(xi) = uTempVer(xi) +  v(yi,xi);
         end
     end
    colum(:,xi)= ones(size(y(:,1),1),1).*uTempVer(xi);
    end
    uLineAvg=colum./size(y,1);
    handles.fig = plot(x(1,:),uLineAvg(1,:));
    uavg = trapz(y(:,1),uLineAvg(:,1))/channelWidth; % u  avrage
     ylabel('Velocity average [um/sec]');
     xlabel('Position [um]');
%     title('Avarage Velocity along y. ''u'' direction');    
    umaxLineAvg= max(max(uLineAvg));
    end
% handles.uavg
% guidata(hObject, handles)


% --- Executes on button press in PB_avgVelocity.
function PB_avgVelocity_Callback(hObject, eventdata, handles)
% hObject    handle to PB_avgVelocity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if handles.isvideo==0 

if isfield(handles,'xS')==0
uiwait(msgbox('Run correlation first!'));
return
end
val = get(handles.popupmenu_component, 'string'); % Determine the selected data set.
str = get(handles.popupmenu_component, 'Value');
switch str;
    case 1
    [handles.uavg,handles.umaxLineAvg]=avgVelocity(hObject, eventdata, handles);
    case 2
    [handles.uavg,handles.umaxLineAvg]=avgVelocityV(hObject, eventdata, handles);
end

val = get(handles.popupmenu_chooseU, 'string'); % Determine the selected data set.
str = get(handles.popupmenu_chooseU, 'Value');
switch str;
    case 1
        set(handles.velocityInfo,'String',num2str(handles.uavg,'%0.2f   um/sec'));
    case 2
        set(handles.velocityInfo,'String',num2str(handles.umaxLineAvg,'%0.2f   um/sec'));
    case 3
        set(handles.velocityInfo,'String',num2str(max(max(handles.uS)),'%0.2f   um/sec'));
end
guidata(hObject,handles)

elseif handles.isvideo~=0 
    m = handles.m;
    size(m.u,3)
    for k=1:size(m.u,3)
        hold off;
        direction = 'horizontal';
        uavg(:,:,k) = avg_velocity_line(m ,direction, k); drawnow;
    end
    
     for i=1:size(uavg,3)
       middle = round(size(uavg,1)/2)
       y(i)= uavg(middle ,1,i)
%        hold on;
     end
      plot(1:size(uavg,3),y); drawnow
end

% --- Executes on selection change in popupmenu_component.
function popupmenu_component_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_component (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_component contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_component


% --- Executes during object creation, after setting all properties.
function popupmenu_component_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_component (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PB_magnitude.
function PB_magnitude_Callback(hObject, eventdata, handles)
% hObject    handle to PB_magnitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles,'xS')==0
uiwait(msgbox('Run correlation first!'));
return
end

hold off
val = get(handles.popupmenu_magnitude, 'string'); % Determine the selected data set.
str = get(handles.popupmenu_magnitude, 'Value');
switch str;
    case 1
    handles.w=magnitude(handles.xS,handles.yS,handles.uS,handles.vS);
    case 2
    handles.w=magnitude(handles.xS,handles.yS,handles.uS,handles.vS.*0);
    case 3
    handles.w=magnitude(handles.xS,handles.yS,handles.uS.*0,handles.vS);   
end

handles.w = flipud(handles.w); %Note: magnitude function mirror about horizontal axis!
handles.fig = pcolor(handles.x,handles.y,handles.w);% drawnow;%, shading flat, colorbar

  set(handles.fig,'edgecolor','none');
  colormap(jet);
  ylabel(colorbar,'Velocity magnitude [um/sec]');
  shading flat %shading interp/flat/faceted 
  %// get axes handle
  ax = gca;
  %// set labels
   set(ax,'XTickLabel');
   set(ax,'YTickLabel');
   xlabel('[um]'); ylabel('[um]');

% --- Executes on selection change in popupmenu_magnitude.
function popupmenu_magnitude_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_magnitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_magnitude contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_magnitude


% --- Executes during object creation, after setting all properties.
function popupmenu_magnitude_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_magnitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_sizeFactor1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sizeFactor1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sizeFactor1 as text
%        str2double(get(hObject,'String')) returns contents of edit_sizeFactor1 as a double


% --- Executes during object creation, after setting all properties.
function edit_sizeFactor1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sizeFactor1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_sizeFactor2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sizeFactor2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sizeFactor2 as text
%        str2double(get(hObject,'String')) returns contents of edit_sizeFactor2 as a double


% --- Executes during object creation, after setting all properties.
function edit_sizeFactor2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sizeFactor2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in PB_saveAsFig.
function PB_saveAsFig_Callback(hObject, eventdata, handles)
% hObject    handle to PB_saveAsFig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uiputfile( {'*.jpg';'*.mat';},  'Save as');

if filename==0; filename='empty'; end
dot = regexp(filename,'\.'); 
fullname = fullfile(pathname,filename);
switch(filename(dot+1:end))
 case {'jpg'}
    F = getframe(handles.axes1);
    Image = frame2im(F);
    imwrite(Image, fullname)
 case {'mat'}
   m = matfile(fullname, 'Writable', true);
   m.x = handles.xS;
   m.y = handles.yS;
   m.u = handles.uS;
   m.v = handles.vS;
   clear m
 otherwise
  uiwait(msgbox('Error: empty name, save again'));
end
        


% --- Executes on button press in PB_LoadExample.
function PB_LoadExample_Callback(hObject, eventdata, handles)
% hObject    handle to PB_LoadExample (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
im1=imread('a.jpg');
if ndims(im1) == 3, im1 = rgb2gray(im1); end
handles.image{1} = im1;
imshow(im1);

im2=imread('b.jpg');
if ndims(im2) == 3, im2 = rgb2gray(im2); end
handles.image{2} = im2;

handles.isvideo=0;
guidata(hObject, handles)
set(handles.text_video,'BackgroundColor',[0.94 0.94 0.94]);
set(handles.text_images,'BackgroundColor','green');
set(handles.text15,'String','Example loaded');drawnow;

% --- Executes on button press in PB_reset.
function PB_reset_Callback(hObject, eventdata, handles)
% hObject    handle to PB_reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
set(handles.text15,'String','');drawnow;
cla(handles.axes1,'reset');


if isfield(handles,'x')==1  handles=rmfield(handles,{'x','y','u','v'}); end
if isfield(handles,'xS')==1  handles=rmfield(handles,{'xS','yS','uS','vS'}); end
if isfield(handles,'w')==1  handles=rmfield(handles,{'w'}); end
if isfield(handles,'maskfile')==1  handles=rmfield(handles,{'maskfile'}); end
if isfield(handles,'isvideo')==1  handles=rmfield(handles,{'isvideo'}); end
if isfield(handles,'videObj')==1  handles=rmfield(handles,{'videObj'}); end
if isfield(handles,'m')==1  handles=rmfield(handles,{'m'}); end


%text
set(handles.velocityInfo,'String','');drawnow;
set(handles.flowRateUm,'String','');drawnow;
set(handles.flowRateUl,'String','');drawnow;
set(handles.text_frame,'String','');drawnow;

guidata(hObject, handles)
handles
clear all;



% --- Executes on selection change in popupmenu_along.
function popupmenu_along_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_along (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_along contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_along


% --- Executes during object creation, after setting all properties.
function popupmenu_along_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_along (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_channelHeight_Callback(hObject, eventdata, handles)
% hObject    handle to edit_channelHeight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_channelHeight as text
%        str2double(get(hObject,'String')) returns contents of edit_channelHeight as a double


% --- Executes during object creation, after setting all properties.
function edit_channelHeight_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_channelHeight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_chooseU.
function popupmenu_chooseU_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_chooseU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_chooseU contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_chooseU
update_ChooseU(handles)

% --- Executes during object creation, after setting all properties.
function popupmenu_chooseU_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_chooseU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function update_ChooseU(handles)
val = get(handles.popupmenu_chooseU, 'string'); % Determine the selected data set.
str = get(handles.popupmenu_chooseU, 'Value');
switch str;
    case 1
        set(handles.velocityInfo,'String',num2str(handles.uavg,'%0.2f   um/sec'));
    case 2
        set(handles.velocityInfo,'String',num2str(handles.umaxLineAvg,'%0.2f   um/sec'));
    case 3
        set(handles.velocityInfo,'String',num2str(max(max(handles.uS)),'%0.2f   um/sec'));
end


% --- Executes on button press in PB_calculate.
function PB_calculate_Callback(hObject, eventdata, handles)
% hObject    handle to PB_calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles,'xS')==0
uiwait(msgbox('Run correlation first!'));
return
end

[handles.uavg,handles.umaxLineAvg]=avgVelocity(hObject, eventdata, handles);

channelWidth = str2num(get(handles.edit_channelWidth,'string'))
channelHeight = str2num(get(handles.edit_channelHeight,'string'))

  Q=handles.uavg*channelWidth*channelHeight;
  set(handles.flowRateUm,'String',num2str(Q,'%0.2f  um^3/sec  '));

  Q=Q*5.999999999999989e-8; 
  set(handles.flowRateUl,'String',num2str(Q,'%0.2f ul/min'));




% --- Executes on button press in PB_Interpolate.
function PB_Interpolate_Callback(hObject, eventdata, handles)
% hObject    handle to PB_Interpolate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% hold off
sizeFactor = str2num(get(handles.edit_sizeFactor2,'string'))
set(handles.text15,'String','Wait: Interpolating');drawnow;

[handles.uS,handles.vS] = naninterp(handles.uS,handles.vS,'linear',handles.maskfile,handles.xS,handles.yS)
 set(handles.text15,'String','Finished');
 handles.fig=quiver(handles.xS,handles.yS,handles.uS,handles.vS,sizeFactor); 
 zoom on


% --- Executes on button press in PB_rotate.
function PB_rotate_Callback(hObject, eventdata, handles)
% hObject    handle to PB_rotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hold off;
handles.image{1} = transpose(handles.image{1});
imshow(handles.image{1});
handles.image{2} = transpose(handles.image{2});
guidata(hObject, handles)


% --- Executes on button press in PB_density.
function PB_density_Callback(hObject, eventdata, handles)
% hObject    handle to PB_density (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hold off  
set(handles.text15,'String','Wait: Calculating'); drawnow;
handles.densityWin  = str2num(get(handles.edit_densityWin,'string'))

myfun = @(block_struct) ...
   uint8(mean2(block_struct.data)*...
   ones(size(block_struct.data)));
I = blockproc(handles.image{1},[handles.densityWin(1) handles.densityWin(2)],myfun);
I = im2double(I);

if isfield(handles,'maskfile')==1
if ischar(handles.maskfile)
    mss=load(handles.maskfile)
    maske=mss.maske
    1
elseif isstruct(handles.maskfile)
    maske= handles.maskfile;
    2 
else
    maske = []
end

for i=1:size(maske,2)
    maskeTemp=maske(i)
    msk =  maskeTemp.msk;
    msk=~msk;
    I = I.*msk;
    i
    clear msk maskeTemp
end
end
imagesc(I);
colormap('jet')
% colormap(flipud(colormap('jet')))
colorbar;
 set(handles.text15,'String','Finished');drawnow;


% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
% hObject    handle to File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function Help_Callback(hObject, eventdata, handles)
% hObject    handle to Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Load_video_Callback(hObject, eventdata, handles)
% hObject    handle to Load_video (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Load_pair_Callback(hObject, eventdata, handles)
% hObject    handle to Load_pair (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Load_example_Callback(hObject, eventdata, handles)
% hObject    handle to Load_example (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit_densityWin_Callback(hObject, eventdata, handles)
% hObject    handle to edit_densityWin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_densityWin as text
%        str2double(get(hObject,'String')) returns contents of edit_densityWin as a double


% --- Executes during object creation, after setting all properties.
function edit_densityWin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_densityWin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





% --- Executes on button press in PB_avgVelocityVsTime.
function PB_avgVelocityVsTime_Callback(hObject, eventdata, handles)
% hObject    handle to PB_avgVelocityVsTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit_frameRate_Callback(hObject, eventdata, handles)
% hObject    handle to edit_frameRate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_frameRate as text
%        str2double(get(hObject,'String')) returns contents of edit_frameRate as a double


% --- Executes during object creation, after setting all properties.
function edit_frameRate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_frameRate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PB_play.
function PB_play_Callback(hObject, eventdata, handles)
% hObject    handle to PB_play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in PB_saveVideo.
function PB_saveVideo_Callback(hObject, eventdata, handles)
% hObject    handle to PB_saveVideo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit_endTime_Callback(hObject, eventdata, handles)
% hObject    handle to edit_endTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_endTime as text
%        str2double(get(hObject,'String')) returns contents of edit_endTime as a double


% --- Executes during object creation, after setting all properties.
function edit_endTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_endTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_strartTime_Callback(hObject, eventdata, handles)
% hObject    handle to edit_strartTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_strartTime as text
%        str2double(get(hObject,'String')) returns contents of edit_strartTime as a double


% --- Executes during object creation, after setting all properties.
function edit_strartTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_strartTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PB_streamline.
function PB_streamline_Callback(hObject, eventdata, handles)
% hObject    handle to PB_streamline (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f=handles.fig;
cla;
if handles.isvideo==0
imshow(handles.image{1});
elseif handles.isvideo==1
imshow(handles.read_frame0);
end
gap = str2num(get(handles.edit_streamGap,'string'))
h=mstreamline(handles.xS,handles.yS,handles.uS,handles.vS,gap);



function edit_streamGap_Callback(hObject, eventdata, handles)
% hObject    handle to edit_streamGap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_streamGap as text
%        str2double(get(hObject,'String')) returns contents of edit_streamGap as a double


% --- Executes during object creation, after setting all properties.
function edit_streamGap_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_streamGap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PB_playLoad.
function PB_playLoad_Callback(hObject, eventdata, handles)
% hObject    handle to PB_playLoad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.vidObj = VideoReader(handles.video);
vidObj = handles.vidObj;
fps = str2num(get(handles.edit_frameRate,'string'));
stime = str2num(get(handles.edit_strartTime,'string'));
etime = str2num(get(handles.edit_endTime,'string'));

if ischar(get(handles.edit_endTime,'string'))
    eframe=100000;
else
    eframe = round(etime*4);        %eframe = round(etime*vidObj.FrameRate)
end
vidObj.CurrentTime = stime;
sframe = round(stime*4)+1;
 set(handles.text_frame ,'string',sframe); drawnow;
% for i=1:sframe
%     readFrame(vidObj);
% end

this_frame0 = readFrame(vidObj);
imshow(this_frame0); drawnow
k=sframe;
while k < eframe  & hasFrame(vidObj)     
    this_frame1 = readFrame(vidObj); % next frame
    imshow(this_frame1); drawnow; % hold on;
%     handles.fig = figure('visible','off');
%     handles.fig=quiver(x,y,u,v,sizeFactor);
 set(handles.text_frame ,'string',k); drawnow;
    this_frame0 = this_frame1; 
    k=k+1;
end
