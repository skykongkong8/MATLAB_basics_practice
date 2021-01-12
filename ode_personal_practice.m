%% Linear ODE
% dy/dt = ty 인 방정식 풀기
syms y(t);
ode = diff(y,t) == t*y;
ySol(t) = dsolve(ode);
% ySol(t) 가 정답임

% 초기조건이 있는 경우 ex) y(0) = 0
syms y(t);
ode = (diff(y,t) + y)^2 == 1;
cond = y(0) == 0;
ySol(t) = dsolve(ode, cond); %이렇게 초기조건까지 넣어주면 된다.

% multiple 초기조건s ex) y'(0) = 1
Dy = diff(y);
cond2 = Dy(0) == 1;
conds = [cond, cond2];
ySol(t) = dsolve(ode, conds) %이런식으로 벡터에 담아서 주면 된다.

%% 연립 미분 방정식
% ex) du/dt = 3u + 4v, dv/dt = -4u + 3v
syms u(t) v(t);
ode1 = diff(u) == 3*u + 4*v;
ode2 = diff(v) == -4*u + 3*v;
odes = [ode1, ode2]; % 초기조건처럼 행렬로 묶는다.

S = dsolve(odes); %각각의 u, v에 접근하고 싶다면,

uSol(t) = S.u;
vSol(t) = S.v; % 이렇게 struct에 접근하듯이 메소드를 써주면 된다.


%초기조건을 사용하여 변수를 단일변수로 하면 plot을 사용할 수 있다!
cond1 = u(0) == 0;
cond2 = v(0) == 1;
conds = [cond1, cond2];

R = dsolve(odes, conds);
uSol_r(t) = R.u;
vSol_r(t) = R.v;

fplot(uSol_r(t))
hold on;
fplot(vSol_r(t))
grid on;
legend('uSol', 'vSol');
hold off;