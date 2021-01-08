%% fprintf

% C의 포매팅처럼 %d, %f 등을 사용
% cf) %*d 사용-- field width 라고 하는데, 2개까지 받는다
n = [8 1 6]
fprintf('%2d %2d %2d\n', n);
fprintf('Magic Numbers\nDo Exist!\n');
fprintf('The numvers are %d, %d and %d', n);

% 기본 언어에는 없는 기능1
% 행렬 data를 계속해서 반복문처럼 출력한다
n=(1:9)';
times2 = [2*ones(9,1) n 2*n]
times2'
fprintf('%d x %d = %2d\n', times2')

%다른 포맷팅 해보기
%소숫점 자리 맞추기/ 칸 별 오른쪽정렬, 왼쪽 정렬
fprintf('%5.1f %-5.1f', pi, pi);

%텍스트 파일에 직접 쓰기-파일생성 위치는 matlab저장소, 반드시 fclose로 닫아주기
n = (1:9)';
times2 = [2*ones(9,1) n 2*n];
fid = fopen('times2.txt', 'w');
fprintf(fid, '%d x %d = %2d\n', times2');
fclose(fid);




%% Comments

%방법1: %이하문장으로 주석 넣기

%방법2: 여러 줄의 주석 넣기

%{
이런 방식으로 Block comments를 (여러 줄의 코멘트)
넣을 수 있다.
%}

% 방법3: 블록지정 후, ctrl+r을 누르면 주석지정이 되고, ctrl+t를 누르면 해제된다.





%% Web Publishing

% 퍼센트를 두 번 써주면 챕터? 별로 구분이 된다.
% LaTex으로 수학식을 써준다 -- $이 사이에 쓰면 된다$
% $S_n = \sum_{k=1}^{n} k = \frac{n(n+1)}{2}$
% 입니다.

n = 10;
k=1:n;
s1 = sum(k);
s2 = n*(n+1)/2;
fprintf('%3d = %3d ?\n', s1, s2);





%% LaTex 기본 수식 알아보기
% $z = \sqrt{x^2 + y^2}$
%
% $x \simeq a_1 \times b_1^2$
%
% $z = \frac{\alpha}{\beta^2}$
%
% $s_1 = \sum_{k=1}^n k^2$
%
% $y = \int_{0}^{\infty} e^{-x^2} dx$
%
% $\lim_{x\to\infty}f(x)=0$
%
% $\sin(x+y) = \sin x \cos y + \cos x\sin y$
%
% $\mathcal{A}(x) \equiv \Delta(\mathcal{D})$
%
%구글에 LATEX symbol이라고 검색하면 잘 나옵니다!

%% Matlab Data FIle

% save 커맨드 -- 변수만 따로 할수도 있다.
save mydata name 등

%% 엑셀파일 읽기/쓰기
a = xlsread('엑셀파일 이름.xlsx',-1) % -1 옵션을 같이주면 엑셀 파일이 열리며 일부분만 마우스로 지정하여 불러온다.
b = xlsread('엑셀파일 이름.xlsx', 'Sheet1', 'A3:B4') % 이와 같이 엑셀파일을 인덱싱?해서 불러올 수 있다,

xlswrite('magic.xlsx', magic(4)); %이런 식으로 엑셀 파일을 쓸 수 있다.
xlswrite('blahblah.xlsx', magic(7), 3, 'B2'); % Sheet3에 넣어서, B2부터 넣는다는 의미. 3 대신 string으로 이름지정 가