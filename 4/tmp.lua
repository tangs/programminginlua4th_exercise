-- 4.1
local txt1 = [=[
<![CDATA[ 
  Hello world
]]>]=]

local txt2 = "<![CDATA[\n  Hello world\n]]>"

print(txt1)
print(txt2)

-- 4.3
local function insert(str, idx, deststr)
    return "" .. str:sub(1, idx - 1) .. deststr .. str:sub(idx)
end

print(insert("hello world", 1, "start: "))
print(insert("hello world", 7, "small "))

-- 4.4
local function utf8_insert(str, idx, deststr)
    local bytes = {}
    local curidx = 1
    local function insert()
        for _, byte1 in utf8.codes(deststr) do
            table.insert(bytes, byte1)
        end
    end
    for _, byte in utf8.codes(str) do
        if curidx == idx then insert() end
        table.insert(bytes, byte)
        curidx = curidx + 1
    end
    if curidx == idx then insert() end
    return utf8.char(table.unpack(bytes))
end

print(utf8_insert("你好 世界", 1, "程序"))
print(utf8_insert("你好 世界", 3, "程序"))
print(utf8_insert("你好 世界", 6, "程序"))

-- 4.5
local function remove(str, s, len)
    return str:sub(1, s - 1) .. str:sub(s + len)
end

print(remove("hello world", 7, 4))
print(remove("hello world", 1, 4))
print(remove("hello world", 10, 4))
print(remove("hello world", 20, 4))

-- 4.6
local function utf8_remove(str, s, len)
    local bytes = {}
    local idx = 1
    for _, byte in utf8.codes(str) do
        if idx < s or idx >= s + len then
            table.insert(bytes, byte)
        end
        idx = idx + 1
    end
    return utf8.char(table.unpack(bytes))
end

print(utf8_remove("你好 世界", 1, 2))
print(utf8_remove("你好 世界", 3, 2))
print(utf8_remove("你好 世界", 5, 2))

-- 4.7
local function ispali(str)
    local s = 1
    local e = #str
    while s < e do
        if str:byte(s) ~= str:byte(e) then return false end
        s = s + 1
        e = e - 1
    end
    return true
end

print("4.7:")
print(ispali("step on no pets"))
print(ispali("step on nopets"))
print(ispali("banana"))

-- 4.8
local function ispali_ignspace(str)
    local function isignore(idx)
        local byte = str:byte(idx)
        return byte >= 0x20 and byte < 0x30
    end
    local s = 1
    local e = #str
    while s < e do
        while s < e and isignore(s) do s = s + 1 end
        while s < e and isignore(e) do e = e - 1 end
        if str:byte(s) ~= str:byte(e) then return false end
        s = s + 1
        e = e - 1
    end
    return true
end

print("4.8:")
print(ispali_ignspace("step on no pets"))
print(ispali_ignspace("step on nopets"))
print(ispali_ignspace("banana"))
print(ispali_ignspace("中国中"))

-- 4.9
local function utf8_ispali_ignspace(str)
    local bytes = {}
    local function isignore(idx)
        local byte = bytes[idx]
        return byte >= 0x20 and byte < 0x30
    end
    for _, byte in utf8.codes(str) do
        table.insert(bytes, byte)
    end
    local s = 1
    local e = #bytes
    while s < e do
        while s < e and isignore(s) do s = s + 1 end
        while s < e and isignore(e) do e = e - 1 end
        if bytes[s] ~= bytes[e] then return false end
        s = s + 1
        e = e - 1
    end
    return true
end

print("4.9:")
print(utf8_ispali_ignspace("step on no pets"))
print(utf8_ispali_ignspace("step on nopets"))
print(utf8_ispali_ignspace("banana"))
print(utf8_ispali_ignspace("中国中"))
print(utf8_ispali_ignspace("中 国中"))
print(utf8_ispali_ignspace("中 国中哥"))