using Plots
using LinearAlgebra
using Polynomials

R = 5
r = 2
d = 3

function x(theta)
    return (((R+r) * cos(theta)) + (d * cos(((R+r)/r) * theta)))
end
  

function y(theta)
    return (((R+r) * sin(theta)) - (d * sin(((R+r)/r) * theta)))
end


theta = range(0, 4pi, length=40)
xs = @. BigFloat(x(theta))
ys = @. BigFloat(y(theta))

f1 = fit(theta,xs)
f2 = fit(theta,ys)

#Actual fit

actualx(t) = (((R+r) * cos(t)) + (d * cos(((R+r)/r) * t)))
actualy(t) = (((R+r) * sin(t)) - (d * sin(((R+r)/r) * t)))

scatter(xs,ys,markerstrokewidth=0, label="Data")
plot!(f1.(theta),f2.(theta),label="interpolation")
plot!(actualx,actualy,0,4pi,label="actual")
