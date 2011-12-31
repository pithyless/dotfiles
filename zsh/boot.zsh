# Checks
if [[ $(uname) = 'Linux' ]]; then
    IS_LINUX=1
fi
if [[ $(uname) = 'Darwin' ]]; then
    IS_MAC=1
    export __CF_USER_TEXT_ENCODING=0x1F5:0x8000100:0x8000100
fi
if [[ -x `which brew` ]]; then
    HAS_BREW=1
fi
if [[ -x `which apt-get` ]]; then
    HAS_APT=1
fi
if [[ -x `which yum` ]]; then
    HAS_YUM=1
fi
