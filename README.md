# Fluentd
## 1. 배경
* 서버간 분산되어 있는 마이크로 서비스들의 로그 추적의 어려움
* 중앙 집중형 로깅 방식 필요성
* 파일 로깅의 속도 저하(개발시 비즈니스 로직에만 집중하고 로깅 고려 없이 개발 가능)
* AWS ECS(Elastic Container Service) 환경 고려
  
-----------

## 2. 구성도
![image](https://github.com/siawase7179/Fluentd/assets/152139618/aded3c84-f555-4d49-8afe-5edd135bcbb5)

-----------

## 3. 포테이너 log driver 리스트
![image](https://github.com/siawase7179/Fluentd/assets/152139618/474a970e-5837-4039-826a-de10982d1a1e)
> [!NOTE]
> Docker document : https://docs.docker.com/config/containers/logging/fluentd/

-----------

## 4. 컨티에너 log driver 설정
![image](https://github.com/siawase7179/Fluentd/assets/152139618/19693dc2-e5a4-48ad-bcb4-5fe710e0e58b)
> [!NOTE]
> tag 옵션을 사용하여 flutend 서버에서 이벤트 별 분기 처리 가능
-----------

## 5. fluentd 설정
### Storage 저장
![image](https://github.com/siawase7179/Fluentd/assets/152139618/07dd4ead-8ada-4e74-8074-bd5a4463c29d)
* tag(conatiner name과 container id로 구분) 별 별도의 파일 생성
* D-1 압축 보관

### kafka 전송
![image](https://github.com/siawase7179/Fluentd/assets/152139618/c3f9944d-7869-447b-bae2-cb323d96f409)

-----------

## 6. Kibana 
![image](https://github.com/siawase7179/Fluentd/assets/152139618/01678e15-8e96-4570-99c3-e4e00df65ba0)

## 7. 결론
1. 이미 ELK 구성으로 중앙 집중을 하였지만 ELK로 보내기 위해 별도의 filebeat을 설치해야 되는 번거로움이 제거 되었다.
2. 어플리케이션의 별도 파일로깅 없이 처리가 가능하다.
3. EFK를 찾아보면 k8s 환경에서 사이드카 패턴으로 pod를 구성하는 게 많이 나오나 아직 k8s까지 고려대상이 아니라 아쉬움이 남는다.

> [!NOTE]
> 참고 : [여기어때 기술블로그 : EKS환경에서 EFK 도입기](https://techblog.gccompany.co.kr/eks-%ED%99%98%EA%B2%BD%EC%97%90%EC%84%9C%EC%9D%98-efk-%EB%8F%84%EC%9E%85%EA%B8%B0-e8a92695e991)
