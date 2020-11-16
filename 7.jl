
#==============================================

7.jl

Read color image.
Convert the color image into an array of numbers.
Manipulate the numbers.

You run this in the Julia REPL with
include("7.jl")

You can run this from the command line with
julia 7.jl

16 November 2020

==============================================#

# These import and Pkg.add added 9 November 2020

import Pkg
using Pkg
Pkg.add("Images")
Pkg.add("ImageView")
Pkg.add("ImageMagick")


using Images, ImageView, FileIO


# Read the input image and display it
input_image = nothing
input_image = load("dwaynephillips.jpg")
imshow(input_image)

number_of_rows = size(input_image, 1)
number_of_cols = size(input_image, 2)

# Use channelview to convert the to array of numbers.
# This has the affect of altering the colors in the input_image.

second_image = channelview(input_image)

# The color image is Red, Green, Blue
# image[1,22,33] gives the Red value of row 22 column 33

# These loops will saturate the red channelview
# The output image will look really red.

for i in 1:number_of_rows, j in 1:number_of_cols
   if(second_image[1,i,j] > 0.1)
      second_image[1,i,j] = 0.9
   end
end

imshow(input_image)


# The End
