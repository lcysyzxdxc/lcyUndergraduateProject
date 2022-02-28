Nsample=100000;
k=5;    %工作结点数
pA=[0.26,0.26,0.48];
pB=[0.35,0.65];
% resOutput=zeros(1,n);
numOfPoint=20;
life=zeros(1,Nsample);
res=zeros(1,Nsample);
for t=1:Nsample
    stateSystem=0;
    stateComp=zeros(1,numOfPoint);
    stateItemA=zeros(1,numOfPoint);
    stateItemB=zeros(1,numOfPoint);
    %stateItemB1=zeros(1,numOfPoint);
    %stateItemB2=zeros(1,numOfPoint);
    while stateSystem==0
        %[stateItemA,stateItemB1,stateItemB2,T]=changeStateItemTB2(stateItemA,stateItemB1,stateItemB2,pA,pB,numOfPoint);
        %stateItemB=mixState(stateItemB1,stateItemB2);
        [stateItemA,stateItemB,T]=changeStateItemT(stateItemA,stateItemB,pA,pB,numOfPoint);
        stateComp=changeStateComp(stateItemA,stateItemB);
        stateSystem=judgeSystem(stateComp);
        life(t)=life(t)+T;
        if life(t)>=177500
            life(t)=177500;
            break
        end
    end
end
fprintf('numOfPoint=%d, meanLife=%f \n',numOfPoint,mean(life))

