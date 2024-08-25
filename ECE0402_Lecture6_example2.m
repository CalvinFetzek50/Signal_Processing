clear
clc

j = sqrt(-1);

T = 1;
t_max = 3*T;
t_min = -t_max;
dt = T/1000;
t = t_min : dt : t_max;
x = zeros(size(t));

figure(1)
subplot(3,1,1)
h1 = plot(t,x,'b');
axis([t_min t_max 0 1])
h2 = text(0.9*t_min, 0.9, ['aT = 0']);
xlabel('t   (sec)')
ylabel('x(t)')
title('ECE 0402 - Fourier Series for Periodic Exponential')
set(gca,'XTick',[-3*T : 0.5*T : 3*T])
set(gca,'XTickLabel',{'-3T','-5T/2','-2T','-3T/2','-T','-T/2','0','T/2','T','3T/2','2T','5T/2','3T'})

k_max = 30;
k_min = -k_max;
k = k_min : k_max;
X = zeros(size(k));

subplot(3,1,2)
h3 = stem(k,real(X),'b','filled');
xlabel('k')
ylabel('\Ree\{X_k\}')
axis([k_min k_max 0 1])

subplot(3,1,3)
h4 = stem(k,imag(X),'r','filled');
xlabel('k')
ylabel('\Imm\{X_k\}')
axis([k_min k_max -0.5 0.5])

figure(2)
subplot(3,1,1)
h5 = plot(t,x,'b');
axis([t_min t_max 0 1])
h6 = text(0.9*t_min, 0.9, ['aT = 0']);
xlabel('t   (sec)')
ylabel('x(t)')
title('ECE 0402 - Fourier Series for Periodic Exponential')
set(gca,'XTick',[-3*T : 0.5*T : 3*T])
set(gca,'XTickLabel',{'-3T','-5T/2','-2T','-3T/2','-T','-T/2','0','T/2','T','3T/2','2T','5T/2','3T'})

k_max = 30;
k_min = -k_max;
k = k_min : k_max;
X = zeros(size(k));

subplot(3,1,2)
h7 = stem(k,abs(X),'b','filled');
xlabel('k')
ylabel('|X_k|')
axis([k_min k_max 0 1])

subplot(3,1,3)
h8 = stem(k,angle(X),'r','filled');
xlabel('k')
ylabel('\angle X_k')
axis([k_min k_max -pi/2 pi/2])

for aT = 0.125 : 0.125 : 5
    a = aT/T;
    x = 0;
    for i = -3 : 2
        subset = ( abs(t-(i+0.5)*T) <= T/2 );
        t1 = t(subset) - i*T;
        x(subset) = exp(-a*t1);
    end
    
    set(h1, 'YData', x)
    set(h2, 'String', ['aT = ' num2str(aT)])
    
    X = ( 1 - exp(-aT) ) ./ ( aT + j*2*pi*k);
    set(h3,'YData', real(X))
    set(h4,'YData', imag(X))

    set(h5, 'YData', x)
    set(h6, 'String', ['aT = ' num2str(aT)])
    
    set(h7,'YData', abs(X))
    set(h8,'YData', angle(X))
    
    waitforbuttonpress
    
end