%% plot
help plot; %여기에서 각종 character들의 종류를 확인할 수 있다. 'b-'등!
X_test = [0:1:10];
y_test = 2*X_test;

plot(X_test, y_test);

%% exercise more
X = [0:0.1:10];
y = sin(X);
plot(X,y);

xlabel('x-axis'); ylabel('y-axis');
title('y=sin(x)');

%% plot characteristics

plot(X,y, 'r*');
plot(X,y,'bo');

%% M-file 활용--저장해서 활용하자.

%% 그래프를 하나 이상 그리기
%차례로 X,y에 해당하는 벡터를 짝지어서 넣어주면 된다.
X2 = X;
y2 = X2-5;

plot(X,y,'gd', X2, y2,'mo');
legend('y=sin(x)', 'y = x-5');
grid on;

%% 변형
plot(X,y);
hold on;
plot(X2, y2);
%hold on을 사용하면 쓴 그래프를 유지시켜주기 때문에 따로 쓰더라도 한번에 그래프를 그릴 수 있다!
hold off; %그리고 이렇게 hold off를 해주어야 잡은 상태가 해제되어서 이후 그래프에 영향을 미치지 않는다.

%% 곡선을 좀 더 위주로 그려보자
x = -10:0.1:2*pi;
y = x.^2; %함수에서 제곱을 표한현하고 싶을 떄는, .^이렇게 점을 찍어주어야 한다!
plot(x,y, 'b-');
title('multiple arcs');
xlabel('x-axis'); ylabel('y-axis');
grid on;
legend('y=x^2');

y_sine = sin(x);
y_cosine = cos(x);

plot(x, y_sine, ...
    x, y_cosine); %이렇게 ... 점 3개를 찍으면 줄바꿈할수있다.
grid on;

%% 플랏그래프 속성 직접 바꾸기

