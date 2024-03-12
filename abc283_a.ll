//4 3

@str.inputA = private unnamed_addr constant [3 x i8] c"%d\00",align 1
@str.outputA = private unnamed_addr constant [4 x i8] c"%d\0a\00",align 1

define i32 @main(){
    %H1.addr = alloca i32
    %H2.addr = alloca i32
    call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.inputA, i64 0, i64 0), i32* %H1.addr)
    call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.inputA, i64 0, i64 0), i32* %H2.addr)
    %H1 = load i32,i32* %H1.addr
    %H2 = load i32,i32* %H2.addr
    %temp.addr = alloca i32
    store i32 1,i32* %temp.addr
    br label %loop
loop:
    %i = load i32,i32* %temp.addr
    %j = load i32,i32* %H2.addr
    %i2 = mul i32 %i,%H1
    store i32 %i2,i32* %temp.addr
    %j2 = sub i32 %j,1
    store i32 %j2,i32* %H2.addr
    %break = icmp eq i32 %j2,0
    br i1 %break,label %loop.end,label %loop
loop.end:
    %out = load i32,i32* %temp.addr
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.outputA, i64 0, i64 0), i32 %out)
    ret i32 0
}

declare i32 @scanf(i8*, ...)
declare i32 @printf(i8*, ...)
