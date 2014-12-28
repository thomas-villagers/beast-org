<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Body Beast meets Org-Mode</a>
<ul>
<li><a href="#sec-1-1">1.1. Capture Templates</a></li>
<li><a href="#sec-1-2">1.2. Emacs-Lisp</a></li>
<li><a href="#sec-1-3">1.3. R</a></li>
<li><a href="#sec-1-4">1.4. Batch Export</a></li>
</ul>
</li>
</ul>
</div>
</div>


# Body Beast meets Org-Mode<a id="sec-1" name="sec-1"></a>

Capture [Body Beast](http://www.beachbody.com/product/fitness_programs/body-beast-workout.do) workout results and create statistics 

see example

## Capture Templates<a id="sec-1-1" name="sec-1-1"></a>

## Emacs-Lisp<a id="sec-1-2" name="sec-1-2"></a>

see [beast-org.el](src/beast-org.el)

## R<a id="sec-1-3" name="sec-1-3"></a>

R needs zoo, ggplot2 and reshape2

    install.packages("zoo")
    install.packages("ggplot2")
    install.packages("reshape")

## Batch Export<a id="sec-1-4" name="sec-1-4"></a>

    emacs -l init.el training.org --batch -f org-html-export-to-html --kill