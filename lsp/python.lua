return {
    cmd = { 'pylsp' },
    filetypes = { 'python' },
    plugins = {
        pycodestyle = { enabled = false },
        pyflakes = { enabled = false },
    },
    root_markers = {
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        'Pipfile',
    },
    single_file_support = true,
}
