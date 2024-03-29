</$objtype/mkfile
BIN=/$objtype/bin
#BIN=$home/bin/$objtype
MAN=/sys/man/1

TARG=nile
OFILES=\
	nile.$O\
	data.$O\
	fsys.$O\
	scrl.$O\
	time.$O\
	util.$O\
	wctl.$O\
	wind.$O\
	xfid.$O\

HFILES=dat.h\
	fns.h\

UPDATE=\
	mkfile\
	$HFILES\
	${OFILES:%.$O=%.c}\

</sys/src/cmd/mkone

install:V: $BIN/$TARG $MAN/$TARG

$O.out:	/$objtype/lib/libdraw.a /$objtype/lib/libframe.a \
	/$objtype/lib/libthread.a /$objtype/lib/libplumb.a /$objtype/lib/libc.a
syms:V:
	$CC -a $CFLAGS nile.c	> syms
	$CC -aa $CFLAGS *.c 	>>syms

$MAN/nile:	nile.man
	cp nile.man $MAN/nile
