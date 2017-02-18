function kplot(kette, col)
% ignoriert die dritte dimension, falls vorhanden

plot(kette(:,1), kette(:,2), col)
return
end