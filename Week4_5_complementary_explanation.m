m = magic(4)
sum(m);
sum(m,2);
sum(diag(m));

max(m)

%% 이미지 파일
dir *.JPG
M = imread('winter.JPG');
%figure, imshow(M);

%imtool(M); %RGB값, 위치좌표 들을 다 탐색하면서 보기 보통 스크립트에선 사용안함~

m = M(:,142:287,:); %imtool로 좌표를 확인해서 인덱싱한 새 이미지
%figure, imshow(m); %태양빛이 비치지 않는 부분 잘라내기
m2 = M(1:125,1:105,:);
%figure, imshow(m2); %태양이 있는 부분만 잘라내기

%% input 창 띄우기
%name = inputdlg("Como te llamas?"); %창 만들기
disp(['Hello, ', name{1}]);

% age = inputdlg('Cuantos anos te tienes?');
% fprintf('Usted va a tener %d anos en ano que viene.\n', str2double(age)+1);

%% () [] 쓰는 상황 차이

% ()는 함수에 사용한다.
log10(3)
% 수학적 소괄호 때 ()을 사용한다.
% range 선언 할 때,
a = (3:8)
% string, array를 인덱싱할 때 ()
a(2)
%matrix 등을 선언할 때,()
b = magic (3)
c = randi (4,3)

% 이런 martix들을 붙일 때 []
d = [b,c]
e = [b;,c] %밑에 붙이기

% string을 여러개를 만들고 싶을 때
msg = ['yes'; 'nop'] % 서로 글자수가 같아야한다
% {}을 쓰면 상관 없다. -- cell이라는 자료형임
msg1 = {'yes', 'no', 'thank you', 'love you'}
% 이 때의 인덱싱
msg1(1) %cell 자료형을 인덱싱하면 cell이 나온다
msg1{1} %cell 자료형을 {}으로 접근하면 그 안에 string이 나온다 -- key-value 쌍 처럼

fprintf('%s\n', msg1{1}) %fprintf('%s\n', msg1(1))은 불가능

% {}의 활용
c1 = {magic(3), randi(3,4, 2)} %다르게도 
% 참고. randi 는 첫번째 파라미터: random한 수의 범위, 두번째: 까지만있으면 N*N행렬, 세번째도 있으면: N*M행렬

%% for문
for n = 1:9
%     disp(n)
    fprintf('3 x %d = %2d\n', n, 3*n);
end
%breakpoint 사용해보기 -- loop을 차례차례 돌면서 보아준다


% fibbonachi series
f0 = 0;
f1 = 1;
for n=2:10
    fprintf('%d번째 피보나치 수는 %3d입니다.\n', n, f0+f1)
    temp = f0;
    f0 = f1;
    f1 = temp + f1;
end

%% if문
n = input('enter a number: ');
if mod(n,2) == 0
    fprintf('%d is even', n)
else
    fprintf('%d is odd', n)
end