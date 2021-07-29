# tom puro 440Hz
- gravar tom puro 440Hz com duração de 2s
- visualizar e escutar
- multiplicar por 15
- salvar em .wav
- abrir o arquivo salvo
- visualizar e escutar

> Praat History
Create Sound as pure tone: "tone", 1, 0, 1, 44100, 440, 0.2, 0.01, 0.01
View & Edit
Zoom: 0.1, 0.125
Multiply: 15
Save as WAV file: "/tmp/tone.wav"
Read from file: "/tmp/tone.wav"
View & Edit

---

# tom puro 440Hz
- gravar tom puro 440Hz com duração de 2s
- escutar
- visualizar o sinal no tempo e tempo-frequência (espectrograma)
- zoom em um intervalo de 25ms
- visualizar apenas a faixa de 0 a 1kHz
- alterar a extensão dinâmica para 20dB
- alterar a largura da janela do espectrograma de 50ms e depois 100ms (default 5ms)

> Praat History
Create Sound as pure tone: "tone", 1, 0, 2, 44100, 440, 0.2, 0.01, 0.01
View & Edit
Zoom: 0.1, 0.125
Spectrogram settings: 0, 1000, 0.005, 70
Spectrogram settings: 0, 1000, 0.005, 20
Spectrogram settings: 0, 1000, 0.05, 20
Spectrogram settings: 0, 1000, 0.1, 20


---

# gravar um som complexo

- gravar o seguinte som complexo: x(t) = 1/4 sin(2 pi 880 t) + 1/2 sin(2 pi 1320 t) + 1/4 sin(2 pi 1760 t)
- escutar
- visualizar o sinal no tempo e tempo-frequência (espectrograma) - utilize os parâmetros padrão do praat
- zoom em um intervalo de 25ms
- visualizar apenas a faixa de 0 a 2kHz
- alterar a extensão dinâmica para 20dB
- alterar a largura da janela do espectrograma de 50ms e depois 100ms
- aplicar filtro passa-faixa com f1=780, f2=980, w=100
- escutar e visualizar

> Praat History
Create Sound from formula: "complexsound", 1, 0, 2, 44100, "1/4 * sin(2*pi*880*x) + 1/2 * sin(2*pi*1320*x) + 1/4 * sin(2*pi*1760*x)"
Play
View & Edit
Zoom: 0.1, 0.125
Spectrogram settings: 0, 5000, 0.005, 70
Spectrogram settings: 0, 2000, 0.005, 70
Spectrogram settings: 0, 2000, 0.005, 20
Spectrogram settings: 0, 2000, 0.05, 20
Spectrogram settings: 0, 2000, 0.1, 20
Filter (pass Hann band): 780, 980, 100
Play
View & Edit


---

# reamostragem

- gravar uma senoide de 4410Hz utilizando fs=44.1kHz
- visualizar
- reamostrar usando fs=8kHz
- escutar e visualizar
- reamostrar usando fs=8820Hz
- escutar e visualizar

> Praat History
Create Sound as pure tone: "tone", 1, 0, 2, 44100, 4410, 0.2, 0.01, 0.01
Play
View & Edit
Zoom: 0.1, 0.125
Spectrogram settings: 0, 8000, 0.1, 20
Resample: 8000, 50
Play
selectObject: "Sound tone_8000"
Play
View & Edit
Show all
selectObject: "Sound tone"
Resample: 8820, 50
Play
View & Edit
Zoom: 0.1, 0.125
Spectrogram settings: 0, 5000, 0.005, 70
Spectrogram settings: 0, 5000, 0.005, 50
Spectrogram settings: 0, 5000, 0.05, 20
Play
Zoom: 0, 2


---

# vogal [a]

- download do arquivo: https://web.uvic.ca/ling/resources/ipa/charts/IPAlab/IPAsounds/open_front_unrounded.mp3
- abrir no Praat e escutar
- verificar a qual é a frequência de amostragem utilizada
- escutar e visualizar
- zoom no trecho de interesse (trecho sem silêncio)
- ajustar extensão (freq) do espectrograma (0 a 4kHz), largura da janela e extensão dinâmica
- mostrar pitch
- faça N = número de costeletas que encontramos no tempo 0.322 
- compare f0 (pitch) com o valor de 4000/N
- fazer a análise LPC e visualizar o fatia do espectro em torno de 0.322
- fazer uma decimação do sinal original por um fator M=5 (ou seja, nova fs=8820Hz)
- fazer novamente o LPC e visualizar
- veja a trajetória dos formantes no espectrograma e compare os valores no tempo 0.322 com aquele do gráfico anterior

> Praat History
Read from file: "/tmp/open_front_unrounded.mp3"
Play
Info
View & Edit
Zoom: 0.192, 0.659
Spectrogram settings: 0, 4000, 0.025, 20
Spectrogram settings: 0, 4000, 0.01, 20
Spectrogram settings: 0, 4000, 0.01, 70
Spectrogram settings: 0, 4000, 0.025, 50
Show pitch
Calculator: "4000/29"
To LPC (autocorrelation): 16, 0.025, 0.005, 50
selectObject: "LPC open_front_unrounded"
To Spectrum (slice): 0.322, 20, 0, 50
selectObject: "Spectrum open_front_unrounded_0_322"
View & Edit
selectObject: "Sound open_front_unrounded"
Resample: 8820, 50
selectObject: "Sound open_front_unrounded_8820"
To LPC (autocorrelation): 16, 0.025, 0.005, 50
To Spectrum (slice): 0.322, 20, 0, 50
View & Edit
selectObject: "Sound open_front_unrounded"
View & Edit
Zoom: 0.192, 0.659
Show formants
Show pitch
Formant settings: 5500, 5, 0.025, 30, 1


---

# vogal [a]

- repetir os passos, mas selecionar apenas o trecho de com sinal (selecionar > File > Extract selected sound)
- resample 8820Hz
- análise LPC
- selecionar o objeto LPC e o objeto som e realizar a filtragem inversa para obter o ruído de excitação 
- selecionar o ruído de excitação juntamente com o objeto LPC e realizar a filtragem
- sintetizar o seguinte tom complexo: uma combinação de senoides harmonicamente relacionadas com f0=140Hz
- filtrar o tom complexo pelo filtro LPC

- *extract the source from an existing speech sound*
- *to get at the source signal, however, you need the raw LPC object: you select it together with the resampled Sound, and apply inverse filtering*

> Praat History
Read from file: "/tmp/open_front_unrounded.mp3"
View & Edit
Extract selected sound (time from 0)
selectObject: "Sound untitled"
Play
Resample: 8820, 50
To LPC (autocorrelation): 16, 0.025, 0.005, 50
selectObject: "Sound untitled_8820"
View & Edit
selectObject: "LPC untitled_8820"
To Spectrum (slice): 0.1, 20, 0, 50
View & Edit
selectObject: "LPC untitled_8820"
selectObject: "Sound untitled_8820"
plusObject: "LPC untitled_8820"
Filter (inverse)
selectObject: "Sound untitled_8820"
Play
selectObject: "Spectrum untitled_88200_1"
selectObject: "Spectrum untitled_88200_1"
selectObject: "Sound untitled_8820"
selectObject: "LPC untitled_8820"
plusObject: "Sound untitled_8820"
Filter: "yes"
Play
Create Sound as tone complex: "toneComplex", 0, 2, 8820, "cosine", 140, 0, 0, 0
Play
selectObject: "LPC untitled_8820"
plusObject: "Sound toneComplex"
Filter: "yes"
Play
selectObject: "Sound toneComplex"
Play
selectObject: "LPC untitled_8820"
plusObject: "Sound toneComplex"
Filter: "no"
Play
selectObject: "Sound untitled_8820"
Play
selectObject: "Sound untitled_8820"
Play
View & Edit
selectObject: "Sound untitled_8820"
New Praat script


---

# utilizar o resíduo de uma vogal e o filtro LPC de outra

- baixar o [i]: https://web.uvic.ca/ling/resources/ipa/charts/IPAlab/IPAsounds/close_front_unrounded.mp3
- realizar os mesmo passos anteriores com a vogal [a] e a vogal [i]
- utilizar o resíduo obtido pela vogal [i] para excitar o filtro LPC obtido pela vogal [a] 
- utilizar o resíduo obtido pela vogal [a] para excitar o filtro LPC obtido pela vogal [i]

> Praat History
Read from file: "/tmp/open_front_unrounded.mp3"
View & Edit
Extract selected sound (time from 0)
Rename: "vowel [a]"
Resample: 8820, 50
To LPC (autocorrelation): 16, 0.025, 0.005, 50
selectObject: "Sound vowel__a__8820"
plusObject: "LPC vowel__a__8820"
Filter (inverse)
selectObject: "Sound vowel__a__8820"
Rename: "vowel__a__8820_ruido_excitacao"
Read from file: "/tmp/close_front_unrounded.mp3"
View & Edit
Extract selected sound (time from 0)
selectObject: "Sound untitled"
Rename: "vowel [i]"
Resample: 8820, 50
To LPC (autocorrelation): 16, 0.025, 0.005, 50
selectObject: "Sound vowel__i__8820"
plusObject: "LPC vowel__i__8820"
Filter (inverse)
Rename: "vowel__i__8820_ruido_excitacao"
selectObject: "LPC vowel__a__8820"
plusObject: "Sound vowel__i__8820_ruido_excitacao"
Filter: "no"
Play
Rename: "vowel__a__8820_ruido_excitacao_[i]"
selectObject: "Sound vowel__a__8820_ruido_excitacao"
selectObject: "Sound vowel__a__8820_ruido_excitacao"
plusObject: "LPC vowel__i__8820"
Filter: "no"
Play
Rename: "vowel__i__8820_ruido_excitacao_[a]"
New Praat script

