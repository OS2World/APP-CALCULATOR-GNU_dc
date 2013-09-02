# Makefile for GNU dc.	-*- Indented-Text -*-
# Copyright (C) 1993 Free Software Foundation, Inc.

CC = gcc -Zomf -Zmt -O -s
O = .obj

CFLAGS =
LDFLAGS = 

all: dc.exe

.SUFFIXES: .c $O

.c$O:
	$(CC) -c -I. $(CFLAGS) $<

dc$O: dc.c decimal.h
decimal$O: decimal.c decimal.h

dc.exe: dc$O decimal$O
	$(CC) $(LDFLAGS) -o $@ dc$O decimal$O

dc.info: dc.texinfo
	makeinfo --no-split dc.texinfo

dc.dvi: dc.texinfo
	texi2dvi dc.texinfo
