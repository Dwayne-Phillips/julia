
# Some experiments with TextAnalysis.jl
# 26 October 2020

using TextAnalysis

# read a file on MacBook Air

fd = FileDocument("/users/dwaynephillips/phil.txt")

summarize(fd)

# This prints it all

text(fd)

# let's try again and make a StringDocument from a file
# so we can use the preprocessing things on it.

titusfd=FileDocument("/users/dwaynephillips/titus.txt")

titusString=StringDocument(text(titusfd)) 

prepare!(titusString, strip_numbers)

prepare!(titusString, strip_articles)

# I don't like with stemming does
# stem!(titusString)


