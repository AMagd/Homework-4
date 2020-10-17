function output = TrajectoryTime(omax, amax, dq)

o = sqrt(dq * amax);

if o <= omax
    t1 = sqrt(dq/amax);
    tau = t1;
else
    t1 = omax/amax;
    tau = dq/omax;
end

output = [t1 tau];