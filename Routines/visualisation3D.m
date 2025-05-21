function [] = visualisation3D(m,U,s)
    figure;
    if nargin == 2
    s = 'visualisation de la solution';
    else
    s = ['visualisation de la solution ' s];
    end
    c = m.centre;
    % Pts : matrice N x 2 des coordonnées (x, y)
    % T  : matrice M x 3 des indices des sommets des triangles
    % u  : vecteur N x 1 des valeurs f(x, y)

    trisurf(m.ele_sommets, c(:,1), c(:,2), U);  % Tracé de la surface
    shading interp;                % Pour lisser la surface
    xlabel('x'); ylabel('y'); zlabel('u(x,y)');
    title(s);

end

