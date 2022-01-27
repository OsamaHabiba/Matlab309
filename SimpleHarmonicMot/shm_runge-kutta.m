n = 250;
dt = 0.04;
v = zeros(n,1); % row vector of dimension n
y = zeros(n,1); % row vector of dimension n
v_dash = zeros(n,1); 
y_dash = zeros(n,1);
time = zeros(n,1); 
y(1)=0.2; %initial displacement

for step = 1:n-1
v_dash=v(step)-0.5*y(step)*dt;
y_dash=y(step)+0.5*v(step)*dt;
v(step+1) = v(step)-y_dash*dt;
y(step+1) = y(step)+v_dash*dt;
time(step+1) = time(step)+dt;
end

plot(time,y);
xlabel('Time');
ylabel('Displacement');
