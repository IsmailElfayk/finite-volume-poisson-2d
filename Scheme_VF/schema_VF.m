function [A, b, U] = schema_VF(m, u_init, f_sec)
    % Schéma des volumes finis pour -Δu = f avec conditions de Dirichlet
    % Entrées :
    %   m      : structure contenant les données du maillage
    %   u_init : fonction exacte pour imposer u=0 sur le bord
    %   f_sec  : fonction seconde membre f(x, y)
    %
    % Sorties :
    %   A : matrice de rigidité
    %   b : vecteur second membre
    %   U : solution approchée

    f = f_sec;
    %u = inline(u_init, 'x', 'y'); % transforme u_init en fonction anonyme
    u = u_init;

    % Initialisation de la matrice et du vecteur second membre
    M = zeros(length(m.centre), length(m.centre)); 
    b = zeros(length(m.centre), 1);

    % Boucle sur toutes les arêtes
    for i = 1:m.nb_edge
        K = m.edge(i, m.K); % triangle à gauche de l’arête
        L = m.edge(i, m.L); % triangle à droite (ou -1 si bord)

        if L < 0
            % Cas d’une arête frontière (Dirichlet)

            % Coordonnées des extrémités de l’arête
            x_deb = m.node(m.edge(i, m.DEB), 1);
            y_deb = m.node(m.edge(i, m.DEB), 2);
            x_fin = m.node(m.edge(i, m.FIN), 1);
            y_fin = m.node(m.edge(i, m.FIN), 2);

            % Centre de l’arête
            x_centre = (x_deb + x_fin) / 2;
            y_centre = (y_deb + y_fin) / 2;

            % Contribution de l’arête à la diagonale
            M(K, K) = M(K, K) + m.edge(i, m.MES) / m.edge(i, m.DKsigma);

            % Contribution du terme de bord à b (u=0 connu sur le bord)
            b(K) = b(K) + ...
                   (u(x_centre, y_centre) * m.edge(i, m.MES)) / ...
                   m.edge(i, m.DKsigma);
        else
            % Cas d’une arête intérieure

            % Coefficient de diffusion (symétrique)
            a = m.edge(i, m.MES) / m.edge(i, m.DKL);

            % Ajout des contributions à la matrice de rigidité
            M(K, K) = M(K, K) + a;
            M(K, L) = M(K, L) - a;
            M(L, L) = M(L, L) + a;
            M(L, K) = M(L, K) - a;

            % Contribution au second membre (source dans L)
            b(L) = b(L) + ...
                   (m.edge(i, m.MES_L_DEB) + m.edge(i, m.MES_L_FIN)) * ...
                   f(m.centre(L, 1), m.centre(L, 2));
        end

        % Contribution au second membre (source dans K)
        b(K) = b(K) + ...
               (m.edge(i, m.MES_K_DEB) + m.edge(i, m.MES_K_FIN)) * ...
               f(m.centre(K, 1), m.centre(K, 2));
    end

    % Stockage final
    A = M;
    U = M \ b; % Résolution du système linéaire
end


