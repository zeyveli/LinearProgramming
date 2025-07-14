%% The LP problem solver

run LP_construct.m

%the LP forman conventor
[c,A,b,artif] = LP_format(type, object_function, subject_to, variable_sign);

if artif ~= 0
    %solve two phase algorythm

    a = length(artif); %number of artificial variables
    n = length(A);

    %artificial cost function finder
    ca = zeros(length(A)-1,1); 
    for i = 1:length(artif)
        ca(artif(i),1) = 1; %artificial cost function
    end

    %canonic LP problem and basic variable indexes
    [T,basic] = canonic(ca,A,b); %transform the initial system to canonic
    [m,n] = size(T);

    %two phase solver
    [T,basic] = two_phase_simplex(T,basic,m,n,c,artif);

elseif artif == 0
    %solve one phase algorythm

    %canonic LP problem and basic variable indexes
    [T,basic] = canonic(c,A,b); %transform the initial system to canonic
    [m,n] = size(T);

    %one phase solver
    [T,basic] = one_phase_simplex(T,basic,m,n);

end

%the result
x = zeros(length(T)-1,1);
for i = 1:length(basic)
    x(basic(i),1) = T(i,length(T));
end

%returning the solutions back to original form of the problem
k = 1;
for i = 1:length(object_function)
    if variable_sign(i) == 1
        x_orj(i,1) = x(k,1);
        k = k+1;
    elseif variable_sign(i) == -1
        x_orj(i,1) = -x(k,1);
        k = k+1;
    elseif variable_sign(i) == 0
        x_orj(i,1) = x(k,1)-x(k+1,1);
        k = k+2;
    end
end

fprintf("the result is:")
x_orj
fprintf("the objective function is:")
    T(m,length(T))

