
#==============================================

8.jl

Read color image.
Convert color jpg to grayscale tif and bmp
Same the grayscales images

You run this in the Julia REPL with
include("8.jl")

You can run this from the command line with
julia 8.jl

30 November 2020

==============================================#

# These import and Pkg.add added 9 November 2020

import Pkg
using Pkg
Pkg.add("Images")
Pkg.add("ImageView")
Pkg.add("ImageMagick")


using Images, ImageView, FileIO


# Read the input image and display it
input_image = load("sillyName.jpg")
imshow(input_image)

output_image = Gray.(input_image)
imshow(output_image)

save("BWsillyName.tif", output_image)
save("BWsillyName.bmp", output_image)

# The End
