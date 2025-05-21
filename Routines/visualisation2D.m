function [] = visualisation2D(m,U,c)
if nargin == 2
    c = 'visualisation de la solution';
else
    c = ['visualisation de la solution ' c];
end
figure;
    patch('Faces', m.ele_sommets, ...               % matrice des triangles
      'Vertices', m.node, ...            % coordonnées des sommets
      'FaceVertexCData', U, ...     % données par triangle
      'FaceColor', 'flat', ...      % couleur uniforme par triangle
      'EdgeColor', 'k');            % bords visibles en noir

    colorbar;                           % légende des couleurs
    title(c);
    xlabel('x'); ylabel('y');

end

