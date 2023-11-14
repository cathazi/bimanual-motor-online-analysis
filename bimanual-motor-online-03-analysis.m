clear all; clc; close all;

%% HOUSE KEEPING
PATH_MAIN = 'PATH';
PATHIN_RAW =[PATH_MAIN 'LASSO_raw_data/'];
PATH_OUT = [PATH_MAIN 'LASSO_figures/'];

training.theo.colour=[1 0.25 0.4;1 0.55 0.2; 0.5 0.8 0.2 ; 0 0.6 1; 0.6 0 0.8];
transfer.theo.colour=[0.8 0.8 0.8; 0.4 0.4 0.4; 0 0 0];

training.emp.colour=[1 0.25 0.4;0.7490 0.6745 0.2000; 0.3020 0.3020 0.9020];
transfer.emp.colour=[0.8 0.8 0.8;0.2 0.2 0.2];

training.trials = [6:105];
transfer.trials.pre = [1:5];
transfer.trials.post = [106:110];

% theoretical levels
training.theo.label = {'Train-I','Train-II','Train-III','Train-IV','Train-V'};
transfer.theo.label = {'Transfer-S','Transfer-M','Transfer-L'};

training.theo.idx.num = [1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;4;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5;5];
transfer.theo.idx.num = [1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;2;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3;3];

% emperical levels
training.emp.label = {'Train-I','Train-II/III','Train-IV/V'};
transfer.emp.label = {'Transfer-S','Transfer-M|L'};

training.emp.idx.num = training.theo.idx.num;
training.emp.idx.num(training.emp.idx.num==3)=2;
training.emp.idx.num(training.emp.idx.num==4)=3;
training.emp.idx.num(training.emp.idx.num==5)=3;

transfer.emp.idx.num = transfer.theo.idx.num;
transfer.emp.idx.num(transfer.emp.idx.num==3)=2;

% change labels: numeric > strings (easier interpretation in stats software)
for s = 1:length(training.theo.idx.num)
    % theoretical levels
    for t = 1:length(training.theo.label)
        if training.theo.idx.num(s) == t
            training.theo.idx.label{s} = training.theo.label{t};
        end
    end

    for t = 1:length(transfer.theo.label)
        if transfer.theo.idx.num(s) == t
            transfer.theo.idx.label{s} = transfer.theo.label{t};
        end
    end

    % emperical levels
    for t = 1:length(training.emp.label)
        if training.emp.idx.num(s) == t
            training.emp.idx.label{s} = training.emp.label{t};
        end
    end

    for t = 1:length(transfer.emp.label)
        if transfer.emp.idx.num(s) == t
            transfer.emp.idx.label{s} = transfer.emp.label{t};
        end
    end
end


%% get reset index for PCA
cd(PATHIN_RAW);
files = dir('Subject*.mat')

for s = 1:length(files)
    load(files(s).name);
    clear ResInd
    ResInd_1(isnan(ResInd_1))=[];ResInd(1,:) = ResInd_1(2:end); %first orientation street
    ResInd_2(isnan(ResInd_2))=[];ResInd(2,:) = ResInd_2;
    ResInd_3(isnan(ResInd_3))=[];ResInd(3,:) = ResInd_3;
    ResInd_4(isnan(ResInd_4))=[];ResInd(4,:) = ResInd_4;
    ResInd_5(isnan(ResInd_5))=[];ResInd(5,:) = ResInd_5;
    ResInd_6(isnan(ResInd_6))=[];ResInd(6,:) = ResInd_6;
    ResInd(:,[6 107]) = []; %orientation street before training and post transfer
    Reset_all(s,:,:) = ResInd;
end
Reset_all = squeeze(mean(Reset_all,2));

%% data reduction
% PCA with MT, Error, Reset
load([PATH_OUT 'LASSO_MT_Error_training.mat']);
load([PATH_OUT 'LASSO_Error_MT_transfer.mat']);

clear Data_org
Data_org(:,transfer.trials.pre,:) = permute(squeeze(VAR_curves(:,1,:,:)),[2,1,3]);
Data_org(:,training.trials,:) = permute(reshape(VAR_c,100,[],2),[2,1,3]);
Data_org(:,transfer.trials.post,:) = permute(squeeze(VAR_curves(:,2,:,:)),[2,1,3]);
Data_org(:,:,3) = Reset_all;

temp = reshape(Data_org,[],size(Data_org,3));
temp = zscore(temp);

[COEFF, SCORE, LATENT, TSQUARED, EXPLAINED] = pca(reshape(temp,[],size(Data_org,3)));
Data_pca = reshape(SCORE,size(Data_org,1),size(Data_org,2),[]);
Data_pca = Data_pca(:,:,1);



% Lefebvre 2012/13;
load([PATH_OUT 'LASSO_MT_Error_training.mat']);
load([PATH_OUT 'LASSO_Error_MT_transfer.mat']);

% get a & b 
% if avaivlable use independent data, i.e., pilot data 
a = mean(VAR_c(:,:,:,1),[1 2 3]);
b = mean(VAR_c(:,:,:,2),[1 2 3]);

clear Data_org
Data_org(:,transfer.trials.pre,:) = permute(squeeze(VAR_curves(:,1,:,:)),[2,1,3]);
Data_org(:,training.trials,:) = permute(reshape(VAR_c,100,[],2),[2,1,3]);
Data_org(:,transfer.trials.post,:) = permute(squeeze(VAR_curves(:,2,:,:)),[2,1,3]);
Data_org(:,:,3) = Reset_all;

Pe = a./Data_org(:,:,1);
Pv = b./Data_org(:,:,2);

PI = Pv.*Pe;

PI_initial = mean(PI(:,training.trials(1:10)),2);
LI = ((PI-PI_initial)./PI_initial)*100;

Data_pca = PI;

%% Stats note
% dfs for post-hoc ttests from jamovi
% effect size (cohens d for paired samples ttests from jamovi

%% Stats ana01: Validation

cd(PATH_OUT);
fid = fopen( 'ana01_training_main_effect.csv', 'w' );
fprintf( fid, '%s,%s,%s,%s,%s\n','MT','Error','Reset','PCA','group');
for g = 1:size(Data_org,1)
    fprintf( fid, '%d,%d,%d,%d,%s\n',squeeze(mean(Data_org(g,training.trials,:),2)),mean(Data_pca(g,training.trials),2),training.theo.idx.label{g});
end
fclose(fid);


fid = fopen( 'ana01_transfer_main_effect.csv', 'w' );
fprintf( fid, '%s,%s,%s\n','trans_pre_PCA','trans_post_PCA','group');
for g = 1:size(Data_org,1)
    fprintf( fid, '%d,%d,%s\n',squeeze(mean(Data_pca(g,transfer.trials.pre),2)),squeeze(mean(Data_pca(g,transfer.trials.post),2)),transfer.theo.idx.label{g});
end
fclose(fid);

%% Stats ana02: Learning 
A = importdata('Questionnaires.txt');

fid = fopen( 'ana02_training_effect.csv', 'w' );
fprintf( fid, '%s,%s,%s,%s,%s\n','train_pre_PCA','train_post_PCA','train_change_PCA','BMI','group');
for g = 1:size(Data_org,1)
    fprintf( fid, '%d,%d,%d,%d,%s\n',squeeze(mean(Data_pca(g,training.trials(1:10)),2)),squeeze(mean(Data_pca(g,training.trials(end-9:end)),2)),...
      squeeze(mean(Data_pca(g,training.trials(1:10)),2))-squeeze(mean(Data_pca(g,training.trials(end-9:end)),2)),A.data(g,2),training.emp.idx.label{g});
end
fclose(fid);

for t=1:3
    subj = training.emp.idx.num == t;
    training.emp.label(t)
    [H,P,CI,STATS] = ttest(mean(Data_pca(subj,training.trials(1:10)),2),mean(Data_pca(subj,training.trials(end-9:end)),2))
    
    % effect size/ cohens D for paired samples ttest
    Before = mean(Data_pca(subj,training.trials(1:10)),2);
    After = mean(Data_pca(subj,training.trials(end-9:end)),2);
    (mean(Before)-mean(After))/std(After-Before)
end

%% Stats ana03: Interaction
cd(PATH_OUT);
fid = fopen( 'ana03_interaction.csv', 'w' );
fprintf( fid, '%s,%s,%s,%s,%s,%s,%s,%s,%s\n',...
    'trans_pre_PCA','trans_post_PCA','trans_diff_PCA','train_diff_PCA','BMI','trans_group_theory','trans_group_emperical','train_group_theory','train_group_emperical');

for g = 1:size(Data_pca,1)
    fprintf( fid, '%d,%d,%d,%d,%d,%s,%s,%s,%s\n',...
        squeeze(mean(Data_pca(g,transfer.trials.pre),2)),squeeze(mean(Data_pca(g,transfer.trials.post),2)),squeeze(mean(Data_pca(g,transfer.trials.post),2))-squeeze(mean(Data_pca(g,transfer.trials.pre),2)),...
        squeeze(mean(Data_pca(g,training.trials(1:10)),2))-squeeze(mean(Data_pca(g,training.trials(end-9:end)),2)),A.data(g,2),...
        transfer.theo.idx.label{g},transfer.emp.idx.label{g},training.theo.idx.label{g},training.emp.idx.label{g});
end
fclose(fid);

%% Stats ana04: Qs
cd(PATH_OUT);
fid = fopen( 'ana04_Qs.csv', 'w' );

A = importdata('Questionnaires.txt');
fprintf( fid, '%s,%s,%s,%s\n','AMI','BIM','trans_group_emperical','train_group_emperical');

for g = 1:size(Data_pca,1)
    fprintf( fid, '%d,%d,%s,%s\n',A.data(g,:),transfer.emp.idx.label{g},training.emp.idx.label{g});
end
fclose(fid);

%% Figure 2 (ana01)
f1 = figure('units','normalized','outerposition',[0 0 0.7 0.6],'DefaultAxesFontSize',16);

Data_figure = Data_pca;

% figure 2 part a
subplot('Position',[0.1 0.59 0.335/2+0.02 0.34]);hold on;
for t = 1:size(VAR_c,3)
    var_temp = mean(Data_figure(training.theo.idx.num==t,training.trials),2);
    bp(t) = prctile(var_temp,50);
    var(t) = std(var_temp)/sqrt(length(var_temp));
end

ebw = 0.1;
plot([1:5],bp,'k','Linewidth',1.5);
for t = 1:size(VAR_c,3)
    plot([t t],[bp(t)-var(t) bp(t)+var(t)],'k','Linewidth',1.5);
    plot([t-ebw t+ebw],[bp(t)-var(t) bp(t)-var(t)],'k','Linewidth',1.5);
    plot([t-ebw t+ebw],[bp(t)+var(t) bp(t)+var(t)],'k','Linewidth',1.5);
    plot(t,bp(t),'s','MarkerFaceColor',training.theo.colour(t,:),'MarkerEdgeColor','k','MarkerSize',8);
end
xlim([0.5 5.5]);
xticklabels(training.theo.label);xtickangle(30);
ylabel('Training task PI (a.u.)');
box(gca,'on');

% figure 2 part b
clear bp
subplot('Position',[0.35 0.59 0.335 0.34]);hold on;
x_pos = [1 2;5 9;9 16;13 23;17 30];
p = 1;
x_pos_shift_data = -1;
jit = (rand(90,1)-0.5)/3;

for t = 1:size(VAR_c,3)
    var_temp = mean(Data_figure(training.theo.idx.num==t,training.trials),2);

    % boxplot
    bp = prctile(var_temp,[25 50 75]);
    iqr = bp(3)-bp(1);
    for b = 1:3
        plot([x_pos(t,p)-0.33 x_pos(t,p)+0.33],[bp(b) bp(b)],'Color',training.theo.colour(t,:),'LineWidth',2);
    end
    plot([x_pos(t,p)-0.33 x_pos(t,p)-0.33],[bp(1) bp(3)],'Color',training.theo.colour(t,:),'LineWidth',2);
    plot([x_pos(t,p)+0.33 x_pos(t,p)+0.33],[bp(1) bp(3)],'Color',training.theo.colour(t,:),'LineWidth',2);
    out = isoutlier(var_temp,'gesd');
    plot([x_pos(t,p) x_pos(t,p)],[bp(1) min(var_temp(~out))],'Color',training.theo.colour(t,:),'LineWidth',1);
    plot([x_pos(t,p) x_pos(t,p)],[bp(3) max(var_temp(~out))],'Color',training.theo.colour(t,:),'LineWidth',1);

    % data
    plot(ones(1,90)*x_pos(t,p)+x_pos_shift_data+jit,var_temp,'ko','MarkerFaceColor','k','MarkerEdgeColor','k','MarkerSize',2);

    % distribution
    [N,EDGES] = histcounts(var_temp,[min(var_temp):0.05:max(var_temp)]);
    N = smoothdata(N/max(N),'sgolay',8);
    N(2:end+1) = N;N(1)=0;N(end+1)=0;
    Cent = EDGES(1:end-1)+EDGES(2)-EDGES(1);
    Cent(2:end+1) = Cent; Cent(1) = Cent(2)-(Cent(3)-Cent(2)); Cent(end+1) = Cent(end)+(Cent(3)-Cent(2));
    offset = ones(1,length(N))*x_pos(t,p)-1.5;
    f = fill(offset+N*-1,Cent,training.theo.colour(t,:));
    f.EdgeColor = training.theo.colour(t,:);

end % trainings task
xlim([-2 18]);
xticks(x_pos(:,1)-1);xticklabels(training.theo.label);xtickangle(30);
%ylabel('Performance (a.u.)')


% figure 2 part c
subplot('Position',[0.1 0.115 0.114 0.34]);hold on;
for t = 1:size(VAR_c,3)
    var_temp = mean(Data_figure(transfer.theo.idx.num==t,transfer.trials.post),2);
    bp(t) = prctile(var_temp,50);
    var(t) = std(var_temp)/sqrt(length(var_temp));
end

ebw = 0.1;
plot([1:5],bp,'k','Linewidth',1.5);
for t = 1:3
    plot([t t],[bp(t)-var(t) bp(t)+var(t)],'k','Linewidth',1.5);
    plot([t-ebw t+ebw],[bp(t)-var(t) bp(t)-var(t)],'k','Linewidth',1.5);
    plot([t-ebw t+ebw],[bp(t)+var(t) bp(t)+var(t)],'k','Linewidth',1.5);
    plot(t,bp(t),'s','MarkerFaceColor',transfer.theo.colour(t,:),'MarkerEdgeColor','k','MarkerSize',8);
end
xlim([0.5 3.5]);
xticklabels(transfer.theo.label);xtickangle(30);
ylabel('Transfer task PI (a.u.)');set(gca,'Fontsize',15);
box(gca,'on');


% figure 2 part d
subplot('Position',[0.35 0.115 0.2 0.34]);hold on;
x_pos = [1 2;5 9;9 16;22 23;29 30];
jit = (rand(150,1)-0.5)/3;
for t = 1:3
    p=1
    var_temp = mean(Data_figure(transfer.theo.idx.num==t,transfer.trials.post),2);
    x_pos_shift_data = -1;

    % boxplot
    bp = prctile(var_temp,[25 50 75]);
    iqr = bp(3)-bp(1);
    for b = 1:3
        plot([x_pos(t,p)-0.33 x_pos(t,p)+0.33],[bp(b) bp(b)],'Color',transfer.theo.colour(t,:),'LineWidth',2);
    end
    plot([x_pos(t,p)-0.33 x_pos(t,p)-0.33],[bp(1) bp(3)],'Color',transfer.theo.colour(t,:),'LineWidth',2);
    plot([x_pos(t,p)+0.33 x_pos(t,p)+0.33],[bp(1) bp(3)],'Color',transfer.theo.colour(t,:),'LineWidth',2);
    out = isoutlier(var_temp,'gesd');
    plot([x_pos(t,p) x_pos(t,p)],[bp(1) min(var_temp(~out))],'Color',transfer.theo.colour(t,:),'LineWidth',1);
    plot([x_pos(t,p) x_pos(t,p)],[bp(3) max(var_temp(~out))],'Color',transfer.theo.colour(t,:),'LineWidth',1);

    % data
    plot(ones(1,150)*x_pos(t,p)+x_pos_shift_data+jit,var_temp,'ko','MarkerFaceColor','k','MarkerEdgeColor','k','MarkerSize',2);

    % distribution
    if v == 1
        [N,EDGES] = histcounts(var_temp,[min(var_temp):0.5:max(var_temp)]);
        %[N,EDGES] = histcounts(var_temp,[min(var_temp):250:max(var_temp)]);
    else
        [N,EDGES] = histcounts(var_temp,[min(var_temp):0.05:max(var_temp)]);
    end

    N = smoothdata(N/max(N),'sgolay',8);
    N(2:end+1) = N;N(1)=0;N(end+1)=0;
    Cent = EDGES(1:end-1)+EDGES(2)-EDGES(1);
    Cent(2:end+1) = Cent; Cent(1) = Cent(2)-(Cent(3)-Cent(2)); Cent(end+1) = Cent(end)+(Cent(3)-Cent(2));

    offset = ones(1,length(N))*x_pos(t,p)-1.5;
    f = fill(offset+N*-1,Cent,transfer.theo.colour(t,:));
    f.EdgeColor = transfer.theo.colour(t,:);
end % trainings task
xlim([-2 10]);
xticks(x_pos(:,1)-1);xticklabels(transfer.theo.label);xtickangle(30);
%ylabel('Performance (a.u.)');
set(gca,'Fontsize',15);

annotation('line',[0.288 0.35],[0.93 0.758],'LineStyle','--');
annotation('line',[0.288 0.35],[0.59 0.66],'LineStyle','--');

annotation('line',[0.215 0.35],[0.115 0.173],'LineStyle','--');
annotation('line',[0.215 0.35],[0.453 0.22],'LineStyle','--');

annotation('textbox',[0.05 0.99 0.0001 0.001],'String','a','FitBoxToText','on','Fontsize',26,'Fontweight','bold','EdgeColor','none');
annotation('textbox',[0.05 0.515 0.0001 0.001],'String','b','FitBoxToText','on','Fontsize',26,'Fontweight','bold','EdgeColor','none');
print([PATH_OUT '/ana01_training_transfer'],'-dtiff','-r300');

% revision 1
clear var_temp
for t = 1:3
    var_temp{t} = mean(Data_figure(training.emp.idx.num==t,training.trials),2);
end
clear var_temp
for t = 1:2
    var_temp{t} = mean(Data_figure(transfer.emp.idx.num==t,transfer.trials.post),2);
end
[H,P,CI,STATS] = ttest2(var_temp{1},var_temp{2})
effect = meanEffectSize(var_temp{1},var_temp{2},Effect="cohen")

%% Figure 3 (ana02)
f1 = figure('units','normalized','outerposition',[0 0 0.7 0.6],'DefaultAxesFontSize',16);

% figure 3 part a
subplot('Position',[0.1 0.59 0.335 0.34]);hold on;
x_pos = [1 2;8 9;15 16;22 23;29 30];
for t = 1:length(training.emp.label)
    for p = 1:2
        if p ==1
            var_temp = mean(Data_figure(training.emp.idx.num==t,training.trials(1:10)),2);
            x_pos_shift_data = -1;
        else
            var_temp = mean(Data_figure(training.emp.idx.num==t,training.trials(end-9:end)),2);
            x_pos_shift_data = 1;
        end

        % boxplot
        bp = prctile(var_temp,[25 50 75]);
        iqr = bp(3)-bp(1);
        for b = 1:3
            plot([x_pos(t,p)-0.33 x_pos(t,p)+0.33],[bp(b) bp(b)],'Color',training.emp.colour(t,:),'LineWidth',2);
        end
        plot([x_pos(t,p)-0.33 x_pos(t,p)-0.33],[bp(1) bp(3)],'Color',training.emp.colour(t,:),'LineWidth',2);
        plot([x_pos(t,p)+0.33 x_pos(t,p)+0.33],[bp(1) bp(3)],'Color',training.emp.colour(t,:),'LineWidth',2);
        out = isoutlier(var_temp,'gesd');
        plot([x_pos(t,p) x_pos(t,p)],[bp(1) min(var_temp(~out))],'Color',training.emp.colour(t,:),'LineWidth',1);
        plot([x_pos(t,p) x_pos(t,p)],[bp(3) max(var_temp(~out))],'Color',training.emp.colour(t,:),'LineWidth',1);

        % data
        jit = (rand(length(var_temp),1)-0.5)/3;
        plot(ones(length(var_temp),1)*x_pos(t,p)+x_pos_shift_data+jit,var_temp,'ko','MarkerFaceColor','k','MarkerEdgeColor','k','MarkerSize',2);

        % distribution
        [N,EDGES] = histcounts(var_temp,[min(var_temp):0.1:max(var_temp)]);
        N = smoothdata(N/max(N),'sgolay',8);
        N(2:end+1) = N;N(1)=0;N(end+1)=0;
        Cent = EDGES(1:end-1)+EDGES(2)-EDGES(1);
        Cent(2:end+1) = Cent; Cent(1) = Cent(2)-(Cent(3)-Cent(2)); Cent(end+1) = Cent(end)+(Cent(3)-Cent(2));
        if p ==1
            offset = ones(1,length(N))*x_pos(t,p)-1.5;
            f = fill(offset+N*-1,Cent,training.emp.colour(t,:));
            f.EdgeColor = training.emp.colour(t,:);
        else
            offset = ones(1,length(N))*x_pos(t,p)+1.5;
            f = fill(offset+N,Cent,training.emp.colour(t,:));
            f.EdgeColor = training.emp.colour(t,:);
        end

        xlim([-2 19]);ylim([-0.5 6]);yticks([0:1:6]);
    end % time points
end % trainings task
xticks(x_pos(:,1)+0.5);xticklabels(training.emp.label);xtickangle(30)
ylabel('Training task PI (a.u.)');

annotation('textbox',[0.12 0.631 0.0001 0.001],'String','early','FitBoxToText','on','Fontsize',16,'EdgeColor','none');
annotation('textbox',[0.16 0.631 0.0001 0.001],'String','late','FitBoxToText','on','Fontsize',16,'EdgeColor','none');
annotation('textbox',[0.231 0.631 0.0001 0.001],'String','early','FitBoxToText','on','Fontsize',16,'EdgeColor','none');
annotation('textbox',[0.270 0.631 0.0001 0.001],'String','late','FitBoxToText','on','Fontsize',16,'EdgeColor','none');
annotation('textbox',[0.342 0.631 0.0001 0.001],'String','early','FitBoxToText','on','Fontsize',16,'EdgeColor','none');
annotation('textbox',[0.381 0.631 0.0001 0.001],'String','late','FitBoxToText','on','Fontsize',16,'EdgeColor','none');

% figure 3 part b
subplot('Position',[0.1 0.115 0.114 0.34]);hold on;
for t = 1:size(VAR_c,3)
    var_temp = mean(Data_figure(training.emp.idx.num==t,training.trials(1:10)),2) - mean(Data_figure(training.emp.idx.num==t,training.trials(end-9:end)),2)
    bp(t) = prctile(var_temp,50);
    var(t) = std(var_temp)/sqrt(length(var_temp));
end

ebw = 0.1;
plot([1:5],bp,'k','Linewidth',1.5);
for t = 1:3
    plot([t t],[bp(t)-var(t) bp(t)+var(t)],'k','Linewidth',1.5);
    plot([t-ebw t+ebw],[bp(t)-var(t) bp(t)-var(t)],'k','Linewidth',1.5);
    plot([t-ebw t+ebw],[bp(t)+var(t) bp(t)+var(t)],'k','Linewidth',1.5);
    plot(t,bp(t),'s','MarkerFaceColor',training.emp.colour(t,:),'MarkerEdgeColor','k','MarkerSize',8);
end
xlim([0.5 3.5]);ylim([-1.15 -0.5])
xticklabels(training.emp.label);xtickangle(30);
ylabel('Training task Δ PI (a.u.)');set(gca,'Fontsize',15);
box(gca,'on');

% figure 3 part c
subplot('Position',[0.25 0.115 0.19 0.34]);hold on;
x_pos = [1 2;5 9;9 16;13 23;17 30];
for t = 1:length(training.emp.label)
        p=1
        %var_temp = mean(LI(training.emp.idx.num==t,training.trials(1:10)),2) - mean(LI(training.emp.idx.num==t,training.trials(end-9:end)),2)
        var_temp = mean(Data_figure(training.emp.idx.num==t,training.trials(1:10)),2) - mean(Data_figure(training.emp.idx.num==t,training.trials(end-9:end)),2)
        x_pos_shift_data = -1;

        % boxplot
        bp = prctile(var_temp,[25 50 75]);
        iqr = bp(3)-bp(1);
        for b = 1:3
            plot([x_pos(t,p)-0.33 x_pos(t,p)+0.33],[bp(b) bp(b)],'Color',training.emp.colour(t,:),'LineWidth',2);
        end
        plot([x_pos(t,p)-0.33 x_pos(t,p)-0.33],[bp(1) bp(3)],'Color',training.emp.colour(t,:),'LineWidth',2);
        plot([x_pos(t,p)+0.33 x_pos(t,p)+0.33],[bp(1) bp(3)],'Color',training.emp.colour(t,:),'LineWidth',2);
        out = isoutlier(var_temp,'gesd');
        plot([x_pos(t,p) x_pos(t,p)],[bp(1) min(var_temp(~out))],'Color',training.emp.colour(t,:),'LineWidth',1);
        plot([x_pos(t,p) x_pos(t,p)],[bp(3) max(var_temp(~out))],'Color',training.emp.colour(t,:),'LineWidth',1);

        % data
        jit = (rand(length(var_temp),1)-0.5)/3;
        plot(ones(length(var_temp),1)*x_pos(t,p)+x_pos_shift_data+jit,var_temp,'ko','MarkerFaceColor','k','MarkerEdgeColor','k','MarkerSize',2);

        % distribution
        [N,EDGES] = histcounts(var_temp,[min(var_temp):0.1:max(var_temp)]);
        N = smoothdata(N/max(N),'sgolay',8);
        N(2:end+1) = N;N(1)=0;N(end+1)=0;
        Cent = EDGES(1:end-1)+EDGES(2)-EDGES(1);
        Cent(2:end+1) = Cent; Cent(1) = Cent(2)-(Cent(3)-Cent(2)); Cent(end+1) = Cent(end)+(Cent(3)-Cent(2));

        offset = ones(1,length(N))*x_pos(t,p)-1.5;
        f = fill(offset+N*-1,Cent,training.emp.colour(t,:));
        f.EdgeColor = training.emp.colour(t,:);

        xlim([-2 18]);
end % trainings task
xlim([-2 18]);
xticks(x_pos(:,1)-1);xticklabels(training.emp.label);xtickangle(30);
xlim([-2 10]);

% figure 2 part d 

annotation('line',[0.215 0.25],[0.115 0.31],'LineStyle','--');
annotation('line',[0.215 0.25],[0.453 0.345],'LineStyle','--');

annotation('textbox',[0.05 0.99 0.0001 0.001],'String','a','FitBoxToText','on','Fontsize',26,'Fontweight','bold','EdgeColor','none');
annotation('textbox',[0.05 0.515 0.0001 0.001],'String','b','FitBoxToText','on','Fontsize',26,'Fontweight','bold','EdgeColor','none');
print([PATH_OUT '/ana02_training_change'],'-dtiff','-r300');

%% Figure 4 (ana03)
clear h subj

f1 = figure('units','normalized','outerposition',[0 0 0.7 0.7],'DefaultAxesFontSize',16);

% part a
sb_idx = [1 5 9];
mks = {'o','v','s'};
for t = 1:length(training.emp.label)
    subplot(3,4,sb_idx(t));hold on;
    for tt = 1:length(transfer.emp.label)
        subj(1,:) = training.emp.idx.num == t;
        subj(2,:) = transfer.emp.idx.num == tt;

        % plot std
        plot([1 1],[squeeze(mean(Data_pca(sum(subj,1)==2,transfer.trials.pre),[1 2]))-(squeeze(std(mean(Data_pca(sum(subj,1)==2,transfer.trials.pre),2)))/sqrt(sum(sum(subj,1)==2))) squeeze(mean(Data_pca(sum(subj,1)==2,transfer.trials.pre),[1 2]))+(squeeze(std(mean(Data_pca(sum(subj,1)==2,transfer.trials.pre),2)))/sqrt(sum(sum(subj,1)==2)))],'Color',transfer.emp.colour(tt,:),'Linewidth',2)
        plot([2 2],[squeeze(mean(Data_pca(sum(subj,1)==2,transfer.trials.post),[1 2]))-(squeeze(std(mean(Data_pca(sum(subj,1)==2,transfer.trials.post),2)))/sqrt(sum(sum(subj,1)==2))) squeeze(mean(Data_pca(sum(subj,1)==2,transfer.trials.post),[1 2]))+(squeeze(std(mean(Data_pca(sum(subj,1)==2,transfer.trials.post),2)))/sqrt(sum(sum(subj,1)==2)))],'Color',transfer.emp.colour(tt,:),'Linewidth',2)

        % plot mean
        plot([1 2],[squeeze(mean(Data_pca(sum(subj,1)==2,transfer.trials.pre),[1 2])) squeeze(mean(Data_pca(sum(subj,1)==2,transfer.trials.post),[1 2]))],'Color',transfer.emp.colour(tt,:),'Linewidth',2,'Marker',mks{tt},'MarkerFaceColor',transfer.emp.colour(tt,:),'MarkerSize',8,'MarkerEdgeColor','k');
        
        if t==1
            h(tt) = plot(0,0,mks{tt},'MarkerFaceColor',transfer.emp.colour(tt,:),'MarkerSize',8,'MarkerEdgeColor','k');
        end
        %legend(h,transfer.emp.label,'Position',[0.22 0.87 0.01 0.01],'FontSize',12,'Box','off');
    end
    xlim([0.9 2.1]);xticks([1 2]);%ylim([1 3.1])
    title(training.emp.label{t});
    xticklabels([]);axis square;
    ylabel('Transfer task PI (a.u)');
    xticklabels({'pre','post'});
end

% part b) - correlation
trans_diff = squeeze(mean(Data_pca(:,transfer.trials.pre),2))-squeeze(mean(Data_pca(:,transfer.trials.post),2));
train_diff = squeeze(mean(Data_pca(:,training.trials(1:10)),2))-squeeze(mean(Data_pca(:,training.trials(end-9:end)),2));

subplot('Position',[0.41 0.105 0.288 0.51]);hold on;
plot([0 0],[-10 10],'k--');
plot([-10 10],[0 0],'k--');

% CI
VARS = [train_diff,trans_diff];
VARS_sort = sortrows(VARS,1);
mdl = fitlm(VARS_sort(:,1),VARS_sort(:,2),'linear');
[ypred,yci] = predict(mdl,VARS_sort(:,1));
plot(VARS_sort(:,1),yci(:,1),'k');
plot(VARS_sort(:,1),yci(:,2),'k');
fill([VARS_sort(:,1);flip(VARS_sort(:,1))],[yci(:,1);flip(yci(:,2))],[0.6 0.6 0.6]);

% slope 
coef = polyfit(train_diff,trans_diff,1);
plot(min(train_diff):0.1:max(train_diff),polyval(coef,min(train_diff):0.1:max(train_diff)),'k');

% data
for g = 1:size(trans_diff,1)
    plot(train_diff(g),trans_diff(g),mks{transfer.emp.idx.num(g)},'MarkerEdgeColor',transfer.emp.colour(transfer.emp.idx.num(g),:),'MarkerFaceColor',training.emp.colour(training.emp.idx.num(g),:));
end
[r,p] = corrcoef(train_diff,trans_diff)
xlabel('Training task Δ PI (a.u.)');ylabel('Transfer task Δ PI (a.u.)');


for t=1:length(training.emp.label)
    h(t) = plot([-10000 -10000],[-10001 -10001],'Color',training.emp.colour(t,:),'LineWidth',2);
end
for tt=1:length(transfer.emp.label)
    h(end+1) = plot(-10000,-10000,mks{tt},'MarkerFaceColor',transfer.emp.colour(tt,:),'MarkerSize',8,'MarkerEdgeColor','k');
end
[~,hObj] = legend(h,{'Train-I','Train-II/III','Train-IV/V','Transfer-S','Transfer-M/L'},'Location','southwest','box','off','FontSize',12);
hL = findobj(hObj,'type','line');
set(hL,'linewidth',2);
xlim([-3.55 0.2]);ylim([-1.2 0.5]);yticks([-1.2:0.4:1]);
annotation('textbox',[.41 .51 .1 .1],'string',{'r  = 0.110'},'Fontsize',12,'EdgeColor','none')
annotation('textbox',[.41 .49 .1 .1],'string',{'p = 0.019'},'Fontsize',12,'EdgeColor','none')

% part c) - distributions
subplot('Position',[0.41 0.615 0.288 0.29]);hold on;
plot([0 0],[0 8],'k--');
counter_pos = 0;
for t = 1:length(training.emp.label)
    for tt = 1:length(transfer.emp.label)
        subj(1,:) = training.emp.idx.num == t;
        subj(2,:) = transfer.emp.idx.num == tt;
        
        counter_pos = counter_pos + 1;
        var_temp = train_diff(sum(subj)==2);

            % distribution
            [N,EDGES] = histcounts(var_temp,[min(train_diff):0.05:max(train_diff)]);
            N = smoothdata(N/max(N),'sgolay',8);
            N(2:end+1) = N;N(1)=0;N(end+1)=0;
            Cent = EDGES(1:end-1)+EDGES(2)-EDGES(1);
            Cent(2:end+1) = Cent; Cent(1) = Cent(2)-(Cent(3)-Cent(2)); Cent(end+1) = Cent(end)+(Cent(3)-Cent(2));
            offset = ones(1,length(N))*counter_pos;
            f = fill(Cent,offset+N,training.emp.colour(t,:));
            f.EdgeColor = transfer.emp.colour(tt,:);f.LineWidth = 3;
    end
end
xlim([-3.55 0.2]);ylim([0.9 7]);
xticks([]);
yticks([]);

subplot('Position',[0.698 0.105 0.169 0.51]);hold on;
plot([0 8],[0 0],'k--');
counter_pos = 0;
for t = 1:length(training.emp.label)
    for tt = 1:length(transfer.emp.label)
        subj(1,:) = training.emp.idx.num == t;
        subj(2,:) = transfer.emp.idx.num == tt;
        
        counter_pos = counter_pos + 1;
        var_temp = trans_diff(sum(subj)==2);

            % distribution
            [N,EDGES] = histcounts(var_temp,[min(trans_diff):0.05:max(trans_diff)]);
            N = smoothdata(N/max(N),'sgolay',8);
            N(2:end+1) = N;N(1)=0;N(end+1)=0;
            Cent = EDGES(1:end-1)+EDGES(2)-EDGES(1);
            Cent(2:end+1) = Cent; Cent(1) = Cent(2)-(Cent(3)-Cent(2)); Cent(end+1) = Cent(end)+(Cent(3)-Cent(2));
            offset = ones(1,length(N))*counter_pos;
            f = fill(offset+N,Cent,training.emp.colour(t,:));
            f.EdgeColor = transfer.emp.colour(tt,:);f.LineWidth = 3;
    end
end
ylim([-1.2 0.5]);xlim([0.9 7]);
xticks([]);
yticks([]);

annotation('textbox',[0.075 0.99 0.0001 0.001],'String','a','FitBoxToText','on','Fontsize',26,'Fontweight','bold','EdgeColor','none');
annotation('textbox',[0.37 0.99 0.0001 0.001],'String','b','FitBoxToText','on','Fontsize',26,'Fontweight','bold','EdgeColor','none');

print([PATH_OUT '/ana03_interaction-main'],'-dtiff','-r300');

%% Design 
figure;
deg = [22.5 18 11.25 6.425 2];
N_streets = [5 6 9 15 46];

linelength = 1;
x(1) = 0;
y(1) = 0;
for i = 1:5
    subplot(1,5,i); hold on;    
    streets = [0:deg(i):90];
    
    for s = 1:length(streets)
        x(2) = x(1) + linelength * cosd(streets(s));
        y(2) = y(1) + linelength * sind(streets(s));
        plot(x,y,'k')
    end
    axis square;
    xticks([]);
    yticks([]);
end



figure;hold on;
yyaxis left
plot(deg,'Linewidth',1.5,'color','k');ylabel('Degree (°)');
for s = 1:5
    plot(s,deg(s),'o','MarkerFaceColor',training.theo.colour(s,:),'MarkerEdgeColor','k','MarkerSize',11);
end

yyaxis right
plot(N_streets,'Linewidth',1.5,'color',[1,102,94]./255);ylabel('N of streets');
for s = 1:5
    plot(s,N_streets(s),'v','MarkerFaceColor',training.theo.colour(s,:),'MarkerEdgeColor','k','MarkerSize',11);
end

ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = [1,102,94]./255;

xlabel('Training tasks');
xticks([1:1:5]);
xticklabels(training.theo.label);
xtickangle(45)
set(gca,'Fontsize',14);
axis square

%% SI figure Main effect of training task and bimanual competence

clear subj
figure;hold on;

cols = [189,189,189;99,99,99;0 0 0]./255;
m = {'s','o','v'};
sty = {'-','--',':'}

for tt = 1:3
    for t = 1:length(training.emp.label)

        subj(1,:) = training.emp.idx.num == t;
        subj(2,:) = A.data(:,2) == tt;

        temp_mean(t,tt) = nanmean(train_diff(sum(subj,1)==2));
        temp_se(t,tt) = nanstd(train_diff(sum(subj,1)==2))/sqrt(sum(sum(subj,1)==2));
    end

    plot(temp_mean(:,tt),'Color',cols(tt,:),'Linewidth',2,'Linestyle',sty{tt},'Marker',m{tt},'MarkerEdgeColor','k','MarkerFaceColor',cols(tt,:),'MarkerSize',10);

end
xticks([1 2 3]);xlim([0.5 3.5]);xticklabels({'Train-I','Train-II/III','Train-IV/V'});
ylabel('Training task Δ PI (a.u.)');
set(gca,'Fontsize',16)
legend({'BMI = 1','BMI = 2','BMI = 3'},'Location','southeast')
print([PATH_OUT '/SI_BMI'],'-dtiff','-r300');



