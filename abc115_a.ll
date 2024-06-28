abc115_a.ll
##########################################
##########################################
##########################################
##########################################
##########################################
##########################################
##########################################
##########################################

@str.inputA = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@str.E3 = private unnamed_addr constant [23 x i8] c"Christmas Eve Eve Eve\0A\00", align 1
@str.E2 = private unnamed_addr constant [19 x i8] c"Christmas Eve Eve\0A\00", align 1
@str.E1 = private unnamed_addr constant [15 x i8] c"Christmas Eve\0A\00", align 1
@str.E0 = private unnamed_addr constant [11 x i8] c"Christmas\0A\00", align 1

define i32 @main() {
    %A.addr = alloca i32
    
    call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.inputA, i64 0, i64 0), i32* %A.addr)
    %A = load i32, i32* %A.addr
    
    %cmp22 = icmp eq i32 %A, 22
    br i1 %cmp22, label %if.22, label %else.22
    
if.22:
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @str.E3, i64 0, i64 0))
    br label %if.end

else.22:
    %cmp23 = icmp eq i32 %A, 23
    br i1 %cmp23, label %if.23, label %else.23

if.23:
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.E2, i64 0, i64 0))
    br label %if.end

else.23:
    %cmp24 = icmp eq i32 %A, 24
    br i1 %cmp24, label %if.24, label %else.24

if.24:
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @str.E1, i64 0, i64 0))
    br label %if.end

else.24:
    %cmp25 = icmp eq i32 %A, 25
    br i1 %cmp25, label %if.25, label %if.end

if.25:
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @str.E0, i64 0, i64 0))
    br label %if.end

if.end:
    ret i32 0
}

declare i32 @scanf(i8*, ...)
declare i32 @printf(i8*, ...)

##########################################
[python]
D=int(input())
L=["Christmas Eve Eve Eve","Christmas Eve Eve","Christmas Eve","Christmas"]
print(L[D-22])
##########################################
