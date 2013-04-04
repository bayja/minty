Feature: 좋아하는 트윗 선택하기
	In order to 내가 좋아하는 트윗을 모아보기 위하여
	As 서비스 사용자는
	So 좋아하기를 할 수 있다.

	Scenario:
		Given 트윗이 있다.
		And   사용자가 있다.
		When  좋아요 버튼을 누른다.
		Then  사용자의 좋아요 목록에 좋아한 트윗이 보인다.