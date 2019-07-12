function hmm = createHMMmatrices()
%CREATEHMMMATRICES Summary of this function goes here
%   G: Übergangswahrscheinlichkeiten der Hidden States
%   V: Emissionswahrscheinlichkeiten der Visible States

G = zeros(11, 11);
G(1, 2:3) = [0.4, 0.6];
G(2:3, 4:5) = [0.3, 0.7; 0.7, 0.3];
G(4:5, 6:7) = [0.8, 0.2; 0.2, 0.8];
G(6:7, 8:9) = [0.9, 0.1; 0.1, 0.9];
G(8:9, 10:11) = [0.6, 0.4; 0.4, 0.6];
G(10:11, 10:11) = [1 0; 0 1];

V = zeros(11, 10);
V(2:3, 1:2) = [0.1, 0.9; 0.9, 0.1];
V(4:5, 3:4) = [0.4, 0.6; 0.6, 0.4];
V(6:7, 5:6) = [0.7, 0.3; 0.3, 0.7];
V(8:9, 7:8) = [0.6, 0.4; 0.4, 0.6];
V(10:11, 9:10) = [0.8, 0.2; 0.2, 0.8];

hmm.G = G;
hmm.V = V;

end
