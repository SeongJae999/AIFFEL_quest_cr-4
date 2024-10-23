# 인공지능 서비스 디자인하기
**1. 어플리케이션의 정보구조도 및 레이블링(하단 탭 구조)과 와이어프레임**  
    - 어플리케이션 설명: 습관을 만들고 싶은 현대인들에게 "꾸준러"를 챌린지를 진행하는 앱이다.  
    - 와이어프레임
![와이어프레임](https://github.com/user-attachments/assets/40bd62cc-6ad4-4b49-b236-ba445308edbf)

**2. 와이어프레임을 바탕으로 프로토타이핑 툴(Oven, Figma, Adobe XD, Protopie 등)중 하나를 사용하여 프로토타이핑을 완성**  
    - marvelapp을 사용하여 프로토타이핑을 진행하였다.  
    https://marvelapp.com/prototype/1bab4224/screen/95834101
    
**3. 프로토타이핑 화면을 플러터로 구현**
![my_application_01 – main dart](https://github.com/user-attachments/assets/e49340bf-f65e-4efe-8eec-ee97b4e488dd)


**#회고**  
    - 아직 flutter를 다루는 게 익숙치 않아서 프로젝트를 수행하는 데 어려움이 있었다.  
    - StatelessWidget이 아닌 StatefulWidget으로 사용하여야 할 때, MaterialPageRoute 같은 동적 경로 생성자를 사용할 때 등 계속 에러가 있어서 시간이 많이 소요되었다.  
    - 특히, ID로 입력받은 값을 전달받아서 다음 화면에 보여줄때를 구현하는 것이 어려웠었는데, print로 디버깅하면서 시도하였지만, 2개의 화면 중 1개의 화면만 성공할 수 있었다. 구현하지 못한 부분은 추후 수정보완작업을 진행하여야 할 것 같다.




# AIFFEL Campus Online Code Peer Review Templete
- 코더 : 고은비
- 리뷰어 : 김승기


# PRT(Peer Review Template)
- [x]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
    - 구현하고자 하셨던 내용은 정상적으로 실행된 것으로 확인됩니다.
        ![스크린샷 2024-10-23 180333](https://github.com/user-attachments/assets/c62958dc-0dd6-4f4b-afb7-7b428e64dbdc)    ![스크린샷 2024-10-23 180323](https://github.com/user-attachments/assets/f87f6856-e6ac-47ba-a0a6-eb7d7e671d84)

    
- [x]  **2. 전체 코드에서 가장 핵심적이거나 가장 복잡하고 이해하기 어려운 부분에 작성된 
주석 또는 doc string을 보고 해당 코드가 잘 이해되었나요?**
    - 값을 넘겨주는 부분, 설명 주석 추가
      ![image](https://github.com/user-attachments/assets/c5fbab8e-ad23-4634-a827-b3cb446e744b)

        
- [x]  **3. 에러가 난 부분을 디버깅하여 문제를 해결한 기록을 남겼거나
새로운 시도 또는 추가 실험을 수행해봤나요?**
    - 에러난 부분 기록
      ![스크린샷 2024-10-23 180529](https://github.com/user-attachments/assets/5badf7ba-e8e2-4119-9eaa-ad40a7edf180)

        
- [x]  **4. 회고를 잘 작성했나요?**
    - 위에 잘 작성 되어있습니다.
        
- [x]  **5. 코드가 간결하고 효율적인가요?**
    - 리뷰어 본인도 하지 못했지만 각 페이지를 다트파일로 나눠 구현하였으면 더 보기 편할듯하다.
    - 전체적으로 잘 작동되는 코드입니다.


# 회고(참고 링크 및 코드 개선)
```
지금까지 배웠던 내용을 잘 활용하신 것이 보입니다.
값을 넘기거나 받고 stateful위젯을 활용하여 사용자가 선택한 버튼의 색상을 변경된 것을 볼 수 있습니다.
화면 전환도 잘 구현 되어있었고 전체적으로 잘 작성되었습니다.
```
