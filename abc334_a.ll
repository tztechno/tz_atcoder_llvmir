//kangping 
//atcoder|beginner|contest

@str.inputA = private unnamed_addr constant [3 x i8] c"%d\00",align 1
@str.Bat = private unnamed_addr constant [5 x i8] c"Bat\0a\00",align 1
@str.Glove = private unnamed_addr constant [7 x i8] c"Glove\0a\00",align 1

define i32 @main(){
    %B.addr = alloca i32
    %G.addr = alloca i32
    call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.inputA, i64 0, i64 0), i32* %B.addr)
    call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.inputA, i64 0, i64 0), i32* %G.addr)
    %B = load i32,i32* %B.addr
    %G = load i32,i32* %G.addr
    %bat = icmp sgt i32 %B,%G
    br i1 %bat,label %if,label %else
if:
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.Bat, i64 0, i64 0))
    br label %if.end
else:
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @str.Glove, i64 0, i64 0))
    br label %if.end
if.end:
    ret i32 0
}

declare i32 @scanf(i8*, ...)
declare i32 @printf(i8*, ...)
