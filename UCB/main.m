clear all
Rplot=zeros([1000 1]);
epsilon=0.1;
hold on;
for sample=1:2000
    c=2;
    NA=ones([10 1]);
    mu=zeros([10 1]);
    for timestep=1:1000
        A=SelectAction(mu,c,timestep,NA);
        R=GetReward(A);
        mu(A)=mu(A)+(R-mu(A))/NA(A);
        NA(A)=NA(A)+1;
        Rplot(timestep)=Rplot(timestep)+(R-Rplot(timestep))/sample;
    end
    
end
plot(1:1000,Rplot)
ylim([-0.1 2])
xlim([-10 1000])
