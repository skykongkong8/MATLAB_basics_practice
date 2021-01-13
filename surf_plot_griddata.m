%% no grid data의 경우
x = 0:1:4;
y = 0:1:4;
[x_mat y_mat] = meshgrid(x,y);

Z_mat = [0 0 0 0 0;
    0 1 1 1 0;
    0 1 2 1 0;
    0 1 1 1 0;
    0 0 0 0 0];
surf(x_mat, y_mat, Z_mat);
xlabel('x'); ylabel('y'); zlabel('z');

shading interp; %색깔 배치를 주변과 잘 비율적으로 맞도록 조정

% 그런데, 이건 data의 크기가 적어서 맨손으로 직접 입력했지만, 해상도가 높은 구조물/그래프/data의 경우??

%% griddata를 사용
clear all; close all; clc;
figure(1);
x = -1:0.1:1;
y = -0.5:0.05:0.5;
[X_mat, Y_mat] = meshgrid(x,y);

Z_mat = zeros(length(y), length(x));

surf(X_mat, Y_mat, Z_mat);

% 이 상태에서, 각각의 점을 잡는다 - 이 경우, 피라미드 골의 각각의 꼭짓점
pt = [-1, -0.5, 0;
    -1, 0.5, 0;
    1, 0.5, 0;
    1, -0.5, 0;
    0, 0, 1];
% help griddata -- interpolates scattered data = 점 사이 빈 값들을 연속적으로 채워준다
pyramid = griddata(pt(:,1), pt(:,2), pt(:,3), X_mat, Y_mat);
figure(2);
surf(X_mat, Y_mat, pyramid);