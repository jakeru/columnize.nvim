local pstrings = require('plenary.strings')

local M = {}

function M.split(str)
    return str:gmatch('%S+')
end

function M.left_whitespace(str)
    return select(3, string.find(str, '^(%s*)'))
end

function M.rtrim(str)
    local res, _ = string.gsub(str, '[ \t]+%f[\r\n%z]', '')
    return res
end

function M.max_word_length(str)
    local max_len = 0
    for w in M.split(str) do
        max_len = math.max(max_len, pstrings.strdisplaywidth(w))
    end
    return max_len
end

function M.max_word_length_in_lines(lines)
    local max_len = 0
    for _, line in ipairs(lines) do
        max_len = math.max(max_len, M.max_word_length(line))
    end
    return max_len
end

function M.columnize_line(line, indent, word_length)
    local res = {}
    for w in M.split(line) do
        table.insert(res, indent .. pstrings.align_str(w, word_length, false))
    end
    return M.rtrim(table.concat(res, ' '))
end

function M.columnize_lines(lines, indent, word_length)
    local res = {}
    for _, line in ipairs(lines) do
        table.insert(res, M.columnize_line(line, indent, word_length))
    end
    return res
end

return M
