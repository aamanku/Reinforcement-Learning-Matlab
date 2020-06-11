clear all
Rplot=zeros([1000 1]);
epsilon=0.1;
hold on;
for sample=1:2000
    NA=ones([10 1]);
    mu=zeros([10 1]);
    mu_1=mu;
    alpha=0.3;
    R=zeros([1000 10]);
    for timestep=1:1000
        A=SelectAction(mu,epsilon);
        R(NA(A),A)=GetReward(timestep,A);
        mu(A)=(1-alpha)^(NA(A))*mu_1(A);
        for i=1:NA(A)
            mu(A)=mu(A)+alpha*(1-alpha)^(NA(A)-i)*(R(i,A));
        end
        NA(A)=NA(A)+1;
        Rplot(timestep)=Rplot(timestep)+(R(NA(A)-1,A)-Rplot(timestep))/sample;
    end
    
end
plot(1:1000,Rplot)
ylim([-0.1 2.7])
xlim([-10 1000])
