%The following code tests the Chicken game under varying
%conditions of uncertainty regarding tau in the CH model. Each of the 
%behaviorally robust models of Caballero, Lunday and Uber are tested in 
%turn. 


%% Static Payoff Array - Chicken

%%%Variant 1
% payoffarray(1,1,1)=2;
% payoffarray(1,1,2)=1;
% payoffarray(1,2,1)=3;
% payoffarray(1,2,2)= 0;
% 
% payoffarray(2,1,1)=2;
% payoffarray(2,1,2)=3;
% payoffarray(2,2,1)=1;
% payoffarray(2,2,2)= 0;

%%%Variant 2
payoffarray(1,1,1)=5;
payoffarray(1,1,2)=1;
payoffarray(1,2,1)=10;
payoffarray(1,2,2)= 0;

payoffarray(2,1,1)=5;
payoffarray(2,1,2)=10;
payoffarray(2,2,1)=1;
payoffarray(2,2,2)= 0;

%% Check Point Estimate Value of Chicken
max_k=40;
tau_LB= 1.49;
tau_UB = 1.500;
tau_inc=tau_UB - tau_LB;

[value, tau_rang]=CogHierExpM(payoffarray, tau_LB, tau_UB, tau_inc, max_k)
plot(value{1})

%% 
%M-Player Expected Payoff of each action over tau-values
 
tau_LB= 0;
tau_UB = 12;
tau_inc=0.05;
max_k=40;

[value,tau_rng]=CogHierExpM(payoffarray, tau_LB, tau_UB, tau_inc, max_k)

%Via plot
plot(tau_rng, value{1})
plot(tau_rng,value{2})

%Or via scatter
%Or We can plot as a scatter plot as scatter plot
hold on
sz=6
scatter(tau_rng,value{2}(:,1),sz,'filled')
scatter(tau_rng,value{2}(:,2),sz,'filled')
ylabel('M-step Thinker Expected Payoff','fontsize',25)
xlabel('Mean Level of Thinking (\tau)','fontsize',25)
set(gcf,'color','w');
set(gca, 'FontSize', 24)
hold off

%% First Uncertainty Conditions
max_k=40;
U_tau =[0,0.5,1,1.5,2,2.5,3];
Dist = [0.02,0.1,0.15,0.46,0.15,0.1,0.02];
tau_LB= 0;
tau_UB = 12;
tau_inc=0.025;
c1 = 1.5;
c2 = 0.5;
c3 = 1;
c4= 2;
beta_a = 10; % Both dists for S1 and S2 have means of about 1.5;
beta_b = 75;        %% Also "majority" of density b/w 1 and 2

%Find R1,S1,...,DR2 solutions for column player
%Calculate the R1 Solution
R1_col{1}=BRmaximin_R1(payoffarray, U_tau, max_k,2); %Player 2= Col Player
%Calculate S1 Solution
S1_col{1}=BRmaximin_S1(payoffarray, U_tau,Dist, max_k,2); 
%Calculate DR1 Solution
DR1_col{1}=BRmaximin_DR1(payoffarray, U_tau,c1,c2,c3,c4, max_k,2); 
%Calculate the R2 Solution
R2_col{1}= BRmaximin_R2(payoffarray, tau_LB, tau_UB, tau_inc, max_k,2); 
%Calculate the S2 Solution
S2_col{1}= BRmaximin_S2(payoffarray, tau_LB, tau_UB, tau_inc, beta_a, beta_b, max_k,2); 
%Calculate the DR2 Solution
DR2_col{1}= BRmaximin_DR2(payoffarray, tau_LB, tau_UB, tau_inc,c1,c2,c3,c4, max_k,2); 

