% ==========================
% Définition des cas de test
% ==========================

% Import de la classe contenant les fonctions sources et exactes
Data;

% Initialisation de la structure de cas de test
% Chaque cas associe un terme source (secMem) et une solution exacte (exacte)

% === Cas de test 1 ===
casTest(1).Nom = 'test 1';              % Nom du test
casTest(1).secMem = @Data.f_1;          % Terme source correspondant à u_ex_1
casTest(1).exacte = @Data.u_ex_1;       % Solution exacte : (x² - x)(y² - y)

% === Cas de test 2 ===
casTest(2).Nom = 'test 2';              % Nom du test
casTest(2).secMem = @Data.f_2;          % Terme source correspondant à u_ex_2
casTest(2).exacte = @Data.u_ex_2;       % Solution exacte : sin(pi*x)sin(pi*y)

% === Cas de test 3 ===
casTest(3).Nom = 'test 3';              
casTest(3).secMem = @Data.f_3;          
casTest(3).exacte = @Data.u_ex_3;      

% === Cas de test 4 ===
casTest(4).Nom = 'test 4';              
casTest(4).secMem = @Data.f_4;          
casTest(4).exacte = @Data.u_ex_4;      



