%% Behaviorally Robust Maximin -- DR1
%%
% Function calculates expected value for large M player for each action 
% in Normal form game via the Cognitive Hierarchy Model by Camerer et al
% (2004). It is an exact implementation of DR1. 

% Accepts  inputs: (1) The normal form game (i.e., payoffarray), 
% (2) the finite uncertainty set over tau, U-tau (3) mean of the unknown 
% dist, c1 (4,5,6) the density of the distribution (c2) within some subset 
% of the uncertainty set (i.e., c3 and c4), (7) a maximum k value to be 
% considered, max_k, & (8) which agent's role we are taking 
% (i.e, who are we in the game: agent).

% The payoff array is a multi-dimensional array of the following form. 
%      [player recieving payoff, player 1 action,..., player n action]

% For example, matching pennies is represented as 
% payoffarray(1,1,1)=1
% payoffarray(1,1,2)=0
% payoffarray(1,2,1)=0
% payoffarray(1,2,2)=1
% payoffarray(2,1,1)=0
% payoffarray(2,1,2)=1
% payoffarray(2,2,1)=1
% payoffarray(2,2,2)=0

% The uncertainty set U_tau must be a vector like U_tau =[0,1,2,3]
% max_k and agent are integers are appropriate (i.e., big M and player #).
% c1 is the mean of the unknown distribution over U_tau (c1>=0)
% c2 is the density is the lower bound of the unknown dist b/w [c3,c4]
    %0<=c2<=1; c3>=0; c4>c3

% The output vector x provides the optimal strategy under information
% conditions DR1 in terms of the probability assigned to each action. 

function [x] = BRmaximin_DR1(payoffarray, U_tau, c1,c2,c3,c4, max_k, agent)


% Determine number of players in the game
numplayers = size(payoffarray,1);

% Determine number of actions avail to each player
for player = 1:numplayers
    numactions(player) = size(payoffarray,player+1);
end

%Build Index array for the normal form game
Indexarray = cell(1,ndims(payoffarray));
numpayoffcells = numel(payoffarray);

%Build index for each tau
idxM= ones(1,numplayers);

%Define ExpMpayoff variable 
numtaus = length(U_tau);
for player =1:numplayers
    ExpMpayoff{player} = zeros(numtaus,numactions(player));
end

%Loop thru all taus
for tau= U_tau
    
  %Determine true probability of a player being step k
  for k=0:max_k
    if k < max_k
        fk(k+1) = (exp(-tau)*tau^k)/factorial(k);
    else
        fk(k+1) = 1-sum(fk);
    end
  end

 %Build strategy matrix for each player using k steps. Each row represents
 %a k level of thought (row 1 corresponds to 0 steps, row n with n-1 steps)
 %and each column value is an action. Thus, each row sums to 1. 
  for player =1:numplayers
    strategy{player} = zeros(max_k, numactions(player)); 
  end

 %Calculate player strategoes when using each step k (0 to max_k)
  for k = 0:max_k
    for player=1:numplayers
        %Initialize for random level 0 thinkers
        if k == 0
            for q = 1:numactions
                strategy{player}(k+1,q) = 1/numactions(player);
            end
        end
        
    % Determine exp value of playing each strategy under k-level of thought
        if k>0
          %Zero out exp payoff for actions  
          exppayoffperaction = zeros(1,numactions(player));
          %Loop thru all perceived opponent lvl of thought
          for opplvl = 1:k
            denom = sum(fk(1:k));
            opponents = 1:numplayers;
            opponents(player) =[];
            %Find the probability that given player action... a selected
            %payoff occurs
            for cellnum = 1:numpayoffcells
                %Determine actions of all players for cell index
                [Indexarray{:}] = ind2sub(size(payoffarray), cellnum);
                cellindex = cell2mat(Indexarray);
                if cellindex(1) == player
                  %Probability of each player action in the Indexarray
                  probidx=1;
                  for otherplayer = opponents  
                    probabilityplay(probidx) = strategy{otherplayer}(opplvl, cellindex(otherplayer+1)); 
                    probidx=probidx+1;
                  end
                  %Probability payoff occurs given other player's strats
                  probofcell = (fk(opplvl)/denom) * prod(probabilityplay);
                  exppayoffperaction(cellindex(player+1)) = exppayoffperaction(cellindex(player+1)) + probofcell*payoffarray(cellnum);
                end
            end
          end
        
        % Find best strategy to play
            maxval = max(exppayoffperaction);
            idx = find(exppayoffperaction == maxval);  
            for q=1:numactions(player)
                if ismember(q,idx) == 1
                    strategy{player}(k+1,q) = 1/length(idx);
                else
                    strategy{player}(k+1,q)=0;
                end
            end
        end
        
        if k==max_k
            for action = 1:numactions(player)
              ExpMpayoff{player} (idxM(player),action) = exppayoffperaction(action);
            end
            idxM(player) =idxM(player)+1;
        end
     
        clear exppayoffperaction probofcell probabilityplay
        
        %Translate to probs of playing via Poisson rate
        rateofplay{player}(k+1, :)= fk(k+1)*strategy{player}(k+1,:);
                
    end
  end

end

%Solve LP to find agent's robust strategy
%%%% The first 3 DVs are the dual variables z_i, remaining are prob(action)
f = -1*[c1,c2,1,zeros(1,numactions(agent))]
LPactioncoeff = zeros(1,numactions(agent));
%CH constraints
% for j = 1:numactions(agent)
%     for tau_idx =1:length(U_tau)
%         LPactioncoeff(j) = LPactioncoeff(j) + ExpMpayoff{agent}(tau_idx,j);
%     end
% end

%%% Write out all constraint coeff
A_idx=1; 
for tau = U_tau
    if tau >= c3 && tau <= c4
        %A(A_idx,:) = [tau, 1, 1, -1*LPactioncoeff];  
        A(A_idx,:) = [tau, 1, 1, -1*ExpMpayoff{agent}(A_idx,:)];
    else 
       % A(A_idx,:) = [tau, 0, 1, -1*LPactioncoeff];  
       A(A_idx,:) = [tau, 1, 1, -1*ExpMpayoff{agent}(A_idx,:)];
    end 
    A_idx = A_idx+1;
end

%Prob constraints
b = zeros(1,length(U_tau));
Aeq = [0,0,0,ones(1,numactions(agent))]; %Prob constraint
beq = 1;
%Bounds on DVs ... z1 and z3 are unrestricted
lb = zeros(1,length(Aeq));
lb(1)=-inf;
lb(3)=-inf;
%Solve LP
x =linprog(f,A,b,Aeq,beq,lb);

