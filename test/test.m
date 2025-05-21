%clc;
close all;

% ================================
% Ajout des chemins vers les dossiers
% ================================
addpath('../Routines')      % Dossier contenant les routines utilitaires
addpath('../Scheme_VF')     % Dossier contenant les schémas volumes finis
addpath('../Data')          % Dossier contenant les données et fonctions

% ===============================
% Chargement de la structure des cas de test
% ===============================
structure;

% ===============================
% Affichage des cas de test disponibles
% ===============================
for i = 1:length(casTest)
    fprintf('%d) %s:\n', i, casTest(i).Nom);
end

% ===============================
% Choix du cas de test par l'utilisateur
% ===============================
choix1 = -1;
while (int32(choix1) <= 0 || int32(choix1) > length(casTest))
    choix1 = input('Choisissez un problème pour le test : ');
end
choix1 = int32(choix1);
c = casTest(choix1);

% ===============================
% Choix de l'affinement du maillage
% ===============================
choix2 = -1;
while (int32(choix2) < 1 || int32(choix2) > 12)
    choix2 = input('Choisissez l affinement du maillage entre 1 et 12 : ');
end

% ===============================
% Lecture du maillage choisi
% ===============================
m = mesh_reader(choix2);

% ===============================
% Initialisation de la condition aux bords (u = 0 ici)
% ===============================
%u = inline(0, 'x', 'y')

% ===============================
% Calcul de la solution exacte au centre des cellules
% ===============================
u_ex = c.exacte;
Uex = u_ex(m.centre(:,1), m.centre(:,2));

% ===============================
% Application du schéma volumes finis
% ===============================
[A, b, Uapp] = schema_VF(m, u_ex, c.secMem);

% ===============================
% Affichage des solutions exacte et approchée
% ===============================
%[Uex Uapp]

% ===============================
% Calcul et affichage de l'erreur max (norme infinie)
% ===============================
norm(Uex - Uapp, inf)


visualisation2D(m,Uapp, 'approche');
visualisation2D(m,Uex, 'exact');

%visualisation3D(m,Uapp, 'approche');
%visualisation3D(m,Uex, 'exact');



    
    
    
    





















