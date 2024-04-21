abc105_a.ll
#######################################
#######################################
#######################################
#######################################
#######################################
#######################################
#######################################
@str.inputA = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@str.output = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @main() {
  %n.addr = alloca i32
  %k.addr = alloca i32
  %ans = alloca i32

  ; Input reading
  call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.inputA, i64 0, i64 0), i32* %n.addr)
  call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.inputA, i64 0, i64 0), i32* %k.addr)

  %n = load i32, i32* %n.addr
  %k = load i32, i32* %k.addr

  ; Modulo operation
  %modVal = srem i32 %n, %k

  ; Condition check
  %isZero = icmp eq i32 %modVal, 0

  ; Branch based on condition
  br i1 %isZero, label %ifZero, label %ifNonZero

ifZero:
  ; Store result if modVal is zero
  store i32 0, i32* %ans
  br label %output

ifNonZero:
  ; Store result if modVal is non-zero
  store i32 1, i32* %ans
  br label %output

output:
  ; Load the result
  %loadedAns = load i32, i32* %ans

  ; Print the result
  %ansPtr = getelementptr inbounds [4 x i8], [4 x i8]* @str.output, i64 0, i64 0
  call i32 (i8*, ...) @printf(i8* %ansPtr, i32 %loadedAns)

  ret i32 0
}

declare i32 @scanf(i8*, ...)
declare i32 @printf(i8*, ...)
#######################################
