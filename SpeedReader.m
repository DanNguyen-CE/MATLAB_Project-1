function [words] = SpeedReader (string,wpm)

string = strsplit(string);
wpm = 60/wpm;

for i=1:length(string)
    disp(string (i));
    pause(wpm);
    clc;
    
end
clc;
end