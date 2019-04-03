%%Stahl and Wilson Games - CH Exp Payoff M-Step Thinker Graphs
% Implements BR strategies of each type against all 12 S&W games. 
%%
%Parameters for each Game below and for R1,S1,DR1,R2,S2,and DR2 solns
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
%% Action Key...T=1; M=2; B=3
%%Player 1 is Row Player, Player 2 is Column Player

%Game 1
payoffarray(1,1,1)=25;
payoffarray(1,1,2)=30;
payoffarray(1,1,3)=100;
payoffarray(1,2,1)= 40;
payoffarray(1,2,2)=45;
payoffarray(1,2,3)=65;
payoffarray(1,3,1)=31;
payoffarray(1,3,2)=0;
payoffarray(1,3,3)=40;

for i =1:3
    for j =1:3
        payoffarray(2,i,j)=payoffarray(1,j,i);
    end
end

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


%%
%Game 2
payoffarray(1,1,1)= 75;
payoffarray(1,1,2)=40;
payoffarray(1,1,3)=45;
payoffarray(1,2,1)=70;
payoffarray(1,2,2)=15;
payoffarray(1,2,3)=100;
payoffarray(1,3,1)=70;
payoffarray(1,3,2)=60;
payoffarray(1,3,3)=0;

for i =1:3
    for j =1:3
        payoffarray(2,i,j)=payoffarray(1,j,i);
    end
end


%Find R1,S1,...,DR2 solutions for column player
%Calculate the R1 Solution
R1_col{2}=BRmaximin_R1(payoffarray, U_tau, max_k,2); %Player 2= Col Player
%Calculate S1 Solution
S1_col{2}=BRmaximin_S1(payoffarray, U_tau,Dist, max_k,2); 
%Calculate DR1 Solution
DR1_col{2}=BRmaximin_DR1(payoffarray, U_tau,c1,c2,c3,c4, max_k,2); 
%Calculate the R2 Solution
R2_col{2}= BRmaximin_R2(payoffarray, tau_LB, tau_UB, tau_inc, max_k,2); 
%Calculate the S2 Solution
S2_col{2}= BRmaximin_S2(payoffarray, tau_LB, tau_UB, tau_inc, beta_a, beta_b, max_k,2); 
%Calculate the DR2 Solution
DR2_col{2}= BRmaximin_DR2(payoffarray, tau_LB, tau_UB, tau_inc,c1,c2,c3,c4, max_k,2); 
%%
%Game 3
payoffarray(1,1,1)= 75;
payoffarray(1,1,2)=0;
payoffarray(1,1,3)=45;
payoffarray(1,2,1)=80;
payoffarray(1,2,2)=35;
payoffarray(1,2,3)=45;
payoffarray(1,3,1)=100;
payoffarray(1,3,2)=35;
payoffarray(1,3,3)=41;

for i =1:3
    for j =1:3
        payoffarray(2,i,j)=payoffarray(1,j,i);
    end
end

%Find R1,S1,...,DR2 solutions for column player
%Calculate the R1 Solution
R1_col{3}=BRmaximin_R1(payoffarray, U_tau, max_k,2); %Player 2= Col Player
%Calculate S1 Solution
S1_col{3}=BRmaximin_S1(payoffarray, U_tau,Dist, max_k,2); 
%Calculate DR1 Solution
DR1_col{3}=BRmaximin_DR1(payoffarray, U_tau,c1,c2,c3,c4, max_k,2); 
%Calculate the R2 Solution
R2_col{3}= BRmaximin_R2(payoffarray, tau_LB, tau_UB, tau_inc, max_k,2); 
%Calculate the S2 Solution
S2_col{3}= BRmaximin_S2(payoffarray, tau_LB, tau_UB, tau_inc, beta_a, beta_b, max_k,2); 
%Calculate the DR2 Solution
DR2_col{3}= BRmaximin_DR2(payoffarray, tau_LB, tau_UB, tau_inc,c1,c2,c3,c4, max_k,2); 

%%
%Game 4
payoffarray(1,1,1)= 30;
payoffarray(1,1,2)=50;
payoffarray(1,1,3)=100;
payoffarray(1,2,1)=40;
payoffarray(1,2,2)=45;
payoffarray(1,2,3)=10;
payoffarray(1,3,1)=35;
payoffarray(1,3,2)=60;
payoffarray(1,3,3)=0;

for i =1:3
    for j =1:3
        payoffarray(2,i,j)=payoffarray(1,j,i);
    end
end

%Find R1,S1,...,DR2 solutions for column player
%Calculate the R1 Solution
R1_col{4}=BRmaximin_R1(payoffarray, U_tau, max_k,2); %Player 2= Col Player
%Calculate S1 Solution
S1_col{4}=BRmaximin_S1(payoffarray, U_tau,Dist, max_k,2); 
%Calculate DR1 Solution
DR1_col{4}=BRmaximin_DR1(payoffarray, U_tau,c1,c2,c3,c4, max_k,2); 
%Calculate the R2 Solution
R2_col{4}= BRmaximin_R2(payoffarray, tau_LB, tau_UB, tau_inc, max_k,2); 
%Calculate the S2 Solution
S2_col{4}= BRmaximin_S2(payoffarray, tau_LB, tau_UB, tau_inc, beta_a, beta_b, max_k,2); 
%Calculate the DR2 Solution
DR2_col{4}= BRmaximin_DR2(payoffarray, tau_LB, tau_UB, tau_inc,c1,c2,c3,c4, max_k,2); 

%%
%Game 5
payoffarray(1,1,1)= 10;
payoffarray(1,1,2)=100;
payoffarray(1,1,3)=40;
payoffarray(1,2,1)=0;
payoffarray(1,2,2)=70;
payoffarray(1,2,3)=50;
payoffarray(1,3,1)=20;
payoffarray(1,3,2)=50;
payoffarray(1,3,3)=60;

for i =1:3
    for j =1:3
        payoffarray(2,i,j)=payoffarray(1,j,i);
    end
end

%Find R1,S1,...,DR2 solutions for column player
%Calculate the R1 Solution
R1_col{5}=BRmaximin_R1(payoffarray, U_tau, max_k,2); %Player 2= Col Player
%Calculate S1 Solution
S1_col{5}=BRmaximin_S1(payoffarray, U_tau,Dist, max_k,2); 
%Calculate DR1 Solution
DR1_col{5}=BRmaximin_DR1(payoffarray, U_tau,c1,c2,c3,c4, max_k,2); 
%Calculate the R2 Solution
R2_col{5}= BRmaximin_R2(payoffarray, tau_LB, tau_UB, tau_inc, max_k,2); 
%Calculate the S2 Solution
S2_col{5}= BRmaximin_S2(payoffarray, tau_LB, tau_UB, tau_inc, beta_a, beta_b, max_k,2); 
%Calculate the DR2 Solution
DR2_col{5}= BRmaximin_DR2(payoffarray, tau_LB, tau_UB, tau_inc,c1,c2,c3,c4, max_k,2); 

%%
%Game 6
payoffarray(1,1,1)= 25;
payoffarray(1,1,2)=30;
payoffarray(1,1,3)=100;
payoffarray(1,2,1)=60;
payoffarray(1,2,2)=31;
payoffarray(1,2,3)=51;
payoffarray(1,3,1)=95;
payoffarray(1,3,2)=30;
payoffarray(1,3,3)=0;

for i =1:3
    for j =1:3
        payoffarray(2,i,j)=payoffarray(1,j,i);
    end
end

%Find R1,S1,...,DR2 solutions for column player
%Calculate the R1 Solution
R1_col{6}=BRmaximin_R1(payoffarray, U_tau, max_k,2); %Player 2= Col Player
%Calculate S1 Solution
S1_col{6}=BRmaximin_S1(payoffarray, U_tau,Dist, max_k,2); 
%Calculate DR1 Solution
DR1_col{6}=BRmaximin_DR1(payoffarray, U_tau,c1,c2,c3,c4, max_k,2); 
%Calculate the R2 Solution
R2_col{6}= BRmaximin_R2(payoffarray, tau_LB, tau_UB, tau_inc, max_k,2); 
%Calculate the S2 Solution
S2_col{6}= BRmaximin_S2(payoffarray, tau_LB, tau_UB, tau_inc, beta_a, beta_b, max_k,2); 
%Calculate the DR2 Solution
DR2_col{6}= BRmaximin_DR2(payoffarray, tau_LB, tau_UB, tau_inc,c1,c2,c3,c4, max_k,2); 


%%
%Game 7
payoffarray(1,1,1)= 30;
payoffarray(1,1,2)=100;
payoffarray(1,1,3)=50;
payoffarray(1,2,1)=40;
payoffarray(1,2,2)=0;
payoffarray(1,2,3)=90;
payoffarray(1,3,1)=50;
payoffarray(1,3,2)=75;
payoffarray(1,3,3)=29;

for i =1:3
    for j =1:3
        payoffarray(2,i,j)=payoffarray(1,j,i);
    end
end

%Find R1,S1,...,DR2 solutions for column player
%Calculate the R1 Solution
R1_col{7}=BRmaximin_R1(payoffarray, U_tau, max_k,2); %Player 2= Col Player
%Calculate S1 Solution
S1_col{7}=BRmaximin_S1(payoffarray, U_tau,Dist, max_k,2); 
%Calculate DR1 Solution
DR1_col{7}=BRmaximin_DR1(payoffarray, U_tau,c1,c2,c3,c4, max_k,2); 
%Calculate the R2 Solution
R2_col{7}= BRmaximin_R2(payoffarray, tau_LB, tau_UB, tau_inc, max_k,2); 
%Calculate the S2 Solution
S2_col{7}= BRmaximin_S2(payoffarray, tau_LB, tau_UB, tau_inc, beta_a, beta_b, max_k,2); 
%Calculate the DR2 Solution
DR2_col{7}= BRmaximin_DR2(payoffarray, tau_LB, tau_UB, tau_inc,c1,c2,c3,c4, max_k,2); 
%%
%Game 8
payoffarray(1,1,1)= 0;
payoffarray(1,1,2)=60;
payoffarray(1,1,3)=50;
payoffarray(1,2,1)=100;
payoffarray(1,2,2)=20;
payoffarray(1,2,3)=50;
payoffarray(1,3,1)=50;
payoffarray(1,3,2)=40;
payoffarray(1,3,3)=52;

for i =1:3
    for j =1:3
        payoffarray(2,i,j)=payoffarray(1,j,i);
    end
end

%Find R1,S1,...,DR2 solutions for column player
%Calculate the R1 Solution
R1_col{8}=BRmaximin_R1(payoffarray, U_tau, max_k,2); %Player 2= Col Player
%Calculate S1 Solution
S1_col{8}=BRmaximin_S1(payoffarray, U_tau,Dist, max_k,2); 
%Calculate DR1 Solution
DR1_col{8}=BRmaximin_DR1(payoffarray, U_tau,c1,c2,c3,c4, max_k,2); 
%Calculate the R2 Solution
R2_col{8}= BRmaximin_R2(payoffarray, tau_LB, tau_UB, tau_inc, max_k,2); 
%Calculate the S2 Solution
S2_col{8}= BRmaximin_S2(payoffarray, tau_LB, tau_UB, tau_inc, beta_a, beta_b, max_k,2); 
%Calculate the DR2 Solution
DR2_col{8}= BRmaximin_DR2(payoffarray, tau_LB, tau_UB, tau_inc,c1,c2,c3,c4, max_k,2); 

%%
%Game 9
payoffarray(1,1,1)= 40;
payoffarray(1,1,2)=100;
payoffarray(1,1,3)=65;
payoffarray(1,2,1)=33;
payoffarray(1,2,2)=25;
payoffarray(1,2,3)=65;
payoffarray(1,3,1)=80;
payoffarray(1,3,2)=0;
payoffarray(1,3,3)=65;

for i =1:3
    for j =1:3
        payoffarray(2,i,j)=payoffarray(1,j,i);
    end
end

%Find R1,S1,...,DR2 solutions for column player
%Calculate the R1 Solution
R1_col{9}=BRmaximin_R1(payoffarray, U_tau, max_k,2); %Player 2= Col Player
%Calculate S1 Solution
S1_col{9}=BRmaximin_S1(payoffarray, U_tau,Dist, max_k,2); 
%Calculate DR1 Solution
DR1_col{9}=BRmaximin_DR1(payoffarray, U_tau,c1,c2,c3,c4, max_k,2); 
%Calculate the R2 Solution
R2_col{9}= BRmaximin_R2(payoffarray, tau_LB, tau_UB, tau_inc, max_k,2); 
%Calculate the S2 Solution
S2_col{9}= BRmaximin_S2(payoffarray, tau_LB, tau_UB, tau_inc, beta_a, beta_b, max_k,2); 
%Calculate the DR2 Solution
DR2_col{9}= BRmaximin_DR2(payoffarray, tau_LB, tau_UB, tau_inc,c1,c2,c3,c4, max_k,2); 
%%
%Game 10
payoffarray(1,1,1)= 45;
payoffarray(1,1,2)=50;
payoffarray(1,1,3)=21;
payoffarray(1,2,1)=41;
payoffarray(1,2,2)=0;
payoffarray(1,2,3)=40;
payoffarray(1,3,1)=40;
payoffarray(1,3,2)=100;
payoffarray(1,3,3)=0;

for i =1:3
    for j =1:3
        payoffarray(2,i,j)=payoffarray(1,j,i);
    end
end

%Find R1,S1,...,DR2 solutions for column player
%Calculate the R1 Solution
R1_col{10}=BRmaximin_R1(payoffarray, U_tau, max_k,2); %Player 2= Col Player
%Calculate S1 Solution
S1_col{10}=BRmaximin_S1(payoffarray, U_tau,Dist, max_k,2); 
%Calculate DR1 Solution
DR1_col{10}=BRmaximin_DR1(payoffarray, U_tau,c1,c2,c3,c4, max_k,2); 
%Calculate the R2 Solution
R2_col{10}= BRmaximin_R2(payoffarray, tau_LB, tau_UB, tau_inc, max_k,2); 
%Calculate the S2 Solution
S2_col{10}= BRmaximin_S2(payoffarray, tau_LB, tau_UB, tau_inc, beta_a, beta_b, max_k,2); 
%Calculate the DR2 Solution
DR2_col{10}= BRmaximin_DR2(payoffarray, tau_LB, tau_UB, tau_inc,c1,c2,c3,c4, max_k,2); 


%%
%Game 11
payoffarray(1,1,1)= 30;
payoffarray(1,1,2)=100;
payoffarray(1,1,3)=22;
payoffarray(1,2,1)=35;
payoffarray(1,2,2)=0;
payoffarray(1,2,3)=45;
payoffarray(1,3,1)=51;
payoffarray(1,3,2)=50;
payoffarray(1,3,3)=20;

for i =1:3
    for j =1:3
        payoffarray(2,i,j)=payoffarray(1,j,i);
    end
end

%Find R1,S1,...,DR2 solutions for column player
%Calculate the R1 Solution
R1_col{11}=BRmaximin_R1(payoffarray, U_tau, max_k,2); %Player 2= Col Player
%Calculate S1 Solution
S1_col{11}=BRmaximin_S1(payoffarray, U_tau,Dist, max_k,2); 
%Calculate DR1 Solution
DR1_col{11}=BRmaximin_DR1(payoffarray, U_tau,c1,c2,c3,c4, max_k,2); 
%Calculate the R2 Solution
R2_col{11}= BRmaximin_R2(payoffarray, tau_LB, tau_UB, tau_inc, max_k,2); 
%Calculate the S2 Solution
S2_col{11}= BRmaximin_S2(payoffarray, tau_LB, tau_UB, tau_inc, beta_a, beta_b, max_k,2); 
%Calculate the DR2 Solution
DR2_col{11}= BRmaximin_DR2(payoffarray, tau_LB, tau_UB, tau_inc,c1,c2,c3,c4, max_k,2); 
%%
%Game 12
payoffarray(1,1,1)= 40;
payoffarray(1,1,2)=15;
payoffarray(1,1,3)=70;
payoffarray(1,2,1)=22;
payoffarray(1,2,2)=80;
payoffarray(1,2,3)=0;
payoffarray(1,3,1)=30;
payoffarray(1,3,2)=100;
payoffarray(1,3,3)=52;

for i =1:3
    for j =1:3
        payoffarray(2,i,j)=payoffarray(1,j,i);
    end
end

%Find R1,S1,...,DR2 solutions for column player
%Calculate the R1 Solution
R1_col{12}=BRmaximin_R1(payoffarray, U_tau, max_k,2); %Player 2= Col Player
%Calculate S1 Solution
S1_col{12}=BRmaximin_S1(payoffarray, U_tau,Dist, max_k,2); 
%Calculate DR1 Solution
DR1_col{12}=BRmaximin_DR1(payoffarray, U_tau,c1,c2,c3,c4, max_k,2); 
%Calculate the R2 Solution
R2_col{12}= BRmaximin_R2(payoffarray, tau_LB, tau_UB, tau_inc, max_k,2); 
%Calculate the S2 Solution
S2_col{12}= BRmaximin_S2(payoffarray, tau_LB, tau_UB, tau_inc, beta_a, beta_b, max_k,2); 
%Calculate the DR2 Solution
DR2_col{12}= BRmaximin_DR2(payoffarray, tau_LB, tau_UB, tau_inc,c1,c2,c3,c4, max_k,2); 