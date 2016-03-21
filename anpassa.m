
U_out = @(w, U_in, T)(U_in*w*T)./((ones(1, 200) + (w*T).^2).^(1/2));

%{
Plottar med värdena från förra delen och beräknar rms-felet
%}
U_in1 = 5.5;
T1 = 1.5 * 10^(-3);
semilogx(w, U_out(w, U_in1, T1), 'b')
hold on
semilogx(w, Uo, 'k')
rms1 = rms_fel(Uo, U_out(w, U_in1, T1))
xlabel('Frekvensen, \omega')
ylabel('Utspänningen, U_{out}')


%{
Prövar sedan med lite olika värden på U_in och T och sparar alla värden 
i en matris A där vi sedan kan hitta minimum av felet.
%}
A = [];
for U_in = linspace(5.2, 5.8, 100)
    for T = linspace(1*10^(-3), 1.8*10^(-3), 100)
        A = [A; U_in, T, rms_fel(Uo, U_out(w, U_in, T))];
    end
end

[v, i] = min(A(:,3));
res = A(i,:);
U_in = res(1)
T = res(2)
rms = res(3)

semilogx(w, U_out(w, U_in, T), 'r')




