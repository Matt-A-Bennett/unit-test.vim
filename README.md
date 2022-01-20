# unit-test.vim
In its current state this plugin probably isn't much use to anybody. I
originally developed it while writing (and testing!) my [surround-funk.vim
plugin](https://github.com/Matt-A-Bennett/surround-funk.vim) - which I hope is
useful to many! 

The unit-test.vim plugin allows you to run a preset list of normal commands on
some text in a buffer, and compare the results to another buffer containing the
expected results. If the results match, the test is passed, if not, then the
test is failed.

A summary of the passes and failures are shown in a split buffer. On tests that
failed, a copy of the expected and actual results are printed.
