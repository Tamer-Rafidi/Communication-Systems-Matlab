%This code sets up the time and frequency vectors for all the numerical
%experiments of Lab3
clear 
format long e
tend = 10;
tbeg = -10;
N=100000;
tstep = (tend-tbeg)/N;
sampling_rate = 1/tstep;

%Time window 
tt = tbeg:tstep:tend-tstep;

y1 = load('lab4_num_expt1')
y2 = load('lab4_num_expt2')
y3 = load('lab4_num_expt3')

% Experiment 1
maxlag = 100; % Change from 100 to 200 to 500 for part i, ii, iii respectively 
%Autocorrelation of yt
Ry  = xcorr(y1.yt,y1.yt,maxlag);
%tau vector
tau_vec = -(maxlag*tstep):tstep:maxlag*tstep;
%Abs. PSD corresponding to yt
Sy = abs(fftshift(fft(fftshift(Ry))));
%define the frequency vector corresponding to tau_vec
Ntau = length(tau_vec);
%Nyquist sampling rate
fmax = sampling_rate/2; 
fmin = -fmax;
fstep = (fmax-fmin)/Ntau;
%Frequency window
freq = fmin:fstep:fmax-fstep;

tiledlayout(1,2);

nexttile;
plot(tau_vec, Ry);
title("Autocorrelation of yt");
xlabel("tau (s)");
ylabel("Ry");
yline(0);


nexttile;
plot(freq, Sy);
title("PSD vs Frequency");
xlabel("Frequency (Hz)");
ylabel("PSD");


% Experiment 2
maxlag = 20000; % Change from 100 to 200 to 20000 for part i, ii, iii respectively 
%Autocorrelation of yt
Ry  = xcorr(y2.yt,y2.yt,maxlag);
%tau vector
tau_vec = -(maxlag*tstep):tstep:maxlag*tstep;
%Abs. PSD corresponding to yt
Sy = abs(fftshift(fft(fftshift(Ry))));
%define the frequency vector corresponding to tau_vec
Ntau = length(tau_vec);
%Nyquist sampling rate
fmax = sampling_rate/2; 
fmin = -fmax;
fstep = (fmax-fmin)/Ntau;
%Frequency window
freq = fmin:fstep:fmax-fstep;

tiledlayout(1,2);
nexttile;
plot(tau_vec, Ry);
title("Autocorrelation of yt");
xlabel("tau (s)");
ylabel("Ry");

nexttile;
plot(freq, Sy);
title("PSD vs Frequency");
xlabel("Frequency (Hz)");
ylabel("PSD");

plot(tt, y2.yt);
title("yt as a function of time");
xlim([-100*tstep 100*tstep]);
xlabel("Time (s)");
ylabel("y(t)");

% Experiment 3
maxlag = 20000;
%Autocorrelation of yt
Rxy  = xcorr(y3.yt,y3.xt,maxlag);
%tau vector
tau_vec = -(maxlag*tstep):tstep:maxlag*tstep;
%Abs. PSD corresponding to yt
Sy = abs(fftshift(fft(fftshift(Rxy))));
%define the frequency vector corresponding to tau_vec
Ntau = length(tau_vec);
%Nyquist sampling rate
fmax = sampling_rate/2; 
fmin = -fmax;
fstep = (fmax-fmin)/Ntau;
%Frequency window
freq = fmin:fstep:fmax-fstep;

tiledlayout(1,3);
 
nexttile;
plot(tt, y3.xt);
title("x(t) vs time");
xlabel("Time (s)");
ylabel("x(t)");

nexttile;
plot(tt, y3.yt);
title("y(t) vs time");
xlabel("Time (s)");
ylabel("y(t)");

nexttile;
plot(tau_vec, Rxy);
title("Cross-correlation R_{xy}");
xlabel("tau (s)");
ylabel("R_{xy}");

