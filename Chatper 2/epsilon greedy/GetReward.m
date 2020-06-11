function reward=GetReward(a)
mu=[0.2;-0.8;1.5;0.4;1.4;-1.5;-0.2;-1;0.8;-0.5];
reward=mu(a)+randn;%normally distributed 
end