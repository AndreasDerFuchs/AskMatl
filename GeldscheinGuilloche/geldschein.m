scale=2;%sqrt(2);
xmax=floor(1900/scale);
ymax=floor(900/scale);

image=zeros(xmax,ymax,3);

f1=figure(1); cla
set(f1,'position',[1909-xmax 985-ymax xmax+10 ymax+10]);
axis([0 xmax 0 ymax]);
set(gca,'units','pixels')
set(gca,'position',[5 5 xmax+4 ymax+4])
set(gca,'xtick',[],'ytick',[])
box on
hold on

%% lines rechts
col=[130 170 160]/256;
rechts_center = xmax*0.9;
rechts_width = xmax*0.02;
tmax=70;
t=0:0.1:tmax;
for phase=(0:11)/3
    plot(rechts_center+sin(t+phase)*rechts_width,t*ymax/tmax,'Color',col)
end

%% grosse wellen
colbg=[150 166 160]/256;
col=colbg;
tmax=35;
gr_ausschlag=ymax*0.02;
t=0:0.1:tmax;
nmax=60;
for n=[-3:8 12.5 17.5 22:(nmax+3)]
    plot(t*xmax/tmax,n*ymax/nmax+cos(t)*gr_ausschlag,'Color',col, 'linewidth',1.15)
end
% die drei dickeren große wellen
for ph=(0.5:6)*2*pi/6; n=10;
    plot(t*xmax/tmax,n*ymax/nmax+(cos(t)+cos(t+ph))*gr_ausschlag,'Color',col)
end
for ph=(0.5:6)*2*pi/6; n=20;
    plot(t*xmax/tmax,n*ymax/nmax+(cos(t)+cos(t+ph))*gr_ausschlag,'Color',col)
end
col=[1 0.9 0.4];
for ph=(0.5:9)*2*pi/9; n=15;
    plot(t*xmax/tmax,n*ymax/nmax+(cos(t)+cos(t+ph))*gr_ausschlag,'Color',col)
end
%% rand1 oben und unten, der größere graue
kette_rnd=[12 8 11 7 6 7 11 8 12]' * ymax/120;
kette_rnd=repmat(kette_rnd,9,2);
nr = size(kette_rnd,1);
kette_rnd(1:end,1)=(1:nr)*xmax*1.2/nr - xmax/10;
kette_rnd=kette_feiner(kette_rnd, 0, 7);
kette_rnd=kette_gleicher(kette_rnd, 0, xmax*1.2);
kette_lin=kette_rnd; kette_lin(:,2)=0;
%plot(kette_rnd(:,1), kette_rnd(:,2), 'g.-')
%plot(kette_lin(:,1), kette_lin(:,2), 'g.-')
col=colbg;
ketten_fill(kette_lin,kette_rnd,10,10, col)

kette_lin(:,2)=ymax;
kette_rnd(:,2)=ymax-kette_rnd(:,2);
%plot(kette_rnd(:,1), kette_rnd(:,2), 'g.-')
%plot(kette_lin(:,1), kette_lin(:,2), 'g.-')
ketten_fill(kette_lin,kette_rnd,10,10, col)

%% rand2 oben und unten, der kleinere grüne
colbg=[33 99 66]/256;
kette_rnd=[1 5 4 5 6 6 5 4 5 ]' * ymax/120;
kette_rnd=repmat(kette_rnd,5,2);
nr = size(kette_rnd,1);
kette_rnd(1:end,1)=(1:nr)*xmax*1.3/nr - xmax/10;
kette_rnd=kette_feiner(kette_rnd, 0, 7);
kette_rnd=kette_gleicher(kette_rnd, 0, xmax*1.3);
kette_lin=kette_rnd; kette_lin(:,2)=0;
%plot(kette_rnd(:,1), kette_rnd(:,2), 'g.-')
%plot(kette_lin(:,1), kette_lin(:,2), 'g.-')
col=colbg;
ketten_fill(kette_lin,kette_rnd,13,7, col)

kette_lin(:,2)=ymax;
kette_rnd2=kette_rnd;
kette_rnd2(:,2)=ymax-kette_rnd2(:,2);
kette_lin(:,1)=kette_lin(:,1)-xmax*0.14;
kette_rnd2(:,1)=kette_rnd2(:,1)-xmax*0.12;
%plot(kette_rnd2(:,1), kette_rnd2(:,2), 'g.-')
%plot(kette_lin(:,1), kette_lin(:,2), 'g.-')
ketten_fill(kette_lin,kette_rnd2,13,7, col)

%% final
axis([0 xmax 0 ymax]);
dataFrame = getframe(gca);
[im,imMap] = frame2im(dataFrame);
imwrite(im(2+(1:ymax),2+(1:xmax),:),'Hintergrund_03.png');