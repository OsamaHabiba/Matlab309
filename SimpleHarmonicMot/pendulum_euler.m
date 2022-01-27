length= 1; %pendulum length in metres
g=9.8 %acceleration due to gravity
n = 250; %time points
dt = 0.04; % time increment
omega = zeros(n,1); % initializes omega, row vector of dimension n
theta = zeros(n,1); % initializes theta, row vector of dimension n
time = zeros(n,1); % this initializes the vector time to being all zeros
theta(1)=0.2; %initial displacement

for step = 1:n-1 % loop over the timesteps
omega(step+1) = omega(step) - (g/length)*theta(step)*dt;
theta(step+1) = theta(step)+omega(step)*dt
time(step+1) = time(step) + dt;
end

plot(time,theta,'r' );
xlabel('time (seconds) ');
ylabel('theta (radians)');