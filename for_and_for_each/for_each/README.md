# for_each test variable
terraform for_each study
- [관련 공식문서](https://developer.hashicorp.com/terraform/language/meta-arguments/for_each)

## to use
variable.tf에 정의된 변수로, Terraform for_each 구문을 학습함.

for_each 구문은 , 중첩 블록 ({} 내부 {}...) 상태의 Terraform code에서, 여려개의 값을 반복해서 사용하기 위해 사용함.

주로 특정 값을 기준으로 여러 리소스를 반복해서 생성할 때 사용,.

## Example 설명
해당 예제에서는, 22, 443 번 포트를 ingress로 open하는 ingress security group을 2가지 생성함.

이때 443 포트일경우는 cidr_block이 "0.0.0.0/0" 으로 생성하며,
22번 포트일경우에는 cidr_block이 "127.0.0.1/0", "192.168.0.0/24" 두가지로 할당됨.

list만 사용하여 value를 넣어줄 수 있고, 해당 예제처럼 map으로 할당하여 key , value를 넣어줄 수 있음.
- [코드](./securitygroup.tf)

## for_each의 확장
- [관련_공식문서](https://developer.hashicorp.com/terraform/language/meta-arguments/for_each#chaining-for_each-between-resources)
object 키워드를 사용해서 , 아래 예시처럼 나만의 variable을 정의하여 사용할 수 있음.

```bash
variable "evstream_cluster" {

  type = object({
    name = string
    kafka_version = string
    broker = object({
      node_count = number
      node_instance_type = string
      ebs_volume_size_gb = number
    })
  })

  default = {
    name = "evstream",
    kafka_version = "2.2.1",
    broker = {
      node_count = 3,
      node_instance_type = "m5.large",
      ebs_volume_size_gb =  500
    }
  }
}
```