FROM rocker/verse:4.1.1

RUN apt-get update -y && apt-get install -y libtiff5-dev libwebp-dev libzstd-dev

ENV BUILD_DATE=2022-04-06

#RUN MRAN=https://mran.microsoft.com/snapshot/${BUILD_DATE} \
#RUN MRAN=https://mran.revolutionanalytics.com/snapshot/${BUILD_DATE} \
#  && echo MRAN=$MRAN >> /etc/environment \
#  && export MRAN=$MRAN \
#  && echo "options(repos = c(CRAN='$MRAN'), download.file.method = 'libcurl')" >> /usr/local/lib/R/etc/Rprofile.site

RUN Rscript -e 'options(timeout=2.4e6)'

WORKDIR /home/rstudio
COPY renv.lock renv.lock

ENV RENV_VERSION 0.15.5
RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"

# approach two
#RUN mkdir -p renv
#COPY .Rprofile .Rprofile
#COPY renv/activate.R renv/activate.R
#COPY renv/settings.dcf renv/settings.dcf

#RUN R -e "renv::activate()"
#RUN R -e 'renv::restore(lockfile = "/home/rstudio/renv.lock")'

# approach one
#RUN mkdir -p renv/library
#ENV RENV_PATHS_LIBRARY renv/library


RUN R -e "renv::restore()"
