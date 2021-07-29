---
title: "DSP4Linguists"
author: Leonardo Araujo
date: July 30, 2021
output: beamer_presentation
classoption: "aspectratio=169"
mainfont: DejaVuSerif.ttf
sansfont: DejaVuSans.ttf
monofont: DejaVuSansMono.ttf 
mathfont: texgyredejavu-math.otf 
<!-- copile with: pandoc -t beamer main.md --pdf-engine=xelatex -o main.pdf -->
---

# URL

![https://raw.githubusercontent.com/leolca/lectures/master/dsp4linguists/main.pdf](imgs/qrurl.png)

---

# Elements of Acoustic Phonetics

![Peter Ladefoged, Elements of Acoustic Phonetics, 1996](imgs/Ladefoged.png){ height=75% }

---

# Acoustic wave

![Acoustic wave.](imgs/awave.jpg)

<!-- Source: novotest.biz -->

---

# Analog > Digital / Digital > Analog

![ADC and DAC.](imgs/sound-adc-dac.svg)

<!-- Source: Wikimedia. -->

---

# Microphone

![Microphone polar pattern](imgs/micpolarpattern.jpg){ height=50% }

---

# Microphone

![Microphone polar pattern](imgs/micpolarpattern2.jpg){ height=50% }

---

# Headphone

![Headphone frequency response](imgs/headphone-freq-resp.png){ height=75% }

---

![Sampling.](imgs/discretization.jpg)

---

![Quantization.](imgs/quantization.jpg)

---

![Coded pulses.](imgs/pulsos-codificados.png){ height=80% }

---

![Digital pulse.](imgs/digpulse.png)

---

![Non-ideal Pulse.](imgs/nidealpulse.png){ height=50% }

---

![ADC and DAC](imgs/adconversion.png)

---

# Quantizer

![3 bits uniform quantizer](imgs/quantizer.png){ height=80% }

---

# Quantization examples

![440 Hz sin wave.](imgs/sinq.png){ height=80% }

<!--
pkg load signal
pkg load communications
fs = 8820; % Hz
f0 = 440; % Hz  (A4)
t = [0:1/fs:3]'; % vetor tempo (s)
x = sin(2*pi*f0*t);
nbits = 2;
M = 2^nbits;
xmax = 1; xmin = -1;
u_codebook = [0:M-1]' / (M - 1) * (xmax - xmin) + xmin;
u_partition = (u_codebook(1:M-1) + u_codebook(2:M))/2;
[idx, xq, d] = quantiz(x, u_partition, u_codebook);
player = audioplayer (xq, fs, 8);
play (player);


[x, fs] = audioread ('/home/leoca/ee/ufsj/aulas/audioevideo/quantization/EAgoraJose.ogg');
nbits = 1;
M = 2^nbits;
xmax = 1; xmin = -1;
u_codebook = [0:M-1]' / (M - 1) * (xmax - xmin) + xmin;
u_partition = (u_codebook(1:M-1) + u_codebook(2:M))/2;
[idx, xq, d] = quantiz(x, u_partition, u_codebook);
player = audioplayer (xq, fs, 8);
play (player);
pause (5);
stop (player);
-->

---

# Clipping

![Signal clipping](imgs/clipping.png)

<!--
% clipping
fs = 8820; % Hz
f0 = 440; % Hz  (A4)
t = [0:1/fs:3]'; % vetor tempo (s)
x = sin(2*pi*f0*t);
player = audioplayer (x, fs, 8);
play (player);
for m=0.8:-0.2:0.2,
  pause(3);
  xc = sign(x).*min(abs(x),m)./m;
  player = audioplayer (xc, fs, 8);
  play (player);
endfor

cmd = 'wget -q https://www.macmillandictionary.com/media/british/uk_pron/w/wor/word_/word_British_English_pronunciation_106225.mp3 -O /tmp/word.mp3';
system (cmd);
cmd = 'ffmpeg -i /tmp/word.mp3 -c:a libvorbis -q:a 4 -loglevel quiet -y /tmp/word.ogg';
system (cmd);
[x, fs] = audioread ('/tmp/word.ogg');
x = x./max(abs(x));
player = audioplayer (x, fs, 8);
play (player);
for m=0.8:-0.25:0.05,
  pause(3);
  xc = sign(x).*min(abs(x),m)./m;
  player = audioplayer (xc, fs, 8);
  plot(xc);
  play (player);
endfor
-->

---

# Praat clipping example

![440Hz sin wave clipped](imgs/praat-clipping.png){ height=80% }

---

# Praat clipping example - recording

![saturation](imgs/praat-clipping-rec.png){ height=75% }

---

# Fourier Series

[Simulation](https://www.compadre.org/osp/EJSS/4487/272.htm)

![Fourier Series and Sound](imgs/fouriersounds.png){ height=80% }


---

# Signals and Systems

![Resonator](imgs/resonator.png)

<!--
pkg load signal
pkg load communications
file = '/home/leoca/ee/ufsj/aulas/audioevideo/quantization/BeethovensSymphonyNo.9Scherzo.ogg';
% file = '/home/leoca/ee/ufsj/aulas/audioevideo/quantization/Goldberg_Variations_32_Aria_da_Capo_è_Fine.ogg';
% file = '/home/leoca/ee/ufsj/aulas/audioevideo/quantization/Liberdade.ogg';
[x, fs] = audioread (file);
x = x(:,1);
[b, a] = butter (8, 1/40); %1/5: fc=4410     1/10: fc=2205     1/20: fc=1102.5     1/40: fc=551 
y = filtfilt (b, a, x);
player = audioplayer (y, fs, 16);
play (player);
stop (player);
-->

---

# Vowel

[open_front_unrounded.mp3](https://web.uvic.ca/ling/resources/ipa/charts/IPAlab/IPAsounds/open_front_unrounded.mp3)

![Vowel sound (open front unrounded [a]).](imgs/sound-ex01.png){ height=80% }

---

# Pitch

![Autocorrelation](imgs/autocorrelation.png){ height=80% }

<!--
wget -q https://web.uvic.ca/ling/resources/ipa/charts/IPAlab/IPAsounds/open_front_unrounded.mp3 -O /tmp/ah.mp3
ffmpeg -i /tmp/ah.mp3 /tmp/ah.ogg 


pkg load signal
pkg load communications
[x, fs] = audioread ('/tmp/ah.ogg');
x = x(9E3:29E3); % remover silencio
x = decimate(x,5);
fs = fs/5;
t = [0:1/fs:(length(x)-1)/fs]; 
start=round(0.15*fs);
wl = round(50E-3 * fs); % 40 ms
xa = x(start:start+wl);

gconv(xa,flipud(xa),[],0)

-->

---

# LPC model

![LPC model and vocal tract](imgs/lpc-model.png){ width=100% }

---

# Vocal apparatus 

![Hideyuki Sawada's KTR voice robot [https://www.youtube.com/watch?v=qobhDJ_vEOc](https://www.youtube.com/watch?v=qobhDJ_vEOc)](imgs/sawada.jpg){ height=50% }

[vocal cord stroboscopy examination](https://www.youtube.com/watch?v=t13ftpM4rPw)

[History of Speech Synthesis](https://www.youtube.com/watch?v=G7Y3BRxQGVw)

[four people sing Kyrie eleison during laryngoscopy](https://www.youtube.com/watch?v=-XGds2GAvGQ)

---

![LPC model](imgs/lpc-model2.png){ width=75% }

synthesized example
<!-- 
play /home/leoca/ee/ufsj/aulas/audioevideo/lpc/synthesized-jose.ogg
play /home/leoca/ee/ufsj/aulas/audioevideo/lpc/synthesized-daisy.ogg
play /home/leoca/ee/ufsj/aulas/audioevideo/lpc/synthesized-liberdade.ogg

play -v 0.1 snds/ah.ogg 
play -v 0.1 snds/pulsetrain.ogg 
play -v 0.1 snds/ah_r.ogg 

wget -q https://web.uvic.ca/ling/resources/ipa/charts/IPAlab/IPAsounds/open_front_unrounded.mp3 -O /tmp/ah.mp3
ffmpeg -i /tmp/ah.mp3 /tmp/ah.ogg
wget -q http://savannah.gnu.org/support/download.php?file_id=49063 -O lpc.m

./flowgen_shimmer -r 44100 -d 3 -j 1 -s 1 -o glottalpulse.pcm
sox -t raw -c 1 -e signed-integer -b 16 -r 44100 glottalpulse.pcm glottalpulse.wav

==== Octave ====
pkg load signal
pkg load communications
[x, fs] = audioread ('/tmp/ah.ogg');
x = x(9E3:29E3); % remover silencio
x = decimate(x,5);
fs = fs/5;
t = [0:1/fs:(length(x)-1)/fs]; 
start=round(0.15*fs);
wl = round(50E-3 * fs); % 40 ms

function [pks,locs] = findpeaks(data)
% [pks,locs] = findpeaks(data)
%   find the peaks values on vector data
  n = length(data);
  locs = find([data(2:n,1) - data(1:n-1,1) < 0; 1] & [1; data(1:n-1,1) - data(2:n,1) < 0]);
  pks = data(locs);
endfunction 

[r,l] = xcorr(x(start:start+wl));
[pks,locs] = findpeaks(r(wl:end));

[_,id] = sort(pks,"descend");
T0 = locs(id(2))/fs;
f0 = 1/T0;

p = 12; % ordem do modelo
[a, g] = lpc (x, p);

function x = createpulsetrain(fs,d,f0,jit,shim)
  if jit < 0 || jit > 1, error('jitter must be in ther inverval [0,1]'); endif;
  if shim < 0 || shim > 1, error('shimmer must be in ther inverval [0,1]'); endif;
  if f0 > fs/2, error('are you crazy?'); endif;
  L = d * fs; % desired length (samples)
  i = 0; x = [];
  while(length(x) < L),
     f0r = (jit*f0)*rand + f0;
     lag = round(fs / f0r);
     x = [x  zeros(1,lag-1) (1-shim*rand)];
  endwhile
  if(length(x) > L), x = x(1:L); endif;
endfunction

sig = createpulsetrain(fs,length(x)/fs,f0,0.05,0.1);
xr = filter(1,a,sig);

audiowrite ('ah_r.ogg', xr, fs);
audiowrite ('pulsetrain.ogg', sig, fs);

-->

---

![Spectrum and LPC.](imgs/sound-ex02.png)

---

![Spectrogram.](imgs/sound-ex03.png){ height=80% }

---

# Spectrogram 

![Schematics](imgs/spectrogram_scheme.png){ height=80% }


---

# Time vs Frequency

![Uncertainty principle](imgs/spectrogram_time_freq_resolution.png){ height=60% }

---

# The Uncertainty Principle

![Heisenberg's uncertainty principle](imgs/heisenberg.jpg){ height=60% }

---

# Spectrogram

![Chirp example, from 0 to 500Hz.](imgs/chirp.png){ height=80% }

<!--
Fs=1000;
x = chirp([0:1/Fs:2],0,2,500);  # freq. sweep from 0-500 over 2 sec.
player = audioplayer (x, Fs, 16);
play (player);

step=ceil(20*Fs/1000);    # one spectral slice every 20 ms
window=ceil(100*Fs/1000); # 100 ms data window

## test of automatic plot
[S, f, t] = specgram(x);
specgram(x, 2^nextpow2(window), Fs, window, window-step);
-->

---

# Shepard Tone

![Shepard Tone](imgs/shepard.png){ height=80% }

---

## Downsampling

![Downsampling example](imgs/downsample.png){ height=50% }

---

# Downsample / Decimate

![Downsample and Decimate](imgs/downsampledecimate.png){ height=80% }


---

# Downsample / Decimate (audio example)

![Downsample and Decimate](imgs/downsampledecimate2.png){ width=100% }

<!--
Fs=44100;
x = chirp([0:1/Fs:2],0,2,4000);  # freq. sweep from 0-500 over 2 sec.
player = audioplayer (x, Fs, 16);
play (player);
step=ceil(20*(Fs)/1000);    # one spectral slice every 20 ms
window=ceil(100*(Fs)/1000); # 100 ms data window
figure; specgram(x, 2^nextpow2(window), Fs, window, window-step);

xd = downsample (x,10);
player = audioplayer (xd, Fs/10, 16);
play (player);
step=ceil(20*(Fs/10)/1000);    # one spectral slice every 20 ms
window=ceil(100*(Fs/10)/1000); # 100 ms data window
figure; specgram(xd, 2^nextpow2(window), Fs/10, window, window-step);

xd = decimate (x,10);
player = audioplayer (xd, Fs/10, 16);
play (player);
step=ceil(20*(Fs/10)/1000);    # one spectral slice every 20 ms
window=ceil(100*(Fs/10)/1000); # 100 ms data window
figure; specgram(xd, 2^nextpow2(window), Fs/10, window, window-step);
-->


---

# Hearing

* Intensity
* Pitch
* Duration
* Quality/timber

---

# Pitch metamery

![Fastl, H. & Stoll, G. Scaling of pitch strength, Hearing Research (1979): 293-301](imgs/pitchmetamery.png){ height=80% }

<!--
% https://www.szynalski.com/tone-generator/

pkg load signal
pkg load communications
fs = 44100; % Hz
t = [0:1/fs:3]'; % vetor tempo (s)

f1=440; f2=660; f3=880; x1=sin(2*pi*f1*t); x2=sin(2*pi*f2*t); x3=sin(2*pi*f3*t); x=0.8*x1+x2+0.8*x3; x=0.5*x./max(abs(x)); player = audioplayer (x, fs, 8); play (player);
x=0.5*sin(2*pi*220*t); player = audioplayer (x, fs, 8); play (player);

-->


---

# Pitch JND

![Elements of acoustic phonetics, Peter Ladefoged (1996)](imgs/pitch-jnd.png){ height=80% }

---

# Pitch scales

![Elements of acoustic phonetics, Peter Ladefoged (1996)](imgs/pitch-scales.png){ height=80% }


---

# Tonal languages

![Mandarin - ma](imgs/mandarin-ma.png)

<!--
play snds/mandarin-ma.ogg
# https://www.youtube.com/watch?v=9XRXYaHOlpo
-->

---

# Duration

* Staat /ʃtaːt/ - country; state 
* Stadt /ʃtat/ - city; town 

<!--
play snds/staat_state_country.ogg
play snds/stadt_city.ogg
-->
---

# Hearing range

![Hearing range](imgs/hearing-range.png){ height=80% }

---

# Fletcher-Munson curves

![Equal-loudness contour](imgs/fletcher.png){ height=80% }

---

# Masking

![Frequency masking](imgs/masking.png){ height=60% }


---

# Masking

![Time masking](imgs/timemasking.png){ height=60% }

---

# Musical instruments

![Frequency range of musical instruments](imgs/sndextension.png){ height=80% }

---

# Ear

![Ear](imgs/ear.png){ height=80% }

---

# Middle ear

![Middle ear](imgs/mear.png){ height=80% }

---

# Cochlea

![Cochlea and organ of Corti](imgs/cochlea.png){ height=80% }

---

![Travelling wave](imgs/cochlea2.png){ height=80% }

---

# Hair cells

![Inner (IHC) and outer hair cells (OHC)](imgs/haircells.png){ height=80% }

---

# Auditory Scene Analysis - Albert Bregman

![Stream segregation in a cycle of six tones](imgs/bregman-01.png){ height=70% }

<!-- /ms/downloads/lectures/Bregman_ASA/Track01.mp3 -->

---

![Loss of rhythmic information as a result of stream segregation](imgs/bregman-02.png){ height=70% }

<!-- /ms/downloads/lectures/Bregman_ASA/Track03.mp3 -->

---

![Fusion by common frequency change](imgs/bregman-03.png){ height=70% }

<!-- /ms/downloads/lectures/Bregman_ASA/Track11.mp3 -->

---

![Sine-wave speech](imgs/bregman-04.png){ height=70% }

<!-- /ms/downloads/lectures/Bregman_ASA/Track23.mp3 -->

---

![Role of frequency micro-modulation in voice perception](imgs/bregman-05.png){ height=70% }

<!-- /ms/downloads/lectures/Bregman_ASA/Track24.mp3 -->

---

![The picket-fence effect with speech](imgs/bregman-06.png){ height=70% }

<!-- /ms/downloads/lectures/Bregman_ASA/Track31.mp3 -->

---

# Audio file formats

![I Siegert, AF Lotz, LL Duong, A Wendemuth, Measuring the impact of audio compression on the spectral quality of speech data, 2016](imgs/audiocodecs.png)


---

# Compression ratio

![I Siegert, AF Lotz, LL Duong, A Wendemuth, Measuring the impact of audio compression on the spectral quality of speech data, 2016](imgs/audiocodecs_compressionratio.png)

---

# Compresstion error

![I Siegert, AF Lotz, LL Duong, A Wendemuth, Measuring the impact of audio compression on the spectral quality of speech data, 2016](imgs/audiocodecs_compressionerror.png)

---

# Compression ratio vs compression error

![I Siegert, AF Lotz, LL Duong, A Wendemuth, Measuring the impact of audio compression on the spectral quality of speech data, 2016](imgs/audiocodecs_compressionratio_compressionerror.png)

--- 

# Conclusion

``we recommend to use FLAC for all cases where
the accuracy matters. In cases where a slight error is acceptable, we recommend Vorbis at
500 kbit/s'' (Siegert et al 2016)

<!-- http://www.essv.de/pdf/2016_229_236.pdf -->

---

# Praat

![440Hz sin wave](imgs/praat01.png){ height=70% }

<!-- record a 440Hz sin wave 
New > Sound > Pure tone 
   check parameters
   use 44.1kHz sampling frequency

View & Edit 
   Spectrogram - settings - window length - dynamic range (from peak)

-->

---

# Praat

![1/4 sin(2 pi 880x) + 1/2 sin(2 pi 1320x) + 1/4 sin(2 pi 1760x)](imgs/praat02.png){ height=70% }

<!--
new > sound > from formula
    1/4 * sin(2*pi*880*x) + 1/2 * sin(2*pi*1320*x) + 1/4 * sin(2*pi*1760*x) 

view from 0.0125 to 0.025 and spectrogram with 0.02 window length and 40dB dynamic range
  change window length and observe the effects
-->

---

# Praat

![Filter pass Hann band](imgs/hannfilter.png){ height=80% }

---

# Praat

![f1=780, f2=980, w=100](imgs/praat02_afterfilter.png){ height=70% }

---

# Praat

![4400Hz sin wave](imgs/praat03.png){ height=70% }

<!--
record 4400 Hz sin wave with 44.1kHz sampling freq
resample to 8000Hz > result null
resample to 8820Hz > result with small modulating aliasing (see image)
Praat uses anti-asing filter
--> 

---

# Praat

![ah](imgs/praat04.png){ height=70% }

<!--
load ah.mp3 file
open > read from file
change spectrogram settings - window length 0.025 (better frequency resolution)
-->

---

# Praat

![ah](imgs/praat05.png){ height=70% }

<!--
analyze spectrum > LPC autocorrelation
  > to expectrum slice > time  0.322

-->

---

# Praat

![ah](imgs/praat06.png){ height=70% }

<!--
back to original ah
convert > resample to 8820
analyze spectrum > LPC autocorrelation
  > to expectrum slice > time  0.322
   to expectrum slice > time  0.322
-->


---

# THE END


