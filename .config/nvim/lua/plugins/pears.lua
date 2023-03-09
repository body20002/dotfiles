return {
    'steelsojka/pears.nvim',
    lazy = false,
    config = function()
        require"pears".setup(function(conf) conf.preset "tag_matching" end)
    end
}
