Nsample=100000;
k=5; n=20;   %工作结点数
pA=[0.26,0.26,0.48];
pB=[0.35,0.65];
pointOutput=zeros(1,n);
% resOutput=zeros(1,n);
for numOfPoint=5:20 %总结点数
    life=zeros(1,Nsample);
    for t=1:Nsample
        stateSystem=0;
        stateComp=zeros(1,numOfPoint);
        stateItemA=zeros(1,numOfPoint);
        stateItemB=zeros(1,numOfPoint);
        while stateSystem==0
            [stateItemA,stateItemB,T]=changeStateItemT(stateItemA,stateItemB,pA,pB,numOfPoint);
            stateComp=changeStateComp(stateItemA,stateItemB);
            stateSystem=judgeSystem(stateComp);
            life(t)=life(t)+T;
            if life(t)>=100000
                life(t)=100000;
                break
            end
        end
    %if mod(t,100)==0
    %    fprintf('%d sample,meanLife=%f \n',t,sum(life)/t)
    %end
    end
    pointOutput(numOfPoint)=mean(life);
    
    fprintf('numOfPoint=%d, meanLife=%f \n',numOfPoint,pointOutput(numOfPoint))
end

