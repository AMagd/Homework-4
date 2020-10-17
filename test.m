clear all
clc

l1 = 1; l2 = 1; l3 =1;
%%
desiredPosition = [0.5; -0.5; 0.5];

% set initial angles
q = [0; 0; 0]; % avoid singular values

% specify number of iterations
iterations = 10;
rob = figure;
for i = 1:iterations
    if ~ishandle(rob), break; end
    clf

    O3 = [l2*cos(q(1))*cos(q(2)) - l3*(cos(q(1))*sin(q(2))*sin(q(3)) - cos(q(1))*cos(q(2))*cos(q(3)));
         l2*cos(q(2))*sin(q(1)) - l3*(sin(q(1))*sin(q(2))*sin(q(3)) - cos(q(2))*cos(q(3))*sin(q(1)));
         l1 - l3*(cos(q(2))*sin(q(3)) + cos(q(3))*sin(q(2))) - l2*sin(q(2))];

    J = [-sin(q(1))*(l3*cos(q(2) + q(3)) + l2*cos(q(2))), -cos(q(1))*(l3*sin(q(2) + q(3)) + l2*sin(q(2))), -l3*sin(q(2) + q(3))*cos(q(1)); 
        cos(q(1))*(l3*cos(q(2) + q(3)) + l2*cos(q(2))), -sin(q(1))*(l3*sin(q(2) + q(3)) + l2*sin(q(2))), -l3*sin(q(2) + q(3))*sin(q(1)); 
        0, - l3*cos(q(2) + q(3)) - l2*cos(q(2)), -l3*cos(q(2) + q(3))];
    
    q = q + pinv(J)*(desiredPosition - O3);
    
    % Plotting
    FK(rad2deg(q(1)), rad2deg(q(2)), rad2deg(q(3)), 1);
    plot3(desiredPosition(1), desiredPosition(2), desiredPosition(3),'.r','Markersize',10)
    xlabel('X'),ylabel('Y'),zlabel('Z')
    drawnow
end