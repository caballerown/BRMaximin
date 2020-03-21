# BRMaximin 

## Purpose
Identify behaviorally robust solutions to matrix games with varying forms of uncertainty by leveraging the Cognitive Hierarchy (CH) model to describe the behavior of boundedly rational adversaries. Utilizes finite or interval-based uncertainty for the tau-parameter when uncertainty sets, probability distributions, or ambiguity sets are available. The CogHierSol() function outputs the CH model solution for a given game and tau-value, and the CogHierExpM() function provides the expected value for a given action of an M-step thinker across a set of tau values. The BRmaximin_XYZ functions find behaviorally robust strategies (BRS) for the normal form game. That is BRmaximin_R1 and BRmaximin_R2 respecitively identify BRS for finite and interval based uncertainty sets of tau. BRmaximin_S1 and BRmaximin_S2 identify BRS for discrete and beta probability distributions. Whereas, BRmaximin_DR1 and BRmaximin_DR2 find BRS for ambiguity sets over finite and interval-based uncertainty sets.

## Functions
### CogHierSol.m 
* Identifies the CH solution associated with a given game and the estimated τ value. 
* Requires inputs `payoffarray`, `tau`, `max_k`
* Outputs CHsolution

### CogHierExpM.m 
* Identifies the Expected value an M-step thinker assigns with playing each action over all τ values in discrete uncertainty set. 
* Requires inputs `payoffarray`, `tau_LB`, `tau_UB`, `tau_inc`, `max_k`
* Outputs value,tau_rng
### BRmaximin_R1.m
* Finds a behaviorally robust solution to a matrix game utilizing a discrete uncertainty set for τ.
* Requires inputs `payoffarray`, `U_tau`, `max_k`, `agent`
* Outputs x (BR solution)
### BRmaximin_S1.m
* Finds a behaviorally robust solution to a matrix game utilizing a discrete probability distribution over τ.
* Requires inputs `payoffarray`, `U_tau`, `Dist`, `max_k`, `agent`
* Outputs x (BR solution)
### BRmaximin_DR1.m
* Finds a behaviorally robust solution to a matrix game utilizing an ambiguity set of discrete probability distributions over τ.
* Requires inputs `payoffarray`, `U_tau`, `c1`,`c2`,`c3`,`c4`, `max_k`, `agent`
* Outputs x (BR solution)
### BRmaximin_R2.m
* Identifies the Expected value an M-step thinker assigns with playing each action over all τ values in continuous uncertainty set. Discretizes the interval into mesh for numerical calculation. 
* Requires inputs `payoffarray`, `tau_LB`, `tau_UB`, `tau_inc`, `max_k`, `agent`
* Outputs x (BR solution)
### BRmaximin_S2.m
* Finds a behaviorally robust solution to a matrix game utilizing some beta  probability distribution over τ. Discretizes the interval into mesh for numerical calculation.
* Requires inputs `payoffarray`, `tau_LB`, `tau_UB`, `tau_inc`, `beta_a`, `beta_b`, `max_k`, `agent`
* Outputs x (BR solution)
### BRmaximin_DR2.m
* Finds a behaviorally robust solution to a matrix game utilizing an ambiguity set of continuous probability distributions over τ. Discretizes the interval into mesh for numerical calculation.
* Requires inputs payoffarray, `tau_LB`, `tau_UB`, `tau_inc`, `c1`, `c2`, `c3`, `c4`, `max_k`, `agent`
* Outputs x (BR solution)
## Testing Codes
### StahlandWilsoCheckCH.m
* Code to check the CogHierSol code against Camerer (2004) and Stahl and Wilson results. 
### CheckCHSolCode.m
* Code to check CogHierSol with tables provided in Camerer (2004).
### CheckCHExpM.m
* Code illustrating how to use this function and displaying behavior over games in Camerer (2004). 
### StahandWilsonGames_BehavRobust.m
* Code implementing Stahl and Wilson applications in Caballero (2020)
### Chicken_BehavRobust.m
* Code implementing Chicken application in Caballero (2020)
### PD_BehavRobust.m
* Code implementing Prisoner's Dilemma application in Caballero (2020)

## Input Variables
### Payoffarray
* This is the payoff matrix for the normal form game. It should be inputted as follows: 
#### Example
`payoffarray( # of player receiving payoff, player 1 action, …., play n action)`

Matching Pennies” is represented as 

```
payoffarray(1,1,1)=1;
payoffarray(1,1,2)=0;
payoffarray(1,2,1)=0;
payoffarray(1,2,2)=1;
payoffarray(2,1,1)=0;
payoffarray(2,1,2)=1;
payoffarray(2,2,1)=1;
payoffarray(2,2,2)=0;
```

### tau_LB
* Scalar value representing lower bound of uncertainty set. Often this is 0. 
### tau_UB
* Scalar value representing upper bound of uncertainty set. 
### tau_inc
* Scalar grid spacing in the approximation of the continuous interval.
### c1
* Scalar, mean of distributions in ambiguity set (c1>=0)
### c2: 
* Scalar b/w 0 & 1, Density of probability distributions in ambiguity set b/w [c3,c4]
### c3
* Lower bound of density requirement (c3>=0) 
### c4
* Upper bound of density requirement (c4>c3)
### max_k
* Scalar representing the max k-level thinking used in the algorithm
* This is also utilized as the big M value 
### agent
* Scalar, number of the player for whom we are optimizing their choice 
### U_tau
* Vector containing all values of τ being considered
### Dist: Vector
* Discrete probability distribution over U_tau. 
* Elements correspond to one another (e.g., prob(U_tau(1)) = Dist(1) ). 
* Vector values must sum to 1. 
### beta_a
* The alpha parameter in the beta distribution under consideration
### beta_b
* The beta parameter in the beta distribution under considerdation

## Outputs
* Each output of x has a slightly different form depending on the underlying needs of the optimization formulation. 

### BRmaximin_R1.m and BRmaximin_R2.m
* x = [prob action 1, …., probaction n, BR payoff value]
### BRmaximin_S1.m and BRmaximin_S2.m
* x = [prob action 1, …., probaction n]
### BRmaximin_DR1.m and BRmaximin_DR2.m
* x = [dual variable 1, …, dual variable 3, prob action 1, …., probaction n]

## Bibtex Citation
```
@misc{Caballero2019, 
author ={Caballero, William N. and Lunday, Brian J. and Uber, Richard P.}},
title = {{Identifying Behaviorally Robust Strategies for Normal-form Games under Varying Forms of Uncertainty}},
note = {Air Force Institute of Technology: Working Paper},
year = {2020}
}
```



