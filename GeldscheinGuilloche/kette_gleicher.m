function kette_neu=kette_gleicher(kette, ist_rund, n_neu)

if ist_rund
    kette(size(kette,1)+1,:)=kette(1,:);
end
n=size(kette,1);
if n < 4*n_neu
    warning('kette sollte feiner sein');
    kette=kette_feiner(kette,ist_rund,ceil(6*n_neu/n));
end

deltas=diff(kette);
cumlen=cumsum(sqrt(sum(deltas.^2,2)))';
cumneu=(0:(n_neu-1))*cumlen(end)/n_neu;
nn=numel(cumneu);
kette_neu=NaN(nn,size(kette,2));
for i=1:nn
    kette_neu(i,:) = kette(minidx(abs(cumlen-cumneu(i))),:);
end
return
end