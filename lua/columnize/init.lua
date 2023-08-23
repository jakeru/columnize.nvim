local editor = require('columnize.editor')
local strings = require('columnize.strings')

local M = {}

function M.columnize_lines(buffer, start_line, end_line)
    local lines_in = editor.get_lines(buffer, start_line, end_line)
    local indent = strings.left_whitespace(lines_in[1])
    local max_len = strings.max_word_length_in_lines(lines_in)
    local lines_out = strings.columnize_lines(lines_in, indent, max_len)
    editor.set_lines(buffer, start_line, end_line, lines_out)
end

function M.columnize()
    local buffer = 0
    local start_line, end_line = editor.get_selected_lines()
    M.columnize_lines(buffer, start_line, end_line)
end

function M.columnize_cmd(ctx)
    local buffer = 0
    local start_line, end_line = ctx.line1, ctx.line2
    M.columnize_lines(buffer, start_line, end_line)
end

function M.setup(...)
    vim.api.nvim_create_user_command('Columnize', M.columnize_cmd, {range=true})
end

return M
