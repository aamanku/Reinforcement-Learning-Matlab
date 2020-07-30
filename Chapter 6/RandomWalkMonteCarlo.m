function V=RandomWalkMonteCarlo(episodes,alpha,Vini)
V=Vini;
for i=1:episodes
    seq=[];
    St=4;
    Std=St;
    seq=[seq;Std];
    while Std~=7 && Std~=1
        [Std,R]=environment(Std);
        seq=[seq;Std];
    end
    for St=seq(1:end-1)
        V(St)=V(St)+alpha*(R-V(St));
    end    
end
