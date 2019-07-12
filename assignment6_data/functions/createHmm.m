function [ hmm ] = createHmm(  )
% T = Anzahl an der Knoten
% G = Uebergangswahrscheinlichkeiten der Hidden States entsprechend der Matrix auf dem Uebungsblatt.
% V = Emissionswahrscheinlichkeiten der Visible States entsprechend der Matrix auf dem Uebungsblatt.
    hmm.T = 5;
    
    G = cell(1, 5);
    
    G{1, 1} = [0.4, 0.6];
    G{1, 2} = [[0.3, 0.7]; [0.7, 0.3]];
    G{1, 3} = [[0.8, 0.2]; [0.2, 0.8]];
    G{1, 4} = [[0.9, 0.1]; [0.1, 0.9]];
    G{1, 5} = [[0.6, 0.4]; [0.4, 0.6]];
    
    V = cell(1, 5);
    V{1, 1} = [[0.1, 0.9]; [0.9, 0.1]];
    V{1, 2} = [[0.4, 0.6]; [0.6, 0.4]];
    V{1, 3} = [[0.7, 0.3]; [0.3, 0.7]];
    V{1, 4} = [[0.6, 0.4]; [0.4, 0.6]];
    V{1, 5} = [[0.8, 0.2]; [0.2, 0.8]];
    
    hmm.G = G;
    hmm.V = V;


end

    