%% Messdaten einlesen
load('Aufgabe_8_Sprungantwort_Pumpe.mat');

%% Eingangs- und Ausgangsverl�ufe plotten
figure('name','Sprungantwort')
plot(Sprungantwort_Pumpe)
grid on

%% Parameteridentifikation f�r PT1Tt-Verhalten mit der Funktion "tfest"
%
% Achtung: Die Ausgangsgr��e wird in Liter (dm^3) angegeben



