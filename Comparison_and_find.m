%% Comparison 비교 --  (Boolean)
1 == 1; %True 에 대해, 1 이라고 출력한다.
1 == 2; %False 에 대해, 0 이라고 출력한다.

'a' == 'a'; % 이것 역시 1
'a' == 'b'; % 0

% != 와 같은 표현 : ~=

1 ~= 1; % False -- 0 출력
'a' ~= 'b' % Trye -- 1 출력

%각종 >, <등의 부등호를 활용한 Boolean도 있다.

%% find 함수++a

help find; % 배열에서 "0이 아닌" 요소의 인덱스를 포함하는 벡터를 반환

A = magic(3);
find(A>5); 

find([100 200 300]);
find([0 100 200 300]); %0이 있는 곳의 인덱스는 반환하지 않고, 그 외의 것들만 반환함

find([0 0 0]); %비어 있는 벡터 []반환

%이것을 불리언 반환값 0 , 1을 이용해서 True인 것의 인덱스만 반환하도록 유도할 수 있다.

arr = [1 2 3 4 1 2 3 4 1 2 3 4];
index = find(arr >= 3); %3,4가 있는 배열의 인덱스만을 반환
one_index = find(arr == 1); % 1이 있는 인덱스만 반환
impossible_index = find(arr > 1234354354354354354354); %이런건 없으니 빈 배열 반환

% 반환해온 인덱스 활용하기! *(Boolean을 활용한 인덱스로 인덱싱)
arr(index); % 따온 인덱스를 가져와서 다시 정보를 꺼내오는 방식에 적용할 수 있다!