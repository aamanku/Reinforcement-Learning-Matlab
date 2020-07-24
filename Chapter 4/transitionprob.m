%% TP=transitionprob(maxcars,lambdarent,lambdareturn)
%Returns transition probability matrix 

function TP=transitionprob(maxcars,lambdarent,lambdareturn)
TP=zeros([maxcars+1 maxcars+1]);%transition probability matrixxp(-lambda);
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
end



