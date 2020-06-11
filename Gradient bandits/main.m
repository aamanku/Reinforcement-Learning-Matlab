clear all
Rplot=zeros([1000 1]);
epsilon=0.1;
hold on;
for sample=1:2000
    alpha=0.2;
    H=zeros([10 1]);
    R_base=0;
    for timestep=1:1000
        A=SelectAction(H);
        R=GetReward(A);
        for a=1:10
            p=exp(H(a))/(sum(exp(H)));
            if a==A
                H(a)=H(a)+alpha*(R-R_base)*(1-p);
            else
                H(a)=H(a)-alpha*(R-R_base)*(-p);
            end
        end
        R_base=R_base+(R-R_base)/timestep;
        Rplot(timestep)=Rplot(timestep)+(R-Rplot(timestep))/sample;
    end
    
end
plot(1:1000,Rplot)
ylim([-0.1 1.6])
xlim([-10 1000])
