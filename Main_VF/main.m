clear all function
close all;
clc
clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%l appel du maillage%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%addpath('../donnees')
%%%%%%%%%%%%%%%
%addpath('../mesh')
addpath('../Routines')
addpath('../Scheme_V_F')
%%%%%%%%%%%%%%
 l = 3;
 m = mesh_reader(l);
 
 %m.edge
 %m.edge(:,m.DEB)
 %m.centre(m.edge(3,m.K),m.X)
 %m.node
 %m.node(m.edge(3,m.DEB),:)
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %m.edge(12,m.K);
 %m.edge(12,m.MES);
 
 %%%%%%%%%%%%%%
 %M = schema_vf_1(m)


 
