length= 1; %pendulum length 
g=9.8 %acceleration due to gravity
n = 250;
dt = 0.04; % time increment
omega = zeros(n,1); % initializes omega, row vector of dimension n
theta = zeros(n,1); % initializes theta, row vector of dimension n
time = zeros(n,1); % initializes the vector time to being all zeros
theta(1)=0.2; %initial displacement

for step = 1:n-1 % loop over the time
omega(step+1) = omega(step) - (g/length)*theta(step)*dt;
theta(step+1) = theta(step)+omega(step +1)*dt
time(step+1) = time(step) + dt;
end

plot(time,theta,'r' );
xlabel('time (seconds) ');
ylabel('theta (radians)');