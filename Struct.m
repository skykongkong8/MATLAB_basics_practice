%% Struct이 뭐냐
car(1).company = 'company a';
car(1).color = 'white';
car(1).year = '2021';
car(1).type = 'sedan';
whos car;

car(2).company = 'company b'; %작업공간에서(해당 struct더블클릭) 인스턴스별로 속성업데이트 여부를 확인할 수 있다
car(2).color = 'black';
car(2).year = '1888';
car(2).type = 'tau';

whos car;

car(1) % 해당인스턴스의 속성을 한꺼번에 볼 수 있다.

%stuct는 파이썬 클래스와 비슷한듯!

%% 복수 선택
car(:).company;%모든 자동차 선택-- +회사 속성을 한번에 보기
list_company = {car(:).company}; %배열에 저장하기는 cell로 해야한다.

list_year = {car(:).year}; %cell을 쓰지 않는다면 가장 최초 하나만 이상하게 저장되므로 주의!