@str.inputA = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@str.output = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @main() {
  %B.addr = alloca i32
  %G.addr = alloca i32
  %sum = alloca i32

  ; 入力値の読み込み
  call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.inputA, i64 0, i64 0), i32* %B.addr)
  call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.inputA, i64 0, i64 0), i32* %G.addr)

  %B = load i32, i32* %B.addr
  %G = load i32, i32* %G.addr

  ; 掛け算
  %sumVal = mul i32 %B, %G
  store i32 %sumVal, i32* %sum

  ; 出力
  %loadedSum = load i32, i32* %sum
  %sumPtr = getelementptr inbounds [4 x i8], [4 x i8]* @str.output, i64 0, i64 0
  call i32 (i8*, ...) @printf(i8* %sumPtr, i32 %loadedSum)

  ret i32 0
}

declare i32 @scanf(i8*, ...)
declare i32 @printf(i8*, ...)
