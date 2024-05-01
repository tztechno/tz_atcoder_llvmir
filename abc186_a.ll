abc186_a.ll
############################################
%ansVal = sdiv i32 %B, %G  ; Signed division
############################################
############################################
############################################
############################################
############################################
############################################
############################################
############################################
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
  %ansVal = sdiv i32 %B, %G  ; Signed division
  store i32 %ansVal, i32* %ans

  ; Output
  %loadedAns = load i32, i32* %ans
  %ansPtr = getelementptr inbounds [4 x i8], [4 x i8]* @str.output, i64 0, i64 0
  call i32 (i8*, ...) @printf(i8* %ansPtr, i32 %loadedAns)

  ret i32 0
}

declare i32 @scanf(i8*, ...)
declare i32 @printf(i8*, ...)
############################################
[python]
n,w=map(int,input().split())
print(n//w)
############################################
