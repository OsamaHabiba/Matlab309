N=1000;
x= linspace(0,1,N);
% Set up intial wavepacket;
x_0=0.4;
C=10;
sigma_squared=1e-3;
k_0=500;

dx=1e-3;
dt=5e-8;

% Generate an intial wavepacket
psi=C*exp(-(x-x_0).^2/sigma_squared).*exp(1i*k_0*x);

%Extract the real and imaginary parts of the wavefunction
R_initial=real(psi);
I_initial=imag(psi);
V= zeros(1, N);
V(600:N) =-1e6;
% Initialise currents
I_current=I_initial;
R_current=R_initial;
% Initial run of Im(psi) to start off leapfrog process;
% t=t+dt/2;


I_next= zeros(1,N);
s=dt/(2*dx^2);
for x=2:N-1;
% Calculate the imaginary part of the wavefunction at time t=t+dt,
I_next(x)=I_current(x) +s*(R_current(x+1)-2*R_current(x)+R_current(x-1))...
-dt*V(x).*R_current(x);
% Boundary conditions
I_next(1)=I_next(2);
I_next(N)=I_next(N-1);
end;

R_next= zeros(1,N);
s=dt/(2*dx^2);
for x=2:N-1;
% Calculate the real part of the wavefunction at time t=t+dt,
R_next(x)=R_current(x) - s*(I_current(x+1)-2*I_current(x)+I_current(x-1))...
+dt*V(x).*I_current(x);
% Boundary conditions
R_next(1)=R_next(2);
R_next(N)=R_next(N-1);
end;

for time_step = 1:15000;
% evaluate R at dt, 2*dt, 3*dt, ...
% Time is incremented by t=t+dt/2
R_current=R_next;
% evaluate I at (3/2)*dt, (5/2)*dt, ...
% Time is incremented by t=t+dt/2
% calculate psi*psi with R(t) and I(t+dt/2) and I(t-dt/2)
prob_density=R_current.^2+I_next.*I_current;
I_current=I_next;
% Visualise results with movie. Plot every 10 calculations for speed
if rem(time_step, 10)== 0;
plot(x, prob_density,'-b','LineWidth',2);
title('Reflection from cliff');
axis([0 1 0 200]);
xlabel('x');
ylabel('Probability density');
drawnow;
end;
end;
