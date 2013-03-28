Feature: 사용자 목록 보여주기
	In order to 사용자 목록을 보기 위해서
	As I 서비스 사용자
	So that 목록 페이지를 본다

	Scenario:
		Given "dddd" 라는 이름의 사용자가 있을 때
		When 사용자 목록 페이지에 방문하면
		Then "dddd" 사용자가 목록에 출력 되는 것