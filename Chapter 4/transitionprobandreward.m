%% [TP,RP]=transitionprobandreward(maxcars,lambdarent,lambdareturn,rentreward)
%Returns transition probability matrix and expected reward vector

function [TP,RP]=transitionprobandreward(maxcars,lambdarent,lambdareturn,rentreward)
TP=zeros([maxcars+1 maxcars+1]);%transition probability matrix
RP=zeros([maxcars+1 1]);%Expected Reward vector
poisson=@(n,lambda)((lambda^n)/factorial(n))*exp(-lambda);
%transition probability
for curstate=0:maxcars %currentstate
    for rented=0:maxcars%number of rented cars which is limited by the number of available cars
        for returned=0:maxcars %number of returned cars
            transtate=max(0,min(curstate+returned-min(rented,curstate),maxcars));%saturates the impossible
            returnp=poisson(returned,lambdareturn);
            rentp=poisson(rented,lambdarent);
            TP(curstate+1,transtate+1)=TP(curstate+1,transtate+1)+returnp*rentp;
        end
    end
end
% Expected reward
for curstate=0:maxcars
    reward=0;
    for rented=0:maxcars
        rentp=poisson(rented,lambdarent);
        reward=reward+rentreward*rentp*min(curstate,rented);
    end
    RP(curstate+1)=reward;
end
end



