
/*
 계산기 앱 만들기

 1. UILabel을 추가
    - 제약 설정

 2. UIButton 1개를 추가 (재사용이 가능하게)
    - 버튼 제약 설정
      * setTitle의 text는 계속 바뀌어야 함

 3. title이 다른 버튼 4개 생성
    * 여기서 버튼을 생성할 때 text를 확인해서 색상을 바꿔주기

 4. title이 다른 버튼 4개를 받아서 StackView로 바꿔주기 (함수 사용)
    [UIButton] -> UIStackView
    horizontalStackView

 5. 세트화된 horizontalStackView를 4개 생성
    [StackView]

 6. horizontalStackView를 4개 받아서 VerticalStackView로 바꿔주기 (함수 사용)
    [StackView] -> StackView

 7. 연산 시 주의할 점
    버튼에 따라 동작하는 것이 다름. = 연산을 할 때만 연산 결과가 반영되어야 함
    연산 결과가 나오면 결과 값만 다시 써야함
    number를 기준으로 생각해봤을 때, 연산의 결과를 number에 표시하되,
    연산이 끝나면 해당 연산을 기점으로 number에 값이 업데이트 되어야 함.
 */
