

using JuMP, Cbc
m = Model(with_optimizer(Cbc.Optimizer))
@variable(m, 0 <= x <= 2 )
@variable(m, 0 <= y <= 30 )
@objective(m, Max, 5x + 3*y )
@constraint(m, 1x + 5y <= 3.0 )
print(m)
status = optimize!(m)
println("Objective value: ", getobjectivevalue(m))
println("x = ", getvalue(x))
println("y = ", getvalue(y))

