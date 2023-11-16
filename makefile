file=test1

all: use-template

no-template:
	pandoc -st beamer ${file}.md -o ${file}.pdf

use-template:
	pandoc -st beamer --template template/my-beamer-template.tex ${file}.md -o ${file}.pdf	

to-tex:
	pandoc -st beamer --template template/my-beamer-template.tex ${file}.md -o ${file}.tex	


	

#pandoc -st beamer ${file}.md -o ${file}.pdf

#pandoc -st beamer -N -V theme:Copenhagen -V colortheme:beaver ${file}.md -o ${file}.pdf

tex:
	pandoc -t beamer --slide-level 2 -N -V theme:Copenhagen -V colortheme:beaver ${file}.md -o ${file}.tex

clean:
	rm *.aux *.fdb_* *.log *.nav *.out *.snm *.synctex* *.toc *.fls

commit:
	git pull
	git add .
	git commit -am 'auto'
	git push