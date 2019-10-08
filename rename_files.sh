#!/bin/bash

workingDir=/hoge/hoge
workingDir2=/hoge/hoge2

str1=2_12_102
str2=2_12_106

`rename 's/$str1/$str2/g' $workingDir/*.svg`
