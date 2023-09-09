local module = {}

function module.cntCharactersByMultibyte(str)
    local sb_count = 0
    local mb_count = 0

    for index = 1, #str do
        local byte = string.byte(str, index)

        if byte >= 192 and byte <= 223 then
            mb_count = mb_count + 1
            index = index + 2
        elseif byte >= 224 and byte <= 239 then
            mb_count = mb_count + 1
            index = index + 3
        elseif byte >= 240 and byte <= 244 then
            mb_count = mb_count + 1
            index = index + 4
        else
            sb_count = sb_count + 1
            index = index + 1
        end
    end

    return sb_count, mb_count
end

return module