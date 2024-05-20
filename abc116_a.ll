abc116_a.ll
###########################################
###########################################
###########################################
###########################################
###########################################
@str.inputA = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@str.output = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @main() {
entry:
  %A.addr = alloca i32, align 4
  %B.addr = alloca i32, align 4
  %ans = alloca i32, align 4

  ; Input reading
  %inputA_ptr = getelementptr inbounds [3 x i8], [3 x i8]* @str.inputA, i64 0, i64 0
  call i32 (i8*, ...) @scanf(i8* %inputA_ptr, i32* %A.addr)
  call i32 (i8*, ...) @scanf(i8* %inputA_ptr, i32* %B.addr)

  %A = load i32, i32* %A.addr, align 4
  %B = load i32, i32* %B.addr, align 4

  ; Calculation
  %ansVal = mul i32 %A, %B
  %ansVal2 = sdiv i32 %ansVal, 2
  store i32 %ansVal2, i32* %ans, align 4

  ; Output
  %loadedAns = load i32, i32* %ans, align 4
  %output_ptr = getelementptr inbounds [4 x i8], [4 x i8]* @str.output, i64 0, i64 0
  call i32 (i8*, ...) @printf(i8* %output_ptr, i32 %loadedAns)

  ret i32 0
}

declare i32 @scanf(i8*, ...)
declare i32 @printf(i8*, ...)
###########################################
[python]
a,b,c=map(int,input().split())
print(a*b//2)
###########################################
