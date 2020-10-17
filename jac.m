function output = jac(q)

l1 = 1; l2 = 1; l3 = 1;

 output = [-sin(q(1))*(l3*cos(q(2) + q(3)) + l2*cos(q(2))), -cos(q(1))*(l3*sin(q(2) + q(3)) + l2*sin(q(2))), -l3*sin(q(2) + q(3))*cos(q(1)); 
        cos(q(1))*(l3*cos(q(2) + q(3)) + l2*cos(q(2))), -sin(q(1))*(l3*sin(q(2) + q(3)) + l2*sin(q(2))), -l3*sin(q(2) + q(3))*sin(q(1)); 
        0, - l3*cos(q(2) + q(3)) - l2*cos(q(2)), -l3*cos(q(2) + q(3))];