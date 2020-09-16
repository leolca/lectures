p1 = [0.001 : 0.001 : 0.999];
I = -(1-p1/2).*log2((2-p1)/4) - (p1/2).*log2(p1/2) - (3/2)*p1;
plot(p1,I); xlabel('p1'); ylabel('I(X;Y)');
[mI, id] = max(I);
p1(id)
ans =  0.11800
mI
mI =  1.0875
