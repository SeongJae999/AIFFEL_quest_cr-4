/* 
Quest 1 - Flutter
Pomodoro Timer 만들기 (2024-10-24)
*/

import 'dart:async';

void main() {
  int workTime = 25 * 60; // 25분에 해당되는 초
  int shortBreakTime = 5 * 60; // 5분에 해당되는 초
  int longBreakTime = 15 * 60; // 15분에 해당되는 초
  int cycleCount = 0;

// 시간측정 - 1초마다 실행
  Timer.periodic(Duration(seconds: 1), (timer) {
    // 4회 작업 사이클
    if (cycleCount < 4) {
      if (workTime > 0) {
        print(
            '작업 시간: ${workTime ~/ 60}:${(workTime % 60).toString().padLeft(2, '0')}');
        workTime--;
      } else if (shortBreakTime > 0) {
        print(
            '휴식 시간: ${shortBreakTime ~/ 60}:${(shortBreakTime % 60).toString().padLeft(2, '0')}');
        shortBreakTime--;
      } else {
        cycleCount++;
        workTime = 25 * 60; // 다시 작업 시간 초기화
        shortBreakTime = 5 * 60; // 다시 휴식 시간 초기화
        print('새 작업 사이클 시작');
      }
    } else {
      if (longBreakTime > 0) {
        print(
            '긴 휴식 시간: ${longBreakTime ~/ 60}:${(longBreakTime % 60).toString().padLeft(2, '0')}');
        longBreakTime--;
      } else {
        print('Pomodoro 타이머 종료');
        timer.cancel();
      }
    }
  });
}


/* 
회고
*김우찬: GPT is GOAT. 이 과정이 끝나면 다트에 조금이라도 익숙해지겠지...?
*고은비: 상대적으로 쉬운 언어였던 python을 사용하다가 main 함수를 사용하는 것부터 잘 모르겠다. 학습하다보면 App을 만들 수 있는 날이 언젠가는 오겠지만 너무 어려울 것 같습니다ㅠㅠㅠㅠ
*임만순: 비동기 작업을 할 때 어떤 라이브러리를 사용해야 되는지부터 감이 잡히지 않았고, 작업시간과 휴식시간 그리고 사이클을 처리하는 방법에 많은 어려움이 있었습니다.
*/
