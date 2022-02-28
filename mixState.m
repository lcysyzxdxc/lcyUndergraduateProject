function stateItemB=mixState(stateItemB1,stateItemB2)
matState=[0 0 2;0 1 2;2 2 2];
n=numel(stateItemB1);
stateItemB=zeros(1,n);
for num=1:n
    stateItemB(num)=matState(stateItemB1(num)+1,stateItemB2(num)+1);
end

