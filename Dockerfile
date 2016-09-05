FROM base/archlinux:latest
MAINTAINER Harm Endres <harm.endres@gmail.com>
RUN pacman -Sy --noconfirm archlinux-keyring
RUN pacman -Sy --noconfirm curl openssl
RUN ls -ahl
RUN mkdir /tmp/package-query
RUN ls -ahl
RUN cd /tmp/package-query
RUN curl --insecure -o PKGBUILD 'https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=package-query'
RUN ls -ahl
RUN makepkg --asroot -s -i --noconfirm
RUN mkdir /tmp/yaourt
RUN cd /tmp/yaourt
RUN curl -o PKGBUILD 'https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=yaourt'
RUN ls -ahl
RUN makepkg --asroot -s -i --noconfirm
RUN cd
