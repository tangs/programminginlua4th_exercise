local a = {}
a[1] = 1
a[3] = 3

print(#a)
for k, v in ipairs(a) do
    print(k, v)
end


for k, v in pairs(a) do
    print(k, v)
end

print(a[3])

local a1 = {
    [1] = 1,
    [2] = 2,
    [3] = 3,
    [4] = 4,
    [5] = 5,
}

table.move(a1, 3, #a1, 1)

print(a1)
for k, v in pairs(a1) do
    print(k, v)
end

local sunday = "monday"
local monday = "sunday"
local t = {sunday = "monday" , [sunday] = monday} 
print(t.sunday, t[sunday], t[t.sunday])

-- 5.2
a = {}
a.a = a
print(a == a.a.a.a)
a.a.a.a = 3
-- err?
print(a.a.a.a)
