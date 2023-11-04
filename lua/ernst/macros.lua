local setreg = vim.fn.setreg
local replace = vim.api.nvim_replace_termcodes

function replace(s)
    return vim.api.nvim_replace_termcodes(s, true, true, true)
end

-- Pest to PHPUnit - transform  test() to a public function
setreg(
    'T',
    replace(
        '/test(<CR>vllllllhcpublic function<CR><ESC>/[\'"]<CR>' ..
        'D0:s/\\<./\\u&/g<CR>:s/ //g<CR>' ..
        'itest<ESC>A(): void<ESC>kJo{<ESC>/^\\s*});<CR>cc}<ESC>:w<CR>'
    )
)

-- Pest to PHPUnit - move test()->throws into block
setreg(
    'X',
    replace(
        ':let oldpattern=@/<CR>k/->throws<CR>dt;?test(<CR>' ..
        'o<ESC>pa;<ESC>I$this<ESC>o<ESC>?test(<CR>:let @/=oldpattern<CR>k'
    )
)

-- Pest to PHPUnit - transform expect()->toBe
setreg(
    'E',
    replace(
        ':let oldpattern=@/<CR>^cw$this->assertEquals<ESC>la, <ESC>' ..
        '$xx^/)->toBe<CR>vllllllldD^/,<CR>P$a);<ESC>:let @/=oldpattern<CR>j^'
    )
)

-- Pest to PHPUnit - transform expect()->toContain
setreg(
    'C',
    replace(
        ':let oldpattern=@/<CR>^cw$this->assertStringContainsString<ESC>la, <ESC>' ..
        '$xx^/)->toContain<CR>vlllllllllllldD^/,<CR>P$a);<ESC>:let @/=oldpattern<CR>j^'
    )
)

-- Pest to PHPUnit - transform expect()->toBeInstanceOf
setreg(
    'I',
    replace(
        ':let oldpattern=@/<CR>^cw$this->assertInstanceOf<ESC>la, <ESC>/)' ..
        '->toBeInstanceOf(<CR>vlllllllllllllllllddt)?this->assert<CR>:let @/=oldpattern<CR>f,Pj^'
    )
)
