
#==============================================

crop.jl

Experimenting with image size and cropping.
This is from page 14 ff. of 
"Hands on Computer Vision with Julia"
Dmitrija Cudihins

You run this in the Julia REPL with
include("crop.jl")

You can run this from the command line with
julia crop.jl

15 November 2020

==============================================#

# These import and Pkg.add added 9 November 2020

import Pkg
using Pkg
Pkg.add("Images")
Pkg.add("ImageMetadata")
Pkg.add("TestImages")
Pkg.add("ImageView")
Pkg.add("ImageMagick")


using Images, ImageMetadata, TestImages, ImageView, FileIO

# Read the input image and display it
input_image = nothing
input_image = load("cameraman.tif")
imshow(input_image)

rowscols = size(input_image)
println("number of rows is ", rowscols[1])
println("number of columns is ", rowscols[2])

cropped_image = input_image[1:100, 1:300]
rowscols = size(cropped_image)
println("Now looking at the size of the cropped image")
println("number of rows is ", rowscols[1])
println("number of columns is ", rowscols[2])
imshow(cropped_image)

crop_again = view(input_image, 100:200, 200:500)
imshow(crop_again)


# The End
