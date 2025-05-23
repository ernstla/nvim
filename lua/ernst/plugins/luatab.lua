return { {
    'alvarosevilla95/luatab.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function(spec)
        require('luatab').setup {}
    end
} }
