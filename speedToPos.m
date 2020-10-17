function output = lineToPolly(p0, a, t1, t0)


% first path a/2 * (t-t0)^2 + p0
a10 = p0;
a11 = 0;
a12 = a/2;


% first path -a/2 * (t-2t0)^2 + p0 + 2t0
p02 = p0

a20 = p0 + a/2

output = [p0; inv(A1)*b];