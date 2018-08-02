#!/usr/bin/env zsh

# Usage:
# 
# foo () {
#     logging "fooing"
#     SOME_CODE
# }
# foo 3>/dev/stdout &>/tmp/kili-manjaro.log
# 这样只会在屏幕上输出 "fooing", 其他内容连同 "fooing" 在内会被重定向到 .log 文件中
logging () {
    print "[$funcstack[2]] $*" 1>&3
    print "[$funcstack[2]] $*"
}
