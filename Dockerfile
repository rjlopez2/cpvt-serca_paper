FROM rocker/verse:4.1.1

RUN apt-get update -y && apt-get install -y libtiff5-dev libwebp-dev libzstd-dev

ENV BUILD_DATE=2022-04-06
RUN MRAN=https://mran.microsoft.com/snapshot/${BUILD_DATE} \
  && echo MRAN=$MRAN >> /etc/environment \
  && export MRAN=$MRAN \
  && echo "options(repos = c(CRAN='$MRAN'), download.file.method = 'libcurl')" >> /usr/local/lib/R/etc/Rprofile.site \
  && install2.r --error --skipinstalled\
  pacman readxl tidyverse ggpubr ggbeeswarm ggnewscale colorspace cowplot here lme4 broom.mixed markdown


RUN installGithub.r\
  rjlopez2/AnlysisOfWaves@ef4f585

WORKDIR /home/rstudio
