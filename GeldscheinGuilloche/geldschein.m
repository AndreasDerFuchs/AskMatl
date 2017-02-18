%function geldschein()

scale=1900/1300;
scale=1;
xmax=floor(1900/scale);
ymax=floor(900/scale);

f1=figure(1); cla
set(f1,'position',[1909-xmax 985-ymax xmax+10 ymax+10]);
axis([0 xmax 0 ymax]);
set(gca,'units','pixels')
set(gca,'position',[5 5 xmax+4 ymax+4])
set(gca,'xtick',[],'ytick',[])
box on
hold on

%% grosse wellen
colbg=[150 166 160]/256;
col=colbg;
tmax=35;
gr_ausschlag=ymax*0.023;
t=0:0.1:tmax;
nmax=floor(xmax/8.3);
n0=ceil(nmax*gr_ausschlag/ymax);
n1=round(nmax*0.17);
n2=round(nmax*0.24);
n3=2*n2-n1;
d=n0+1; % == Abstand der ersten liene zur Mitte des dicken Bandes
for n=[-n0:(n1-d) (n1+n2)/2 (n2+n3)/2 (n3+d):(nmax+n0)]
    plot(t*xmax/tmax,n*ymax/nmax+cos(t)*gr_ausschlag,'Color',col)
end
% die drei dickeren große wellen
for ph=(0.5:6)*2*pi/6; n=n1; % = 10, wenn nmax=60
    plot(t*xmax/tmax,n*ymax/nmax+(cos(t)+cos(t+ph))*gr_ausschlag,'Color',col)
end
for ph=(0.5:6)*2*pi/6; n=n3; % = 20, wenn nmax=60
    plot(t*xmax/tmax,n*ymax/nmax+(cos(t)+cos(t+ph))*gr_ausschlag,'Color',col)
end
col=[1 0.9 0.4];
for ph=(0.5:9)*2*pi/9; n=n2; % = 15, wenn nmax=60
    plot(t*xmax/tmax,n*ymax/nmax+(cos(t)+cos(t+ph))*gr_ausschlag,'Color',col)
end
%% rand1 oben und unten, der größere graue
colrnd=[116 148 160]/256;
col=colrnd;
kette_rnd=[12 8 11 7 6 7 11 8 12]' * ymax/120;
kette_rnd=repmat(kette_rnd,9,2);
nr = size(kette_rnd,1);
kette_rnd(1:end,1)=(1:nr)*xmax*1.2/nr - xmax/10;
kette_rnd=kette_feiner(kette_rnd, 0, 7);
kette_rnd=kette_gleicher(kette_rnd, 0, xmax*1.2);
kette_lin=kette_rnd; kette_lin(:,2)=0;
%plot(kette_rnd(:,1), kette_rnd(:,2), 'g.-')
%plot(kette_lin(:,1), kette_lin(:,2), 'g.-')
ketten_fill(kette_lin,kette_rnd,10,10, col)

kette_lin(:,2)=ymax;
kette_rnd(:,2)=ymax-kette_rnd(:,2);
%plot(kette_rnd(:,1), kette_rnd(:,2), 'g.-')
%plot(kette_lin(:,1), kette_lin(:,2), 'g.-')
ketten_fill(kette_lin,kette_rnd,10,10, col)

%% rand2 oben und unten, der kleinere grüne
col=[33 99 66]/256;
kette_rnd=0.8*[1 5 4 5 6 6 5 4 5 ]' * ymax/120;
kette_rnd=repmat(kette_rnd,7,2);
nr = size(kette_rnd,1);
kette_rnd(1:end,1)=(1:nr)*xmax*1.3/nr - xmax/10;
kette_rnd=kette_feiner(kette_rnd, 0, 8);
kette_rnd=kette_gleicher(kette_rnd, 0, xmax*1.3);
kette_lin=kette_rnd; kette_lin(:,2)=0;
kplot(kette_rnd, 'g-')
%kplot(kette_lin, 'g.-')
ketten_fill(kette_lin,kette_rnd,13,7, col)

kette_lin(:,2)=ymax;
kette_rnd2=kette_rnd;
kette_rnd2(:,2)=ymax-kette_rnd2(:,2);
kette_lin(:,1)=kette_lin(:,1)-xmax*0.14;
kette_rnd2(:,1)=kette_rnd2(:,1)-xmax*0.12;
%kplot(kette_rnd, 'r-')
kplot(kette_rnd2, 'g-')
%kplot(kette_lin, 'g.-')
ketten_fill(kette_lin,kette_rnd2,13,7, col)

%% rechter senkrechter streifen
col=colrnd;
x1=0.90*xmax;
x2=0.95*xmax;
xsf=0.85; % x-stretch faktor
ysf=0.73; % y-stretch faktor
sen_lin_li = [x1-0.0*kette_rnd(:,2) kette_rnd(:,1)*ysf];
sen_rnd_li = [x1-xsf*kette_rnd(:,2) kette_rnd(:,1)*ysf];
%kplot(sen_rnd_li, 'r.-')
%kplot(sen_lin_li, 'r-')
sen_lin_re = [x2-0.0*(kette_rnd2(:,2))      kette_rnd2(:,1)*ysf];
sen_rnd_re = [x2-xsf*(kette_rnd2(:,2)-ymax) kette_rnd2(:,1)*ysf];
%kplot(sen_rnd_re, 'g.-')
%kplot(sen_lin_re, 'g-')
sen_rnd = [sen_rnd_li; flipud(sen_rnd_re)];
patch(sen_rnd(:,1), sen_rnd(:,2), 'white', 'EdgeColor','white')
ketten_fill(sen_rnd_li,sen_lin_li,13,7, col)
ketten_fill(sen_rnd_re,sen_lin_re,13,7, col)

%% senkrechte Spaghetti rechts
col=[130 170 160]/256;
rechts_center = (x1+x2)/2;
rechts_width = (x2-x1)*0.42;
tmax=70;
t=0:0.1:tmax;
for phase=(0:11)/3
    plot(rechts_center+sin(t+phase)*rechts_width,t*ymax/tmax,'Color',col)
end

%% Rosette
% Teil 1: Mitte = Ursprung = [0 0]
ros_ausen = [ 1 9];
%ros_ausen = [ ros_ausen nach_innen(ros_ausen,2)];
ros_innen = [];
%kplot(ros_ausen,'ro-')

%% final
axis([0 xmax 0 ymax]);
dataFrame = getframe(gca);
[im,imMap] = frame2im(dataFrame);
imwrite(im(3+(1:ymax),3+(1:xmax),:),'Hintergrund_03.png');