clc
clear all

% Range= 32;
% Resolution=13;
% fs=200;
% T=0.005:1/fs:15;

% Set input folder
input_folder = 'E:\SisFall_dataset\SisFall_dataset\ADL\ADL All';
% Read all *.txt files from input folder
% NOTE: This creates a MATLAB struct with a bunch of info about each text file
% in the folder you specified. 
files = dir(fullfile(input_folder, '*.txt'));
% Get full path names for each text file
file_paths = fullfile({files.folder}, {files.name});
% Read data from files, keep second column
for i = 1 : numel(file_paths)
    load(file_paths{i}) ;
    
end
% y=DSMPL(D07_SA01_R02);
