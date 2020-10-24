
# Simple .csv file stuff

using Pkg

Pkg.add("CSV")
Pkg.add("DataFrames")
Pkg.add("Plots")

using CSV
using DataFrames
using Plots

iris = CSV.read("iris.csv", normalizenames = true)

first(iris, 5)

describe(iris)

histogram(
   iris.sepal_length,
   title = "Iris Dataset: Histograph of Sepal Length",
   label="counts",
   xlabel="Sepal Length",
   ylabel="Counts")

p1=scatter(iris.petal_length)
p2=histogram(iris.petal_width)
p3=histogram(iris.sepal_length)
p4=scatter(iris.sepal_width)
plot(p1,p2,p3,p4,layout=(2,2),legend=false)



