local function foo(...)
    local ret = ""
    for k, v in ipairs{...} do
        ret = ret .. k .. ":" .. v .. "\n"
    end
    return ret
end

local function bar(...)
    local ret = ""
    local args = table.pack(...)
    for i = 1, args.n do
        ret = ret .. i .. ":" .. tostring(args[i]) .. "\n"
    end
    return ret
end

-- print(foo())
-- print(foo(1))
-- print(foo(1, 2))
print(foo(1, nil, 2))
print(bar(1, nil, 2))

-- 6.1
local function print_arr(arr)
    for k, v in ipairs(arr) do
        print(k, v)
    end
end

-- print_arr({1, 2, 3, 4, 5})

-- 6.2
local function rm_first(...)
    local args = table.pack(...)
    table.remove(args, 1)
    return table.unpack(args)
end

print(foo(rm_first(1, 2, 3, 4, 5)))

-- 6.3
local function rm_last(...)
    local args = table.pack(...)
    table.remove(args)
    return table.unpack(args)
end

print(foo(rm_last(1, 2, 3, 4, 5)))

-- 6.4
local function shuffle(arr)
    local len = #arr
    for i = 1, len do
        local dest = math.random(len)
        arr[i], arr[dest] = arr[dest], arr[i]
    end
    return arr
end

math.randomseed(os.time())
print(print_arr(shuffle{1, 2, 3, 4, 5}))