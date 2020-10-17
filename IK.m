function q = IK(px,py,pz,sol)

l1 = 1; l2 = 1; l3 = 1;

if px == 0 && py == 0
    disp("Singular case, infinite number of solutions")
    % will assume one value for q1
    q1 = 0;
else
    q1 = atan2(py,px);
end

X = sqrt(px^2 + py^2);
Y = pz-l1;

if pz == l1
    q2 = 0;
    q3 = pi;
    q = [q1 q2 q3];
elseif sqrt(X^2 + Y^2) == l2 + l3
    disp("Singular case, only one solution")
    q2 = atan2(Y,X);
    q3 = 0;
    q = [q1 q2 q3];
else
    alpha = acos( (X^2 + Y^2 + l2^2 - l3^2)/(2*l2*sqrt(X^2 + Y^2)) );
    beta = acos( (l2^2 + l3^2 -X^2 - Y^2)/(2*l2*l3) );
    gamma = atan2(Y,X);

    % Elbow up
    q21 = gamma - alpha;
    q31 = pi - beta;

    % Elbow down
    q22 = gamma + alpha;
    q32 = beta - pi;


    q = [q1 q21 q31;
         q1 q22 q32]; 
end

 q = rad2deg(q)';
 
 if sol
     q = q(:,1);
 end