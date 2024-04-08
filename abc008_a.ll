//abc008_a.ll

###########################################################

@str.inputA = private unnamed_addr constant [3 x i8] c"%d\00",align 1
@str.outputA = private unnamed_addr constant [4 x i8] c"%d\0a\00",align 1

define i32 @main(){
    %A.addr = alloca i32
    %B.addr = alloca i32
    call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.inputA, i64 0, i64 0), i32* %A.addr)
    call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.inputA, i64 0, i64 0), i32* %B.addr)
    %A = load i32,i32* %A.addr
    %B = load i32,i32* %B.addr
    %diff = sub i32 %B,%A
    %out = add i32 %diff,1
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.outputA, i64 0, i64 0), i32 %out)
    ret i32 0
}

declare i32 @scanf(i8*, ...)
declare i32 @printf(i8*, ...)
  
###########################################################
  
