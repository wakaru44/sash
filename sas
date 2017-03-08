#!/usr/bin/python
# TODO : user a better runner compatible with venv

"""
A nice module to search your bash/zsh history
"""


from subprocess import Popen, PIPE, STDOUT


def get_history():
    return get_history_zsh()
    #return get_history_bash()


def get_history_zsh():
#http://stackoverflow.com/questions/5460923/run-bash-built-in-commands-in-python
    """
    obtain it in a nasty way.
    return a generator.
    """
    shell_command = 'zsh -i -c "history -r; history"'
    event = Popen(shell_command, shell=True, stdin=PIPE, stdout=PIPE, 
	stderr=STDOUT)
    (output,rubbish) = event.communicate()
    history = [x for x in output.split("\n") ]
    for line in history:
        yield line


def get_history_bash(shell = "zsh"):
#http://stackoverflow.com/questions/5460923/run-bash-built-in-commands-in-python
    """
    obtain it in a nasty way.
    return a generator.
    """
    shell_command = 'bash -i -c "history -r; history"'
    event = Popen(shell_command, shell=True, stdin=PIPE, stdout=PIPE, 
	stderr=STDOUT)
    (output,rubbish) = event.communicate()
    history = [x for x in output.split("\n") ]
    for line in history:
        yield line


def pattern_check(lines, patterns):
    """
    get a generator. 
    process the lines and apply a matching pattern
    """
    for index,line in enumerate(lines):
        print "checking",index
        fail=False # We will use this flag to fail on the 1st miss
        for pattern in patterns:
            if pattern not in line:
                fail = True
                break # If one pattern fails, all fail
        # And if all of them succeded, we return a line
        if not fail:
            yield line


def quicktest():
    patterns = ["ssh"]
    #patterns = ["ssh","es","prod"]
    hist = get_history()
    results = pattern_check(hist, patterns)
    print "\n".join([ x for x in results])
    print len( [ x for x in results] )

# TODO: add the main and parse some arguments
quicktest()
