%solving shrodinger eq for finit potential well using shooting method

N=200;
dx=0.01;
E_initial=1.879;
dE=0.1;
x=(dx: dx: N*dx);
V= zeros(1, N);
V(100:N) =1000;
b= 1.5;

last_diverge=0;

minimum_dE=0.005;

E=E_initial;


while abs(dE)>minimum_dE;
    % Initialise
    psi= zeros(1, N);
    psi(1)=1;
    psi(2)=1;

    for i=2:N-1;
        psi(i+1)=2*psi(i)-psi(i-1)-2*(E-V(i))*dx^2*psi(i);
        if abs(psi(i+1)) > b; % if psi is diverging, exit the loop;
        return;
    end;

    
    plot(x, psi,'r');
    title('Square well');
    axis([0 2 -2 2]);
    xlabel('distance');
    ylabel('Wavefunction');
    drawnow;
    pause(0.5);

    if sign(psi(i+1))~=sign(last_diverge);
        dE=-dE/2;
    end;

    E=E+dE;
    last_diverge=sign(psi(i+1));
end;
end;
