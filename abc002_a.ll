@str.inputA = private unnamed_addr constant [3 x i8] c"%d\00",align 1
@str.output = private unnamed_addr constant [4 x i8] c"%d\0a\00",align 1

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
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.output, i64 0, i64 0),i32 %B)
    br label %if.end
else:
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.output, i64 0, i64 0),i32 %G)
    br label %if.end
if.end:
    ret i32 0
}

declare i32 @scanf(i8*, ...)
declare i32 @printf(i8*, ...)
