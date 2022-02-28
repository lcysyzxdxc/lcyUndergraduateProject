function [stateItemA,stateItemB,T]=changeStateItemT(stateItemA,stateItemB,pA,pB,n)
%	¸Ä×´Ì¬
lambdaA=37000;
%lambdaA=lambdaA*1.1;
lambdaB=480000;
%lambdaB=lambdaB*1.1;
T1=exprnd(lambdaA,n,1);
T2=exprnd(lambdaB,n,1);
T1min=min(T1);
T2min=min(T2);
T1Index=find(T1==T1min);
T2Index=find(T2==T2min);
if T1min<=T2min && stateItemA(T1Index)==0   
    path=rand(1);    
    if path<pA(1)
        stateItemA(T1Index)=1;
    elseif pA(1)<=path<(pA(1)+pA(2))
        stateItemA(T1Index)=2;
    else
        stateItemA(T1Index)=3;
    end
end
 
if T1min>=T2min && stateItemB(T2Index)==0
    path=rand(1);
    if path<pB(1)
        stateItemB(T2Index)=1;
    else
        stateItemB(T2Index)=2;
    end
end
T=min(T1min,T2min);
end

