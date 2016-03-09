
% A = Vi och B = RC
% Från när vi tittade i grafen: A = 3.9 och B = 1/30
semilogx(w, Uo)

%A = 5.3;
%B = 1/749;
Vo = @(w1, A, B)(A*w1*B)./((ones(1, 200) + (w1*B).^2).^(1/2));
%semilogx(w, Vo(w))

hold on;


%fel = sqrt((sum((Vo(w, A, B) - Uo).^2))/200)

for A = linspace(5.0, 5.6, 1000)
   for B = linspace(1/800, 1/700, 1000)
       A
       semilogx(w, Vo(w, A, B))
    end
end

7





