close all
clear all
clc
%% load X_train
y=zeros(6309,1);
y(4518:end,1)=1; % fall means 1
rand_num = randperm(size(X,1));
X_train = X(rand_num(1:round(0.8*length(rand_num))),:);
y_train = y(rand_num(1:round(0.8*length(rand_num))),:);

X_test = X(rand_num(round(0.8*length(rand_num))+1:end),:);
y_test = y(rand_num(round(0.8*length(rand_num))+1:end),:);
%%
Md1 = fitcsvm(X_train,y_train,'KernelFunction','linear');
%%
test_accuracy_for_iter = sum((predict(Md1,X_test) == y_test))/length(y_test)*100