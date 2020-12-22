time_next_event(1) = sim_time + exprnd(mean_interarrival);
num_in_s = num_in_s + 1;
if (num_in_q < N)
    time_arrival_system(num_in_s) = sim_time;       % time arrival system (i) = time of arrival of message-i
end                                                % time arrival system (num_in_s) = time of arrival of the last message to arrive
total_of_customers = total_of_customers + 1;
for channel = 1:m
    if (server_status(channel) == 1) && (channel==m)% busy is 1 and idle is 0                                              
        blocked = false;
        if(num_in_q < N)
            num_in_q = num_in_q + 1;                    %Server is busy, so increment number of customers in queue
        else
            blocked = true;
            num_blocks  = num_blocks + 1;
            total_of_customers = total_of_customers - 1; % remove as not admitted
            num_in_s = num_in_s - 1;
        end
        total_num_events = total_num_events + 1;
        
        % Check to see whether an overflow condition exists.
        if num_in_q > Q_LIMIT                       % Check to see whether termination condition is met:
                                                % The queue limit has been reached, so stop the simulation.
            display(['Simulation is intentionally stopped, something wrong. Overflow occurs at simu time = ' num2str(sim_time)]);
            return; 
        end
        if(num_in_q <= N) && ~blocked
            time_arrival_queue(num_in_q) = sim_time;
        end
    elseif server_status(channel) == 1
        continue;
    else % server_status == idle
        % Server is idle, so arriving customer has a delay of zero.
        % The following two statements are for program clarity and
        % do not affect the results of the simulation.
    
        wait_time = 0;
        total_of_waits = total_of_waits + wait_time;
    
        % Increment the number of customers delayed, and make server busy.
        num_waiting_custs = num_waiting_custs + 1;
        server_status(channel) = 1; % server is busy
    
        %Schedule a departure (service completion).
        time_next_event(1 + channel) = sim_time + exprnd(mean_service_time);
        
        total_num_events = total_num_events + 1;

        break;
    end
end
