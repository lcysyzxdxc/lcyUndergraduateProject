%颗粒度1h
Nsample=100000;
n=20;   %总结点数
k=5;    %工作结点数
life=zeros(1,Nsample);
pA=[0.26,0.26,0.48];
pB=[0.35,0.65];
for t=1:Nsample
    stateSystem=0;
    stateComp=zeros(1,n);
    stateItemA=zeros(1,n);
    stateItemB=zeros(1,n);
    while stateSystem==0
        [stateItemA,stateItemB]=changeStateItem(stateItemA,stateItemB,pA,pB,n);
        stateComp=changeStateComp(stateItemA,stateItemB);
        stateSystem=judgeSystem(stateComp);
        life(t)=life(t)+1;
        if life(t)>=90000
            break
        end
    end
    if mod(t,100)==0
        fprintf('%d sample,meanLife=%f \n',t,sum(life)/t)
    end
end