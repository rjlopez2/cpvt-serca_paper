FROM rocker/verse:4.1.1

RUN apt-get update -y && apt-get install -y libtiff5-dev libwebp-dev libzstd-dev

RUN installGithub.r\
# crsh/papaja@b6cd70f benmarwick/wordcountaddin@fdf70d9
  rjlopez2/AnlysisOfWaves@ef4f585

WORKDIR /home/rstudio
