local function concat(t)
    local ret = ""
    for _, v in ipairs(t) do
        ret = ret .. v
    end
    return ret
end

local function concat1(t)
    local bytes = {}
    for _, str in ipairs(t) do
        for _, byte in ipairs {str:byte(1, #str)} do
            table.insert(bytes, byte)
        end
    end
    return string.char(table.unpack(bytes))
end

local a = {}

for i = 1, 200000 do
    a[i] = "dsgs" .. string.char(i % 32 + 97)
    -- a[1] = a[1] .. a[1]
    -- a[2] = a[2] .. a[2]
end

local time1 = os.clock()
local ret1 = concat(a)
local time2 = os.clock()
-- local ret2 = concat1(a)
local time3 = os.clock()
local ret3 = table.concat(a)
local time4 = os.clock()

print(time2 - time1)
print(time3 - time2)
print(time4 - time3)

print(ret1 == ret3)
-- print(ret2 == ret3)
