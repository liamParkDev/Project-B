## Project-B 스크립트 기능 간략 소개

### 클라이언트 패치 스크립트

0.mkdir.sh
- 매월 신규 폴더 생성
- crontab 설정

1.sync.sh
- 로컬 파일 CDN 동기화
- 병렬 처리
  
2.generate.sh
- 동기화 파일 리스트 출력 (기록 보관)

3.purge.sh
- pugre 리스트 재출력
- purge 진행

4.rmdir.sh
- 90일 이전 로그 삭제
- Crontab 설정
  
5.backup.sh
- DB 2차 백업 파일 FTP 전송
