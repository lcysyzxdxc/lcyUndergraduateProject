function stateSystem=judgeSystem(stateComp)
%   判断是否正常工作
a0=length(find(stateComp==0));
a1=length(find(stateComp==1));
a2=length(find(stateComp==2));
a3=length(find(stateComp==3));
a4=length(find(stateComp==4));
a5=length(find(stateComp==5));
if a5>=1 || a3>=2 || (a0+a2+a3==0) || (a0+a1+((a2+a3)>0)<5)
    stateSystem=1;
elseif a5==0 && ((a3==1 && a0+a1>=4) || (a3==0 && a0>=1 && a0+a1>=4)) || (a3==0 && a0==0 && a2>=1 && a1>=4)
    stateSystem=0;
elseif (a3+a5==0) && (a0>=1 && a0+a1==4 && a2>=1)
    pr=a2/(a0+a2);
    stateSystem=1;
    if rand(1)<pr
        stateSystem=0;
    end
end

end

