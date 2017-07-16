



n=0:1/48000:1-1/48000;
m=0:pi/24000:2*pi-pi/24000
Tabla=sin(m);


for R = 1:10000
    fprintf('%d, ',Tabla(R))
end

for R = 10001:20000
    fprintf('%d, ',Tabla(R))
end
for R = 20001:30000
    fprintf('%d, ',Tabla(R))
end
for R = 30001:40000
    fprintf('%d, ',Tabla(R))
end
for R = 40001:48000
    fprintf('%d, ',Tabla(R))
end

plot(Tabla)