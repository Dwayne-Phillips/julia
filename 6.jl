
#==============================================

6.jl

Read a color image from the Internet.

You run this in the Julia REPL with
include("6.jl")

You can run this from the command line with
julia 6.jl

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
url_path = download("http://dwaynephillips.net/images/DwayneFXCC.jpg")
input_image = nothing
input_image = load(url_path)
imshow(input_image)

save("sillyName.jpg",input_image)

# The End
