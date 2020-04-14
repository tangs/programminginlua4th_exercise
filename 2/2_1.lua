local N = 8

local function isplaceok(a, n, c)
    for i = 1, n - 1 do
        if (a[i] == c) or
           (a[i] - i == c - n) or
           (a[i] + i == c + n) then
            return false
        end
    end
    return true
end

local function printsolution(a)
    for i = 1, N do
        for j = 1, N do
            io.write(a[i] == j and "X" or "-", " ")
        end
        io.write("\n")
    end
    io.write("\n")
end

local function addquee(a, n)
    if n > N then
        printsolution(a)
        return true
    else
        for c = 1, N do
            if isplaceok(a, n, c) then
                a[n] = c
                if addquee(a, n + 1) then
                    return true
                end
            end
        end
        return false
    end
end

addquee({}, 1)