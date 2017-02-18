function kette_neu=kette_feiner(kette, ist_rund, wie_oft)

if nargin<2
    ist_rund=0;
end
if nargin<3
    wie_oft=1;
end
kette2 = kette([1:end 1],:);
zwischenpunkte = (kette(1:end,:) + kette2(2:end,:))/2;
if ~ist_rund; zwischenpunkte=zwischenpunkte(1:(end-1),:); end

n = size(zwischenpunkte,1);

kette_neu = NaN(2*n, size(kette,2));
kette_neu(1:2:end,:) = (kette(1:n,:) + zwischenpunkte)/2;
kette_neu(2:2:end,:) = (kette2(2:(n+1),:) + zwischenpunkte)/2;

if wie_oft > 1
    kette_neu = kette_feiner(kette_neu, ist_rund, wie_oft-1);
end
return
end


