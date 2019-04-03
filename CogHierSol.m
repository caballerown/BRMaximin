%% Cognitive Hierarchy Strategy Calculation Function

% Function calculates player's strategies in Normal form game via the
% Cognitive Hierarchy Model by Camerer et al (2004).

% Accepts three inputs: (1) The normal form game (i.e., payoffarray), 
% (2) the estimated value of tau, and (3) a maximum k value to be considered.

% It outputs a vector for each player which is meant to illustrate the
% expected strategy of a population in the normal form game.

% The payoff array is a multi-dimensional array of the following form. 
% Tau and max_k are non-negative scalars.
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

function [CHsolution] = CogHierSol(payoffarray, tau, max_k)

% Determine number of players in the game
numplayers = size(payoffarray,1);

% Determine number of actions avail to each player
for player = 1:numplayers
    numactions(player) = size(payoffarray,player+1);
end

%Build Index array for the normal form game
Indexarray = cell(1,ndims(payoffarray));
numpayoffcells = numel(payoffarray);

% Determine true probability of a player being step k
for k=0:max_k
    if k < max_k
        fk(k+1) = (exp(-tau)*tau^k)/factorial(k);
    else
        fk(k+1) = 1-sum(fk);
    end
end

% Build strategy matrix for each player using k steps. Each row represents
% a k level of thought (row 1 corresponds to 0 steps, row n with n-1 steps)
% and each column value is an action. Thus, each row sums to 1. 
for player =1:numplayers
    strategy{player} = zeros(max_k, numactions(player)); 
end

% Calculate player strategoes when using each step k (0 to max_k)
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
     
        clear exppayoffperaction probofcell probabilityplay
        
        %Translate to probs of playing via Poisson rate
        rateofplay{player}(k+1, :)= fk(k+1)*strategy{player}(k+1,:);
                
    end
end

%Record final CH values of play

for player =1:numplayers
    for action = 1:numactions(player)
        accumulator = 0;
        for levelthought = 1:max_k+1
          accumulator = accumulator + rateofplay{player}(levelthought,action);
        end
        CHsolution{player}(action) = accumulator;
    end   
end



end 