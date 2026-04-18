# Langford Number Puzzle

Given an integer k, the goal is to construct a sequence s of length 2k where each integer from 1 to k appears exactly
twice. The sequence must satisfy the condition that for each integer i, there exists a position p such that s[p] = i and
s[p + i + 1] = i, ensuring that the two occurrences of i are separated by exactly i other elements. Additionally, to
reduce symmetry, the sequence must have s[1] < s[2k].

[//]: # (Generated using deepseek-r1:latest from D001 description.en.md and model.mzn)
