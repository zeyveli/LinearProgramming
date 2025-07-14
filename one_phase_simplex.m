function [tableu, basic] = one_phase_simplex(tableu,basic,m,n)

% this function solves the two phase simplex algorythm by using the initial
% tableu, basic set and artificial variables

optimality = 0;
while optimality ~= 1

optimality = 1;
for i=1:n-1
    if tableu(m,i) < 0
        optimality = 0;
    end
end


%to selecting the new collumn of the pivot
[~,q] = min(tableu(m,1:n-1));

%to selecting the new row of the pivot
ratio = tableu(:,n)./tableu(:,q);
minir = 99999; %initial high value for onvergence
for i = 1:m-1
    if ratio(i)>0 && ratio(i)<minir
        minir = ratio(i);
        p = i;
    end
end

basic(p) = q;

tableu = pivot_change(tableu,basic);

end

end