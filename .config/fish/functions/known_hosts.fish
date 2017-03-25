# list out all the known hosts form the ssh known_hosts
function known_hosts
    awk '{split($1,aliases,","); if (aliases[1] !~ /^\[/) print aliases[1]}' ~/.ssh/known_hosts
end
