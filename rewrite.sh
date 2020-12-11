#!/usr/bin/env bash

base=cmd/grumble
dst=grumble

printf ">> Cleaning old \"%s\" directory\n" "$dst"

rm -rf ${dst}

printf ">> Creating destination directory \"%s\"\n" "$dst"

mkdir -p $dst

printf ">> Processing files\n"

for f in `ls $base`; do
    cp ${base}/${f} ${dst}/${f}
    sed -i "s/package main/package ${dst}/" ${dst}/${f}
done
