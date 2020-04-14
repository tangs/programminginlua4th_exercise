local N = 8

local times = 0
local match_times = 0
local function isplaceok(a, n, c)
    times = times + 1
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
        -- printsolution(a)
        match_times = match_times + 1
    else
        for c = 1, N do
            if isplaceok(a, n, c) then
                a[n] = c
                addquee(a, n + 1)
            end
        end
    end
end

local function addquee_fullpermutation(a, n)
    if n > N then
        for n = 2, N do
            if not isplaceok(a, n, a[n]) then return end
        end
        -- printsolution(a)
        match_times = match_times + 1
    else
        for c = 1, N do
            a[n] = c
            addquee_fullpermutation(a, n + 1)
        end
    end
end

addquee({}, 1)
print("times:" .. times)
print("match times:" .. match_times)
print("full permutation.")

times = 0
match_times = 0
addquee_fullpermutation({}, 1)
print("times:" .. times)
print("match times:" .. match_times)