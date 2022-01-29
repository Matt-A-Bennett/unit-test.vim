# vim-unit-test
In its current state this plugin probably isn't much use to anybody. I
originally developed it while writing (and testing!) my [vim-surround-funk
plugin](https://github.com/Matt-A-Bennett/vim-surround-funk) - which I hope is
useful to many! 

The vim-unit-test plugin allows you to run a preset list of normal commands on
some text in a buffer, and compare the results to another buffer containing the
expected results. If the results match, the test is passed, if not, then the
test is failed.

A diagnostics page is opened (in a buffer) showing the number of
passes/failures. For each failure, the command, the original input, the result
of applying the command, and the expected results are printed. This makes it
easy to go try the command yourself on the original input and watch where it
goes wrong.
