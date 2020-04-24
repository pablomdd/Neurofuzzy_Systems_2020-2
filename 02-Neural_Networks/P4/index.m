%   In this practice we implement with Adaline the same exercises as in
%   previous 3 Perceptron practices.
%% %% Perceptron 1 Layer
p1 = [1; 2];
p2 = [-1; 1];
p3 = [0; -1];

P = [p1 p2 p3];
Ptrans = P';
T = [1 0 0];
[m, n] = size(P);
N = 1;

Wnew = rand(N,m);
bnew = rand(N,1);

% Ask input for epochs
epochs = 80;

% Alfa
alfa = 0.1;
eStore = zeros(1, epochs * n);
k = 1;

% Training with Adaline
for i = 1:epochs
    for j = 1:n     %n is number of patterns
        a = purelin(Wnew * P(:,j) + bnew);
        
        e = T(j) - a;
        Wnew =  Wnew + alfa * e * Ptrans(j,:);
        bnew = bnew + alfa * e;
        
        eStore(k) = e;
        k = k + 1;
    end
end
plot(1:length(eStore), eStore);


