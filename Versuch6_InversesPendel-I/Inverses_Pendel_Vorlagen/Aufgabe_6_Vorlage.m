%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IRT Regelunsgtechnisches Labor
% Inverses Pendel
% Aufgabe 6 (Parameter-identifikation) - Vorlage
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Messwerte des Sprungversuchs laden
load Aufgabe_6_Sprungversuch.mat

% Zeitverlauf
t = sprungversuch.t;

% Stellgr��enverlauf
u = sprungversuch.uy(:,1);

% Ausgangsgr��enverlauf
y = sprungversuch.uy(:,2);

% Verl�ufe plotten
figure('name','Sprungversuch f�r den Wagen')
plot(t,[u, y]);
legend('Soll-Geschwindigkeit','Ist-Geschwindigkeit')
xlabel('t in s')
ylabel('v in m/s')

% System Identification Tool �ffnen
ident % oder: systemIdentification