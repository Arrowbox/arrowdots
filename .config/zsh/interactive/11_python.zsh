export PIP_REQUIRE_VIRTUALENV=true

syspip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

source /usr/local/bin/virtualenvwrapper.sh 
