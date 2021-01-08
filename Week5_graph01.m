%% Basics
%벡터 데이터 그래프 그리기\
x=[1 2.5 6 3];
y = [2 4 3 6];
% 정의역과 치역의 길이가 같아야 한다!
figure(1);
plot(x,y);
axis([0 7 0 8]); % axis를 통해 보여지는 그래프의 축 범위를 설정할 수 있다.

%% 여러개의 그래프가 하나의 좌표 평면에
%plot(x,y,'r-', u,v,'b:',t,h,'k--');
% 또는, 아예 행렬로 선언해도 여러개의 그래프가 그려진다! (column-wise 방향으로)
x = [1,-1,-1,1,1]'
y=[1,1,-1,-1,1]'
s = 1:0.21:2
X = x*s
Y = y*s
plot(X, Y, 'LineWidth', 2)

%% Example 5-1
t = 0 : 0.1:2*pi+0.1; %각도 -- 0.1씩 증가하는, 모자랄 수도 있어서 조금 더 꼬다리에 추가한 모습.
x = cos(t');
y= sin(t');
N = length(t);

c = -5.5 : 5.5; % 원의 중심
C = repmat(c, N, 1); %repmat 는 c를 복사해주는 것!
r = abs(c); % 반지름

X = x*r + C;
Y = y*r;
plot(X,Y)

%% Triangle tower
a = [0 8 4 0];
b = [0 0 4*sqrt(3) 0];

c = [4 6 2 4];
d = [0 2*sqrt(3), 2*sqrt(3) 0];

e = [2 3 1 2];
f = [0 sqrt(3) sqrt(3) 0];

g = [6 7 5 6];
%h는 f 랑 같음

i = [4 5 3 4];
j = [2*sqrt(3) 3*sqrt(3) 3*sqrt(3) 2*sqrt(3)];
plot(a,b,'b-', c,d,'b-', e,f,'b-', g,f,'b-', i,j,'b-')

%% Square spiral

%try:
% x = [0 2 2 -4 -4 6 6 -8 -8 10 10 -12 -12 14 14 -16 -16 18 18 -20 -20];
% y = [0 0 2 2 -4 -4 6 6 -8 -8 10 10 -12 -12 14 14 -16 -16 18 18 -20];
% plot(x,y, 'b-o')

%solution
x0 = 1:20;
x1 = x0 .* (-1).^(x0+1);
x2 = reshape(repmat(x1,2,1), 1, []);
x = [0 x2];

y0 = 2:2:20
y1 = reshape(repmat(y0, 2,1), 1, []);
n1 = 1: length(y1);
y2 = y1.* (-1).^(n1+1);
y3 = reshape(repmat(y2,2,1),1,[]);
y = [0 0 y3(1:end-1)];
figure(1);
plot(x,y,'b-o', 'MarkerFaceColor', 'blue') %o 채우기

%% 그래프의 특징 조정하기
x = [1 2.5 6 3];
y = [2 -1 3 2];
h = plot(x,y,'r-.o','MarkerFaceColor', 'yellow', 'LineWidth', 2) %여러 조합
axis([0 7 -2 4]);

get(h(1))
% set(h(1), 'LineWidth', 1)
% set(gca, 'MarkerFaceColor', 'blue') %gca = get current axis

%% Detailed Graph
d = 10:0.1:22; dd = 10:2:22;
y = 1000*exp(-0.15*(d-10));
yy = 1000*exp(-0.16*(dd-10));
h = plot(d,y,'b-',dd,yy,'r-.o');
axis([8 24 0 1200]);
set(h(1), 'LineWidth', 2); set(h(2), 'LineWidth', 2); % 각각의 두 그래프의 선 굵기 설정
xlabel('Distance (cm)'); ylabel('Intensity (lux)'); %x과 y축에 설명을 덧붙이기
title('Light Intensity as a Function of Distance'); %제목 붙이기
legend('Theory', 'Experiment'); % 범례 붙이기 범례는 드래그해서 움직일 수 있다.
grid;
% 그래프를 띄운 후에, plot tool 창을 켜서(더블클릭) 그래프의 더 자세한 것을 GUI 환경에서 설정할 수 있다!

%% Custeom plot
d = 10:0.1:22; dd = 10:2:22;
y = 1000*exp(-0.15*(d-10));
yy = 1000*exp(-0.16*(dd-10));
h = plot(d,y,'b-',dd,yy,'r-.o');
axis([8 24 0 1200]);
set(h(1), 'LineWidth', 2); set(h(2), 'LineWidth', 2); % 각각의 두 그래프의 선 굵기 설정
xlabel('Distance (cm)'); ylabel('Intensity (lux)'); %x과 y축에 설명을 덧붙이기
title('Light Intensity as a Function of Distance'); %제목 붙이기
legend('Theory', 'Experiment'); % 범례 붙이기 범례는 드래그해서 움직일 수 있다.
grid;

%% function plot - fplot
% function y = myfun(x)
% y = x^2+4*sin(2*x)-1
% end
% fplot('myfun', [-3 3], 'r-')

fplot('x^2+4*sin(2*x)-1', [-3 3], 'r-') %이런식으로 함수를 직접 써서 할 수 도 있다.

%% 음함수의 경우: ezplot
ezplot('x^2-x*y-y^2=2')
% set(h, 'LineWidth', 3)
grid;


%% 로그 스케일로 바꾸기 (linear에서)
x = linspace(0.1, 60, 100); y = 2.^(-0.2*x+10);
plot(x,y);
semilogx(x,y);
semilogy(x,y); %각 파라미터별 로그 스케일로 바꿔서 보기
loglog(x,y) % 둘다 바꾸기

%% Bar Charts
year = 2000:2006;
sales = [8 12 20 22 18 24 27];
bar(year, sales, 'r')
% barh(위와 같이)--옆으로 누운 형식

a = rand(4)
bar(a) %bar를 여러개로 하려면 데이터 자체가 행렬꼴이면 된다.

%% Request: 코스피 지수 데이터 시각화하기
M = readtable('코스피지수 내역.csv');
stackedplot(M);
A = M(:, 'Date');
B = M(:, 'fluctuation');
stackedplot(A,B)

%% Pie Chart

grades = [11 18 26 9 5];
pie(grades, [0 0 0 1 0]);
title('Class Grades');

%% Histogram

s = randn(1, 1000);
[n x]=hist(s);
stem(x, n, 'filled'); hold on;
plot(x,n,'r-.');