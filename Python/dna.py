#coding=UTF-8

seq = input("Enter a DNA sequence:\n> ")
seq_split = []
for char in seq:
    seq_split.append(char)

for x in range(len(seq_split)):
    if seq_split[x] == "A":
        seq_split[x] = "T"
    elif seq_split[x] == "T":
        seq_split[x] = "A"
    elif seq_split[x] == "G":
        seq_split[x] = "C"
    elif seq_split[x] == "C":
        seq_split[x] = "G"

newseq = "".join(seq_split)
print(newseq)
