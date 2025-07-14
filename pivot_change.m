function [tableu_new] = pivot_change(tableu,basic)

% this functions does the pivoting of the new basic set

for i = 1:length(basic)
    [m,~] = size(tableu);
    tableu(i,:) = tableu(i,:)/tableu(i,basic(i));
    for j = 1:m
        if j ~= i
            tableu(j,:) = tableu(j,:) - tableu(i,:)*tableu(j,basic(i));
        end
    end

    tableu_new = tableu;

end