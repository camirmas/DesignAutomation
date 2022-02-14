function levy3(x)
    n = length(x)

    y(x_i) = 1 + (x_i-1)/4

    term1 = sin(π*y(x[1]))^2
    term3 = y(x[n]-1)^2 * (1+sin(2π*y(x[n]))^2)
    
    sum = 0
    for i=1:n-1
        new = (y(x[i])-1)^2*(1+10sin(π*y(x[i])+1)^2)
        sum += new
    end

    return term1 + sum + term3
end
