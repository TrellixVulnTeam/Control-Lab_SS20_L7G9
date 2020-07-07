clear all;
%% Modellparameter laden

g = 9.81;               % [m/s^2]

%% Parameter des Pendels
m_p = 0.0804;           % Masse ab Drehpunkt [kg]
l_p = 0.147;            % Pendell�nge [m]
J_d = 5.8134e-4;        % Tr�gheitsmoment mit Steineranteil [kgm^2]
mu = 8.5e-6;            % Reibwert [Nms]

l_s = 0.5;              % Schienenl�nge [m]

% Abstastzeit der Regelung
Ts = 0.005;             % [s]

%% Parameter des Wagens

% ohne Totzeit
K = 1;                  % PT1 �bertragungsfaktor 
T1 = 0.043;             % PT1 Zeitkonstante [s]

% mit Totzeit
Km = 1;                 % PT1 �bertragungsfaktor 
T1m = 0.014;            % PT1 Zeitkonstante [s]

Tt = 0.03;              % Totzeit [s]

v_max = 0.73;           % max. Geschwindigkeit des Wagens [m/s]

%% Analytisch linearisierte Zustandsraummodell aufstellen

A = [0 1 0 0; 
     0 -1/T1 0 0; 
     0 0 0 1; 
     0 m_p*l_p/(2*J_d*T1) m_p*g*l_p/(2*J_d) -mu/J_d;
     ];
 
b = [0 K/T1 0 -m_p*l_p*K/(2*J_d*T1)]';

C = [1 0 0 0; 
     0 0 1 0 
     ];

d = 0;

sys = ss(A,b,C,d)


%% Untersuchung wichtiger Systemeigenschaften des linearisierten Modells

% Stabilit�t mittels Pol-Nullstellen Plan
figure('name','Pol-Nullstellenplan')
pzmap(sys)

% Stabilit�t mittels Pol-Nullstellenberechnung
nullstellen = zero(sys) 
polstellen = pole(sys)

% Steuerbarkeit: Rang der Steuerbarkeitsmatrix muss gleich der
% Systemordnung sein.
Q_S = ctrb(sys);
Q_S_rank = rank(Q_S)

% Beobachtbarkeit: Rang der Beobachtbarkeitsmatrix muss gleich der
% Systemordnung sein.
Q_B = obsv(sys);
Q_B_rank = rank(Q_B)

% Fazit: Da eine Polstelle auf der imagin�ren Achse und eine Polstelle
% rechts der imagin�ren Achse liegt, ist das System instabil. Dar�ber
% hinaus ist das System steuer- und beobachtbar.