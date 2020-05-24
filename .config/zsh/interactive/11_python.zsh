export PIP_REQUIRE_VIRTUALENV=true

syspip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

source $(locate virtualenvwrapper_lazy.sh)
