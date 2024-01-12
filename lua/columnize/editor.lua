local M = {}

-- Gets lines from a buffer
--
-- Parameters: ~
--   • {buffer}           Buffer handle, or 0 for current buffer
--   • {start}            First line index, first line is 1
--   • {end}              Last line index, exclusive
--
-- Return: ~
--     Array of lines, or empty array for unloaded buffer.
--
--- @param buffer buffer
--- @param start_line number
--- @param end_line number
--- @return string[]
function M.get_lines(buffer, start_line, end_line)
    return vim.api.nvim_buf_get_lines(buffer, start_line - 1, end_line, true)
end

-- Sets lines of a buffer
--
-- Parameters: ~
--   • {buffer}           Buffer handle, or 0 for current buffer
--   • {start}            First line index, first line is 1
--   • {end}              Last line index, exclusive
--   • {lines}            Array of lines to change
--
--- @param buffer buffer
--- @param start_line number
--- @param end_line number
--- @param lines string[]
function M.set_lines(buffer, start_line, end_line, lines)
    vim.api.nvim_buf_set_lines(buffer, start_line - 1, end_line, true, lines)
end

-- Gets start and end line of current visual selection
function M.get_selected_lines()
    local lines = { vim.fn.line('v'), vim.fn.line('.') }
    return vim.fn.min(lines), vim.fn.max(lines)
end

return M
