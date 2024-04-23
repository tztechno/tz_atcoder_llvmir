#############################################
文字数の数え方
3=c%d
8=cBetter
7=cWorse
sgt: >
slt: <
#############################################

@str.inputA = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@str.Better = private unnamed_addr constant [8 x i8] c"Better\0a\00", align 1
@str.Worse = private unnamed_addr constant [7 x i8] c"Worse\0a\00", align 1

define i32 @main() {
    %A.addr = alloca i32
    %B.addr = alloca i32
    call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.inputA, i64 0, i64 0), i32* %A.addr)
    call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.inputA, i64 0, i64 0), i32* %B.addr)
    %A = load i32, i32* %A.addr
    %B = load i32, i32* %B.addr

    %bat = icmp slt i32 %A, %B ; Changed icmp from sgt to slt for A < B
    br i1 %bat, label %if, label %else ; Changed the branch condition

if:
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @str.Better, i64 0, i64 0))
    br label %if.end
else:
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str.Worse, i64 0, i64 0))
    br label %if.end
if.end:
    ret i32 0
}

declare i32 @scanf(i8*, ...)
declare i32 @printf(i8*, ...)
#############################################
