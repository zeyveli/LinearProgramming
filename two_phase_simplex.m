function [tableu, basic] = two_phase_simplex(T,basic,m,n,c,artif)

% this function solves the two phase simplex algorythm by using the initial
% tableu, basic set and artificial variables

optimality = 0;
while optimality ~= 1

%to selecting the new collumn of the pivot
[~,q] = min(T(m,1:n-1));

%to selecting the new row of the pivot
ratio = T(:,n)./T(:,q);
minir = 99999; %initial high value for onvergence
for i = 1:m-1
    if ratio(i)>0 && ratio(i)<minir
        minir = ratio(i);
        p = i;
    end
end

basic(p) = q;
%basic = mink(basic,length(basic));

T = pivot_change(T,basic);

optimality = 1;
for i=1:n-1
    if T(m,i) < 0
        optimality = 0;
    end
end

end

k = 1;
for i = 1:length(T)
    T_2(:,k) = T(:,i);
    k = k+1;
    for j = 1:length(artif)
        if i == artif(j)
            k = k-1;
        end
    end
end

T_2 = [T_2(1:m-1,:); c' 0];
[m,n] = size(T_2);

for i = 1:length(basic)
    for j = 1:m
        if j ~= i
            T_2(j,:) = T_2(j,:) - T_2(i,:)*T_2(j,basic(i));
        end
    end
end

[tableu, basic] = one_phase_simplex(T_2,basic,m,n);

end