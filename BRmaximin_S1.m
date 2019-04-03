%% Behaviorally Robust Maximin -- DR1
%%
% This is an exact implementation of S1 - Caballero, Lunday and Uber. It
% calculates the expected value for an M-step thinker for each action and
% then solves the resulting stochastic program using the inputed
% probability distribution. 

% Accepts  5 inputs: (1) The normal form game (i.e., payoffarray), 
% (2) the finite uncertainty set over tau, U_tau, (3) the distribution over
% the finite uncertainty set, Dist, (4) a maximum k value to, max_k & 
%(5) which agent's role we are taking (i.e, who are we in the game: agent).

% The payoff array is a multi-dimensional array of the following form: 
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
% Dist must be a vector summing to one such as Dist = [0.2,0.2,0.2,0.4]

% The output vector x provides the optimal strategy under information
% conditions S1 in terms of the probability assigned to each action. 

function [x] = BRmaximin_S1(payoffarray, U_tau, Dist, max_k, agent)


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
A=[];
b=[];
Aeq = ones(1,numactions(agent)); %Prob constraint
beq = 1;
%Find approx S2 Obj Func Coeff -- Note the negative sign b/c MATLAB minimizes
for act=1:numactions(agent)
    f(act) = -1*Dist*ExpMpayoff{agent}(:, act);
end
%Bounds on DVs
lb = zeros(1,length(Aeq));
%Solve LP
x =linprog(f,A,b,Aeq,beq,lb);

