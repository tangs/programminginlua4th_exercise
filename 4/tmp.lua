local txt1 = [=[
<![CDATA[ 
  Hello world
]]>]=]

local txt2 = "<![CDATA[\n  Hello world\n]]>"

print(txt1)
print(txt2)

-- 4.2
local function insert(str, idx, deststr)
    return "" .. str:sub(1, idx - 1) .. deststr .. str:sub(idx)
end

print(insert("hello world", 1, "start: "))
print(insert("hello world", 7, "small "))

-- 4.3
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