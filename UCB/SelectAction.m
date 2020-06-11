function A=SelectAction(mu,c,t,NA)
eqmu=mu+c.*sqrt(log(t)./(NA));%confidence
mu_max=max(eqmu);
[mem,loc]=ismember(eqmu,mu_max);%gets the location and number of maximum mu in the list
if sum(mem)>1% if more than one maximums
    A=randsample(find(loc),1); %randomly select the action from the locations of maximum mu
else
    A=find(~(eqmu-mu_max));
end


end