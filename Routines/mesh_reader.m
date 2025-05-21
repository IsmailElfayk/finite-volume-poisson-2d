%%%%%%%%%%%%%
%% import mesh
%%%%%%%%%%%%%
function [m] = mesh_reader(l)
    % Cette fonction lit les fichiers du maillage triangulaire associés à l'entier l
    % et construit une structure contenant toutes les informations nécessaires.
    % Le maillage doit être présent dans le dossier '../Mesh/' avec un nom spécifique.

    % Importation des arêtes depuis le fichier
    filied = ['../Mesh/maillage_triangle_', num2str(l), '_aretes'];
    [aretes, mesh] = importdata(filied);

    % Importation des centres des triangles
    filied = ['../Mesh/maillage_triangle_', num2str(l), '_centres'];
    [centres, mesh] = importdata(filied);


    % Importation des sommets (nœuds)
    filied = ['../Mesh/maillage_triangle_', num2str(l), '_sommets'];
    [sommets, mesh] = importdata(filied);
    
    % contruction de la matrice des sommets des elements 
    a = aretes.data;
    c = centres.data;

    b=[];
    for i = 1:length(c)
        v = [];
        for j = 1: length(a(:,1))
            if a(j,3) == i || a(j,4) == i
               v = [v a(j,1) a(j,2)]; 
            end
        end
     v = unique(v, 'stable');
     b = [b;v];
    end

    % Construction de la structure de données du maillage
    m = struct(...
        'nom', l, ...                         % identifiant du maillage
        'edge', aretes.data, ...              % tableau des arêtes
        'centre', centres.data, ...           % tableau des centres de triangles
        'node', sommets.data, ...             % tableau des sommets (nœuds)
        'nb_ele', size(centres.data, 1), ...  % nombre de triangles (éléments)
        'nb_edge', size(aretes.data, 1), ...  % nombre d’arêtes
        'nb_node', size(sommets.data, 1), ... % nombre de nœuds
        'ele_sommets', b, ...                  % matrice des sommets de chaque element
        ...  % Indices pour les colonnes dans les tableaux d’arêtes
        'X', 1, ...                % colonne X dans un point (nœud ou centre)
        'Y', 2, ...                % colonne Y dans un point
        'DEB', 1, ...              % indice du sommet de début d’une arête
        'FIN', 2, ...              % indice du sommet de fin d’une arête
        'K', 3, ...                % indice du triangle à gauche de l’arête
        'L', 4, ...                % indice du triangle à droite (ou -1 si bord)
        'MES', 5, ...              % mesure (longueur) de l’arête
        'DKsigma', 6, ...          % distance du centre de K au centre de l’arête
        'DLsigma', 7, ...          % distance du centre de L à l’arête
        'DKL', 8, ...              % distance entre les centres K et L
        'MES_K_DEB', 9, ...        % partie de l'aire autour de K, côté début
        'MES_K_FIN', 10, ...       % partie de l'aire autour de K, côté fin
        'MES_L_DEB', 11, ...       % partie de l'aire autour de L, côté début
        'MES_L_FIN', 12, ...       % partie de l'aire autour de L, côté fin
        'N_KL_X', 13, ...          % composante X de la normale entre K et L
        'N_KL_Y', 14, ...          % composante Y de la normale entre K et L
        'NS_DEBFIN_X', 15, ...     % composante X de la normale de l’arête
        'NS_DEBFIN_Y', 16, ...     % composante Y de la normale de l’arête
        'LABEL', 17 ...            % label de l’arête (utile pour conditions limites)
    );
end
