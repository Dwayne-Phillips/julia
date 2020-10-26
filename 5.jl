
# Some experiments with TextAnalysis.jl
# 26 October 2020

using TextAnalysis

# read a file on MacBook Air

fd = FileDocument("/users/dwaynephillips/phil.txt")

summarize(fd)

# This prints it all

text(fd)


