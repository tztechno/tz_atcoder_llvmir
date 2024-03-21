@str.inputA = private unnamed_addr constant [3 x i8] c"%d\00",align 1
@str.output = private unnamed_addr constant [4 x i8] c"%d\0a\00",align 1

define i32 @main(){
    %B.addr = alloca i64
    call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.inputA, i64 0, i64 0), i64* %B.addr)
    %B = load i64,i64* %B.addr
    %B2 = mul i64 2,%B
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.output, i64 0, i64 0),i64 %B2)
    ret i32 0
}

declare i32 @scanf(i8*, ...)
declare i32 @printf(i8*, ...)
