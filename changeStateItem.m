function [stateItemA,stateItemB]=changeStateItem(stateItemA,stateItemB,pA,pB,n)
%	��״̬
lambdaA=1/37000;
lambdaB=1/480000;
wrongA=1-exp(-lambdaA); %A����
wrongB=1-exp(-lambdaB); %B����
changeA=(rand(1,n)<wrongA);
changeB=(rand(1,n)<wrongB);
for point=1:n
    if changeA(point)==1 && stateItemA(point)==0
        path=rand(1);
        if path<pA(1)
            stateItemA(point)=1;
        elseif pA(1)<=path<(pA(1)+pA(2))
            stateItemA(point)=2;
        else
            stateItemA(point)=3;
        end
    end
    if changeB(point)==1 && stateItemB(point)==0
        path=rand(1);
        if path<pB(1)
            stateItemB(point)=1;
        else
            stateItemB(point)=2;
        end
    end    
end

