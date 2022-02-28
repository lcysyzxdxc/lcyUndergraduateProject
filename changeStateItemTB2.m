function [stateItemA,stateItemB1,stateItemB2,T]=changeStateItemTB2(stateItemA,stateItemB1,stateItemB2,pA,pB,n)
%	¸Ä×´Ì¬
lambdaA=37000;
%lambdaA=lambdaA*1.1;
lambdaB=480000;
%lambdaB=lambdaB*1.1;
T1=exprnd(lambdaA,n,1);
T2=exprnd(lambdaB,n,1);
T3=exprnd(lambdaB,n,1);
T1min=min(T1);
T2min=min(T2);
T3min=min(T3);
T1Index=find(T1==T1min);
T2Index=find(T2==T2min);
T3Index=find(T3==T3min);
T=min(min(T1min,T2min),T3min);
if T1min==T && stateItemA(T1Index)==0   
    path=rand(1);    
    if path<pA(1)
        stateItemA(T1Index)=1;
    elseif pA(1)<=path<(pA(1)+pA(2))
        stateItemA(T1Index)=2;
    else
        stateItemA(T1Index)=3;
    end
end
 
if T2min==T && stateItemB1(T2Index)==0
    path=rand(1);
    if path<pB(1)
        stateItemB1(T2Index)=1;
    else
        stateItemB1(T2Index)=2;
    end
end

if T3min==T && stateItemB1(T3Index)==0
    path=rand(1);
    if path<pB(1)
        stateItemB1(T3Index)=1;
    else
        stateItemB1(T3Index)=2;
    end
end

end

