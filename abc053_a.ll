

@str.inputA = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@str.ABC = private unnamed_addr constant [5 x i8] c"ABC\0a\00", align 1
@str.ARC = private unnamed_addr constant [5 x i8] c"ARC\0a\00", align 1

define i32 @main() {
    %R.addr = alloca i32
    call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.inputA, i64 0, i64 0), i32* %R.addr)
    %R = load i32, i32* %R.addr

    %bat = icmp slt i32 %R, 1200 ; Changed icmp from sgt to slt for A < B
    br i1 %bat, label %if, label %else ; Changed the branch condition

if:
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.ABC, i64 0, i64 0))
    br label %if.end
else:
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.ARC, i64 0, i64 0))
    br label %if.end
if.end:
    ret i32 0
}

declare i32 @scanf(i8*, ...)
declare i32 @printf(i8*, ...)
