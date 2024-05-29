#UTILIZA ARCH LINUX COMO BASE
FROM archlinux:lastest
#INSTALA EL ENTORNO DE ESCRITORIO LXDE
RUN pacman -Syu
RUN pacman -S lxde xorg xorg-server xorg-drivers mesa lxappearance lxmenu lxpanel lightdm lightdm-gtk-greeter
#INSTALA HERRAMIENTAS PARA COMPILAR
#EDITAR Y EJECUTAR CODIGO DE C/C++
#ADEMAS DE GIT Y GIT BASH
RUN pacman -S gcc gdb make cmake binutils
RUN pacman -S clang llvm-bin
RUN pacman -S git git-bash neovim
#CONFIGUTA ARCH LINUX Y LXDE
RUN useradd -m -U $USERNAME && passwd $USERNAME
RUN mkdir -p /home/$USERNAME/.config/lxde
RUN cp -r /etc/xdg/lxde/default /home/$USERNAME/.config/lxde
RUN chown -R $USERNAME:$USERNAME /home/$USERNAME/.config/lxde
#DEFINE EL NOMBRE DE USUARIO Y EL 
#DIRECTORIO DE TRABAJO
USER $USERNAME:$USERNAME
WORKDIR /home/$USERNAME
