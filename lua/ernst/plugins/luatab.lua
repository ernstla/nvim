return { {
    'alvarosevilla95/luatab.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function(_, opts)
        require('luatab').setup(opts)
    end
} }
