.ONESHELL:

.PHONY: all
all: readme doc test cleanup

.PHONY: doc
doc:
	$(MAKE) -C doc
	cd doc || exit
	xelatex quran-bn-doc
	xelatex quran-bn-doc

.PHONY: test
test:
	$(MAKE) -C sample  quran-bn-test.tex
	cd sample || exit
	xelatex quran-bn-test
	cd .. || exit

.PHONY: cleanup
cleanup:
	$(MAKE) clean
	$(MAKE) clean -C doc -f ../Makefile
	$(MAKE) clean -C tex -f ../Makefile
	$(MAKE) clean -C sample -f ../Makefile

.PHONY: clean
clean:
	@rm -fv ./*.{aux,log,toc,idx,hd,out} ./*~

.PHONY: dev
dev:
	cd tex || exit
	sudo cp -v *.def quran-bn.sty /usr/local/texlive/2023/texmf-dist/tex/latex/quran-bn

.PHONY: ctan
ctan:
	$(MAKE) cleanup
	mkdir -p quran-bn/doc quran-bn/tex
	cp -v README        quran-bn
	cd tex || exit
	cp -v quran-bn.sty  ../quran-bn/tex
	cp -v qurantext-bn*.translation.def ../quran-bn/tex
	cd ../doc/ || exit
	cp -v quran-bn-doc.pdf quran-bn-doc.tex quran.png ../quran-bn/doc
	cd ../sample || exit
	cp -v quran-bn-test*    ../quran-bn/doc
	cd ..
	zip -r quran-bn.zip quran-bn
	mv -fv quran-bn.zip ..
	rm -rfv ../quran-bn
	mv -fv quran-bn ..

QURANDATE := $(shell grep "quranbndate{" tex/quran-bn.sty | cut -d'{' -f2 | tr -d '}')
QURANVERSION := $(shell grep "quranbnversion{" tex/quran-bn.sty | cut -d'{' -f2 | tr -d '}')
YEAR := "$(shell echo ${QURANDATE} | cut -d'/' -f1)"
readme-file := README

.PHONY: readme
readme:
	@echo "_____________________" > "${readme-file}"
	@echo "The quran-bn package" >> "${readme-file}"
	@echo "v${QURANVERSION}" >> "${readme-file}"
	@echo "" >> "${readme-file}"
	@echo "The package is prepared for typesetting some of Bengali translations of the Holy Quran." >> "${readme-file}"
	@echo -e "The supported translations are done  by \`Zohurul Hoque\`, and \`Muhiuddin Khan\`," >> "${readme-file}"
	@echo "" >> "${readme-file}"
	@echo "For more information, please see the documentation." >> "${readme-file}"
	@echo "" >> "${readme-file}"
	@echo "Current version release date: ${QURANDATE}" >> "${readme-file}"
	@echo "___________________" >> "${readme-file}"
	@echo "Seiied-Mohammad-Javad Razvian" >> "${readme-file}"
	@echo "javadr@gmail.com" >> "${readme-file}"
	@echo "" >> "${readme-file}"
	@echo "Copyright © 2021-${YEAR}" >> "${readme-file}"
	@echo "It may be distributed and/or modified under the LaTeX Project Public License," >> "${readme-file}"
	@echo "version 1.3c or higher (your choice). The latest version of" >> "${readme-file}"
	@echo "this license is at: http://www.latex-project.org/lppl.txt" >> "${readme-file}"
	@echo "" >> "${readme-file}"
	@echo "This work is “author-maintained” (as per LPPL maintenance status)" >> "${readme-file}"
	@echo "by Seiied-Mohammad-Javad Razavian." >> "${readme-file}"
