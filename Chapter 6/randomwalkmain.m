clear all
close all
%% Monte Carlo

Vini=[0 0.5 0.5 0.5 0.5 0.5 0];
max_alpha=0.04;
max_episodes=100;
for alpha=0.01:0.01:max_alpha
rmsplot=zeros([max_episodes+1 1]);
for episodes=0:max_episodes
    Vavg=zeros([1 7]);
for runsiter=0:100
    V=RandomWalkMonteCarlo(episodes,alpha,Vini);
    Vavg=Vavg+(V-Vavg)/(runsiter+1);
end
rmsplot(episodes+1)=rms(Vavg(2:6)-[1/6 2/6 3/6 4/6 5/6]);
end
plot(0:max_episodes,rmsplot)
hold on;
end
%% Temporal Difference
Vini=[0 0.5 0.5 0.5 0.5 0.5 0];
max_alpha=0.15;
max_episodes=100;
for alpha=0.05:0.05:max_alpha
rmsplot=zeros([max_episodes+1 1]);
for episodes=0:max_episodes
    Vavg=zeros([1 7]);
for runsiter=0:100
    V=RandomWalkTemporalDifference(episodes,alpha,Vini);
    Vavg=Vavg+(V-Vavg)/(runsiter+1);
end
rmsplot(episodes+1)=rms(Vavg(2:6)-[1/6 2/6 3/6 4/6 5/6]);
end
plot(0:max_episodes,rmsplot)
hold on;
end
