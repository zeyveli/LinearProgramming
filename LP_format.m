function [c,A,b,art] = LP_format(type, object_function, subject_to, variable_sign)

% this function converts the problem defined in the LP construct code to
% the standard LP form, using slack, surplus and, if necessary, artificial
% variables.

%the type corrector
if type == "max"
    object_function = -object_function;
end

%negative and unbounded variable corrector
for i = length(variable_sign)
    if variable_sign == -1
        object_function(i) = -object_function(i);
        subject_to(:,i+1) = -subject_to(:,i+1);
    elseif variable_sign == 0
        if i == 1
            object_function = [object_function(1) -object_function(1) object_function(2:length(object_function))];
            subject_to = [subject_to(:,1:i+1) -subject_to(:,i+1) subject_to(:,i+2:length(subject_to))];
            variable_sign = [1 1 variable_sign(i+1:length(variable_sign))];
        elseif i == length(object_function)
            object_function = [object_function(1:i) -object_function(i)];
            subject_to = [subject_to(:,1:i+1) -subject_to(:,i+1)];
            variable_sign = [variable_sign(1:i-1) 1 1];
        else
            object_function = [object_function(1:i) -object_function(i) object_function(i+1:length(object_function))];
            subject_to = [subject_to(:,1:i+1) -subject_to(:,i+1) subject_to(:,i+2:length(subject_to))];
            variable_sign = [variable_sign(1:i-1) 1 1 variable_sign(i+1:length(variable_sign))];
        end
    end
end

%negative b corrector
for i = 1:length(subject_to(:,1))
    if subject_to(i,length(subject_to)) < 0
        subject_to(i,:) = -subject_to(i,:);
    end
end

%inequality corrector <=
for i = 1:length(subject_to(:,1))
    if subject_to(i,1) == -1
        object_function = [object_function 0];
        variable_sign = [variable_sign 1];
        new_collumn = zeros(length(subject_to(:,1)),1);
        new_collumn(i,1) = 1;
        subject_to = [subject_to(:,1:length(subject_to(1,:))-1) new_collumn subject_to(:,length(subject_to(1,:)))];
    end
end

art = 0; %artificial variable index
a = 1; %artificial variable counter

%inequality corrector >=
for i = 1:length(subject_to(:,1))
    if subject_to(i,1) == 1
        object_function = [object_function 0];
        variable_sign = [variable_sign 1 1];
        new_collumns = zeros(length(subject_to(:,1)),2);
        new_collumns(i,:) = [-1 1];
        subject_to = [subject_to(:,1:length(subject_to(1,:))-1) new_collumns subject_to(:,length(subject_to(1,:)))];
        art(a) = length(subject_to(1,:)) - 2;
        a = a+1;
    end
end

%equality corrector =
for i = 1:length(subject_to(:,1))
    if subject_to(i,1) == 0
        variable_sign = [variable_sign 1];
        new_collumn = zeros(length(subject_to(:,1)),1);
        new_collumn(i,1) = 1;
        subject_to = [subject_to(:,1:length(subject_to(1,:))-1) new_collumn subject_to(:,length(subject_to(1,:)))];
        art(a) = length(subject_to(1,:)) - 2;
        a = a+1;
    end
end

c = object_function';
b = subject_to(:,length(subject_to));
A = subject_to(:,2:length(subject_to)-1);


