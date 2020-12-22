function [E_x_sim, E_q_sim, E_d_sim, E_w_sim,Sys_ut_sim,blocking_probability] = flow_control_main(mu, lambda, m, N)

    % The simulation of M/M/2/3 queueing system (QS)   
    %% Global parameters
    time_next_event(1:3) = 0;   % Events = {arrivals, departure ch1, departure ch2}
    num_events = 3;             % arrival and departure events for a G/G/1 QS

    mu =mu; % 1; 
    mean_service_time = 1/mu;      % Average message service time [sec]; 1/2 = 0.5 sec
    limit_customers = 100000;      % Maximum number of messages that arrive to the system (whether admitted or blocked) which induce termination of the simulation run
    Q_LIMIT = 1e30;  % The simulation program is terminated if the number of stored (in queue) messages exceeds this level
    % 1e30 denotes a high number (taken as infinity)

    lambda = lambda;%0.8;%0.5;
    rho = lambda/mu;
    mean_interarrival = 1/lambda; % Average interarrival time between message arrivals [sec];
    
    m = m; % number of channels
    N = N; % max size of queue
    %% Initialize the system's parameters
    flow_control_initialize;

    %% Main
    while total_of_customers-1 < limit_customers    % checks that the max number of served messages is below the specified limit and calls the timing( ) routine.
        % Also include termination conditions that involve maximum simulation run time, queue-size limits.
        % timing: Determines the next event type and updates the current simulation time
        timing;

        % update_time_avg_stats
        update_time_avg_stats;
        switch next_event_type
            case 1
                flow_control_arrive;            
            case 2
                departing_channel = 1;
                flow_control_depart; % channel 1
            case 3
                departing_channel = 2;
                flow_control_depart; % channel 2
        end
        %total_of_customers
    end
    % report
    report;
    blocking_probability = num_blocks/total_num_events;
end