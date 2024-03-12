########################################################
########################################################
########################################################
########################################################

@.str = private unnamed_addr constant [5 x i8] c"%lld\00"
@.str2 = private unnamed_addr constant [6 x i8] c"%lld\0A\00"

define i64 @pow(i64 %A, i64 %B) local_unnamed_addr {
  %1 = add i64 %B, -1
  %xtraiter = and i64 %B, 7
  %2 = icmp ult i64 %1, 7
  br i1 %2, label %for.pow.end.unr-lcssa, label %.new

.new:
  %unroll_iter = and i64 %B, -8
  br label %for.pow.main

for.pow.main:
  %val.addr.0 = phi i64 [ 1, %.new ], [ %val.mul.7, %for.pow.main ]
  %niter = phi i64 [ 0, %.new ], [ %niter.next.7, %for.pow.main ]
  %val.mul = mul i64 %val.addr.0, %A
  %val.mul.1 = mul i64 %val.mul, %A
  %val.mul.2 = mul i64 %val.mul.1, %A
  %val.mul.3 = mul i64 %val.mul.2, %A
  %val.mul.4 = mul i64 %val.mul.3, %A
  %val.mul.5 = mul i64 %val.mul.4, %A
  %val.mul.6 = mul i64 %val.mul.5, %A
  %val.mul.7 = mul i64 %val.mul.6, %A
  %niter.next.7 = add i64 %niter, 8
  %niter.ncmp.7 = icmp eq i64 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %for.pow.end.unr-lcssa, label %for.pow.main

for.pow.end.unr-lcssa:
  %val.mul.lcssa.ph = phi i64 [ undef, %0 ], [ %val.mul.7, %for.pow.main ]
  %val.addr.0.unr = phi i64 [ 1, %0 ], [ %val.mul.7, %for.pow.main ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.pow.end, label %for.pow.main.epil

for.pow.main.epil:
  %val.addr.0.epil = phi i64 [ %val.mul.epil, %for.pow.main.epil ], [ %val.addr.0.unr, %for.pow.end.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.next, %for.pow.main.epil ], [ 0, %for.pow.end.unr-lcssa ]
  %val.mul.epil = mul i64 %val.addr.0.epil, %A
  %epil.iter.next = add i64 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %for.pow.end, label %for.pow.main.epil

for.pow.end:
  %val.mul.lcssa = phi i64 [ %val.mul.lcssa.ph, %for.pow.end.unr-lcssa ], [ %val.mul.epil, %for.pow.main.epil ]
  ret i64 %val.mul.lcssa
}

define i32 @main() local_unnamed_addr {
  %B.addr = alloca i64, align 8
  %1 = call i32 @scanf(ptr nonnull @.str, ptr nonnull %B.addr)
  %B = load i64, ptr %B.addr, align 8
  br label %for.loop

for.loop:
  %indvar = phi i64 [ %indvar.next, %pow.exit ], [ 0, %0 ]
  %i.addr.0 = phi i64 [ %i.add1, %pow.exit ], [ 1, %0 ]
  %xtraiter = and i64 %i.addr.0, 7
  %2 = icmp ult i64 %indvar, 7
  br i1 %2, label %pow.exit.unr-lcssa, label %for.loop.new

for.loop.new:
  %unroll_iter = and i64 %i.addr.0, -8
  br label %for.pow.main.i

for.pow.main.i:
  %val.addr.0.i = phi i64 [ 1, %for.loop.new ], [ %val.mul.i.7, %for.pow.main.i ]
  %niter = phi i64 [ 0, %for.loop.new ], [ %niter.next.7, %for.pow.main.i ]
  %val.mul.i = mul i64 %val.addr.0.i, %i.addr.0
  %val.mul.i.1 = mul i64 %val.mul.i, %i.addr.0
  %val.mul.i.2 = mul i64 %val.mul.i.1, %i.addr.0
  %val.mul.i.3 = mul i64 %val.mul.i.2, %i.addr.0
  %val.mul.i.4 = mul i64 %val.mul.i.3, %i.addr.0
  %val.mul.i.5 = mul i64 %val.mul.i.4, %i.addr.0
  %val.mul.i.6 = mul i64 %val.mul.i.5, %i.addr.0
  %val.mul.i.7 = mul i64 %val.mul.i.6, %i.addr.0
  %niter.next.7 = add i64 %niter, 8
  %niter.ncmp.7 = icmp eq i64 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %pow.exit.unr-lcssa, label %for.pow.main.i

pow.exit.unr-lcssa:
  %val.mul.i.lcssa.ph = phi i64 [ undef, %for.loop ], [ %val.mul.i.7, %for.pow.main.i ]
  %val.addr.0.i.unr = phi i64 [ 1, %for.loop ], [ %val.mul.i.7, %for.pow.main.i ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %pow.exit, label %for.pow.main.i.epil

for.pow.main.i.epil:
  %val.addr.0.i.epil = phi i64 [ %val.mul.i.epil, %for.pow.main.i.epil ], [ %val.addr.0.i.unr, %pow.exit.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.next, %for.pow.main.i.epil ], [ 0, %pow.exit.unr-lcssa ]
  %val.mul.i.epil = mul i64 %val.addr.0.i.epil, %i.addr.0
  %epil.iter.next = add i64 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %pow.exit, label %for.pow.main.i.epil

pow.exit:
  %val.mul.i.lcssa = phi i64 [ %val.mul.i.lcssa.ph, %pow.exit.unr-lcssa ], [ %val.mul.i.epil, %for.pow.main.i.epil ]
  %i.add1 = add i64 %i.addr.0, 1
  %flg = icmp slt i64 %val.mul.i.lcssa, %B
  %indvar.next = add i64 %indvar, 1
  br i1 %flg, label %for.loop, label %for.end

for.end:
  %flg2 = icmp eq i64 %val.mul.i.lcssa, %B
  %i.addr.0.lcssa. = select i1 %flg2, i64 %i.addr.0, i64 -1
  %3 = call i32 @printf(ptr nonnull @.str2, i64 %i.addr.0.lcssa.)
  ret i32 0
}

declare noundef i32 @scanf(ptr noalias nocapture noundef readonly, ...) local_unnamed_addr #1

declare noundef i32 @printf(ptr noalias nocapture noundef readonly, ...) local_unnamed_addr #1

########################################################

########################################################

@.str = private unnamed_addr constant [5 x i8] c"%lld\00"
@.str2 = private unnamed_addr constant [6 x i8] c"%lld\0A\00"

define i64 @pow(i64 %A,i64 %B) {
    %i.addr = alloca i64
    %val.addr = alloca i64
    store i64 0,i64* %i.addr
    store i64 1,i64* %val.addr
    br label %for.pow.main
for.pow.main:
    %i = load i64,i64* %i.addr
    %val = load i64,i64* %val.addr
    %val.mul = mul i64 %val,%A
    store i64 %val.mul,i64* %val.addr

    %i.add1 = add i64 %i,1
    store i64 %i.add1,i64* %i.addr

    %flg = icmp eq i64 %i.add1,%B

    br i1 %flg,label %for.pow.end,label %for.pow.main
for.pow.end:
    ret i64 %val.mul
}

define i32 @main() {
    %B.addr = alloca i64
    call i32 @scanf(i8* @.str,i64* %B.addr)
    %B = load i64,i64* %B.addr
    %i.addr = alloca i64
    store i64 1,i64* %i.addr
    br label %for.loop
for.loop:
    %i = load i64,i64* %i.addr
    %i.add1 = add i64 %i,1
    store i64 %i.add1,i64* %i.addr
    %i.i = call i64 @pow(i64 %i,i64 %i)
    %flg = icmp slt i64 %i.i,%B
    br i1 %flg,label %for.loop,label %for.end
for.end:
    %flg2 = icmp eq i64 %i.i,%B
    br i1 %flg2,label %if,label %else
if:
    call i32 @printf(i8* @.str2,i64 %i)
    br label %if.end
else:
    call i32 @printf(i8* @.str2,i64 -1)
    br label %if.end
if.end:
    ret i32 0
}

declare i32 @scanf(ptr noalias nocapture, ...)
declare i32 @printf(ptr noalias nocapture, ...)

########################################################
