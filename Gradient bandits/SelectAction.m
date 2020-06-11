function A=SelectAction(H)
H_max=max(H);
[mem,loc]=ismember(H,H_max);%gets the location and number of maximum mu in the list
if sum(mem)>1% if more than one maximums
    A=randsample(find(loc),1); %randomly select the action from the locations of maximum mu
else
    A=find(~(H-H_max));
end
end