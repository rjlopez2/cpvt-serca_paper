projekt := $(notdir $(CURDIR))

ifeq ($(WINDOWS),TRUE)
	# please mind the unusual way to specify the path
	current_dir:=//c/Users/your_user_name/Documents/cpvt-serca_paper
	home_dir:=$(current_dir)
	uid:=
else
	current_dir := $(CURDIR)
	home_dir := $(current_dir)
	uid = --user $(shell id -u)
endif

ifeq ($(DOCKER),TRUE)
	run_interactive:=docker run  --rm -it -e ROOT=TRUE -e DISABLE_AUTH=true -p 8787:8787 $(uid) -v $(home_dir):/home/rstudio $(projekt)
	run:=docker run -e --rm $(uid) -v $(home_dir):/home/rstudio $(projekt)
	current_dir=/home/rstudio
endif

HTML_FILES=Intact_cells_waves_analysis.html

all : $(HTML_FILES)
	echo All files are now up to date

%.html : code/%.Rmd
	$(run) Rscript -e 'rmarkdown::render("$(current_dir)/$<")'


build: Dockerfile
	docker build -t $(projekt) .

rebuild:
	docker build --no-cache -t $(projekt) .

save: $(projekt).tar.gz

$(projekt).tar.gz:
	docker save $(projekt):latest | gzip > $@

clean:
	rm -f code/$(HTML_FILES)


test:
	$(run_interactive)


echo:
	echo 'rmarkdown::render("$(current_dir)/code/Intact_cells_waves_analysis.Rmd")'
	echo  this is your dir ----> '"$(current_dir)/code/$<"'
#	echo this is the project name --> $(projekt)
#	echo this is the home dir name --> $(home_dir)
#	echo 'rmarkdown::render("$(current_dir)/code/Intact_cells_waves_analysis.Rmd")'
# echo this is the uid name --> $(uid)
