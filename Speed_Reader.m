function varargout = Speed_Reader(varargin)
% SPEED_READER MATLAB code for Speed_Reader.fig
%      SPEED_READER, by itself, creates a new SPEED_READER or raises the existing
%      singleton*.
%
%      H = SPEED_READER returns the handle to a new SPEED_READER or the handle to
%      the existing singleton*.
%
%      SPEED_READER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPEED_READER.M with the given input arguments.
%
%      SPEED_READER('Property','Value',...) creates a new SPEED_READER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Speed_Reader_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Speed_Reader_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Speed_Reader

% Last Modified by GUIDE v2.5 25-Mar-2017 16:08:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Speed_Reader_OpeningFcn, ...
                   'gui_OutputFcn',  @Speed_Reader_OutputFcn, ...
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


% --- Executes just before Speed_Reader is made visible.
function Speed_Reader_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Speed_Reader (see VARARGIN)

% Choose default command line output for Speed_Reader
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Speed_Reader wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Speed_Reader_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function EnterSentence_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EnterSentence (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function EnterSentence_Callback(hObject, eventdata, handles)
% hObject    handle to EnterSentence (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
string = get(hObject, 'String');

% Hints: get(hObject,'String') returns contents of EnterSentence as text
%        str2double(get(hObject,'String')) returns contents of EnterSentence as a double
handles.string = string;
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function WordsPerMinute_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WordsPerMinute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function WordsPerMinute_Callback(hObject, eventdata, handles)
% hObject    handle to WordsPerMinute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
wpm = str2double(get(hObject, 'String'));
if isnan(wpm)
    set(hObject, 'String', 0);
    errordlg('Sorry, speed setting must be a number','Error');
end
% Hints: get(hObject,'String') returns contents of WordsPerMinute as text
%        str2double(get(hObject,'String')) returns contents of WordsPerMinute as a double

% Save the new wpm value
handles.wpm = wpm;
guidata(hObject,handles)

% --- Executes on button press in runProgram.
function runProgram_Callback(hObject, eventdata, handles)
% hObject    handle to runProgram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

string = strsplit(handles.string);
wpm = 60/(handles.wpm);

for i=1:length(string)
    set(handles.WordPrintLine,'String',string(i));
    pause(wpm);
    clc;
    
end
clc;
set(handles.WordPrintLine, 'String', '');
