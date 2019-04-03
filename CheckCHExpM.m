%% Checking the CogHierExpM Function with Published Results

%Check D-Day Game
 
clear payoffarray 

payoffarray(1,1,1)=0;
payoffarray(1,1,2)=1;
payoffarray(1,1,3)=1;
payoffarray(1,2,1)=0.75;
payoffarray(1,2,2)=-0.25;
payoffarray(1,2,3)=0.75;
payoffarray(1,3,1)=0.6;
payoffarray(1,3,2)=0.6;
payoffarray(1,3,3)=-0.4;

payoffarray(2,1,1)=1;
payoffarray(2,1,2)=0;
payoffarray(2,1,3)=0;
payoffarray(2,2,1)=0;
payoffarray(2,2,2)=1;
payoffarray(2,2,3)=0;
payoffarray(2,3,1)=0;
payoffarray(2,3,2)=0;
payoffarray(2,3,3)=1;

tau_LB= 0;
tau_UB = 5;
tau_inc=0.05;
max_k=30;

[value,tau_rng]=CogHierExpM(payoffarray, tau_LB, tau_UB, tau_inc, max_k);

%Via plot
%plot(tau_rng, value{1})
%plot(tau_rng,value{2})

%Or via scatter
%Or We can plot as a scatter plot as scatter plot
hold on
sz=6;
scatter(tau_rng,value{2}(:,1),sz,'filled')
scatter(tau_rng,value{2}(:,2),sz,'filled')
scatter(tau_rng,value{2}(:,3),sz,'filled')
ylabel('M-step Thinker Expected Payoff')
xlabel('Mean Level of Thinking (\tau)')
title('D-Day Game: Column Player')
lgd1 = legend({'E_M[\pi(s^1_{col}),\tau]','E_M[\pi(s^2_{col}),\tau]','E_M[\pi(s^3_{col}),\tau]'},'Location','northeastoutside','Orientation','vertical');
%ylabel('M-step Thinker Expected Payoff','fontsize',25)
%xlabel('Mean Level of Thinking (\tau)','fontsize',25)
set(gcf,'color','w');
%set(gca, 'FontSize', 24)
hold off

%% 
%%Camerer Table VI Check from 2004 CH Paper  -- Costa Gomes Game 8

clear 

payoffarray(1,1,1)=45;
payoffarray(1,1,2)=82;
payoffarray(1,2,1)=22;
payoffarray(1,2,2)=57;
payoffarray(1,3,1)=30;
payoffarray(1,3,2)=28;
payoffarray(1,4,1)=15;
payoffarray(1,4,2)=61;

payoffarray(2,1,1)=66;
payoffarray(2,1,2)=31;
payoffarray(2,2,1)=14;
payoffarray(2,2,2)=55;
payoffarray(2,3,1)=42;
payoffarray(2,3,2)=37;
payoffarray(2,4,1)=60;
payoffarray(2,4,2)=88;

tau_LB= 0;
tau_UB = 5;
tau_inc=0.05;
max_k=30;

[value,tau_rng]=CogHierExpM(payoffarray, tau_LB, tau_UB, tau_inc, max_k);

%plot(tau_rng, value{1})
%plot(tau_rng,value{2})

%Or We can plot as a scatter plot as scatter plot
sz=6;
scatter(tau_rng,value{2}(:,1),sz,'filled')
hold on
scatter(tau_rng,value{2}(:,2),sz,'filled')
title('Camerer Table VI Game - Column Player')
ylabel('M-step Thinker Expected Payoff')
xlabel('Mean Level of Thinking (\tau)')
lgd1 = legend({'E_M[\pi(s^1_{col}),\tau]','E_M[\pi(s^2_{col}),\tau]'},'Location','northeastoutside','Orientation','vertical');
%ylabel('M-step Thinker Expected Payoff','fontsize',25)
%xlabel('Mean Level of Thinking (\tau)','fontsize',25)
set(gcf,'color','w');
%set(gca, 'FontSize', 24)
hold off

%% 
%Check Table VII Camerer from 2004 CH Paper
clear 

payoffarray(1,1,1)=0;
payoffarray(1,1,2)=2;
payoffarray(1,1,3)=-1;
payoffarray(1,2,1)=2;
payoffarray(1,2,2)=0;
payoffarray(1,2,3)=-1;
payoffarray(1,3,1)=-1;
payoffarray(1,3,2)=-1;
payoffarray(1,3,3)=0;

payoffarray(2,1,1)=0;
payoffarray(2,1,2)=-2;
payoffarray(2,1,3)=1;
payoffarray(2,2,1)=-2;
payoffarray(2,2,2)=0;
payoffarray(2,2,3)=1;
payoffarray(2,3,1)=1;
payoffarray(2,3,2)=1;
payoffarray(2,3,3)=0;

tau_LB= 0;
tau_UB = 5;
tau_inc=0.05;
max_k=30;
[value,tau_rng]=CogHierExpM(payoffarray, tau_LB, tau_UB, tau_inc, max_k);

%plot(tau_rng, value{1})
%plot(tau_rng,value{2})

%Or We can plot as a scatter plot as scatter plot
sz=6;
scatter(tau_rng,value{2}(:,1),sz,'filled')
hold on
scatter(tau_rng,value{2}(:,2),sz,'filled')
scatter(tau_rng,value{2}(:,3),sz,'filled')
title('Camerer Table VII Game - Column Player')
ylabel('M-step Thinker Expected Payoff')
xlabel('Mean Level of Thinking (\tau)')
lgd1 = legend({'E_M[\pi(s^1_{col}),\tau]','E_M[\pi(s^2_{col}),\tau]','E_M[\pi(s^3_{col}),\tau]'},'Location','northeastoutside','Orientation','vertical');
%ylabel('M-step Thinker Expected Payoff','fontsize',25)
%xlabel('Mean Level of Thinking (\tau)','fontsize',25)
set(gcf,'color','w');
%set(gca, 'FontSize', 24)
hold off


%%
%Three Player Game Check
clear 

payoffarray(1,1,1,1)=10;
payoffarray(1,1,2,1)=11;
payoffarray(1,1,3,1)=11;
payoffarray(1,2,1,1)=1.75;
payoffarray(1,2,2,1)=-0.25;
payoffarray(1,2,3,1)=0.75;
payoffarray(1,3,1,1)=1.6;
payoffarray(1,3,2,1)=0.6;
payoffarray(1,3,3,1)=-0.4;
payoffarray(1,1,1,2)=0;
payoffarray(1,1,2,2)=1;
payoffarray(1,1,3,2)=1;
payoffarray(1,2,1,2)=0.75;
payoffarray(1,2,2,2)=-0.25;
payoffarray(1,2,3,2)=0.75;
payoffarray(1,3,1,2)=0.6;
payoffarray(1,3,2,2)=0.6;
payoffarray(1,3,3,2)=-0.4;
payoffarray(1,1,1,3)=0;
payoffarray(1,1,2,3)=1;
payoffarray(1,1,3,3)=1;
payoffarray(1,2,1,3)=0.75;
payoffarray(1,2,2,3)=-0.25;
payoffarray(1,2,3,3)=0.75;
payoffarray(1,3,1,3)=0.6;
payoffarray(1,3,2,3)=1.6;
payoffarray(1,3,3,3)=-0.4;

payoffarray(2,1,1,1)=1;
payoffarray(2,1,2,1)=0;
payoffarray(2,1,3,1)=0;
payoffarray(2,2,1,1)=5;
payoffarray(2,2,2,1)=1;
payoffarray(2,2,3,1)=10;
payoffarray(2,3,1,1)=0;
payoffarray(2,3,2,1)=0;
payoffarray(2,3,3,1)=1;
payoffarray(2,1,1,2)=1;
payoffarray(2,1,2,2)=0;
payoffarray(2,1,3,2)=0;
payoffarray(2,2,1,2)=0;
payoffarray(2,2,2,2)=1;
payoffarray(2,2,3,2)=0;
payoffarray(2,3,1,2)=0;
payoffarray(2,3,2,2)=0;
payoffarray(2,3,3,2)=1;
payoffarray(2,1,1,3)=2;
payoffarray(2,1,2,3)=0;
payoffarray(2,1,3,3)=-1;
payoffarray(2,2,1,3)=0;
payoffarray(2,2,2,3)=2;
payoffarray(2,2,3,3)=0;
payoffarray(2,3,1,3)=0;
payoffarray(2,3,2,3)=0;
payoffarray(2,3,3,3)=2;

payoffarray(3,1,1,1)=1;
payoffarray(3,1,2,1)=-1;
payoffarray(3,1,3,1)=0;
payoffarray(3,2,1,1)=0;
payoffarray(3,2,2,1)=1;
payoffarray(3,2,3,1)=0;
payoffarray(3,3,1,1)=-8;
payoffarray(3,3,2,1)=0;
payoffarray(3,3,3,1)=1;
payoffarray(3,1,1,2)=1;
payoffarray(3,1,2,2)=7;
payoffarray(3,1,3,2)=0;
payoffarray(3,2,1,2)=6;
payoffarray(3,2,2,2)=1;
payoffarray(3,2,3,2)=-5;
payoffarray(3,3,1,2)=0;
payoffarray(3,3,2,2)=0;
payoffarray(3,3,3,2)=1;
payoffarray(3,1,1,3)=1;
payoffarray(3,1,2,3)=0;
payoffarray(3,1,3,3)=4;
payoffarray(3,2,1,3)=0;
payoffarray(3,2,2,3)=1;
payoffarray(3,2,3,3)=5;
payoffarray(3,3,1,3)=0;
payoffarray(3,3,2,3)=10;
payoffarray(3,3,3,3)=1;

tau_LB= 0;
tau_UB = 5;
tau_inc=0.05;
max_k=30;


[value,tau_rng]=CogHierExpM(payoffarray, tau_LB, tau_UB, tau_inc, max_k);

%Via plot
%plot(tau_rng, value{1})
%plot(tau_rng,value{2})

%Or via scatter
%Or We can plot as a scatter plot as scatter plot
sz=6;
scatter(tau_rng,value{2}(:,1),sz,'filled')
hold on
scatter(tau_rng,value{2}(:,2),sz,'filled')
scatter(tau_rng,value{2}(:,3),sz,'filled')
title('A Three Player Game Example - Player 2')
ylabel('M-step Thinker Expected Payoff')
xlabel('Mean Level of Thinking (\tau)')
lgd1 = legend({'E_M[\pi(s_{P2}^{1}),\tau]','E_M[\pi(s_{P2}^{2}),\tau]','E_M[\pi(s_{P2}^{3}),\tau]'},'Location','northeastoutside','Orientation','vertical');
%ylabel('M-step Thinker Expected Payoff','fontsize',25)
%xlabel('Mean Level of Thinking (\tau)','fontsize',25)
set(gcf,'color','w');
%set(gca, 'FontSize', 24)
hold off


