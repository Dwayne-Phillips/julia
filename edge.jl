
#==============================================

edge.jl

This little code segment convolves a 3x3 mask
over an image to detect edges.
It uses a simple 3x3 mask that quickly detects
edges.

You run this in the Julia REPL with
include("edge.jl")

You can run this from the command line with
julia edge.jl

18 October 2020

9 November 2020
For some unknown reason, the original version that
used QuartzImageIO stopped working.
I did the Pkg.add("ImageMagick") instead, and it
works again.
I don't understand why???
ANOTHER ALTERNATIVE
is to use ImageIO instead of ImageMagick or QuartzImageIO.

==============================================#

# These import and Pkg.add added 9 November 2020

import Pkg
using Pkg
Pkg.add("Images")
Pkg.add("ImageMetadata")
Pkg.add("TestImages")
Pkg.add("ImageView")
Pkg.add("ImageMagick")


# Pkg.add("QuartzImageIO")


mask = [-1 0 -1; 0 4 0; -1 0 -1];

using Images, ImageMetadata, TestImages, ImageView, FileIO

# using Pkg
# Pkg.add("QuartzImageIO")

# Read the input image and display it
input_image = nothing
input_image = load("cameraman.tif")
imshow(input_image)

# create the output image, initialize it with the input image.
output_image = nothing
output_image = load("cameraman.tif")

# Here is the convolution loops
for i in 3:509
      # print(" i=$i")
   for j in 3:509
      sum = 0
      for a in -1:1
         for b in -1:1
            sum = sum + input_image[i+a,j+b] * mask[a+2,b+2]
         end
      end
      if(sum < 0) sum=0 end
      if(sum > 1.0) sum=1.0 end
     output_image[i,j] = sum
   end
end

# Display the output image and save it to disk.
imshow(output_image)
save("edgecameramanxx.tif",output_image)

# The End
