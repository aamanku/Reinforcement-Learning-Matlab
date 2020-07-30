function [nextstate,reward]=environment(currentstate)
%T1<-A<->B<->C<->D<->E->T2
%  0   0   0   0   0  1 %reward
%1   2   3   4   5   6   7  %position
if rand<=0.5
    goleft=true;
else
    goleft=false;
end
nextstate=currentstate-1*goleft+1*(~goleft);
if nextstate==7
    reward=1;
else
    reward=0;
end
end