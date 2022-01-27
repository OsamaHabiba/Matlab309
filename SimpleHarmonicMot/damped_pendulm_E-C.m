length= 1; %length of pendulum in meters
g=9.8; % acceleration of gravity in meters per second squared
q=1; %damping strength
n = 250;
dt = 0.04;
omega = zeros(n,1); 
theta = zeros(n,1);
time = zeros(n,1);
theta(1)=0.2; %intial displacment

for step = 1:n-1 % loop over the timesteps
omega(step+1) = omega(step) - (g/length)*theta(step)*dt-q*omega(step)*dt;
theta(step+1) = theta(step)+omega(step+1)*dt;
time(step+1) = time(step) + dt;
end

plot(time,theta ); 
xlabel('time (seconds) ');
ylabel('theta (radians)');