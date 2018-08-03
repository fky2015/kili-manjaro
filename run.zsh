source ./utils/logging.zsh


# 普通用户运行

init(){
    # must run first
    cd `dirname "$0"`
}

replace_source(){
    # some important source
    # .xprofile
    logging "[source] install source"

    cat assets/.xprofile | sudo tee ${HOME}/.xprofile
    cat assets/archlinuxcn-mirrorlist | sudo tee /etc/pacman.d/archlinuxcn-mirrorlist
    cat assets/pacman.conf | sudo tee /etc/pacman.conf
    # mirrorlist
    cat assets/mirrorlist | sudo tee /etc/pacman.d/mirrorlist

    # 升级系统, 安装 archlinuxcn-keyring
    sudo pacman -Syu --noconfirm --needed --force
    sudo pacman -S archlinuxcn-keyring --noconfirm

    # pip 源
    pip config set global.index-url 'https://mirrors.ustc.edu.cn/pypi/web/simple'

    # 双系统时间同步
    sudo timedatectl set-local-rtc 1

    logging "[source] installed"

}

install_oh_my_zsh(){
    # config oh-my-zsh and .zshrc
    logging "[zsh] install oh-my-zsh"

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's/env zsh -l//')"

    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    mv assets/.zshrc ${HOME}/

    logging "[zsh] installed"
}

install_fcitx(){
    # 输入法
    logging "[fcitx] install fcitx"

    sudo pacman -S fcitx-im fcitx-sogoupinyin fcitx-cloudpinyin fcitx-configtool --noconfirm --needed

    logging "[fcitx] installed"

}

install_wechat(){
    logging "[wechat] install wechat"

    sudo pacman -S wewechat --noconfirm --needed

    logging "[wechat] installed"

}

install_tim(){
    logging "[tim] install tim"

    sudo pacman -S deepin.com.qq.office --noconfirm --needed

    logging "[tim] installed"

}

install_vim(){
    logging "[vim] install vim"

    sudo pacman -S vim --noconfirm --needed

    logging "[vim] intalled"
}

welcome(){

}
# code start run

main() {
    init
    replace_source
    install_oh_my_zsh
    install_fcitx
    install_vim
    install_wechat
    install_tim
}

main 3>/dev/stdout 2>&1 | tee install.log
