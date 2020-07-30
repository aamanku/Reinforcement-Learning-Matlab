clear all
Rplot=zeros([1000 1]);
optiplot=zeros([1000 1]);
epsilon=0.01;
for sample=1:2000
    NA=ones([10 1]);
    mu=10*ones([10 1]);
    for timestep=1:1000
        A=SelectAction(mu,epsilon);
        R=GetReward(A);
        mu(A)=mu(A)+(R-mu(A))/NA(A);
        NA(A)=NA(A)+1;
        Rplot(timestep)=Rplot(timestep)+(R-Rplot(timestep))/sample;
        optiplot(timestep)=optiplot(timestep)+(A==3);
    end   
end
plot(1:1000,Rplot)
ylim([-2 2])
figure
plot(1:1000,optiplot/20)
ylim([0 100])
Rplot=zeros([1000 1]);
epsilon=0.1;
