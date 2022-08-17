# 아이디어스(idus)

### 개발환경 

- [x] [필수] Swift로 개발 / Xcode 사용 
- [x] [필수] iPhone / iOS 13 이상 지원
- [x] 모든 3rd-party library는 사용 불가합니다.



### Architecture 

> MVVM + CleanArchitecture 

- Search Scene Flow 

<img width="998" alt="스크린샷 2022-08-17 오후 6 15 31" src="https://user-images.githubusercontent.com/59790540/185082171-4269483d-e855-42d4-814a-b5ff4308a571.png">

- DetailPage Scene Flow

<img width="987" alt="스크린샷 2022-08-17 오후 5 54 08" src="https://user-images.githubusercontent.com/59790540/185081927-26bfe189-d3d7-4390-bd0a-b6979fef844d.png">






## 요구사항

### Search 

- [x] [필수] APP_ID를 입력받고, 위 API를 호출하여 응답을 받는다.
- [x] [필수] 위 API의 응답이 validate하다면, App Detail 페이지로 이동한다.
- [x] API의 응답이 invalidate하다면, 유저가 인지할 수 있도록 표시한다.

<img src="https://user-images.githubusercontent.com/59790540/185082542-aaa043e5-28b3-40ee-9bc2-2d188100ecd3.gif" width="200">


### App Detail 

- [x] [필수] 앱의 스크린샷 이미지들을 모두 탐색할 수 있다.
- [x] [필수] ‘펼치기/접기’ 버튼으로 앱 설명 영역을 펼치고 접을 수 있다.
- [x] 앱 카테고리, 크기, 리뷰 등의 API에 포함된 정보들을 보여준다.
  - API로 제공되는 데이터들은 최대한 표현할 수 있게 하였습니다. 
- [x] 스크린샷 이미지를 탭 시, 이미지를 크게볼 수 있는 화면을 제공한다.
- [x] 이미지 / 앱 설명 / 앱 정보 각각을 가시성 있게 노출한다.


https://user-images.githubusercontent.com/59790540/185083646-021f72df-17a7-4557-831f-2424d9924cc3.mp4 

https://user-images.githubusercontent.com/59790540/185084180-d3f3ff41-e21d-4f11-8284-d95864664d86.mp4



### 고민했던 점 

#### 객체간의 데이터 전달과 바인딩 방식에 대한 고민 
  - 각 모듈이 분리가 되어있고, 이들간의 비동기적으로 데이터가 전달해주는데 있어서, completion Handler를 통해 데이터를 전달해 주었습니다. 
  - 각 ViewModel에서는 Observable 객체로 요청한 데이터가 들어온다면 listener(View) 에게 전달해주어, 뷰가 업데이트 될 수 있도록 하였습니다. 


#### 현재 구현한 흐름에서는 Search흐름, DetailPage 흐름에서 각 동일한 API를 요청하여 필요한 값들을 얻어오고 있습니다. 
  - Search Scene에서 넘어온 ViewModel을 DetailPageViewController에게 주입을 해주는 방식으로 리팩토링을 한다면 DetailPageScene에서 한번 더 API요청을 하는 작업을 없앨 수도 있지 않을까 생각합니다. 




#### 뷰 계층

  - 스크롤 뷰 안에 각 뷰들을 넣는 방식으로 구현 했습니다. 

    - 한 섹션이라고 생각되는 뷰들은 CustomView로 구현하도록 하였습니다.

    <img width="313" alt="스크린샷 2022-08-17 오후 6 41 17" src="https://user-images.githubusercontent.com/59790540/185088137-96da5302-fc12-4468-be71-119d823715e7.png">


