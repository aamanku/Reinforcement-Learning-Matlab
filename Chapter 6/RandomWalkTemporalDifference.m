function V=RandomWalkTemporalDifference(episodes,alpha,Vini)
gamma=1;
V=Vini;
for i=1:episodes
    St=4;
    while St~=7 && St~=1
        [Std,R]=environment(St);
        V(St)=V(St)+alpha*(R+gamma*V(Std)-V(St));
        St=Std;
    end
end
end