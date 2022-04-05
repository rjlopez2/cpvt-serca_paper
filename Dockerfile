RUN apt-get update -y && apt-get install -y libtiff5-dev libwebp-dev install zstd
#RUN apt-get install libtiff5-dev
#RUN apt-get install -y libwebp-dev
#RUN apt-get --reinstall install zstd


#RUN install2.r --error --skipinstalled\
#  ijtiff

#RUN installGithub.r\
# crsh/papaja@b6cd70f benmarwick/wordcountaddin@fdf70d9
#  rjlopez2/AnlysisOfWaves@ef4f585

WORKDIR /home/rstudio
