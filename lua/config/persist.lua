vim.api.nvim_create_autocmd('User', {
    pattern = 'VeryLazy',
    callback = function()
        local cfg_path = get_config_path()
        local commit_msg = "\"automatic-" .. get_timestamp() .. "\""

        vim.system({ "git", "add", "." }, { cwd = cfg_path })
        vim.system({ "git", "commit", "-m", commit_msg }, { cwd = cfg_path })
        vim.system({ "git", "push" }, { cwd = cfg_path })
    end
})


function get_config_path()
    local cfg_path = vim.fn.stdpath("config")
    if type(cfg_path) == "table" then
        return cfg_path[0]
    else
        return cfg_path
    end
end

function get_timestamp()
    return os.date("!%Y-%m-%dT%TZ")
end
