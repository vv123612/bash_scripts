
function execute_script {
    echo "execute script $1 for archive $2"
    # time bash -ex $1 $2
    # time --f "Информация о команде:\t%C\tЗагруженность CPU: %P\tВремя выполнения: %e сек" bash -ex $1 $2
    # /usr/bin/time --format "\t%E real,\t%U user,\t%S sys" ls -lah
    # /usr/bin/time --format "\t%E real,\t%U user,\t%S sys" bash -ex $1 $2
    
    /usr/bin/time \
    --output wrapper3.log \
    --append\
    --format "\t%E real,\t%U user,\t%S sys,\t%C " \
    bash -ex $1 $2
}


# execute_script test_script.sh test_achive.tar.xz
execute_script examle_simple.sh test_achive.tar.xz

exit 

