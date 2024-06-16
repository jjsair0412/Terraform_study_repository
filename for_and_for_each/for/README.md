# for test variable
terraform for문 study
- [관련 공식문서](https://developer.hashicorp.com/terraform/language/expressions/for)

## to use
variable.tf에 정의된 변수로, Terraform for문을 학습함.

```bash
$ cd ./for_and_for_each/for

$ pwd
~/for_and_for_each/for

$ ls
README.md   variable.tf

$ terraform console
```

## Terraform for 구문
### 1. 기본 사용
기본적으로 아래 형식을 따름

list의 값들을 s 변수에 할당해서, s 출력
```bash
> [for s in ["a","b","c"] : s]
[
  "a",
  "b",
  "c",
]
```

list의 값들을 s 변수에 할당해서, s 값을 대문자로 변환 후 출력
```bash
> [for s in ["a","b","c"] : upper(s)]
[
  "A",
  "B",
  "C",
]
```

### 2. list
list 변수를 할당하여 출력
```bash
> [for s in var.list1 : s]
[
  "1",
  "10",
  "9",
  "101",
  "3",
]
```

꺼내온 s에 + 1 연산 수행
```bash
> [for s in var.list1 : s+1]
[
  2,
  11,
  10,
  102,
  4,
]
```

### 3. map
map 변수를 할당하여 출력

key만 출력
```bash
> [for k, v in var.map1 : k]
[
  "apple",
  "banana",
  "mango",
  "pear",
]
```

value만 출력
```bash
> [for s in var.map1 : s]
[
  5,
  10,
  0,
  3,
]
```

중괄호 ```{}``` 를 사용하면, for의 결과를 key = value 타입으로 변환이 가능함.
- 이때 발생한 value를 조작하는것 또한 가능 
- ```{}``` 를 사용 시 , ```=>``` 연산자 필요
- [관련 공식문서](https://developer.hashicorp.com/terraform/language/expressions/for#result-types)


key value 값 그대로 출력
```bash
> {for k,v in var.map1 : k => v}
{
  "apple" = 5
  "banana" = 10
  "mango" = 0
  "pear" = 3
}
```

key value 값 바꾸기
```bash
> {for k,v in var.map1 : v => k}
{
  "0" = "mango"
  "10" = "banana"
  "3" = "pear"
  "5" = "apple"
}
```

value 값에 +1 연산 추가
```bash
> {for k,v in var.map1 : k => v+1}
{
  "apple" = 6
  "banana" = 11
  "mango" = 1
  "pear" = 4
}
```