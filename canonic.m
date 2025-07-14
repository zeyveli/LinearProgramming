function [tableu,basic] = canonic(c,A,b)

%this function uses the coefficient matrix c, A and b which form sthe
%augmented matrix. after forming the tableu for simplex algorythim, this
%function converts it to canonical form. 

tableu = [A b; c' 0];
[m,n] = size(tableu);
basic = zeros(1,m-1);

k = 1;
for i = 1:m-1
    for j = 1:n-1
        temp = zeros(m-1,1);
        temp(i) = 1;
        if tableu(1:m-1,j) - temp == zeros(m-1,1)
            basic(k) = j;
        end
    end
    k=k+1;
end

tableu = pivot_change(tableu,basic);
