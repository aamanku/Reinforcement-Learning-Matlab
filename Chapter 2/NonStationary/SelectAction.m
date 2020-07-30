function A=SelectAction(mu,epsilon)
mu_max=max(mu);
[mem,loc]=ismember(mu,mu_max);%gets the location and number of maximum mu in the list
if rand>epsilon %selecting the exploration or exploitation
    if sum(mem)>1% if more than one maximums
        A=randsample(find(loc),1); %randomly select the action from the locations of maximum mu
    else
        A=find(~(mu-mu_max));
    end
else
    A=randsample(1:size(mu),1); %randomly selects the action
end
end