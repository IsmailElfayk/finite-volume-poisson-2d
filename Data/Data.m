classdef Data
    % Classe statique contenant des fonctions utiles pour les tests
    % en volumes finis : solutions exactes et termes sources.
    
    methods (Static)

        %% === Solutions exactes u_ex(x,y) ===

        function [u_ex] = u_ex_1(x, y)
            % Solution exacte de test : polynôme du second degré
            % u_ex(x,y) = (x^2 - x)(y^2 - y)
            u_ex = (x.^2 - x) .* (y.^2 - y);
        end

        function [u_ex] = u_ex_2(x, y)
            % Solution exacte classique : sinusoïdale
            % u_ex(x,y) = sin(pi*x) * sin(pi*y)
            u_ex = sin(pi .* x) .* sin(pi .* y);
        end
        
        function [u_ex] = u_ex_3(x, y)
            % Solution exacte classique 
            % u_ex(x,y) = x^2 + y^2
            u_ex = x.^2 + y.^2;
        end
        function [u_ex] = u_ex_4(x, y)
            % Solution exacte classique 
            % u_ex(x,y) = x^2 + y^2
            u_ex = exp(x+y);
        end
        %% === Termes sources f(x,y) associés ===

        function [f] = f_1(x, y)
            % Terme source correspondant à u_ex_1
            % u_ex = (x^2 - x)(y^2 - y)
            % f = -Δu_ex = -2(x^2 + y^2) + 2(x + y)
            f = -2 * (x.^2 + y.^2) + 2 * (x + y);
        end

        function [f] = f_2(x, y)
            % Terme source correspondant à u_ex_2
            % u_ex = sin(pi*x)*sin(pi*y)
            % f = -Δu_ex = 2*pi^2*sin(pi*x)*sin(pi*y)
            f = 2 * pi^2 .* sin(pi .* x) .* sin(pi .* y);
        end
        
        function [f] = f_3(x, y)
            f = -4;
        end
        function [f] = f_4(x, y)
            f = -2*exp(x+y);
        end

    end
end
