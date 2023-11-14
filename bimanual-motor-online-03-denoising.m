%% DENOISING DATA 
% Written by Marleen J. Schoenfeld and Catharina Zich, January 2023

% Depending on which data (pilot or participant data) you like to denoise,
% please (un)comment the code accordingly. The code below is currently set 
% to denoise participant data.

% In order for the script to run, please make sure to set the directory to 
% a folder which contains the weigth order of the training task 
% (e.g., WeightOrder_Train-I, WeightOrder_Train-II, etc) as well as 
% the data containing the performance in the training tasks 
% (i.e., participant data: 100 (trials) x 6 (streets) x 450 (participants) matrix, or 
%        pilot data: 100 (trials) x 6 (streets) x 75 (pilots) matrix).
% Here, the data is named 'MT_training' (line 46) and 'Error_training' (line 49), please
% change the names accordingly. If you used the DAta_import.m script, the 
% following section ('EXAMPLE: GET DATA MATRIX') shows how 'MT_training' 
% and 'Error_training' were acquired.
% You can skip the section below if you already have a data matrix for the 
% training task performances for all subjects. 

%% EXAMPLE: GET DATA MATRIX 
% The dependent variables to denoise are MTime, and Error. 
% Their matrix contains 110 (trials) x 6 (streets): 
%- trials 1-5 contain the performance in transfer pre, 
%- trials 6-105 contain the performance in training task, 
%- trials 106-110 contain the performance in transfer post.

% If you used the Data_import.m script, you imported and preprocessed 
% single subject data. Here, the code below stores all single subject data in 
% one matrix which is necessary for the denoising. Go to the directory where you
% saved the single subject data and run this section.     

PATH_to_single_subject_data = '/path_to_single_subject_data/';% path where data from Data_import.m was saved
data=dir('Subject*.mat');%get all the single subject names
 
for p=1:length(data)
     clear Error MTime 
     load(data(p).name); %load data of single subjects

        % STORE single subject data in data matrix
         Error_training(:,:,p)=Error(6:105,:);%matrix 100 (trials) x 6 (streets) x 450 (participants) or matrix 100 (trials) x 6 (streets) x 75 (pilots)
         MT_training(:,:,p)=MTime(6:105,:);

 end
save('Data_to_denoise.mat', 'Error_training', 'MT_training');

%% DENOISING
% Once you have the weigth order of each training task 
% (e.g., WeightOrder_Train-I, WeightOrder_Train-II, etc) as well as 
% the data containing the performance in the training tasks 
% (i.e., participant data: 100 (trials) x 6 (streets) x 450 (participants) matrix, or 
%        pilot data: 100 (trials) x 6 (streets) x 75 (pilots) matrix),
% you can run this section for denoising.

clear all; close all; clc;

% SET PATH to folder containing weight order and data to denoise
PATH = '/path_to_data/';%please change t your directory

% LOAD Data to denoise
load([PATH 'Data_to_denoise.mat']);%participant or pilot data

% CREATE subject indicies grouped by number of subjects per training task: 90 for participant or 15 for pilot data
Nsubj1 = 1:90:size(MT_training,3)+1;%for participant data
%Nsubj1 = 1:15:size(MT_training,3)+1;%for pilot data

% DEFINE labels for figures
tit = {'Time [sec]','Error [a.u.]'};
cond = {'Train-I','Train-II','Train-III','Train-IV','Train-V'};
cols = [166,97,26;223,194,125;1,133,113;128,205,193]./255;

% LOOP through training tasks
for c = 1:length(Nsubj1)-1
    
    % LOAD WEIGHTS for training tasks (weights are the same in pilot and participant data)
    load([PATH 'WeightOrder_',cond{c},'.mat']);
    
    % CREATE subject indicies grouped by number of subjects for each condition: 30 within the 90 for participant data or 5 within 15 for pilot data
    Nsubj2 = [Nsubj1(c):30:Nsubj1(c+1)];%for participant data
    %Nsubj2 = [Nsubj1(c):5:Nsubj1(c+1)];%for pilot data
    
    f1 = figure('units','normalized','outerposition',[0 0 1 1],'DefaultAxesFontSize',18);
    
    % LOOP through variabels (MT,Error)
    for v = 1:2
        if v==1
            VAR = MT_training;% participant or pilot data for movement time, change name accordingly 
            WEIGHTS = MT_weightOrder;
        else
            VAR = Error_training;%participant or pilot data for error, change name accordingly
            WEIGHTS = Error_weightOrder;
        end
        sb_idx = [0,2];
        
        % AVERAGE DATA for subjects in each training task
        dat1 = squeeze(mean(VAR(:,:,Nsubj1(c):Nsubj1(c+1)-1),2));%loose one dimension, mean of trials by subjects
        dat2 = ones(1,90) .* mean(WEIGHTS,2);%for participant data
        %dat2 = ones(1,15) .* mean(WEIGHTS,2);%for pilot data
        
        % RESHAPE from 2d to 1d
        dat11 = reshape(dat1,1,[]);
        dat22 = reshape(dat2,1,[]);
        
        % FIT REGRESSION over trials (averaged over streets within trial) and subjects
        mdl = fitlm(dat11,dat22);
        res11 = mdl.Residuals.Raw; % extract Raw residuals 
        res1 = reshape(res11,size(dat1,1),size(dat1,2)); % reshape residuals from 1d to 2d
        
        % SUBSTRACT mean residuals from each subject
        VAR_corr= squeeze(mean(VAR(:,:,Nsubj1(c):Nsubj1(c+1)-1),2)) - mean(res1,2);
        VAR_c(:,:,c,v)= squeeze(mean(VAR(:,:,Nsubj1(c):Nsubj1(c+1)-1),2)) - mean(res1,2);
        
        % PLOT residuals
        subplot(2,2,sb_idx(v)+1);hold on
        plot(mean(res1,2),'k');
        ylabel('Residuals');xlabel('Trials');
        title(['Training task: ',cond{c},' ',tit{v}]);
        if v==1
            ax = gca;
            ax.YAxis.Exponent = 3;
        end
        
        % PLOT data
        subplot(2,2,sb_idx(v)+2);hold on;
        plot(squeeze(mean(VAR(:,:,Nsubj1(c):Nsubj1(c+1)-1),[2 3])),'color',cols(1,:),'Linewidth',2);
        plot(mean(VAR_corr,2),'color',cols(3,:),'Linewidth',2);
        for n = 1:3
            plot(squeeze(mean(VAR(:,:,Nsubj2(n):Nsubj2(n+1)-1),[2 3])),'color',cols(2,:),'Linewidth',1);
            VAR_corr = squeeze(mean(VAR(:,:,Nsubj2(n):Nsubj2(n+1)-1),2)) - mean(res1,2);
            plot(mean(VAR_corr,2),'color',cols(4,:),'Linewidth',1);
        end
        
        % PARAMETERS for plot
        if v==1
            ax = gca;
            ax.YAxis.Exponent = 3;legend('Original','Denoised')
        end
        title(['Training task: ',cond{c},' ',tit{v}]);
        ylabel(tit{v});xlabel('Trials');
        
    end 
    %for pilot data: VAR_c contains matrix of 100 (trials) x 15 (participants per training group) x 5 (training group) x 2 (variables MT (1) and Error (2))
    %for participant data: VAR_c contains matrix of 100 (trials) x 90 (participants per training group) x 5 (training group) x 2 (variables MT (1) and Error (2))
    save('Data_denoised.mat','VAR_c');
end
