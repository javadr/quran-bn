# The quran-bn package
Copyright © 2021-2025

The [`quran-bn`](https://ctan.org/pkg/quran-bn) package is an extension of the [`quran`](https://ctan.org/pkg/quran) LaTeX package, designed to enhance the typesetting of the Holy Quran by incorporating specific Bengali translations. It provides support for German translations carried out by notable translators such as `Zohurul Hoque`, and `Muhiuddin Khan`.

### Sample

```
\documentclass{article}

\usepackage{arabxetex}
\newfontfamily\bengali{NotoSansBengali-Regular}
\usepackage{quran-bn}

\begin{document}

    \begin{arab}[utf]
        \quransurah[112]
    \end{arab}
    {\bengali \quransurahbn[112]}

\end{document}
```

### Documentation
For more details, please refer to [this link](http://mirrors.ctan.org/macros/unicodetex/latex/quran-bn/doc/quran-bn-doc.pdf).

## License

[The LaTeX project public license (LPPL), version 1.3c](https://www.latex-project.org/lppl/lppl-1-3c/)

## Citation

```tex
@misc{quran,
  title={{quran}: An easy way to typeset any part of The Holy Quran},
  url={https://ctan.org/pkg/quran},
  note={Available at https://github.com/javadr/quran},
  author={Javad Razavian},
  year={2015},
}
```
