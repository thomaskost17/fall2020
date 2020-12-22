clear, clc;
executing_var = [1,0,1];
%% 1A:
if executing_var(1)
    mu = 5;
    lambda = 4;
    rho = lambda/mu;
    [E_x_sim, E_q_sim, E_d_sim, E_w_sim,Sys_ut_sim] = main(mu,lambda);
    E_x_calc = rho/(1-rho);
    E_d_calc = 1/(mu*(1-rho));
    E_w_calc = rho/(mu*(1-rho));
    E_q_calc = (rho^2)/(1-rho);
end
%% 1B
if executing_var(2)
    mu = 4;
    p = [0.1:0.1:0.9];
    % simulated,calculated in column
    E_x_vals = zeros(2,length(p));
    E_q_vals = zeros(2,length(p));
    E_d_vals = zeros(2,length(p));
    E_w_vals = zeros(2,length(p));
    utiliztion = zeros(1,length(p));
    for i = 1:length(p)
        rho = p(i);
        [E_x_vals(1,i), E_q_vals(1,i), E_d_vals(1,i),...
            E_w_vals(1,i),utiliztion(i)] =  main(mu,mu*p(i));
        E_x_vals(2,i) = rho/(1-rho);
        E_d_vals(2,i) = 1/(mu*(1-rho));
        E_w_vals(2,i) = rho/(mu*(1-rho));
        E_q_vals(2,i) = (rho^2)/(1-rho);
    end
    figure1 = figure;
    subplot(2,2,1);
    plot(p, E_x_vals);
    legend("Simulated", "Calculated");
    title("E[X]");
    subplot(2,2,2);
    plot(p, E_q_vals);
    legend("Simulated", "Calculated");
    title("E[Q]");
    subplot(2,2,3);
    plot(p, E_d_vals);
    legend("Simulated", "Calculated");
    title("E[D]");
    subplot(2,2,4);
    plot(p, E_w_vals);
    legend("Simulated", "Calculated");
    title("E[W]");
    saveas(figure1, "1B_result.jpg");
end
%% 2A, 2B
if executing_var(3)
    mu = 5;
    lambda = 9.8;
    m = 2;
    N = 3;

    [E_x_sim_blocking, E_q_sim_blocking, E_d_sim_blocking, E_w_sim_blocking,...
        Sys_ut_sim_blocking, blocking_probability] = flow_control_main(mu,lambda, m, N);
    rho = lambda/(m*mu);
    f = lambda/mu;
    syms z;
    P0 = double((symsum((f.^z)/factorial(z), z, 0, m-1)+...
          symsum((f.^z)/(factorial(m)*m.^(z-m)), z, m, N))).^(-1);
    Pb = P0*(f.^N)/(factorial(m)*(m.^(N-m)));
    Pj = zeros(1,N+1);
    for i =0:N
        if i < m
            Pj(i+1) = P0*(f.^i)/(factorial(i));
        else
            Pj(i+1) = P0*(f.^i)/(factorial(m)*(m.^(i-m)));
        end
    end
    lambda_d = lambda*(1-Pb);
    E_x_calc_blocking = Pj*(0:N)';
    E_d_calc_blocking = E_x_calc_blocking/lambda_d;
    E_w_calc_blocking = E_d_calc_blocking - mu.^(-1);
    E_q_calc_blocking = 0;
    for i = m+1:N
        E_q_calc_blocking = E_q_calc_blocking + (i-m)*Pj(i);
    end
end