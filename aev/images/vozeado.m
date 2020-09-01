[x,fs] = audioread('sa.wav');
t = [0:length(x)-1]/44100;
figure(1);

subplot(2,1,1);
w=[10E3 12E3]; plot(1000*t(w(1):w(2)),x(w(1):w(2)),'k'); xlim(1000*t(w)); xlabel('tempo (ms)'); ylabel('amplitude'); title('não vozeado');
subplot(2,1,2);
w=[23E3 25E3]; plot(1000*t(w(1):w(2)),x(w(1):w(2)),'k'); xlim(1000*t(w)); xlabel('tempo (ms)'); ylabel('amplitude'); title('vozeado');

