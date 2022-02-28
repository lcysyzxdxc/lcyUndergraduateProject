Nsample=100000;
k=5;    %工作结点数
pA=[0.26,0.26,0.48];
pB=[0.35,0.65];
pointOutput=zeros(1,20);
% resOutput=zeros(1,n);
for numOfPoint=20:-1:5 %总结点数
    life=zeros(1,Nsample);
    lambdaA=37000;
    lambdaB=480000;
    for t=1:Nsample
        T1=exprnd(lambdaA,numOfPoint,1);
        T2=exprnd(lambdaB,numOfPoint,1);
        TAB=cat(1,T1,T2);
        [T,index]=sort(TAB);
        stateSystem=0;
        stateComp=zeros(1,numOfPoint);
        stateItemA=zeros(1,numOfPoint);
        stateItemB=zeros(1,numOfPoint);
        num=1;
        while stateSystem==0           
            [stateItemA,stateItemB]=changeStateItemAB(stateItemA,stateItemB,pA,pB,numOfPoint,index(num));
            stateComp=changeStateComp(stateItemA,stateItemB);
            stateSystem=judgeSystem(stateComp);
            life(t)=life(t)+T(num);
            if life(t)>=90000
                life(t)=90000;
                break
            end
            num=num+1;
        end
    %if mod(t,100)==0
    %    fprintf('%d sample,meanLife=%f \n',t,sum(life)/t)
    %end
    end
    pointOutput(numOfPoint)=mean(life);
    
    fprintf('numOfPoint=%d, meanLife=%f \n',numOfPoint,pointOutput(numOfPoint))
end

