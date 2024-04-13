abc102_a.ll
######################################
even:
  store i32 %N, i32* %out
  br label %end

odd:
  %oddout = add i32 %N, %N
  store i32 %oddout, i32* %out
  br label %end
######################################
######################################
######################################
######################################
######################################
######################################
######################################
######################################
######################################
@str.inputA = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@str.outputA = private unnamed_addr constant [4 x i8] c"%d\0a\00", align 1

define i32 @main() {
  %N.addr = alloca i32
  call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.inputA, i64 0, i64 0), i32* %N.addr)
  %N = load i32, i32* %N.addr
  %out = alloca i32

  ; If N is even
  %Nparity = and i32 %N, 1
  %Nevencheck = icmp eq i32 %Nparity, 0
  br i1 %Nevencheck, label %even, label %odd

even:
  store i32 %N, i32* %out
  br label %end

odd:
  %oddout = add i32 %N, %N
  store i32 %oddout, i32* %out
  br label %end

end:
  %finalout = load i32, i32* %out
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.outputA, i64 0, i64 0), i32 %finalout)
  ret i32 0
}

declare i32 @scanf(i8*, ...)
declare i32 @printf(i8*, ...)
######################################
