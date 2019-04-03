%%Checking the CogHierSoln Function with Published Results

% Each block computes CH for a given game: Table VI and VII in Camerer, as
% well as Matching Pennies and a 3 player game of our own making

%Camerer Table VI Check from 2004 CH Paper
clear payoffarray 

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

tau = 1.48; %Text seems to imply 1.73 used, but it looks like 1.48 coommon tau for mixed was used
max_k=50;
CH=CogHierSol(payoffarray, tau, max_k);
RowPlayer_TableVIgame = CH{1}
ColPlayer_TableVIgame = CH{2}

%%
%Check Table VII Camerer from 2004 CH Paper
clear payoffarray 

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

tau = 1.48; %Text does not say which \hat{tau} used... but 1.48 gives results
max_k=50;

CH= CogHierSol(payoffarray, tau, max_k);

RowPlayer_TableVIIgame = CH{1}
ColPlayer_TableVIIgame = CH{2}

%%
%Matching Pennies check
clear payoffarray 

payoffarray(1,1,1)=1;
payoffarray(1,1,2)=0;
payoffarray(1,2,1)=0;
payoffarray(1,2,2)=1;

payoffarray(2,1,1)=0;
payoffarray(2,1,2)=1;
payoffarray(2,2,1)=1;
payoffarray(2,2,2)=0;

tau = 1.48;
max_k=50;

CH= CogHierSol(payoffarray, tau, max_k);
RowPlayer_MatchingPenniesgame = CH{1}
ColPlayer_MatchingPenniesgame = CH{2}

%%
%Three Player Game Check
clear payoffarray 

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


tau = 1.48;
max_k=50;

CH = CogHierSol(payoffarray, tau, max_k);

Player1_3playergame = CH{1}
Player2_3playergame = CH{2}
Player3_3playergame = CH{2}


