% data_source = https://data.giss.nasa.gov/gistemp/maps/

clear all; close all; clc;
%% Feature Engineering
% 1. column 이름 등은 필요하지 않으므로 주석 처리한다. Matlab기분 % 붙여주면 된다.
% 2. dataset에서 필요한 data만 채굴해온다 : longitude, ladtitude, array(i,j)-온도변화 만
% 필요하고 첫 두 칼럼은 의미가 없다.

data = load('amaps.txt'); % 16200x5 인 data인 것을 알 수 있다.
longitude = data(:, 3); % 모든 row에 3번째 column인 애들
latitude = data(:, 4); % 모든 row에 4번째 column인 애들
T = data(:, 5); %온도
% 단 T 데이터가 surf를 쓰려면, matrix를 써주어야 하기 때문에, 위의 벡터를 그대로 써줄 수는 없다. 
% 이 떄 griddata를 쓰는 것!

[X Y] = meshgrid(-180: 1: 180, -90:1:90); % XY 좌표평면을 만들어줌

Temp = griddata(longitude, latitude, T, X, Y); %longitude, latitude,T 데이터를 X,Y평면에 입혀주기(data mapping)
surf(X, Y, Temp);
%해보니까 값이 이상함! Feature engineering 더하기

%% 인덱싱으로 값 조작하기
index = find(T>10);
T(index) = NaN; %생략 선언
[X Y] = meshgrid(-180: 1: 180, -90:1:90); % XY 좌표평면을 만들어줌
figure(1);
Temp = griddata(longitude, latitude, T, X, Y); %longitude, latitude,T 데이터를 X,Y평면에 입혀주기(data mapping)
surf(X, Y, Temp); %색이 까맣게 보인다면 줄들이 너무 촘촘하며 박혀있어서 그런것이다.
view(2); %세계 지도에 씌울 것이므로 수직 뷰로 설정
shading flat; % 까만 줄 없애기
colorbar;
colormap hot;
colormap(flipud(colormap)); %하얄수록 떨어짐, 검을수록 높아짐
caxis([-0.2 4.1]); % colorbar 범위 설정

%% 세계지도 사진에 데이터 씌우기
%이미지 불러오기
world_map = imread('equirectangular_world_map.jpg');
figure(2);
image(world_map)
% 이미지 수정을 해줘야함 -- data의 스케일과 이미지의 스케일이 맞도록!
image([-180 180], [-90 90], world_map); % 처음에 좌표평면 설정할 때 썼던 값으로
%그런데 여기까지 하면 음수값이 위에 있고 양수값이 밑에 있는 이상한 상황이 된다. 그래서 이미지를 돌린후 전체를 돌린다.
image([-180 180], [-90 90], flipud(world_map));
set(gca, "YDir",'normal') % get current axis 이렇게 뭐 할 수 있다.

%여기서 hold on을 해주고 기존 코드를 그대로 써준다.
hold on;

surf(X, Y, Temp);
colorbar;
view(2);
shading flat;
colormap hot;
colormap(flipud(colormap));
caxis([-0.2 4.1]);

%근데 이러면 투명도가 너무 없어서 지도가 하나도 안보이고 그냥 가려지게 된다 이 값도 조정해준다
alpha(0.5);
xlabel('longitude [degrees]');
ylabel('latitdue [degress]');
title(['Global Temperature Change from 1957 to 2020', ...
    "Source : NASA https://data.giss.nasa.gov/gistemp/maps/"]);

%% 쫌 더 디테일 : NaN값에는 별도 표시를해주자

% isnan(Temp) 함수를 이용해서 nan값을 찾아서
Temp(find(isnan(Temp))) = 100; %의미 없는 값들을 지정

%다시해주면:
%이미지 불러오기
world_map = imread('equirectangular_world_map.jpg');
figure(2);
image(world_map)
% 이미지 수정을 해줘야함 -- data의 스케일과 이미지의 스케일이 맞도록!
image([-180 180], [-90 90], world_map); % 처음에 좌표평면 설정할 때 썼던 값으로
%그런데 여기까지 하면 음수값이 위에 있고 양수값이 밑에 있는 이상한 상황이 된다. 그래서 이미지를 돌린후 전체를 돌린다.
image([-180 180], [-90 90], flipud(world_map));
set(gca, "YDir",'normal') % get current axis 이렇게 뭐 할 수 있다.

%여기서 hold on을 해주고 기존 코드를 그대로 써준다.
hold on;

surf(X, Y, Temp);
colorbar;
view(2);
shading flat;
colormap hot;
colormap(flipud(colormap));
caxis([-0.2 4.1]);

%근데 이러면 투명도가 너무 없어서 지도가 하나도 안보이고 그냥 가려지게 된다 이 값도 조정해준다
alpha(0.7);
xlabel('longitude [degrees]');
ylabel('latitdue [degress]');
title(['Global Temperature Change from 1957 to 2020', ...
    "Source : NASA https://data.giss.nasa.gov/gistemp/maps/"]);

%++ detail 좀 더
plot([-180 180], [0 0], '-k');
plot([0 0], [-90 90], '-k');