function [stateItemA,stateItemB]=changeStateItemAB(stateItemA,stateItemB,pA,pB,half,index)
if index<=half   
    path=rand(1);
    T1Index=index;
    if path<pA(1)
        stateItemA(T1Index)=1;
    elseif pA(1)<=path<(pA(1)+pA(2))
        stateItemA(T1Index)=2;
    else
        stateItemA(T1Index)=3;
    end
end
 
if index>half
    path=rand(1);
    T2Index=index-half;
    if path<pB(1)
        stateItemB(T2Index)=1;
    else
        stateItemB(T2Index)=2;
    end
end

end



