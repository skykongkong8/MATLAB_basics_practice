%% 기본 그래프
x = 0:0.1*pi:10*pi;
y = sin(x);
plot(x,y,'b');
% legend('y=sin(x)');
grid on;
xlabel('x-axis'); ylabel('y-axis');
title('My Graph');
ylim([-1.5 1.5]); % 표현하는 범위를 지정해주는 함수 ylim
xlim([0 35]);
hold on;

% find 함수를 같이 사용하기
max([1 2 3 4 5]); %입력 배열에서 최댓값을 출력하는 함수 max()
min([1 2 3 4 5]); %반대 함수 min() -- python과 똑같다.

max_value = max(y);
min_value = min(y);

index_sineMaxValues = find(y == max_value) ...
    %y값이 최대인 위치를 갖는다 근데 이때, pi의 각각의 값이 x배열에서 지정되어있지 않다면 배열형식에서 누락될 수 도 있다.

% 최댓값인 점 찍기
plot(x(index_sineMaxValues), ...
    y(index_sineMaxValues), 'r*'); %각각의 x,y의 벡터 길이가 같아야함+ 각각의 자리 맞추기
% hold off;

% 최솟값인 점 찍기
min_index = find(y == min_value);
plot(x(min_index), y(min_index), 'r*');


legend('y=sin(x)','max','min');
hold off;

