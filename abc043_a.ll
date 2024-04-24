

@str.inputA = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@str.output = private unnamed_addr constant [6 x i8] c"%lld\0a\00", align 1

define i32 @main() {
    %B.addr = alloca i64
    call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.inputA, i64 0, i64 0), i64* %B.addr)
    %B = load i64, i64* %B.addr
    %C = add i64 %B, 1
    %B2 = mul i64 %B, %C
    %B3 = udiv i64 %B2, 2
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([56 x i8], [6 x i8]* @str.output, i64 0, i64 0), i64 %B3)
    ret i32 0
}

declare i32 @scanf(i8*, ...)
declare i32 @printf(i8*, ...)
