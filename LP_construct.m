%% constructing the linear programming problem

% this code is the definition code for the LP problem, an example LP
% construction is given at the end of the code.

% assign type value either "min" or "max"
type = "min"; 

% object function is written as using only the coefficients of the
% variables in an array
object_function = [5 -1 1];

% the coefficients of subject functions should be presented in an array 
% including the b matrix.
% first collumn of the subject function determines the function type,
% 0 - equality (=), 1 - greater than (>=) and -1 - lower than (<=)
% the missing variables in each subject function should be set to zero
subject_to = [1  2 -4.5 -3  2; ...
              1  3  1   8   5; ...
              1 12 -2   7 -4.5; ...
              1  0 -1  25 1.5];

% the sign of the variables are presented in here,
% 0 - sign not determined, 1 - x_i >= 0, and -1 - x_i <= 0
variable_sign = [1 1 0];

%% an example construction

% an exaple constructed problem
% minimize 5*x_1 - x_2 + x_3
% subject to 2*x_1 - 4.5*x_2 - 3*x_3 >= 2
%            3*x_1 + 1*x_2 + 8*x_3 >= 5
%            12*x_1 - 2*x_2 + 7*x_3 >= -4.5
%            -1*x_1 + 0*x_2 + 25*x_3 >= 1.5
%            x_1, x_2 >= 0, x_3 is unrestricted in sign
%
% type = "min";
% objective function = [5 -1 1];
% subject to = [1 2 -4.5 -3 2; ...
%               1 3 1 8 5; ...
%               1 12 -2 7 -4.5; ...
%               1 0 -1 25 1.5];
% variable_sign = [1 1 0];
