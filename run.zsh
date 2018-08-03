source ./utils/logging.zsh


# 普通用户运行

init(){
    # must run first
    cd `dirname "$0"`
}

replace_source(){
    # some important source
    # .xprofile
    logging "[source] install oh-my-zsh"    

    cat assets/.xprofile | sudo tee ${HOME}/.xprofile
    cat assets/archlinuxcn-mirrorlist | sudo tee /etc/pacman.d/archlinuxcn-mirrorlist
    cat assets/pacman.conf | sudo tee /etc/pacman.conf
    # mirrorlist
    cat assets/mirrorlist | sudo tee /etc/pacman.d/mirrorlist
    # pip 源
    pip config set global.index-url 'https://mirrors.ustc.edu.cn/pypi/web/simple'
    sudo pacman -Syu --noconfirm
    
    logging "[source] install oh-my-zsh"
    
}

install_oh_my_zsh(){
    # config oh-my-zsh and .zshrc
    logging "[zsh] install oh-my-zsh"
    
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    sudo pacman -S zsh-syntax-highlighting zsh-autosuggestions --noconfirm
    mv assets/.zshrc ${HOME}/
    
    logging "[zsh] installed"
}

install_fcitx(){
    # 输入法
    logging "[fcitx] install oh-my-zsh"
    
    sudo pacman -S fcitx-im fcitx-sogoupinyin fcitx-cloudpinyin fcitx-configtool --noconfirm

    logging "[fcitx] installed"

}

install_wechat(){
    logging "[wechat] install oh-my-zsh"
    
    sudo pacman -S wewechat --noconfirm

    logging "[wechat] install oh-my-zsh"

}

install_tim(){
    logging "[tim] install oh-my-zsh"

    sudo pacman -S deepin.com.qq.office --noconfirm

    logging "[tim] install oh-my-zsh"

}

welcome(){

}
# code start run

init 
replace_source
install_oh_my_zsh
install_fcitx
install_wechat
install_tim

