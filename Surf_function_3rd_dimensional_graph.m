%% meshgrid 먼저 익히기
%각 축별 데이터를 하나의 행렬로 각각 계산하는 함수
% [X Y] = meshgrid();


%% meshgird를 쓰지 않고 해보기
X_mat = [0 1 2 3; 0 1 2 3;
    0 1 2 3; 0 1 2 3];
Y_mat = [ 0 0 0 0;
    1 1 1 1;
    2 2 2 2
    3 3 3 3];

Z= sin(X_mat) .* sin(Y_mat) % .*으로 요소끼리의 곱을 계산한다
surf(X_mat, Y_mat, Z);

%% meshgrid를 사용하면?
x = 0:1:3;
y = 0:1:3;
[x_mat y_mat] = meshgrid(x,y); %이렇게하면 위의 X_mat, Y_mat와 같다
z_mg = sin(x_mat) .* sin(y_mat);
surf(x_mat, y_mat, z_mg); % 더 단순하게 만들 수 있다.

% 번외
figure(1); % figure -- (n) 넣으주면 이후 figure 있는 만큼 여러개의 그래프의 창들을 보여준다.
x = 0: 0.01*pi : pi;
y = 0: 0.01*pi : pi;
[x_mg, y_mg] = meshgrid(x,y);
z_mg = sin(x_mg).*sin(y_mg);
surf(x_mg, y_mg, z_mg);


% 그래프가 특정 축에 대해 변화가 없을 경우를 시각화
figure(2);
z_mg2 = sin(x_mg) * 1;
surf(x_mg, y_mg, z_mg2);

%% surf 그래프 속성 바꾸기
figure(1);
x = 0: 0.01*pi : pi;
y = 0: 0.01*pi : pi;
[x_mg, y_mg] = meshgrid(x,y);
z_mg = sin(x_mg).*sin(y_mg);
surf(x_mg, y_mg, z_mg);

xlabel('x-axis'); ylabel('y-axis'); zlabel('Z = f(x,y) = sin(x)*sin(y)');
colorbar % 등고선색을 부여
% shading flat; %색깔을 위에서 보면 부드럽게 나타나는게 아니라 각지게 나타남
% shading interp;
shading faceted; % 디폴트 그리드가 뚜렷하게 드러난 형태

% colormap hot; colormap으로 colorbar의 색깔 양상을 조절할 수 있다. help colormat을 참조!
colormap hot;
colormap(flipud(colormap)); % colorbar 뒤집기
ylim ([0 pi]);
xlim([0 pi]);
zlim([0 2])

% axis equal %3축 모두 똑같은 크기로 맞추는 함수
%  axis normal % 원래대로 돌아옴

alpha(0.75) % 투명도 조절 0~1까지
% view(2) 그래프 보는 시점 설정

