
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Change the number of N users, DO NOT consider the throughput of PSU %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; clear variables; clf;
close all;
disp('Bismillah: Code generated by Khalid Ibrahim');

NN = 10;          % Total No. of Channels
l =1; 
for N=[5:2:NN]
H = N;
% SNRdb = [0:10:1000];
SNRdb = [0 10 13 14 15 16 17 18 19 20 21:1000];
SNRp1 = 10.^ (SNRdb./10);
SNRp =  SNRp1(1:N);

% bandwidth = 1000000;
bandwidth = 1;
capacity_var = bandwidth .* log2 (1+SNRp) ;     % Channel Capacity in bps
% successful_gain = 1;


%% With PSU
R = (1:500)*5;
R = R(1:N);
% Rp = [1:500]*5 ;
Rp = [1:25000]*1 ;

%%
k = 1; % Location/sub-channel of PSU
z = 1;

for rp = Rp
    R(k) = rp;
    rpp(z) = R(k)/sum(R); 
    r = R/ sum(R);
    sum(r);
    
    UwithCapacity2(l,z) = r(k) *(sum(capacity_var(2:end))  - capacity_var(2:end) * r(2:end)') ;
          z=z+1;
end
Legend(l)={strcat('N=',num2str(N))}    
% Legend(2)={'N = 4'};    
% Legend(3)={'N = 5'};    
l=l+1; % for Legend(l)
end
figure(1)
plot(Rp,UwithCapacity2,'linewidth',1.5);
% plot(UwithCapacity2,'r','linewidth',2.5,'Marker','s');
hold on;
grid on;

% figure(1)
% plot(Rp,UwithCapacity22(1:size(rpp)),'b','linewidth',0.5,'Marker','s');
% plot(UwithCapacity22(1:size(rpp)),'b','linewidth',1.5,'Marker','s');
% Legend(2)={'Without PSU'};

% title(['Do not consider the throughput of PSU. | N = ',num2str(N)]);
xlabel('Data Rate of PSU (bps)');
ylabel('Bandwidth efficiency (bps/Hz)');
legend(Legend)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2)

plot(rpp,UwithCapacity2,'linewidth',1.5);
% plot(UwithCapacity2,'r','linewidth',2.5,'Marker','s');
% xlim([0 1]);
% ylim([0 18])
hold on;
grid on;
% Legend(1)={'With PSU'};    

% figure(2)
% plot(rpp,UwithCapacity22(1:size(rpp)),'b','linewidth',0.5,'Marker','s');
% % plot(UwithCapacity22(1:size(rpp)),'b','linewidth',1.5,'Marker','s');
% Legend(2)={'Without PSU'};

% title(['Do not consider the throughput of PSU. | N = ',num2str(N)]);
xlabel('\delta ','FontSize',15,'FontWeight', 'bold');
ylabel('Bandwidth efficiency (bps/Hz)');
legend(Legend)


% close (2)
