function [] = mesh_drawer(l, n)
    % Cette fonction affiche un maillage lu à partir d’un identifiant l.
    % Si n == 1, elle affiche aussi les indices des arêtes et des triangles.

    if nargin == 1
        n = 1; % Valeur par défaut : on affiche les numéros
    end

    % Lecture du maillage depuis les fichiers associés à l'entier l
    m = mesh_reader(l);
    figure;
    title(['mesh number ' num2str(l)]);
    xlabel('x'); ylabel('y');

    hold on

    % Boucle sur les arêtes pour les tracer
    for i = 1:m.nb_edge
        edge_DEB = m.edge(i, m.DEB); % Indice du sommet de début
        edge_FIN = m.edge(i, m.FIN); % Indice du sommet de fin

        % Coordonnées des extrémités de l’arête
        XD = m.node(edge_DEB, 1);
        YD = m.node(edge_DEB, 2);
        XF = m.node(edge_FIN, 1);
        YF = m.node(edge_FIN, 2);

        % Tracé de l’arête en bleu
        plot([XD, XF], [YD, YF], 'b-');

        if (n == 1)
            % Affichage du numéro de l’arête au milieu
            % text(((XD+XF)/2), (YD+YF)/2 , '✕', 'FontSize',6); % pour un symbole
            text(((XD + XF) / 2), ((YD + YF) / 2), num2str(i), 'FontSize', 8);
        end
    end

    if (n == 1)
        % Affichage des indices des centres des triangles
        for i = 1:m.nb_ele
            text(m.centre(i, 1), m.centre(i, 2), num2str(i), 'FontSize', 8);
        end
    end

    hold off
end
