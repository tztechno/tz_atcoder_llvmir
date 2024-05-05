abc082_a.ll
##########################################
[Calculation]
  %ansVal = add i32 %B, %G  ;
  %ansVal2 = add i32 %ansVal, 1  ;
  %ansVal3 = sdiv i32 %ansVal2, 2  ; Signed division
  store i32 %ansVal3, i32* %ans
##########################################
##########################################
##########################################
##########################################
@str.inputA = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@str.output = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @main() {
  %B.addr = alloca i32
  %G.addr = alloca i32
  %ans = alloca i32

  ; Input reading
  call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.inputA, i64 0, i64 0), i32* %B.addr)
  call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.inputA, i64 0, i64 0), i32* %G.addr)

  %B = load i32, i32* %B.addr
  %G = load i32, i32* %G.addr

  ; Calculation
  %ansVal = add i32 %B, %G  ;
  %ansVal2 = add i32 %ansVal, 1  ;
  %ansVal3 = sdiv i32 %ansVal2, 2  ; Signed division
  store i32 %ansVal3, i32* %ans

  ; Output
  %loadedAns = load i32, i32* %ans
  %ansPtr = getelementptr inbounds [4 x i8], [4 x i8]* @str.output, i64 0, i64 0
  call i32 (i8*, ...) @printf(i8* %ansPtr, i32 %loadedAns)

  ret i32 0
}

declare i32 @scanf(i8*, ...)
declare i32 @printf(i8*, ...)
##########################################
[python]
import math
a,b=map(int,input().split())
print(math.ceil((a+b)/2))
##########################################
