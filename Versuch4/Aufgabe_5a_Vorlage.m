%% --- Beh�ltergrundfl�che berechnen ---
clear all
close all
%% Messdaten einlesen

load('Aufgabe_5_Kennlinie_Behaelter.mat')

V = kennlinie_behaelter.V      % [m^3]
h = kennlinie_behaelter.h;      % [m]

%% Kennlinie ausgeben

figure('name','Beh�lterkennlinie')
plot(V, h);
ylabel('H�he h/m');
xlabel('Volumen V/m^3');
title('Kennlinie Beh�lter B102, B103, B104');
grid on;

%% Grundfl�che der Beh�lter berechnen
% zwischen 2.5 bis 10 dm^3 gibts eine fast lineare zusammenhang. 
% da V = h * a dann kann man alle a berechnen und mittelwert daraus
% rechnen:

%der lineare Bereich der messung
V_lin = V(4:11);
h_lin = h(4:11);
% alle Fl�chen gerechnet
A_lin = V_lin./h_lin;
% mittelwert der Fl�chenwerte
A_Beh = mean(A_lin)

% A_beh�lter = 0.0287 m^3
