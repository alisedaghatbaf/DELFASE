function f_flag = ACCwithFI(sample)
disp(sample);
T = 80;
assignin("base", "T", T);
assignin("base", "Ts", 0.1);
assignin("base","G_ego",tf(1,[0.5,1,0]));
assignin("base","v0_lead", 25);
assignin("base","x0_lead", 50);
assignin("base","x0_ego", 10);
assignin("base","v0_ego", 20);
assignin("base","t_gap", 1.4);
assignin("base","D_default", 10);
assignin("base","v_set", 30);
assignin("base","amin_ego", -3);
assignin("base","amax_ego", 2);
assignin("base","x0_lead", 25);
assignin("base","f_type", 2);
assignin("base","type_val", sample(1));
assignin("base","f_event", 2);
assignin("base","event_val", sample(2));
assignin("base","f_effect", 1);
assignin("base","effect_val", sample(3));
mdl = 'mpcACCsystem';
load_system(mdl)
%faultinjector = finjectors('1');
%disp(faultinjector)
sim(mdl);
t_sim = tout(end,:);
f_flag = t_sim < T;
disp(t_sim);
%mpcACCplot(logsout,D_default,t_gap,v_set)

bdclose(mdl)
end
