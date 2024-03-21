@str.inputA = private unnamed_addr constant [3 x i8] c"%d\00",align 1
@str.output = private unnamed_addr constant [4 x i8] c"%d\0a\00",align 1

define i32 @main(){
    %B.addr = alloca i64
    call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.inputA, i64 0, i64 0), i64* %B.addr)
    %B = load i64,i64* %B.addr
    %C = mul i64 5000,%B
    %C2 = add i64 %C,5000
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.output, i64 0, i64 0),i64 %C2)
    ret i32 0
}

declare i32 @scanf(i8*, ...)
declare i32 @printf(i8*, ...)
