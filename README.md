# Terraform basic TestCode
## Repository RoadMap
## 1. chapter_1
Terraform 기본문법 remind
## 2. chapter_2
AWS와 Terraform 통합 코드
- 모듈사용하여 하위폴더 관리

## 3. chapter_3
chapter_2의 확장
- 모듈 사용 및 data 사용

## 4. chapter_4
보간문의 추가
- 조건문(if-else) , 내장 함수, 반복문(for , for_each) , lock file 등

## 5. for_and_for_each study
Terraform for문과 for_each 구문에 대해 학습
- for 구문 : variable.tf 파일을 정의하여, Terraform console로 학습
- for_each 구문 : security Group을 for_each 로 생성하여 학습

## 6. Terraform module 화
Terraform 코드를 모듈화 하여, dev , prod 계층별로 같은 모듈을 공유함.

이를 통해 재사용성을 확보할 수 있으며, 

tf.state 파일을 따로 관리하게 되기 때문에, dev 계의 state가 변화하더라도 , prod에는 영향이 가지 않아 테스트하거나 인프라 확장 등에 용이함.
