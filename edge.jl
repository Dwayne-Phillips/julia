
#==============================================

edge.jl

This little code segment convolves a 3x3 mask
over an image to detect edges.
It uses a simple 3x3 mask that quickly detects
edges.

You run this in the Julia REPL with include("edge.jl")

18 October 2020

==============================================#

mask = [-1 0 -1; 0 4 0; -1 0 -1];

using Images, ImageMetadata, TestImages, ImageView
using Pkg
Pkg.add("QuartzImageIO")

# Read the input image and display it
input_image = nothing
input_image = load("cameraman.tif")
imshow(input_image)

# create the output image, initialize it with the input image.
output_image = nothing
output_image = load(output_image_path)

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
save("edgecameraman.tif",output_image)

# The End
