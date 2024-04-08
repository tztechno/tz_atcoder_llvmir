//abc086_a.ll
##################################
3 4
##################################
##################################
##################################
@str.inputAB = private unnamed_addr constant [6 x i8] c"%d %d\00",align 1
@str.Odd = private unnamed_addr constant [4 x i8] c"Odd\00",align 1
@str.Even = private unnamed_addr constant [5 x i8] c"Even\00",align 1

define i32 @main(){
    %a = alloca i32,align 4
    %b = alloca i32,align 4
    %call.inputAB = call i32 (i8*, ...) @scanf(i8* noundef getelementptr inbounds ([6 x i8],[6 x i8]* @str.inputAB, i64 0,i64 0),i32* noundef nonnull %a,i32* noundef nonnull %b)
    %A = load i32,i32* %a, align 4
    %B = load i32,i32* %b, align 4
    %c = mul nsw i32 %A,%B
    %mod2 = srem i32 %c,2
    %odd = icmp eq i32 %mod2,1
    br i1 %odd,label %block.odd,label %block.even
block.odd:
    call i32 (i8*, ...) @puts(i8* noundef getelementptr inbounds ([4 x i8],[4 x i8]* @str.Odd, i64 0,i64 0))
    br label %block.out
block.even:
    call i32 (i8*, ...) @puts(i8* noundef getelementptr inbounds ([5 x i8],[5 x i8]* @str.Even, i64 0,i64 0))
    br label %block.out
block.out:
    ret i32 0
}

declare i32 @scanf(i8*, ...)
declare i32 @puts(i8*, ...)
##################################
