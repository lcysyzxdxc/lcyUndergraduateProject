function stateComp=changeStateComp(stateItemA,stateItemB)
%AB����״̬��������
changeMat=[0 3 1;1 5 1;2 3 4;4 4 4];
p=length(changeMat);
stateComp=changeMat(stateItemA+stateItemB*p+1);
end

