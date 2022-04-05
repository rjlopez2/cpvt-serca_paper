projekt := $(notdir $(CURDIR))

ifeq ($(WINDOWS),TRUE)
	# please mind the unusual way to specify the path
	current_dir:=//c/Users/ruben/Documents/CPVT-SERCA_paper
	home_dir:=$(current_dir)
	uid:=
else
	current_dir := $(CURDIR)
	home_dir := $(current_dir)
	uid = --user $(shell id -u)
endif

ifeq ($(DOCKER),TRUE)
	run:=docker run --rm $(uid) -v $(home_dir):/home/rstudio $(projekt)
	current_dir=/home/rstudio
endif

all: manuscript.pdf README.md

build: Dockerfile
	docker build -t $(projekt) .

rebuild:
	docker build --no-cache -t $(projekt) .

save: $(projekt).tar.gz

$(projekt).tar.gz:
	docker save $(projekt):latest | gzip > $@
