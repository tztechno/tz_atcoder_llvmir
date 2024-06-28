abc115_a.ll
##########################################
##########################################
##########################################
##########################################
##########################################
##########################################
##########################################

1. グローバル変数定義:
```llvm
@str.inputA = private unnamed_addr constant [3 x i8] c"%d\00", align 1
```
- @で始まるのはグローバル変数
- privateはリンケージタイプ
- unnamed_addrは最適化のヒント
- constantは変数が定数であることを示す
- [3 x i8]は3バイトの配列型
- c"%d\00"は文字列リテラル
- align 1はメモリアラインメント

2. 関数定義:
```llvm
define i32 @main() {
    ...
}
```
- defineで関数を定義
- i32は戻り値の型（32ビット整数）
- @mainは関数名

3. ローカル変数:
```llvm
%A.addr = alloca i32
```
- %で始まるのはローカル変数
- allocaは変数のためのスタックメモリ確保

4. 関数呼び出し:
```llvm
call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str.inputA, i64 0, i64 0), i32* %A.addr)
```
- callで関数を呼び出す
- getelementptr inboundsは配列要素のアドレス計算

5. 値のロード:
```llvm
%A = load i32, i32* %A.addr
```
- loadでメモリから値を読み込む

6. 比較:
```llvm
%cmp22 = icmp eq i32 %A, 22
```
- icmpは整数比較
- eqは等価比較

7. 分岐:
```llvm
br i1 %cmp22, label %if.22, label %else.22
```
- brは分岐命令
- i1は1ビットの真偽値
- labelの後にジャンプ先のラベルを指定

8. ラベル:
```llvm
if.22:
```
- コロンで終わる文字列はラベル

9. 関数の終了:
```llvm
ret i32 0
```
- retは関数からの戻り

10. 外部関数宣言:
```llvm
declare i32 @scanf(i8*, ...)
```
- declareは外部関数の宣言
- ...は可変引数を示す

これらの要素を組み合わせて、条件分岐や関数呼び出しなどのプログラムロジックを構築しています。


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
