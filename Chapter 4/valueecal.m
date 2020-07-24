%% value=valueecal(maxcars,rewardmove,discountrate,TP1,TP2,RP1,RP2,valuemat,s1,s2,action)
%Calculates the value for given action
function value=valueecal(maxcars,rewardmove,discountrate,TP1,TP2,RP1,RP2,valuemat,s1,s2,action)

a=action;
s1=min(max(s1-a,0),maxcars);%saturating the impossible
s2=min(max(s2+a,0),maxcars);%
% if s2<0 || s1<0 
%     disp('opps somethings wrong')
%     return;
% end
value=abs(a)*rewardmove; %initializing value with moving cost
for sd1=0:maxcars           %s^dash
    for sd2=0:maxcars       %
        value=value+TP1(s1+1,sd1+1)*TP2(s2+1,sd2+1)*(RP1(s1+1)+RP2(s2+1)+discountrate*valuemat(sd1+1,sd2+1)); %bellman's equation
    end
end
end
