
HANDOUT = handout
SRC = ${HANDOUT}.text

main:
	pandoc --css="http://homepages.cwi.nl/~storm/teaching/bb.css" -t html ${SRC} > ${HANDOUT}.html
	pandoc -f markdown -o latex --standalone \
	    -H preamble.tex -o ${HANDOUT}.tex ${SRC}
	pdflatex ${HANDOUT}.tex
	cd ../input; zip 5lang11.zip *; mv 5lang11.zip ../doc; cd -

upload:
	scp handout.html storm@ssh.cwi.nl:/ufs/storm/public_html/5lang11
	scp handout.pdf storm@ssh.cwi.nl:/ufs/storm/public_html/5lang11
	scp 5lang11.zip storm@ssh.cwi.nl:/ufs/storm/public_html/5lang11


