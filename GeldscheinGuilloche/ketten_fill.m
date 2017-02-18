function ketten_fill(k1,k2,n_pi,n_ph, col)

if nargin<5
    col=[1 0 0];
end

n=size(k1,1);
t=(1:n)'*2*pi*n_pi/n;
for ph=(0.5:n_ph)*2*pi/n_ph
    w1=(sin(t+ph)+1)/2;
    w2=1-w1;
    plot(w1.*k1(:,1)+w2.*k2(:,1), w1.*k1(:,2)+w2.*k2(:,2),'Color',col)
end