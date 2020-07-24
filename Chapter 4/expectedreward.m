%% ER=[maxcars,lambdarent,rentreward]
% Expected reward vector
function ER=expectedreward(maxcars,lambdarent,rentreward)
% Expected reward vector
ER=zeros([maxcars+1 1]);%Expected Reward vector
poisson=@(n,lambda)((lambda^n)/factorial(n))*exp(-lambda);
for curstate=0:maxcars
    reward=0;
    for rented=0:maxcars
        rentp=poisson(rented,lambdarent);
        reward=reward+rentreward*rentp*min(curstate,rented);
    end
    ER(curstate+1)=reward;
end