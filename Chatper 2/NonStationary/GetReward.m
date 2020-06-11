function reward=GetReward(t,a)
mu=[0.2;-0.8;1.5;0.4;1.4;-1.5;-0.2;-1;0.8;-0.5]+ones([10 1])*sin(t/200); %varying mean
reward=mu(a)+randn;%normally distributed 
end