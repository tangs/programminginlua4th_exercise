-- 5.4
local function calc_polynomial(coefficients, x)
    local ret = 0
    for k, v in pairs(coefficients) do
        ret = ret + x ^ k * v
    end
    return ret
end

-- x = 2
-- 3x^3 + 2x^2 + 4 => 24 + 8 + 4 = 36
print(calc_polynomial({
    [0] = 4,
    [2] = 2,
    [3] = 3
}, 2))

-- 5.7
local function insert(src, dest, idx)
    for k, v in ipairs(src) do
        -- dest[k + idx - 1] = v
        table.insert(dest, k + idx - 1, v)
    end
end

local t1 = {1, 2, 3}
local t2 = {5, 6, 7, 8}
insert(t1, t2, 2)
for k, v in ipairs(t2) do
    print(k, v)
end
