abc122_a.ll

##########################################
##########################################
##########################################
##########################################
##########################################
##########################################
##########################################
##########################################
; モジュール宣言
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"T\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"C\00", align 1

define i32 @main() {
entry:
  %b = alloca [2 x i8], align 1
  %ans = alloca i8*, align 8

  ; 入力を読み取る
  %0 = getelementptr inbounds [2 x i8], [2 x i8]* %b, i64 0, i64 0
  %call = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %0)

  ; 入力値に基づいて分岐
  %1 = load i8, i8* %0, align 1
  switch i8 %1, label %default [
    i8 65, label %case_A
    i8 84, label %case_T
    i8 67, label %case_C
    i8 71, label %case_G
  ]

case_A:
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0), i8** %ans, align 8
  br label %print

case_T:
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0), i8** %ans, align 8
  br label %print

case_C:
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0), i8** %ans, align 8
  br label %print

case_G:
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0), i8** %ans, align 8
  br label %print

default:
  store i8* null, i8** %ans, align 8
  br label %print

print:
  %2 = load i8*, i8** %ans, align 8
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %2)
  ret i32 0
}
##########################################
[python]
b=str(input())
if b=='A':
    ans='T'
elif b=='T':
    ans='A'
elif b=='C':
    ans='G'
elif b=='G':
    ans='C'
print(ans)
##########################################
