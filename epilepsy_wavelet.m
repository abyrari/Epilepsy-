
%%Mohsen Abyari 
%%epilepsy with wavelet 

clc 
clear all
close all
path='C:\Users\Arya\Documents\MATLAB\Matlab tajhiz teb\jalase4\B\*.txt'
file=dir(path);
for i=1:length(file);
         fn=[path(1:end-5),file(i,1).name];
         x=load(fn);
         %%%Denoise
         [C,L] = wavedec(x,4,'db10');
         [thr,sorh,keepapp] = ddencmp('den','wv',x);
         x = wdencmp('gbl',C,L,'db10',4,thr,sorh,keepapp);
         
         %%%
         waveletfunction='db10';%or sym
            [C,L] = wavedec(x,8,'db10');
            %%calculation the coificients vector
            
            CD1 = detcoef(C,L,1);      %Noisy
            CD2 = detcoef(C,L,2);      %Noisy
            CD3 = detcoef(C,L,3);      %Noisy
            CD4 = detcoef(C,L,4);      %Noisy
            CD5 = detcoef(C,L,5);      %Gama
            CD6 = detcoef(C,L,6);      %%beta
            CD7 = detcoef(C,L,7);      %Alpha
            CD8 = detcoef(C,L,8);      %%theta
            CA8 = appcoef(C,L,waveletfunction,8);     %%delta
            
            
            D1 = wrcoef('d',C,L,waveletfunction,1);    %Noisy
            D2 = wrcoef('d',C,L,waveletfunction,2);    %Noisy
            D3 = wrcoef('d',C,L,waveletfunction,3);    %Noisy
            D4 = wrcoef('d',C,L,waveletfunction,4);    %Noisy
            D5 = wrcoef('d',C,L,waveletfunction,5);    %Gama
            D6 = wrcoef('d',C,L,waveletfunction,6);    %%beta
            D7 = wrcoef('d',C,L,waveletfunction,7);    %Alpha
            D8 = wrcoef('d',C,L,waveletfunction,8);    %%theta
            A8 = wrcoef('a',C,L,waveletfunction,8);    %delta
            
      f1 = FMD(D7);
      f2 = FMD(D6);
      f3 = FMD(D5);
      
      
      f4 = FMN(D7);
      f5 = FMN(D6);
      f6 = FMN(D5);
      
      f7= FR(D7);
      f8= FR(D6);
      f9= FR(D5);
      
      f10 = WL(D7);
      f11 = WL(D6);
      f12 = WL(D5);

      
      feature_normal(i,:)=[f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12];
end

path='C:\Users\Arya\Documents\MATLAB\Matlab tajhiz teb\jalase4\E\*.txt'
file=dir(path);
file=dir(path);
for i=1:length(file);
         fn=[path(1:end-5),file(i,1).name];
         x=load(fn);
         %%%Denoise
         [C,L] = wavedec(x,4,'db10');
         [thr,sorh,keepapp] = ddencmp('den','wv',x);
         x = wdencmp('gbl',C,L,'db10',4,thr,sorh,keepapp);
         
         %%%
         waveletfunction='db10';%or sym
            [C,L] = wavedec(x,8,'db10');
            %%calculation the coificients vector
            
            CD1 = detcoef(C,L,1);      %Noisy
            CD2 = detcoef(C,L,2);      %Noisy
            CD3 = detcoef(C,L,3);      %Noisy
            CD4 = detcoef(C,L,4);      %Noisy
            CD5 = detcoef(C,L,5);      %Gama
            CD6 = detcoef(C,L,6);      %%beta
            CD7 = detcoef(C,L,7);      %Alpha
            CD8 = detcoef(C,L,8);      %%theta
            CA8 = appcoef(C,L,waveletfunction,8);     %%delta
            
            
            D1 = wrcoef('d',C,L,waveletfunction,1);    %Noisy
            D2 = wrcoef('d',C,L,waveletfunction,2);    %Noisy
            D3 = wrcoef('d',C,L,waveletfunction,3);    %Noisy
            D4 = wrcoef('d',C,L,waveletfunction,4);    %Noisy
            D5 = wrcoef('d',C,L,waveletfunction,5);    %Gama
            D6 = wrcoef('d',C,L,waveletfunction,6);    %%beta
            D7 = wrcoef('d',C,L,waveletfunction,7);    %Alpha
            D8 = wrcoef('d',C,L,waveletfunction,8);    %%theta
            A8 = wrcoef('a',C,L,waveletfunction,8);    %delta
            
      f1 = FMD(D7);
      f2 = FMD(D6);
      f3 = FMD(D5);
      
      
      f4 = FMN(D7);
      f5 = FMN(D6);
      f6 = FMN(D5);
      
      f7= FR(D7);
      f8= FR(D6);
      f9= FR(D5);
      
      f10 = WL(D7);
      f11 = WL(D6);
      f12 = WL(D5);
      
     feature_epilepsy(i,:)=[f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12];
end


input=[feature_normal;feature_epilepsy];
 output=[zeros(100,1);ones(100,1)];  
%  
%  
%  
%  x = input';
% t = output';
% 
% % Choose a Training Function
% % For a list of all training functions type: help nntrain
% % 'trainlm' is usually fastest.
% % 'trainbr' takes longer but may be better for challenging problems.
% % 'trainscg' uses less memory. Suitable in low memory situations.
% trainFcn = 'trainscg';  % Scaled conjugate gradient backpropagation.
% 
% % Create a Pattern Recognition Network
% hiddenLayerSize = 4;
% net = patternnet(hiddenLayerSize, trainFcn);
% 
% % Setup Division of Data for Training, Validation, Testing
% net.divideParam.trainRatio = 80/100;
% net.divideParam.valRatio = 15/100;
% net.divideParam.testRatio = 5/100;
% 
% % Train the Network
% [net,tr] = train(net,x,t);
% 
% % Test the Network
% y = net(x);
% e = gsubtract(t,y);
% performance = perform(net,t,y)
% tind = vec2ind(t);
% yind = vec2ind(y);
% percentErrors = sum(tind ~= yind)/numel(tind);
% 
% % View the Network
% view(net)
% 
% % Plots
% % Uncomment these lines to enable various plots.
% %figure, plotperform(tr)
% %figure, plottrainstate(tr)
% %figure, ploterrhist(e)
% figure, plotconfusion(t,y)
% %figure, plotroc(t,y)


 

