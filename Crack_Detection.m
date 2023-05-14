function varargout = Crack_Detection(varargin)
% CRACK_DETECTION MATLAB code for Crack_Detection.fig
%      CRACK_DETECTION, by itself, creates a new CRACK_DETECTION or raises the existing
%      singleton*.
%
%      H = CRACK_DETECTION returns the handle to a new CRACK_DETECTION or the handle to
%      the existing singleton*.
%
%      CRACK_DETECTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CRACK_DETECTION.M with the given input arguments.
%
%      CRACK_DETECTION('Property','Value',...) creates a new CRACK_DETECTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Crack_Detection_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Crack_Detection_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Crack_Detection

% Last Modified by GUIDE v2.5 09-May-2023 15:02:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Crack_Detection_OpeningFcn, ...
                   'gui_OutputFcn',  @Crack_Detection_OutputFcn, ...
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


% --- Executes just before Crack_Detection is made visible.
function Crack_Detection_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Crack_Detection (see VARARGIN)

% Choose default command line output for Crack_Detection
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Crack_Detection wait for user response (see UIRESUME)
% uiwait(handles.figure1);

axes(handles.axes1)
cla(handles.axes1,'reset')
axis off
title('Original image')

axes(handles.axes3)
cla(handles.axes3,'reset')
axis off
title('Segmented cracks')

set(handles.edit1,'String','');
set(handles.edit2,'String','1');


% --- Outputs from this function are returned to the command line.
function varargout = Crack_Detection_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename, pathname] = uigetfile({'*.*'},'Open Directory');
if isequal(filename,0) || isequal(pathname,0)
    return
end

set(handles.edit1,'String',strcat(pathname,filename));
Im=get(handles.edit1,'String');

axes(handles.axes1)
cla(handles.axes1,'reset')
A=imread(Im);
imshow(A)
title('Original image')
if ndims(A)==3; A=rgb2gray(A); end




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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


Im=get(handles.edit1,'String');

axes(handles.axes1)
cla(handles.axes1,'reset')
axis off
A=imread(Im);
imshow(A)
title('Original image')
if ndims(A)==3; B=rgb2gray(A); else B=A; end


Istrech = imadjust(A,stretchlim(A));

Igray_s = rgb2gray(Istrech);
level = 0.08;
Ithres = im2bw(Igray_s,level);
axes(handles.axes3)
cla(handles.axes3,'reset')
axis off
imshow(Ithres)
title('Segmented cracks')


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.axes1)
cla(handles.axes1,'reset')
axis off
title('Original image')

axes(handles.axes3)
cla(handles.axes3,'reset')
axis off
title('Segmented cracks')

set(handles.edit1,'String','');
set(handles.edit2,'String','1');



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Im=get(handles.edit1,'String');

axes(handles.axes1)
cla(handles.axes1,'reset')
axis off
A=imread(Im);
imshow(A)
title('Original image')
if ndims(A)==3; B=rgb2gray(A); else B=A; end


Istrech = imadjust(A,stretchlim(A));

Igray_s = rgb2gray(Istrech);
level = 0.08;
Ithres = im2bw(Igray_s,level);


[m,n]=size(Ithres);
z=1;
for i=1:m
    for j=1:n
        if Ithres(i,j)==0
            K(z,1)=i;
            K(z,2)=j;
            z=z+1;
        end
    end
end

k10=1;
label=0;
for i=1:size(K,1)
    for j=1:size(K,1)
        R_Phi(j,1)=((K(i,1)-K(j,1))^2+(K(i,2)-K(j,2))^2)^.5;
    end
    [R_sort,I_index] = sort(R_Phi(:,1));
    R_node=R_sort(2);
    num_R=find(R_Phi(2:end,1)<=R_node);
    if size(num_R,1)<3
        label(1,k10)=i;
        k10=k10+1;
    end
end

for i=1:size(label,2)
    Ithres(K(label(1,i),1),K(label(1,i),2))=1;
end

axes(handles.axes3)
cla(handles.axes3,'reset')
axis off
imshow(Ithres)
title('Segmented cracks')

[m,n]=size(Ithres);
z=1;
for i=1:m
    for j=1:n
        if Ithres(i,j)==0
            K(z,1)=i;
            K(z,2)=j;
            z=z+1;
        end
    end
end




x=eval(get(handles.edit2,'String'));
[idx,C] = kmeans(K,x);

s=zeros(1,x);
for i=1:size(idx,1)
    s(1,idx(i,1))=s(1,idx(i,1))+((K(i,1)-C(idx(i,1),1))^2+(K(i,2)-C(idx(i,1),2))^2)^.5;
end

for i=1:size(idx,1)
    R(i,1)=((K(i,1)-C(idx(i,1),1))^2+(K(i,2)-C(idx(i,1),2))^2)^.5;
end

for i=1:x
    z=max(R(idx==i,1));
    R_Final(1,i)=z(1);
end


axes(handles.axes3)
hold on
for i=1:x
    Alpha=linspace(0,2*pi);
    plot(R_Final(1,i)*cos(Alpha)+C(i,2), R_Final(1,i)*sin(Alpha)+C(i,1),'LineWidth',2)
end
hold off

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


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Im=get(handles.edit1,'String');

axes(handles.axes1)
cla(handles.axes1,'reset')
axis off
A=imread(Im);
imshow(A)
title('Original image')
if ndims(A)==3; B=rgb2gray(A); else B=A; end


Istrech = imadjust(A,stretchlim(A));

Igray_s = rgb2gray(Istrech);
level = 0.08;
Ithres = im2bw(Igray_s,level);

[m,n]=size(Ithres);
z=1;
for i=1:m
    for j=1:n
        if Ithres(i,j)==0
            K_Final(z,1)=i;
            K_Final(z,2)=j;
            z=z+1;
        end
    end
end

k10=1;
label=0;
for i=1:size(K_Final,1)
    for j=1:size(K_Final,1)
        R_Phi(j,1)=((K_Final(i,1)-K_Final(j,1))^2+(K_Final(i,2)-K_Final(j,2))^2)^.5;
    end
    [R_sort,I_index] = sort(R_Phi(:,1));
    R_node=R_sort(2);
    num_R=find(R_Phi(2:end,1)<=R_node);
    if size(num_R,1)<3
        label(1,k10)=i;
        k10=k10+1;
    end
end

for i=1:size(label,2)
    Ithres(K_Final(label(1,i),1),K_Final(label(1,i),2))=1;
end


axes(handles.axes3)
cla(handles.axes3,'reset')
axis off
imshow(Ithres)
title('Segmented cracks')
