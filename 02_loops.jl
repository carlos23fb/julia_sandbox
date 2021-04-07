m, n = 5, 5
A = zeros(m,n)

for i in 1:m
    for j in 1:m
        A[i,j] = i+j
    end
end
println(A)
