function stateComp=changeStateComp(stateItemA,stateItemB)
%AB工作状态决定整体
changeMat=[0 3 1;1 5 1;2 3 4;4 4 4];
p=length(changeMat);
stateComp=changeMat(stateItemA+stateItemB*p+1);
end

