"" Hardcode handling for Perl 6.
let test#perl#prove#options = "--exec 'perl6 -I lib'"
set path=,,lib/**,t/**,bin/**,resources/**
let g:raku_unicode_abbrevs = 1
let b:ale_linters = {'perl6': ['perl6']}
