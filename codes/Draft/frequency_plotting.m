Fs=200;
Y=fftshift(fft(Data));
f= Fs*(-length(Data)/2:length(Data)/2-1)/length(Data);
subplot(2,1,1)
plot(f,abs(Y))
title('Abs Y')
subplot(2,1,2)
plot(f,unwrap(angle(Y))*180/pi)
title('Phase Y')