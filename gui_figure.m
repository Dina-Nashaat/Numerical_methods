function varargout = gui_figure(varargin)
% GUI_FIGURE MATLAB code for gui_figure.fig
%      GUI_FIGURE, by itself, creates a new GUI_FIGURE or raises the existing
%      singleton*.
%
%      H = GUI_FIGURE returns the handle to a new GUI_FIGURE or the handle to
%      the existing singleton*.
%
%      GUI_FIGURE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_FIGURE.M with the given input arguments.
%
%      GUI_FIGURE('Property','Value',...) creates a new GUI_FIGURE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_figure_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_figure_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_figure

% Last Modified by GUIDE v2.5 14-Dec-2016 20:51:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_figure_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_figure_OutputFcn, ...
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


% --- Executes just before gui_figure is made visible.
function gui_figure_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_figure (see VARARGIN)

% Choose default command line output for gui_figure
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_figure wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%% Edit aesethetic appearance of Equation Input Textbox
jEdit = findjobj(handles.txt_eq);
lineColor = java.awt.Color(0,0,0);  
thickness = 2;  % pixels
newBorder = javax.swing.border.LineBorder(lineColor,thickness);
jEdit.Border = newBorder;
jEdit.repaint;  % redraw the modified control

%% Create Subscript Label into panel

set(handles.txt_upper, 'Visible', 'off');
set(handles.txt_lower, 'Visible', 'off');


% --- Outputs from this function are returned to the command line.
function varargout = gui_figure_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    
% Get default command line output from handles structure
varargout{1} = handles.output;




function txt_eq_Callback(hObject, eventdata, handles)
% hObject    handle to txt_eq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_eq as text
%        str2double(get(hObject,'String')) returns contents of txt_eq as a double

% --- Executes during object creation, after setting all properties.
function txt_eq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_eq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over txt_eq.
function txt_eq_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to txt_eq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject, 'Enable', 'On');
set(hObject,'String','');
set(hObject,'ForegroundColor',[0 0 0]);
uicontrol(hObject);



function txt_upper_Callback(hObject, eventdata, handles)
% hObject    handle to txt_upper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_upper as text
%        str2double(get(hObject,'String')) returns contents of txt_upper as a double


% --- Executes during object creation, after setting all properties.
function txt_upper_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_upper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in menu_method.
function menu_method_Callback(hObject, eventdata, handles)
% hObject    handle to menu_method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menu_method contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu_method

select_index = get(hObject, 'value');
if (select_index == 2 || select_index == 3)
    set(handles.lbl_upper, 'Visible','on');
    set(handles.lbl_lower, 'Visible','on');
    set(handles.txt_upper, 'Visible', 'on');
    set(handles.txt_lower, 'Visible', 'on');    
    set(handles.lbl_upper, 'String', 'Upper Bound');
    set(handles.lbl_lower, 'String', 'Lower Bound');
elseif (select_index == 4 || select_index == 5) 
    set(handles.lbl_upper, 'Visible','on');
    set(handles.lbl_lower, 'Visible','off');
    set(handles.txt_upper, 'Visible', 'on');
    set(handles.txt_lower, 'Visible', 'off');
    set(handles.lbl_upper, 'String', 'Initial Root')
elseif (select_index == 6)
    set(handles.lbl_upper, 'visible', 'on');
    set(handles.lbl_upper, 'String', 'Initial Value 1');
    set(handles.lbl_lower, 'String', 'Initial Value 2');
    set(handles.lbl_upper, 'Visible','on');
    set(handles.lbl_lower, 'Visible','on');
    set(handles.txt_upper, 'Visible', 'on');
    set(handles.txt_lower, 'Visible', 'on');    
else
    set(handles.lbl_upper, 'Visible','off');
    set(handles.lbl_lower, 'Visible','off');
    set(handles.txt_upper, 'Visible', 'off');
    set(handles.txt_lower, 'Visible', 'off');  
end



% --- Executes during object creation, after setting all properties.
function menu_method_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu_method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_iter_Callback(hObject, eventdata, handles)
% hObject    handle to txt_iter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_iter as text
%        str2double(get(hObject,'String')) returns contents of txt_iter as a double


% --- Executes during object creation, after setting all properties.
function txt_iter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_iter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_prec_Callback(hObject, eventdata, handles)
% hObject    handle to txt_prec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_prec as text
%        str2double(get(hObject,'String')) returns contents of txt_prec as a double


% --- Executes during object creation, after setting all properties.
function txt_prec_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_prec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_lower_Callback(hObject, eventdata, handles)
% hObject    handle to txt_lower (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_lower as text
%        str2double(get(hObject,'String')) returns contents of txt_lower as a double


% --- Executes during object creation, after setting all properties.
function txt_lower_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_lower (see GCBO)
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
select_index = get(handles.menu_method, 'value');
Message = 'Please select a suitable Numerical Method to find the root';
root_1 = str2double(get(handles.txt_upper, 'String'));
root_2 = str2double(get(handles.txt_lower, 'String'));
funStr = get(handles.txt_eq, 'String');
iterin = str2num(get(handles.txt_iter, 'String'));
prec = str2double(get(handles.txt_prec, 'String'));
table = handles.table_data;
if isempty(iterin)
    iterin = 50;
end
if isempty(prec)
    prec = 0.0001;
end

if (select_index == 1)
    msgbox(Message);
elseif (select_index == 5) 
    tic;
    [x error iterout] = Newton_Raphson(root_1, funStr, iterin, prec);
    elapsed_time = toc;
    set(handles.table_data, 'ColumnName', {'Root', 'Precision'});
    set(handles.table_data, 'Data', [x;error]');
    set(handles.lbl_root, 'String', x(end));
    set(handles.lbl_iter, 'String', iterout);
    str = strcat(num2str(elapsed_time), ' sec');
    if floor(elapsed_time) == 0 
        str = strcat(num2str(elapsed_time*100), ' msec');
    end
    set(handles.lbl_time, 'String', str);
else
    msgbox(Message);
end



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
