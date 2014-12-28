<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Body Beast meets Org-Mode</a>
<ul>
<li><a href="#sec-1-1">1.1. Capture Templates</a></li>
<li><a href="#sec-1-2">1.2. Emacs-Lisp</a></li>
<li><a href="#sec-1-3">1.3. R</a></li>
<li><a href="#sec-1-4">1.4. Batch Export</a>
<ul>
<li><a href="#sec-1-4-1">1.4.1. HTML</a></li>
<li><a href="#sec-1-4-2">1.4.2. Markdown</a></li>
</ul>
</li>
</ul>
</li>
</ul>
</div>
</div>


# Body Beast meets Org-Mode<a id="sec-1" name="sec-1"></a>

Capture [Body Beast](http://www.beachbody.com/product/fitness_programs/body-beast-workout.do) workout results and create graphs

See [statistics.org](statistics.md) (plain org file) , [statistics.md](statistics.md) (markdown with graphics), [statistics.html](statistics.html) (styled with [org-html-themes](https://github.com/fniessen/org-html-themes))

## Capture Templates<a id="sec-1-1" name="sec-1-1"></a>

[statistics.org](statistics.md) defines a couple of Capture Templates for the Bulk Phase. 

Workouts are captured in file `beast-org-file` ([workouts-example.org](workouts-example.md))

## Emacs-Lisp<a id="sec-1-2" name="sec-1-2"></a>

see [beast-org.el](src/beast-org.el)

## R<a id="sec-1-3" name="sec-1-3"></a>

R needs zoo, ggplot2 and reshape2

    install.packages("zoo")
    install.packages("ggplot2")
    install.packages("reshape")

## Batch Export<a id="sec-1-4" name="sec-1-4"></a>

### HTML<a id="sec-1-4-1" name="sec-1-4-1"></a>

    emacs -l init.el statistics.org --batch -f org-html-export-to-html --kill

### Markdown<a id="sec-1-4-2" name="sec-1-4-2"></a>

Needs ox-md: `(require 'ox-md)` 

    emacs -l init.el statistics.org --batch -f org-md-export-to-markdown --kill