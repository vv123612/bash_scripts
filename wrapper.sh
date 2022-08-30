# https://stackoverflow.com/questions/372116/what-is-the-best-way-to-write-a-wrapper-function-that-runs-commands-and-logs-the

function do_cmd()
{
    eval $*
    if [[ $? -eq 0 ]]
    then
        echo "Successfully ran [ $1 ]"
    else
        echo "Error: Command [ $1 ] returned $?"
        exit $?
    fi
}

function a(){
    echo '$@ - ' "$@"
    echo '$# - ' "$#"
    echo '$$ - ' "$$"
    echo '$* - ' "$*"
    "$@"
}


# do_cmd ls -la  ~


a \
ls -la \
~