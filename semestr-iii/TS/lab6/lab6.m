% Laboratorium nr 6

setenv GNUTERM 'x11'

figc = 0;
% K = [-1.5, -1.0]; 
K = [-1.5, -1.0, -0.5, 0.5, 1.0, 1.5];
% K = [0.5, 1.0, 1.5];
% K = [-0.5, 0.0, 0.5];
delta = zeros(1, 100);
delta(1) = 1;


% 1. Jak polozenie rzeczywistego zera wplywa na funkcje transmitancji i odpowiedz impulsowa filtru?

f=(figc+=1);
j=0;
for k=K
    figure(figc+=1);
    b = poly([k]);
    freqz(b, 1);
    print(["out/fig", num2str(figc), ".png"], "-dpng", "-landscape");
    
    % odp impulsowa
    j+=1;
    figure(f);
    y = filter(b, 1, delta);
    subplot(length(K), 1, j);
    plot(y);
    title(["b = ", num2str(k)]);
end

figure(f);
print(["out/fig", num2str(f), ".png"], "-dpng", "-landscape");



% 2. Jak polozenie bieguna wplywa na funkcje transmitancji i odpowiedz impulsowa filtru?
f2=(figc+=1);
j=0;
for k=K
    figure(figc+=1);
    a = poly([k]);
    freqz(1, a);
    print(["out/fig", num2str(figc), ".png"], "-dpng", "-landscape");
    
    % odp impulsowa
    j+=1;
    figure(f2);
    y = filter(1, a, delta);
    subplot(length(K), 1, j);
    plot(y);
    title(["a = ", num2str(k)]);
end

figure(f2);
print(["out/fig", num2str(f2), ".png"], "-dpng", "-landscape");



% 3. Jak polozenie zespolonego sprzezonego zera wplywa na funkcje transmitancji?
f3=(figc+=1);
figc+=1;
j=0;
for t=[0.3, 0.7]
    for k=K
        figure(figc+=1);
        b = poly([k + t*i, k - t*i]);
        freqz(b, 1);
        print(["out/fig", num2str(figc), ".png"], "-dpng", "-landscape");
        
        % odp impulsowa
        figure(f3);
        y = filter(b, 1, delta);
        subplot(length(K)/2, 2, mod(j, length(K)) + 1);
        plot(y);
        title(["kat = ", num2str(t), ", b = ", num2str(k)]);
        j+=1;
    end
    figure(f3);
    print(["out/fig", num2str(f3), ".png"], "-dpng", "-landscape");
    f3+=1;
end


% 4. Jak polozenie zespolonego sprzezonego bieguna wplywa na funkcje transmitancji?
f4=(figc+=1);
figc+=1;
j=0;
for t=[0.3, 0.7]
    for k=K
        figure(figc+=1);
        a = poly([k + t*i, k - t*i]);
        freqz(1, a);
        print(["out/fig", num2str(figc), ".png"], "-dpng", "-landscape");
        
        % odp impulsowa
        figure(f4);
        y = filter(1, a, delta);
        subplot(length(K)/2, 2, mod(j, length(K)) + 1);
        plot(y);
        title(["kat = ", num2str(t), ", a = ", num2str(k)]);
        j+=1;
    end
    figure(f4);
    print(["out/fig", num2str(f4), ".png"], "-dpng", "-landscape");
    f4+=1
end

