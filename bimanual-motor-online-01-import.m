%% IMPORT DATA 
% Written by Marleen J. Schoenfeld and Catharina Zich, January 2023

%% 1. IMPORT DATA
% Double click on the csv file (raw data file), this opens a import window.
% In import window, set columns called 'BIMquestion1', BIMquestion2, ... to BIMquestion16
% as 'text', set column delimiters on 'comma' and output type as 'column vectors'.

%% 2. PRE-PROCESSING RAW DATA (see 2.1. Participants or 2.2. Pilots)
%% 2.1. Participants (N=450)

%----- Movement Time------------%
% GET DATA from vectors without NaNs
MTime_1=MTime_1(~isnan(MTime_1));MTime_2=MTime_2(~isnan(MTime_2));MTime_3=MTime_3(~isnan(MTime_3));
MTime_4=MTime_4(~isnan(MTime_4));MTime_5=MTime_5(~isnan(MTime_5));MTime_6=MTime_6(~isnan(MTime_6));
% COMBINE individual vectors in one matrix
MTime=[MTime_1(2:end) MTime_2 MTime_3 MTime_4 MTime_5 MTime_6];%leave out orientation street 1 (trial 1)
MTime=[MTime(1:5,:); MTime(7:106,:); MTime(108:end,:)];%leave out orientation street 2 (trial 6) and 3 (trial 107)
%Now your MTime matrix (110 x 6) contains: trials 1-5 (performance in transfer pre), trials 6:105 (performance in training task), trials 106:110 performance in transfer post


%----- Error --------------------%
% GET DATA from vectors without NaNs
Error_1=Error_1(~isnan(Error_1));Error_2=Error_2(~isnan(Error_2));Error_3=Error_3(~isnan(Error_3));
Error_4=Error_4(~isnan(Error_4));Error_5=Error_5(~isnan(Error_5));Error_6=Error_6(~isnan(Error_6));
%COMBINE individual vectors in one matrix
Error=[Error_1(2:end) Error_2 Error_3 Error_4 Error_5 Error_6];%leave out orientation street 1 (trial 1)
Error=[Error(1:5,:); Error(7:106,:); Error(108:end,:)];%leave out orientation street 2 (trial 6) and 3 (trial 107)
%Now your Error matrix (110 x 6) contains: trials 1-5 (performance in transfer pre), trials 6:105 (performance in training task), trials 106:110 performance in transfer post

%------ Achievemen Motivation Inventory ----------%
AMI=AMI_sliderresponse(~isnan(AMI_sliderresponse));AMI=AMI';

%----- Bimanual competence questionnaire--------- %
% Bimanual competence questionnaire was assessed as published in Schoenfeld et al., (2021)
% The dependent variables are included in variables 'BIMquestion1', 'BIMquestion2', …, 'BIMquestion16' and correspond to the following questions:
%- BIMquestion1 to BIMquestion4: Do you currently play games involving both of your hands (sports, hobbies, etc)? 
%- BIMquestion5 to BIMquestion8: Do you currently do any typing using both of your hands, e.g., on the keyboard, or texting using both thumbs, e.g., on your phone?
%- BIMquestion9 to BIMquestion12: Do you currently play (a) videogame(s) involving both of your hands (on computer, playstation, etc)?
%- BIMquestion13 to BIMquestion16: Do you currently play (a) musical instrument(s) involving both of your hands?  

save('Subject_XXX_single_subject_data');

%% 2.2. Pilots (N=75)

%----- Movement Time------------%
% GET DATA from vectors without NaNs
MTime_1=MTime_1(~isnan(MTime_1));MTime_2=MTime_2(~isnan(MTime_2));MTime_3=MTime_3(~isnan(MTime_3));
MTime_4=MTime_4(~isnan(MTime_4));MTime_5=MTime_5(~isnan(MTime_5));MTime_6=MTime_6(~isnan(MTime_6));
%COMBINE individual vectors in one matrix
MTime=[MTime_1 MTime_2 MTime_3 MTime_4 MTime_5 MTime_6];
MTime=[MTime(3:end,:)];%leave out orientation trials 1 and 2
%Now your MTime matrix (110 x 6) contains: trials 1-5 (performance in transfer pre), trials 6:105 (performance in training task), trials 106:110 performance in transfer post


%----- Error --------------------%
% GET DATA from vectors without NaNs
Error_1=Error_1(~isnan(Error_1));Error_2=Error_2(~isnan(Error_2));Error_3=Error_3(~isnan(Error_3));
Error_4=Error_4(~isnan(Error_4));Error_5=Error_5(~isnan(Error_5));Error_6=Error_6(~isnan(Error_6));
%COMBINE individual vectors in one matrix
Error=[Error_1 Error_2 Error_3 Error_4 Error_5 Error_6];
Error=[Error(3:end,:)];%leave out orientation trials 1 and 2
%Now your Error matrix (110 x 6) contains: trials 1-5 (performance in transfer pre), trials 6:105 (performance in training task), trials 106:110 performance in transfer post


%Questionnaire results
AMI=AMI_sliderresponse(~isnan(AMI_sliderresponse));AMI=AMI';

%----- Bimanual competence questionnaire--------- %
% Bimanual competence questionnaire was assessed as published in Schoenfeld et al., (2021).
% The dependent variables are included in variables 'BIMquestion1', 'BIMquestion2', …, 'BIMquestion16' and correspond to the following questions:
%- BIMquestion1 to BIMquestion4: Do you currently play games involving both of your hands (sports, hobbies, etc)? 
%- BIMquestion5 to BIMquestion8: Do you currently do any typing using both of your hands, e.g., on the keyboard, or texting using both thumbs, e.g., on your phone?
%- BIMquestion9 to BIMquestion12: Do you currently play (a) videogame(s) involving both of your hands (on computer, playstation, etc)?
%- BIMquestion13 to BIMquestion16: Do you currently play (a) musical instrument(s) involving both of your hands?  

save('Subject_XXX_single_subject_data');
