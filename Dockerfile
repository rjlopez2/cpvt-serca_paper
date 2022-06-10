FROM rocker/verse:4.1.1

RUN apt-get update -y && apt-get install -y libtiff5-dev libwebp-dev libzstd-dev

ENV BUILD_DATE=2022-04-06
#RUN MRAN=https://mran.microsoft.com/snapshot/${BUILD_DATE} \
RUN MRAN=https://mran.revolutionanalytics.com/snapshot/${BUILD_DATE} \
  && echo MRAN=$MRAN >> /etc/environment \
  && export MRAN=$MRAN \
  && echo "options(repos = c(CRAN='$MRAN'), download.file.method = 'libcurl')" >> /usr/local/lib/R/etc/Rprofile.site

RUN installGithub.r rjlopez2/AnlysisOfWaves@47057a3

RUN install2.r --error --skipinstalled \
  pacman \
  here \
  broom.mixed \
  markdown \
  kableExtra \
  #lmerTest \
  emmeans

RUN installGithub.r  wilkelab/ungeviz@aeae12b

RUN install2.r --error --skipinstalled lmerTest




WORKDIR /home/rstudio

#COPY /code/install_packages.R /home/rstudio/install_packages.R

#RUN Rscript /home/rstudio/install_packages.R
