%% 함수기초 --Length와 Size
% 아마 파이썬 len()과 비슷하지 않을까.
help length; %-- returns the length of vector X ++

%% 연습해보기
a = [1:1:10];
length(a) % 10이 반환된다
b = [1;2;3]
length(b) % 3이 반환된다 -- 벡터길이 이므로!

c = [1 2 3;4 5 6];
length(c);
d = [1 2; 3 4; 5 6];
length(d); %모두 3이 나온다. length는 Matrix가 온다면 가로 세로중 더 긴것의 길이를 알려준다.

%% Cell의 경우:
C = {'a', [1 2 3], 'hello world', [1 2; 2 3]};
length(C); % 4가 나온다. 벡터처럼치면 4개니깐
length(C{2}); % 3이 나온다. 이러면 cell에 저장되어 있는 것의 길이가 나온다.

%% Struct의 경우
car(1).type = 'suv';
car(1).company = 'samsung';
car(2).type='menos grande';
car(2).company ='LG';

length(car); % 2
length(car(1).company); % 7

length({car(:).type}) %2

%% Size함수
help size; %size of array : 배열의 크기를 알 수 있다는 것임!: returns two element row-vector(가로 벡터) [M, N]
E = [1 2 3 4; 4 5 6 7; 7 8 9 10];
size(E); % [3 4]이 나온다.
size(E'); %[4 3]이 나온다. Transpose했으므로!

C = ones(100, 200);
size(C); % 100 200 그대로 나와용

F = eye(111, 45645);
size(F);

%% Cell의 경우
my_cell = {'a', 'dumplings'; [1 2 3; 4 5 6], 88};

size(my_cell); %[2 2]
size(my_cell{2,1}); % {2,1}번째 요소인 matrix 크기 [2 3]이 나온다.