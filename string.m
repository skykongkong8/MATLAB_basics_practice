%% 문자열
s1 = ['a','b','c','d','e'];
s1(2) %string도 인덱싱할 수 있다!
s2=['abcde']; %이렇게 해도 s1과 똑같다.

s3= s2' %세로 벡터로 바꾸고 싶을 때 or 똑같이 semi coloumn써도 됩니당
whos s2

%% 인덱싱하기
s2(1:3);
s1(:) %이렇게 하면 세로벡터로 출력이 된다. 이걸 해결하고 싶다면 (row가 지정이 안되서 그런가봄
s1(1, :) %이렇게 좀더 정확하게 지칭을 해주어야한다.

%% 주의 파이썬과 다른점..이라기보다 헷갈릴것같은거
s_mat = ['name1', 'name2', 'name3']; %이러면 요소끼리 다 붙어서나옴 벡터가 되는것임
whos s_mat 
s_mat2 = ['name1';'name2';'name3']
whos s_mat2 %이러면 3X5행렬임 문자열이 모두 한칸씩 차지한다.
 %단 이 경우 요소끼리의 길이가 다 일정해야함! 그래야 행렬에 차곡차곡 들어가므로(이 점은 int matrix여도 똑같다.)

%% 인덱싱 똑같다.
s_mat2(2:3, 4:5) %요런 느낌

%% CF) 만약 글자 하나하나가 자동으로 전부 찢어지는게 아니라, 글자 단위로 행렬을 생성하고 싶다면?
% 셀 이라는 개념을 이용한다. -다른 노트에서 보기로 한다.