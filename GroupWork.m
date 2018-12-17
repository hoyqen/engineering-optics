function varargout = GroupWork(varargin)
% GROUPWORK MATLAB code for GroupWork.fig
%      GROUPWORK, by itself, creates a new GROUPWORK or raises the existing
%      singleton*.
%
%      H = GROUPWORK returns the handle to a new GROUPWORK or the handle to
%      the existing singleton*.
%
%      GROUPWORK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GROUPWORK.M with the given input arguments.
%
%      GROUPWORK('Property','Value',...) creates a new GROUPWORK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GroupWork_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GroupWork_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GroupWork

% Last Modified by GUIDE v2.5 08-Dec-2018 10:38:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GroupWork_OpeningFcn, ...
                   'gui_OutputFcn',  @GroupWork_OutputFcn, ...
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


% --- Executes just before GroupWork is made visible.
function GroupWork_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GroupWork (see VARARGIN)
set(handles.m,'String','0')
set(handles.n,'String','0')
set(handles.Velocity,'String','0')
set(handles.angle,'String','0')
handles.color = 'gray';
handles.Angle=0;
handles.velocity=0;
handles.Direction = 'hor';
%axes(handles.axes1)
%imshow('Beihang.jpg')
% Choose default command line output for GroupWork

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GroupWork wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GroupWork_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function m_Callback(hObject, eventdata, handles)
% hObject    handle to m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String')); % string属性是字符串，所以必须转换成数值
handles.m=input;
% 检验输入是否为空，是则将它置为0
if (isempty(handles.m))
     set(hObject,'String','0')
end

% 保存handles结构体，只要在handles结构体有改变时，才需要保存
guidata(hObject, handles);
% 这里由于handles没有改变，故这里其实没有必要，但是为了避免潜在的不必要麻烦，建议在所有Callback最后都添加该命令

% Hints: get(hObject,'String') returns contents of m as text
%        str2double(get(hObject,'String')) returns contents of m as a double


% --- Executes during object creation, after setting all properties.
function m_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function n_Callback(hObject, eventdata, handles)
% hObject    handle to n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String')); % string属性是字符串，所以必须转换成数值
handles.n=input;
% 检验输入是否为空，是则将它置为0
if (isempty(handles.n))
     set(hObject,'String','0')
end

guidata(hObject, handles); 
% Hints: get(hObject,'String') returns contents of n as text
%        str2double(get(hObject,'String')) returns contents of n as a double


% --- Executes during object creation, after setting all properties.
function n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in direction.
function direction_Callback(hObject, eventdata, handles)
% hObject    handle to direction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(hObject, 'String');
val = get(hObject,'Value');
% Set current data to the selected data set.
switch str{val}
    case 'Horizontal' % User selects peaks.
       handles.Direction = 'hor';
    case 'Vertical' % User selects membrane.
       handles.Direction = 'ver';
    case 'Circle' % User selects sinc.
       handles.Direction = 'cir';
    case 'Radiated' % User selects sinc.
       handles.Direction = 'rad';
end
% Save the handles structure.
guidata(hObject,handles)
% Hints: contents = cellstr(get(hObject,'String')) returns direction contents as cell array
%        contents{get(hObject,'Value')} returns selected item from direction


% --- Executes during object creation, after setting all properties.
function direction_CreateFcn(hObject, eventdata, handles)
% hObject    handle to direction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Velocity_Callback(hObject, eventdata, handles)
% hObject    handle to Velocity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String')); % string属性是字符串，所以必须转换成数值
handles.velocity=input;
% 检验输入是否为空，是则将它置为0
if (isempty(handles.Velocity))
     set(hObject,'String','0')
end


% 保存handles结构体，只要在handles结构体有改变时，才需要保存
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of Velocity as text
%        str2double(get(hObject,'String')) returns contents of Velocity as a double


% --- Executes during object creation, after setting all properties.
function Velocity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Velocity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function angle_Callback(hObject, eventdata, handles)
% hObject    handle to angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String')); % string属性是字符串，所以必须转换成数值
handles.Angle=input;
% 检验输入是否为空，是则将它置为0
if (isempty(handles.angle))
     set(hObject,'String','0')
end

% 保存handles结构体，只要在handles结构体有改变时，才需要保存
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of angle as text
%        str2double(get(hObject,'String')) returns contents of angle as a double


% --- Executes during object creation, after setting all properties.
function angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
switch get(handles.Color,'value')
    case 1
    a=grating(handles.m,handles.n,'direction',handles.Direction,'Velocity',handles.velocity,'color','rgb');
    case 0
    a=grating(handles.m,handles.n,'Velocity',handles.velocity,'direction',handles.Direction,'maxgrayval',200,'Angle',handles.Angle);
end

axes(handles.axes1)
imshow(a)



axes(handles.axes2)
AF=fft(a);
A1=abs(AF);
sfftI = fftshift(A1);
imagesc(sfftI)

k=100;      %Wavevector of the incoming wave. Wave is assumed to be perpendicular to the grating
d=round(handles.velocity);        %Width between the slits
N_slit=100;   %Number of slits in grating
A=1;        %Amplitude of incoming wave


%Setup extra variables
%fig=figure;
phi_tot=0;

%Define the angles to view the grating at and calculate the path difference
%between adjacent slits
theta_step=0.0001;
theta_end=0.1;
s_theta=theta_step:theta_step:theta_end; %sin(theta)
N_theta=length(s_theta);
delta=k*d*(s_theta);


%% Find how the intensity varies with angle
%Calculate the total amplitude for each angle in a vector phi_tot
for k=1:N_slit
    phi_tot=phi_tot+A*exp(1i*k*delta);
end

%Create variable to save frames to
clear F
F(N_theta)=struct('cdata',[],'colormap',[]);

%Plot top half of figure with total intensity and moving line as
%sin(theta) increases
%h1=subplot(2,1,1);


axes(handles.Intensity)
    if (~(isempty(handles.Intensity)))
     cla reset
    end
plot(s_theta,abs(phi_tot).^2)
hold on
p1=plot([0 0],[0 N_slit^2+10],'r');
ylim([0 N_slit^2+5])
xlabel('sin(\theta)')
ylabel('I')
title('Variation of Intensity with angle')

%% Plot the phasors for each angle
%Main loop over each angle
axes(handles.axes5)
for n=1:N_theta
    
    %Update the position of the red line on the top graph
    set(p1,'XData',[s_theta(n) s_theta(n)])
    
    %Clear the bottom graph
    if (~(isempty(handles.axes5)))
     cla reset
    end
    
    %Draw phasor diagram in bottom half of the figure
    %h2=subplot(2,1,2);
    
    phi=A*exp(1i*delta(n));
    plot([complex(0,0),phi])
    hold on
    
    %Let axes change size so it is easy to see details
    axis square
    axis equal
    
    %Alternatively can keep axes fixed for better feeling of scale
    %set(gca,'XTickLabel','','YTickLabel','')
    %xlim([-N_slit N_slit])
    %ylim([-N_slit N_slit])
    
    title('Phasor Diagram')
    
    %Loop to add each extra slit in
    for k=2:N_slit
        temp=phi;
        phi=phi+A*exp(1i*k*delta(n));
        plot([temp,phi])
    end
    %Draw figure
    drawnow
end    
%image(a)
%get(handles.edit1,’String‘); 


% --- Executes on button press in Color.
function Color_Callback(hObject, eventdata, handles)
% hObject    handle to Color (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%if get(hObject,'Value')
    

% Hint: get(hObject,'Value') returns toggle state of Color


% --- Executes during object creation, after setting all properties.


function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
%


% --- Executes on key press with focus on m and none of its controls.
function m_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to m (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over Color.
function Color_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Color (see GCBO)

% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
