%%Stahl and Wilson Games - CH Exp Payoff M-Step Thinker Graphs
% The following code runs the CH model with the estimates provided by 
% Camerer (2004) in Table III on all 12 of the Stahl and Wilson games. The
% emprical results for the Stahl and Wilson games are also provided for
% comparitive purposes. 

% Action Key: T=1; M=2; B=3

%%Player 1 is Row Player, Player 2 is Column Player

%Game 1
clear payoffarray 
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

%Camerer Regressed Tau Test -- see pg878 of 2004 QJE paper
%%%Compare CamererPred{1} to Stahl and Wilson 1995 GEB paper (pg 227)
%%%Stahl & Wilson Empirical Row Player (Player 1) Obs: (7/48,40/48,1/48)
CamererPred{1} = CogHierSol(payoffarray, 2.93, 50);
SWresults{1} = [7/48,40/48,1/48];
disp('CH Solution Game 1')
celldisp(CamererPred{1}(1))
disp('CH Solution Game 2')
SWresults{1}

%%
%Game 2
clear payoffarray 
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

%Camerer Regressed Tau Test -- see pg878 of 2004 QJE paper
%%%Compare CamererPred{1} to Stahl and Wilson 1995 GEB paper (pg 227)
%%%Stahl & Wilson Empirical Row Player (Player 1) Obs: (30/48,12/48,6/48)
CamererPred{2} = CogHierSol(payoffarray, 0, 50);
SWresults{2} = [30/48,12/48,6/48];
disp('CH Solution Game 2')
celldisp(CamererPred{2}(1))
disp('Stahl & Wilsom Results Game 2')
SWresults{2}

%%
%Game 3
clear payoffarray 
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

%Camerer Regressed Tau Test -- see pg878 of 2004 QJE paper
%%%Compare CamererPred{1} to Stahl and Wilson 1995 GEB paper (pg 227)
%%%Stahl & Wilson Empirical Row Player (Player 1) Obs: (5/48,16/48,27/48)
CamererPred{3} = CogHierSol(payoffarray, 1.40, 50);
SWresults{3} = [5/48,16/48,27/48];
disp('CH Solution Game 3')
celldisp(CamererPred{3}(1))
disp('Stahl & Wilsom Results Game 3')
SWresults{3}

%%
%Game 4
clear payoffarray 
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

%Camerer Regressed Tau Test -- see pg878 of 2004 QJE paper
%%%Compare CamererPred{1} to Stahl and Wilson 1995 GEB paper (pg 227)
%%%Stahl & Wilson Empirical Row Player (Player 1) Obs: (26/48,15/48,7/48)
CamererPred{4} = CogHierSol(payoffarray, 2.34, 50);
SWresults{4} = [26/48,15/48,7/48];
disp('CH Solution Game 4')
celldisp(CamererPred{4}(1))
disp('Stahl & Wilsom Results Game 4')
SWresults{4}

%%
%Game 5
clear payoffarray 
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

%Camerer Regressed Tau Test -- see pg878 of 2004 QJE paper
%%%Compare CamererPred{1} to Stahl and Wilson 1995 GEB paper (pg 227)
%%%Stahl & Wilson Empirical Row Player (Player 1) Obs: (14/48,3/48,31/48)
CamererPred{5} = CogHierSol(payoffarray, 2.01, 50);
SWresults{5} = [14/48,3/48,31/48];
disp('CH Solution Game 5')
celldisp(CamererPred{5}(1))
disp('Stahl & Wilsom Results Game 5')
SWresults{5}

%%
%Game 6
clear payoffarray 
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

%Camerer Regressed Tau Test -- see pg878 of 2004 QJE paper
%%%Compare CamererPred{1} to Stahl and Wilson 1995 GEB paper (pg 227)
%%%Stahl & Wilson Empirical Row Player (Player 1) Obs: (11/48,20/48,17/48)
CamererPred{6} = CogHierSol(payoffarray, 0, 50);
SWresults{6} = [11/48,20/48,17/48];
disp('CH Solution Game 6')
celldisp(CamererPred{6}(1))
disp('Stahl & Wilsom Results Game 6')
SWresults{6}
%%
%Game 7
clear payoffarray 
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

%Camerer Regressed Tau Test -- see pg878 of 2004 QJE paper
%%%Compare CamererPred{1} to Stahl and Wilson 1995 GEB paper (pg 227)
%%%Stahl & Wilson Empirical Row Player (Player 1) Obs: (21/48,17/48,10/48)
CamererPred{7} = CogHierSol(payoffarray, 5.37, 50);
SWresults{7} = [21/48,17/48,10/48];
disp('CH Solution Game 7')
celldisp(CamererPred{7}(1))
disp('Stahl & Wilsom Results Game 7')
SWresults{7}

%%
%Game 8
clear payoffarray 
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


%Camerer Regressed Tau Test -- see pg878 of 2004 QJE paper
%%%Compare CamererPred{1} to Stahl and Wilson 1995 GEB paper (pg 227)
%%%Stahl & Wilson Empirical Row Player (Player 1) Obs: (12/48,12/48,24/48)
CamererPred{8} = CogHierSol(payoffarray, 0, 50);
SWresults{8} = [12/48,12/48,24/48];
disp('CH Solution Game 8')
celldisp(CamererPred{8}(1))
disp('Stahl & Wilsom Results Game 8')
SWresults{8}

%%
%Game 9
clear payoffarray 
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

%Camerer Regressed Tau Test -- see pg878 of 2004 QJE paper
%%%Compare CamererPred{1} to Stahl and Wilson 1995 GEB paper (pg 227)
%%%Stahl & Wilson Empirical Row Player (Player 1) Obs: (26/48,1/48,21/48)
CamererPred{9} = CogHierSol(payoffarray, 1.35, 50);
SWresults{9} = [26/48,1/48,21/48];
disp('CH Solution Game 9')
celldisp(CamererPred{9}(1))
disp('Stahl & Wilsom Results Game 9')
SWresults{9}

%%
%Game 10
clear payoffarray 
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

%Camerer Regressed Tau Test -- see pg878 of 2004 QJE paper
%%%Compare CamererPred{1} to Stahl and Wilson 1995 GEB paper (pg 227)
%%%Stahl & Wilson Empirical Row Player (Player 1) Obs: (39/48,3/48,6/48)
CamererPred{10} = CogHierSol(payoffarray, 11.33, 50);
SWresults{10} = [39/48,3/48,6/48];
disp('CH Solution Game 10')
celldisp(CamererPred{10}(1))
disp('Stahl & Wilsom Results Game 10')
SWresults{10}

%%
%Game 11
clear payoffarray 
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

%Camerer Regressed Tau Test -- see pg878 of 2004 QJE paper
%%%Compare CamererPred{1} to Stahl and Wilson 1995 GEB paper (pg 227)
%%%Stahl & Wilson Empirical Row Player (Player 1) Obs: (13/48,4/48,31/48)
CamererPred{11} = CogHierSol(payoffarray, 6.48, 50);
CamererPred_kmaxb4converge = CogHierSol(payoffarray, 6.48, 6);
SWresults{11} = [13/48,4/48,31/48];
disp('CH Solution Game 11')
celldisp(CamererPred{11}(1))
disp('Stahl & Wilsom Results Game 11')
SWresults{11}
disp('CH Solution Game 11 with low tau before convergence');
CamererPred_kmaxb4converge{1}

%%
%Game 12
clear payoffarray 
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

%Camerer Regressed Tau Test -- see pg878 of 2004 QJE paper
%%%Compare CamererPred{1} to Stahl and Wilson 1995 GEB paper (pg 227)
%%%Stahl & Wilson Empirical Row Player (Player 1) Obs: (26/48,3/48,19/48)
CamererPred{12} = CogHierSol(payoffarray, 1.71, 50);
SWresults{12} = [26/48,3/48,19/48];
disp('CH Solution Game 12')
celldisp(CamererPred{12}(1))
disp('Stahl & Wilsom Results Game 12')
SWresults{12}