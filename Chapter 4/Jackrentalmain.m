%% Code for Example 4.2 Jack's Car Rental from Reinforcement Learning an Introduction 2nd by Sutton and Barto
%Written by Abhijeet Kulkarni 
%amkulk@udel.edu
clear all
close all
clc
%%
maxcars=20;
lambdarent1=3;
lambdaret1=3;
lambdarent2=4;
lambdaret2=2;
rewardrent=10;
rewardmove=-2;
maxmove=5;
discountrate=0.9;
convergencethreshold=0.1;

%%
%initializing matrices
[TP1,RP1]=transitionprobandreward(maxcars,lambdarent1,lambdaret1,rewardrent);
[TP2,RP2]=transitionprobandreward(maxcars,lambdarent2,lambdaret2,rewardrent);
valuemat=zeros(maxcars+1);
policymat=0*ones(maxcars+1);
%%
%Value iteration for estimating optimal policy
iterpolicyimprove=0;
iterpolicyeval=0;
converror=99;
figure('Name','Value Iteration')
while converror>=convergencethreshold
    previousvaluemat=valuemat;
    for s1=0:maxcars
        for s2=0:maxcars
            amin=max(-maxmove,-s2);%getting the possible action
            amax=min(maxmove,s1);%
            best=[amin;valueecal(maxcars,rewardmove,discountrate,TP1,TP2,RP1,RP2, valuemat,s1,s2,amin)];
            for a=amin+1:amax
                tempval=valueecal(maxcars,rewardmove,discountrate,TP1,TP2,RP1,RP2, valuemat,s1,s2,a);
                if tempval>best(2)
                    best(1)=a;
                    best(2)=tempval;
                end
            end
            valuemat(s1+1,s2+1)=best(2);
        end
    end
    [x,y]=meshgrid(0:20,0:20);
    surf(x,y,valuemat)
    drawnow limitrate
    xlabel('#Cars at second location')
    ylabel('#Cars at first location')
    converror=max(max(abs(previousvaluemat-valuemat)));
    fprintf('Iteration = %d | ConvergenceError = %s \n',iterpolicyeval,max(max(abs(previousvaluemat-valuemat))))
    iterpolicyeval=iterpolicyeval+1;
end

%%
%Outputting Deterministic policy
for s1=0:maxcars
    for s2=0:maxcars
        amin=max(-maxmove,-s2);
        amax=min(maxmove,s1);
        best=[amin;valueecal(maxcars,rewardmove,discountrate,TP1,TP2,RP1,RP2, valuemat,s1,s2,amin)];
        for a=amin+1:amax
            tempval=valueecal(maxcars,rewardmove,discountrate,TP1,TP2,RP1,RP2, valuemat,s1,s2,a);
            if tempval>best(2)
                best(1)=a;
                best(2)=tempval;
            end
            
        end
        policymat(s1+1,s2+1)=best(1);
    end
end
%plotting
figure('Name','Optimal Policy')
imagesc(policymat)
set(gca,'YDir','normal');
colorbar
