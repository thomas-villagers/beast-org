<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Programming</a>
<ul>
<li><a href="#sec-1-1">1.1. Setup</a></li>
<li><a href="#sec-1-2">1.2. Capture Templates</a></li>
<li><a href="#sec-1-3">1.3. Emacs Lisp</a></li>
<li><a href="#sec-1-4">1.4. R</a>
<ul>
<li><a href="#sec-1-4-1">1.4.1. Simple R Graph</a></li>
<li><a href="#sec-1-4-2">1.4.2. R Graph with <code>MM:SS</code> at y-axis</a></li>
</ul>
</li>
</ul>
</li>
<li><a href="#sec-2">2. Statistics</a>
<ul>
<li><a href="#sec-2-1">2.1. Bulk Chest</a>
<ul>
<li><a href="#sec-2-1-1">2.1.1. Incline Fly</a></li>
<li><a href="#sec-2-1-2">2.1.2. Incline Press</a></li>
<li><a href="#sec-2-1-3">2.1.3. Chest Press with Rotation</a></li>
<li><a href="#sec-2-1-4">2.1.4. Progressive Incline Press</a></li>
<li><a href="#sec-2-1-5">2.1.5. Close Grip Press to Fly</a></li>
</ul>
</li>
<li><a href="#sec-2-2">2.2. Bulk Legs</a>
<ul>
<li><a href="#sec-2-2-1">2.2.1. Front to back Lunge</a></li>
<li><a href="#sec-2-2-2">2.2.2. Squat</a></li>
<li><a href="#sec-2-2-3">2.2.3. Full to 1/2 Sumo Squat</a></li>
<li><a href="#sec-2-2-4">2.2.4. Split Squat w/EZ Bar</a></li>
<li><a href="#sec-2-2-5">2.2.5. Stiff Leg Deadlift</a></li>
<li><a href="#sec-2-2-6">2.2.6. Alt. Side Squat</a></li>
<li><a href="#sec-2-2-7">2.2.7. Calf Raise</a></li>
</ul>
</li>
<li><a href="#sec-2-3">2.3. Bulk Back</a>
<ul>
<li><a href="#sec-2-3-1">2.3.1. Pull-Over</a></li>
<li><a href="#sec-2-3-2">2.3.2. Reverse Grip Row</a></li>
<li><a href="#sec-2-3-3">2.3.3. One Arm Row</a></li>
<li><a href="#sec-2-3-4">2.3.4. Deadlift</a></li>
<li><a href="#sec-2-3-5">2.3.5. Reverse Fly</a></li>
<li><a href="#sec-2-3-6">2.3.6. Plank Rotation</a></li>
</ul>
</li>
<li><a href="#sec-2-4">2.4. Bulk Arms</a>
<ul>
<li><a href="#sec-2-4-1">2.4.1. Standing Curl</a></li>
<li><a href="#sec-2-4-2">2.4.2. Tricep Extension</a></li>
<li><a href="#sec-2-4-3">2.4.3. Wide EZ Bar Curl</a></li>
<li><a href="#sec-2-4-4">2.4.4. Skull Crusher</a></li>
<li><a href="#sec-2-4-5">2.4.5. Hammer Curl</a></li>
<li><a href="#sec-2-4-6">2.4.6. Tricep Kickback</a></li>
<li><a href="#sec-2-4-7">2.4.7. Weighted Crunch</a></li>
</ul>
</li>
<li><a href="#sec-2-5">2.5. Bulk Shoulders</a>
<ul>
<li><a href="#sec-2-5-1">2.5.1. Lateral Raise</a></li>
<li><a href="#sec-2-5-2">2.5.2. Arnold Press</a></li>
<li><a href="#sec-2-5-3">2.5.3. Upright Row</a></li>
<li><a href="#sec-2-5-4">2.5.4. Alt. Front Raise</a></li>
<li><a href="#sec-2-5-5">2.5.5. Plate Twist-Twist</a></li>
<li><a href="#sec-2-5-6">2.5.6. Reverse Fly</a></li>
</ul>
</li>
</ul>
</li>
<li><a href="#sec-3">3. Running</a></li>
</ul>
</div>
</div>


# Programming<a id="sec-1" name="sec-1"></a>

## Setup<a id="sec-1-1" name="sec-1-1"></a>

    (setq beast-org-file "workouts-example.org") ; use absolute path or capture file goes to ~/org
    (load-file "src/beast-org.el")

    t

## Capture Templates<a id="sec-1-2" name="sec-1-2"></a>

    (setq org-capture-templates
          '(("w" "workout" entry (file+datetree beast-org-file) "* %? \n SCHEDULED: %t\n")
            ("e" "beast abs" entry (file+datetree beast-org-file) "* Beast Abs :bodybeast:beast:abs: \n %?")
            ("c" "bulk chest" entry (file+datetree beast-org-file) "%[capturetemplates/bulkchest.org]")
            ("l" "bulk legs" entry (file+datetree beast-org-file) "%[capturetemplates/bulklegs.org]")
            ("a" "bulk arms" entry (file+datetree beast-org-file) "%[capturetemplates/bulkarms.org]")
            ("b" "bulk back" entry (file+datetree beast-org-file) "%[capturetemplates/bulkback.org]")
            ("s" "bulk shoulders" entry (file+datetree beast-org-file) "%[capturetemplates/bulkshoulders.org]")
            ("r" "running" entry (file+datetree beast-org-file) "* Running :running: \n SCHEDULED: %t\n %^{Time}p")))

## Emacs Lisp<a id="sec-1-3" name="sec-1-3"></a>

see [beast-org.el](src/beast-org.el)

## R<a id="sec-1-4" name="sec-1-4"></a>

### Simple R Graph<a id="sec-1-4-1" name="sec-1-4-1"></a>

This graph captures a set

    library(reshape2)
    library(ggplot2)
    p <- ggplot(melt(table, id="Date"), aes(x=Date,y=value, group = variable, colour = variable))  +  geom_point() + ylab("Weight (Kg)") + geom_line()
    p

### R Graph with `MM:SS` at y-axis<a id="sec-1-4-2" name="sec-1-4-2"></a>

I also go running once in a while. Graph the results:

    library(zoo)
    library(ggplot2)
    setClass("myTime")
    setAs("character","myTime", function(from) as.POSIXct(from, format="%M:%S"))
    Time <- read.zoo(table, colClasses = c("Date", "myTime"))
    q <- autoplot.zoo(Time) + ylab("Time") + xlab("Date") + geom_point() + geom_line()
    q

# Statistics<a id="sec-2" name="sec-2"></a>

## Bulk Chest<a id="sec-2-1" name="sec-2-1"></a>

### Incline Fly<a id="sec-2-1-1" name="sec-2-1-1"></a>

    (make-table "+bulk:chest" "Incline Fly" "singleset")

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="right" />

<col  class="right" />

<col  class="right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Date</th>
<th scope="col" class="right">15 Reps</th>
<th scope="col" class="right">12 Reps</th>
<th scope="col" class="right">8 Reps</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">2014-12-12 Fr</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
</tr>


<tr>
<td class="left">2014-12-18 Do</td>
<td class="right">5</td>
<td class="right">7.5</td>
<td class="right">10</td>
</tr>


<tr>
<td class="left">2014-12-24 Mi</td>
<td class="right">7.5</td>
<td class="right">8.75</td>
<td class="right">10</td>
</tr>
</tbody>
</table>

![img](img/inclinefly-r.png)

### Incline Press<a id="sec-2-1-2" name="sec-2-1-2"></a>

    (make-table "+bulk:chest" "Incline Press" "singleset2")

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Date</th>
<th scope="col" class="right">15 Reps</th>
<th scope="col" class="right">12 Reps</th>
<th scope="col" class="right">8 Reps</th>
<th scope="col" class="right">8 Reps</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">2014-12-12 Fr</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
</tr>


<tr>
<td class="left">2014-12-18 Do</td>
<td class="right">7.5</td>
<td class="right">10</td>
<td class="right">12.5</td>
<td class="right">10</td>
</tr>


<tr>
<td class="left">2014-12-24 Mi</td>
<td class="right">8.75</td>
<td class="right">8.75</td>
<td class="right">12.5</td>
<td class="right">10</td>
</tr>
</tbody>
</table>

![img](img/inclinepress-r.png)

### Chest Press with Rotation<a id="sec-2-1-3" name="sec-2-1-3"></a>

    (make-table "+bulk:chest" "Chest Press with Rotation" "forceset")

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Date</th>
<th scope="col" class="right">5 Reps</th>
<th scope="col" class="right">5 Reps</th>
<th scope="col" class="right">5 Reps</th>
<th scope="col" class="right">5 Reps</th>
<th scope="col" class="right">5 Reps</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">2014-12-12 Fr</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
</tr>


<tr>
<td class="left">2014-12-18 Do</td>
<td class="right">8.75</td>
<td class="right">8.75</td>
<td class="right">8.75</td>
<td class="right">8.75</td>
<td class="right">8.75</td>
</tr>


<tr>
<td class="left">2014-12-24 Mi</td>
<td class="right">8.75</td>
<td class="right">8.75</td>
<td class="right">8.75</td>
<td class="right">8.75</td>
<td class="right">8.75</td>
</tr>
</tbody>
</table>

![img](img/chestpressrotation-r.png)

### Progressive Incline Press<a id="sec-2-1-4" name="sec-2-1-4"></a>

    (make-table "+bulk:chest" "Incline Press 2" "progressiveset")

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Date</th>
<th scope="col" class="right">15 Reps</th>
<th scope="col" class="right">12 Reps</th>
<th scope="col" class="right">8 Reps</th>
<th scope="col" class="right">8 Reps</th>
<th scope="col" class="right">12 Reps</th>
<th scope="col" class="right">15 Reps</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">2014-12-12 Fr</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
</tr>


<tr>
<td class="left">2014-12-18 Do</td>
<td class="right">7.5</td>
<td class="right">8.75</td>
<td class="right">10</td>
<td class="right">10</td>
<td class="right">8.75</td>
<td class="right">7.5</td>
</tr>


<tr>
<td class="left">2014-12-24 Mi</td>
<td class="right">7.5</td>
<td class="right">8.75</td>
<td class="right">12.5</td>
<td class="right">12.5</td>
<td class="right">8.75</td>
<td class="right">7.5</td>
</tr>
</tbody>
</table>

![img](img/inclinepress2-r.png)

### Close Grip Press to Fly<a id="sec-2-1-5" name="sec-2-1-5"></a>

    (make-table "+bulk:chest" "Close Grip Press to Fly" "singleset")

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="right" />

<col  class="right" />

<col  class="right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Date</th>
<th scope="col" class="right">15 Reps</th>
<th scope="col" class="right">12 Reps</th>
<th scope="col" class="right">8 Reps</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">2014-12-12 Fr</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
</tr>


<tr>
<td class="left">2014-12-18 Do</td>
<td class="right">5</td>
<td class="right">7.5</td>
<td class="right">10</td>
</tr>


<tr>
<td class="left">2014-12-24 Mi</td>
<td class="right">7.5</td>
<td class="right">8.75</td>
<td class="right">10</td>
</tr>
</tbody>
</table>

![img](img/closegrippresstofly-r.png)

## Bulk Legs<a id="sec-2-2" name="sec-2-2"></a>

### Front to back Lunge<a id="sec-2-2-1" name="sec-2-2-1"></a>

    (make-table "+bulk:legs" "Front to Back Lunge" "singleset12")

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="right" />

<col  class="right" />

<col  class="right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Date</th>
<th scope="col" class="right">12 Reps</th>
<th scope="col" class="right">10 Reps</th>
<th scope="col" class="right">8 Reps</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">2014-12-13 Sa</td>
<td class="right">5</td>
<td class="right">7.5</td>
<td class="right">10</td>
</tr>


<tr>
<td class="left">2014-12-19 Fr</td>
<td class="right">5</td>
<td class="right">5</td>
<td class="right">7.5</td>
</tr>


<tr>
<td class="left">2014-12-25 Thu</td>
<td class="right">5</td>
<td class="right">7.5</td>
<td class="right">8.75</td>
</tr>
</tbody>
</table>

![img](img/fronttobacklunge-r.png)

### Squat<a id="sec-2-2-2" name="sec-2-2-2"></a>

    (make-table "+bulk:legs" "Squat" "progressiveset")

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Date</th>
<th scope="col" class="right">15 Reps</th>
<th scope="col" class="right">12 Reps</th>
<th scope="col" class="right">8 Reps</th>
<th scope="col" class="right">8 Reps</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">2014-12-13 Sa</td>
<td class="right">5</td>
<td class="right">7.5</td>
<td class="right">0</td>
<td class="right">0</td>
</tr>


<tr>
<td class="left">2014-12-19 Fr</td>
<td class="right">7.5</td>
<td class="right">10</td>
<td class="right">10</td>
<td class="right">8.75</td>
</tr>


<tr>
<td class="left">2014-12-25 Thu</td>
<td class="right">8.75</td>
<td class="right">10</td>
<td class="right">12.5</td>
<td class="right">10</td>
</tr>
</tbody>
</table>

![img](img/squat-r.png)

### Full to 1/2 Sumo Squat<a id="sec-2-2-3" name="sec-2-2-3"></a>

    (make-table "+bulk:legs" "Full to 1/2 Sumo Squat" "forceset")

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Date</th>
<th scope="col" class="right">5 Reps</th>
<th scope="col" class="right">5 Reps</th>
<th scope="col" class="right">5 Reps</th>
<th scope="col" class="right">5 Reps</th>
<th scope="col" class="right">5 Reps</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">2014-12-13 Sa</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
</tr>


<tr>
<td class="left">2014-12-19 Fr</td>
<td class="right">8.75</td>
<td class="right">8.75</td>
<td class="right">8.75</td>
<td class="right">8.75</td>
<td class="right">8.75</td>
</tr>


<tr>
<td class="left">2014-12-25 Thu</td>
<td class="right">10</td>
<td class="right">10</td>
<td class="right">10</td>
<td class="right">10</td>
<td class="right">10</td>
</tr>
</tbody>
</table>

![img](img/fullto12sumosquat-r.png)

### Split Squat w/EZ Bar<a id="sec-2-2-4" name="sec-2-2-4"></a>

    (make-table "+bulk:legs" "Split Squat w/EZ Bar" "progressiveset")

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Date</th>
<th scope="col" class="right">15 Reps</th>
<th scope="col" class="right">12 Reps</th>
<th scope="col" class="right">8 Reps</th>
<th scope="col" class="right">8 Reps</th>
<th scope="col" class="right">12 Reps</th>
<th scope="col" class="right">15 Reps</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">2014-12-13 Sa</td>
<td class="right">2.5</td>
<td class="right">3.75</td>
<td class="right">3.75</td>
<td class="right">5</td>
<td class="right">3.75</td>
<td class="right">2.5</td>
</tr>


<tr>
<td class="left">2014-12-19 Fr</td>
<td class="right">3.75</td>
<td class="right">3.75</td>
<td class="right">5</td>
<td class="right">5</td>
<td class="right">3.75</td>
<td class="right">2.5</td>
</tr>


<tr>
<td class="left">2014-12-25 Thu</td>
<td class="right">3.75</td>
<td class="right">3.75</td>
<td class="right">5</td>
<td class="right">5</td>
<td class="right">3.75</td>
<td class="right">2.5</td>
</tr>
</tbody>
</table>

![img](img/splitsquatwezbar-r.png)

### Stiff Leg Deadlift<a id="sec-2-2-5" name="sec-2-2-5"></a>

    (make-table "+bulk:legs" "Stiff Leg Deadlift" "singleset2")

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Date</th>
<th scope="col" class="right">15 Reps</th>
<th scope="col" class="right">12 Reps</th>
<th scope="col" class="right">8 Reps</th>
<th scope="col" class="right">8 Reps</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">2014-12-13 Sa</td>
<td class="right">5</td>
<td class="right">7.5</td>
<td class="right">0</td>
<td class="right">0</td>
</tr>


<tr>
<td class="left">2014-12-19 Fr</td>
<td class="right">7.5</td>
<td class="right">10</td>
<td class="right">10</td>
<td class="right">8.75</td>
</tr>


<tr>
<td class="left">2014-12-25 Thu</td>
<td class="right">8.75</td>
<td class="right">10</td>
<td class="right">12.5</td>
<td class="right">10</td>
</tr>
</tbody>
</table>

![img](img/stifflegdeadlift-r.png)

### Alt. Side Squat<a id="sec-2-2-6" name="sec-2-2-6"></a>

    (make-table "+bulk:legs" "Alt. Side Squat" "singleset10")

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="right" />

<col  class="right" />

<col  class="right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Date</th>
<th scope="col" class="right">10 Reps</th>
<th scope="col" class="right">10 Reps</th>
<th scope="col" class="right">10 Reps</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">2014-12-13 Sa</td>
<td class="right">5</td>
<td class="right">5</td>
<td class="right">5</td>
</tr>


<tr>
<td class="left">2014-12-19 Fr</td>
<td class="right">5</td>
<td class="right">5</td>
<td class="right">5</td>
</tr>


<tr>
<td class="left">2014-12-25 Thu</td>
<td class="right">5</td>
<td class="right">5</td>
<td class="right">5</td>
</tr>
</tbody>
</table>

![img](img/altsidesquat-r.png)

### Calf Raise<a id="sec-2-2-7" name="sec-2-2-7"></a>

    (make-table "+bulk:legs" "Calf Raise" "singleset50")

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="right" />

<col  class="right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Date</th>
<th scope="col" class="right">50 Reps</th>
<th scope="col" class="right">50 Reps</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">2014-12-13 Sa</td>
<td class="right">7.5</td>
<td class="right">7.5</td>
</tr>


<tr>
<td class="left">2014-12-19 Fr</td>
<td class="right">5</td>
<td class="right">5</td>
</tr>


<tr>
<td class="left">2014-12-25 Thu</td>
<td class="right">5</td>
<td class="right">5</td>
</tr>
</tbody>
</table>

![img](img/calfraise-r.png)

## Bulk Back<a id="sec-2-3" name="sec-2-3"></a>

### Pull-Over<a id="sec-2-3-1" name="sec-2-3-1"></a>

    (make-table "+bulk:back" "Pull-Over" "singleset2")

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Date</th>
<th scope="col" class="right">15 Reps</th>
<th scope="col" class="right">12 Reps</th>
<th scope="col" class="right">8 Reps</th>
<th scope="col" class="right">8 Reps</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">2014-12-14 So</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
</tr>


<tr>
<td class="left">2014-12-21 So</td>
<td class="right">12.5</td>
<td class="right">15</td>
<td class="right">15</td>
<td class="right">15</td>
</tr>


<tr>
<td class="left">2014-12-26 Fr</td>
<td class="right">12.5</td>
<td class="right">15</td>
<td class="right">15</td>
<td class="right">15</td>
</tr>
</tbody>
</table>

![img](img/pullover-r.png)

### Reverse Grip Row<a id="sec-2-3-2" name="sec-2-3-2"></a>

    (make-table "+bulk:back" "Reverse Grip Row" "progressiveset")

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Date</th>
<th scope="col" class="right">15 Reps</th>
<th scope="col" class="right">12 Reps</th>
<th scope="col" class="right">8 Reps</th>
<th scope="col" class="right">8 Reps</th>
<th scope="col" class="right">12 Reps</th>
<th scope="col" class="right">15 Reps</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">2014-12-14 So</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
</tr>


<tr>
<td class="left">2014-12-21 So</td>
<td class="right">5</td>
<td class="right">7.5</td>
<td class="right">10</td>
<td class="right">10</td>
<td class="right">7.5</td>
<td class="right">5</td>
</tr>


<tr>
<td class="left">2014-12-26 Fr</td>
<td class="right">6.25</td>
<td class="right">8.75</td>
<td class="right">11.25</td>
<td class="right">11.25</td>
<td class="right">7.5</td>
<td class="right">6.25</td>
</tr>
</tbody>
</table>

![img](img/reversegriprow-r.png)

### One Arm Row<a id="sec-2-3-3" name="sec-2-3-3"></a>

    (make-table "+bulk:back" "One-Arm Row" "forceset")

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Date</th>
<th scope="col" class="right">5 Reps</th>
<th scope="col" class="right">5 Reps</th>
<th scope="col" class="right">5 Reps</th>
<th scope="col" class="right">5 Reps</th>
<th scope="col" class="right">5 Reps</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">2014-12-14 So</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
</tr>


<tr>
<td class="left">2014-12-21 So</td>
<td class="right">10</td>
<td class="right">10</td>
<td class="right">10</td>
<td class="right">10</td>
<td class="right">10</td>
</tr>


<tr>
<td class="left">2014-12-26 Fr</td>
<td class="right">10</td>
<td class="right">10</td>
<td class="right">10</td>
<td class="right">10</td>
<td class="right">10</td>
</tr>
</tbody>
</table>

![img](img/onearmrow-r.png)

### Deadlift<a id="sec-2-3-4" name="sec-2-3-4"></a>

    (make-table "+bulk:back" "Deadlift" "singleset2")

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Date</th>
<th scope="col" class="right">15 Reps</th>
<th scope="col" class="right">12 Reps</th>
<th scope="col" class="right">8 Reps</th>
<th scope="col" class="right">8 Reps</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">2014-12-14 So</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
</tr>


<tr>
<td class="left">2014-12-21 So</td>
<td class="right">7.5</td>
<td class="right">10</td>
<td class="right">12.5</td>
<td class="right">10</td>
</tr>


<tr>
<td class="left">2014-12-26 Fr</td>
<td class="right">7.5</td>
<td class="right">10</td>
<td class="right">12.5</td>
<td class="right">10</td>
</tr>
</tbody>
</table>

![img](img/deadlift-r.png)

### Reverse Fly<a id="sec-2-3-5" name="sec-2-3-5"></a>

    (make-table "+bulk:back" "Reverse Fly" "singleset15")

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="right" />

<col  class="right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Date</th>
<th scope="col" class="right">15 Reps</th>
<th scope="col" class="right">12 Reps</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">2014-12-14 So</td>
<td class="right">0</td>
<td class="right">0</td>
</tr>


<tr>
<td class="left">2014-12-21 So</td>
<td class="right">5</td>
<td class="right">5</td>
</tr>


<tr>
<td class="left">2014-12-26 Fr</td>
<td class="right">5</td>
<td class="right">5</td>
</tr>
</tbody>
</table>

![img](img/reversefly-r.png)

### Plank Rotation<a id="sec-2-3-6" name="sec-2-3-6"></a>

    (make-table "+bulk:back" "Plank Rotation" "singleset30s")

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="right" />

<col  class="right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Date</th>
<th scope="col" class="right">30 Sec.</th>
<th scope="col" class="right">30 Sec.</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">2014-12-14 So</td>
<td class="right">0</td>
<td class="right">0</td>
</tr>


<tr>
<td class="left">2014-12-21 So</td>
<td class="right">4</td>
<td class="right">4</td>
</tr>


<tr>
<td class="left">2014-12-26 Fr</td>
<td class="right">5</td>
<td class="right">5</td>
</tr>
</tbody>
</table>

![img](img/plankrotation-r.png)

## Bulk Arms<a id="sec-2-4" name="sec-2-4"></a>

### Standing Curl<a id="sec-2-4-1" name="sec-2-4-1"></a>

    (make-table "+bulk:arms" "Standing Curl" "progressiveset")

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Date</th>
<th scope="col" class="right">15 Reps</th>
<th scope="col" class="right">12 Reps</th>
<th scope="col" class="right">8 Reps</th>
<th scope="col" class="right">8 Reps</th>
<th scope="col" class="right">12 Reps</th>
<th scope="col" class="right">15 Reps</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">2014-12-15 Mo</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
</tr>


<tr>
<td class="left">2014-12-22 Mo</td>
<td class="right">7.5</td>
<td class="right">8.75</td>
<td class="right">10</td>
<td class="right">12.5</td>
<td class="right">7.5</td>
<td class="right">5</td>
</tr>


<tr>
<td class="left">2014-12-27 Sa</td>
<td class="right">7.5</td>
<td class="right">8.75</td>
<td class="right">12.5</td>
<td class="right">10</td>
<td class="right">8.75</td>
<td class="right">7.5</td>
</tr>
</tbody>
</table>

![img](img/standingcurl-r.png)

### Tricep Extension<a id="sec-2-4-2" name="sec-2-4-2"></a>

    (make-table "+bulk:arms" "Tricep Extension" "singleset2")

![img](img/tricepextension-r.png)

### Wide EZ Bar Curl<a id="sec-2-4-3" name="sec-2-4-3"></a>

    (make-table "+bulk:arms" "Wide EZ Bar Curl" "forceset")

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Date</th>
<th scope="col" class="right">5 Reps</th>
<th scope="col" class="right">5 Reps</th>
<th scope="col" class="right">5 Reps</th>
<th scope="col" class="right">5 Reps</th>
<th scope="col" class="right">5 Reps</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">2014-12-15 Mo</td>
<td class="right">5</td>
<td class="right">5</td>
<td class="right">5</td>
<td class="right">5</td>
<td class="right">5</td>
</tr>


<tr>
<td class="left">2014-12-22 Mo</td>
<td class="right">6.25</td>
<td class="right">6.25</td>
<td class="right">6.25</td>
<td class="right">6.25</td>
<td class="right">6.25</td>
</tr>


<tr>
<td class="left">2014-12-27 Sa</td>
<td class="right">6.25</td>
<td class="right">6.25</td>
<td class="right">6.25</td>
<td class="right">6.25</td>
<td class="right">6.25</td>
</tr>
</tbody>
</table>

![img](img/wideezbarcurl-r.png)

### Skull Crusher<a id="sec-2-4-4" name="sec-2-4-4"></a>

    (make-table "+bulk:arms" "Skull Crusher" "singleset2")

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Date</th>
<th scope="col" class="right">15 Reps</th>
<th scope="col" class="right">12 Reps</th>
<th scope="col" class="right">8 Reps</th>
<th scope="col" class="right">8 Reps</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">2014-12-15 Mo</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
</tr>


<tr>
<td class="left">2014-12-22 Mo</td>
<td class="right">3.75</td>
<td class="right">5</td>
<td class="right">7.5</td>
<td class="right">6.25</td>
</tr>


<tr>
<td class="left">2014-12-27 Sa</td>
<td class="right">5</td>
<td class="right">6.25</td>
<td class="right">7.5</td>
<td class="right">6.25</td>
</tr>
</tbody>
</table>

![img](img/skullcrusher-r.png)

### Hammer Curl<a id="sec-2-4-5" name="sec-2-4-5"></a>

    (make-table "+bulk:arms" "Hammer Curl" "progressiveset")

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Date</th>
<th scope="col" class="right">15 Reps</th>
<th scope="col" class="right">12 Reps</th>
<th scope="col" class="right">8 Reps</th>
<th scope="col" class="right">8 Reps</th>
<th scope="col" class="right">12 Reps</th>
<th scope="col" class="right">15 Reps</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">2014-12-15 Mo</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
</tr>


<tr>
<td class="left">2014-12-22 Mo</td>
<td class="right">7.5</td>
<td class="right">8.75</td>
<td class="right">10</td>
<td class="right">10</td>
<td class="right">8.75</td>
<td class="right">7.5</td>
</tr>


<tr>
<td class="left">2014-12-27 Sa</td>
<td class="right">7.5</td>
<td class="right">8.75</td>
<td class="right">10</td>
<td class="right">10</td>
<td class="right">7.5</td>
<td class="right">5</td>
</tr>
</tbody>
</table>

![img](img/hammercurl-r.png)

### Tricep Kickback<a id="sec-2-4-6" name="sec-2-4-6"></a>

    (make-table "+bulk:arms" "Tricep Kickback" "progressiveset")

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Date</th>
<th scope="col" class="right">15 Reps</th>
<th scope="col" class="right">12 Reps</th>
<th scope="col" class="right">8 Reps</th>
<th scope="col" class="right">8 Reps</th>
<th scope="col" class="right">12 Reps</th>
<th scope="col" class="right">15 Reps</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">2014-12-15 Mo</td>
<td class="right">5</td>
<td class="right">7.5</td>
<td class="right">8.75</td>
<td class="right">8.75</td>
<td class="right">5</td>
<td class="right">4</td>
</tr>


<tr>
<td class="left">2014-12-22 Mo</td>
<td class="right">5</td>
<td class="right">7.5</td>
<td class="right">8.75</td>
<td class="right">8.75</td>
<td class="right">5</td>
<td class="right">4</td>
</tr>


<tr>
<td class="left">2014-12-27 Sa</td>
<td class="right">4</td>
<td class="right">5</td>
<td class="right">7.5</td>
<td class="right">7.5</td>
<td class="right">5</td>
<td class="right">4</td>
</tr>
</tbody>
</table>

![img](img/tricepkickback-r.png)

### Weighted Crunch<a id="sec-2-4-7" name="sec-2-4-7"></a>

    (make-table "+bulk:arms" "Weighted Crunch" "singleset30")

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Date</th>
<th scope="col" class="right">30 Reps</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">2014-12-15 Mo</td>
<td class="right">5</td>
</tr>


<tr>
<td class="left">2014-12-22 Mo</td>
<td class="right">5</td>
</tr>


<tr>
<td class="left">2014-12-27 Sa</td>
<td class="right">5</td>
</tr>
</tbody>
</table>

![img](img/weightedcrunch-r.png)

## Bulk Shoulders<a id="sec-2-5" name="sec-2-5"></a>

### Lateral Raise<a id="sec-2-5-1" name="sec-2-5-1"></a>

    (make-table "+bulk:shoulders" "Lateral Raise" "singleset")

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="right" />

<col  class="right" />

<col  class="right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Date</th>
<th scope="col" class="right">15 Reps</th>
<th scope="col" class="right">12 Reps</th>
<th scope="col" class="right">8 Reps</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">2014-12-16 Di</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
</tr>


<tr>
<td class="left">2014-12-23 Di</td>
<td class="right">4</td>
<td class="right">5</td>
<td class="right">7.5</td>
</tr>


<tr>
<td class="left">2014-12-28 So</td>
<td class="right">4</td>
<td class="right">5</td>
<td class="right">5</td>
</tr>
</tbody>
</table>

![img](img/lateralraise-r.png)

### Arnold Press<a id="sec-2-5-2" name="sec-2-5-2"></a>

    (make-table "+bulk:shoulders" "Arnold Press" "singleset2")

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Date</th>
<th scope="col" class="right">15 Reps</th>
<th scope="col" class="right">12 Reps</th>
<th scope="col" class="right">8 Reps</th>
<th scope="col" class="right">8 Reps</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">2014-12-16 Di</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
</tr>


<tr>
<td class="left">2014-12-23 Di</td>
<td class="right">7.5</td>
<td class="right">8.75</td>
<td class="right">12.5</td>
<td class="right">7.5</td>
</tr>


<tr>
<td class="left">2014-12-28 So</td>
<td class="right">7.5</td>
<td class="right">8.75</td>
<td class="right">10</td>
<td class="right">8.75</td>
</tr>
</tbody>
</table>

![img](img/arnoldpress-r.png)

### Upright Row<a id="sec-2-5-3" name="sec-2-5-3"></a>

    (make-table "+bulk:shoulders" "Upright Row" "progressiveset")

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Date</th>
<th scope="col" class="right">15 Reps</th>
<th scope="col" class="right">12 Reps</th>
<th scope="col" class="right">8 Reps</th>
<th scope="col" class="right">8 Reps</th>
<th scope="col" class="right">12 Reps</th>
<th scope="col" class="right">15 Reps</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">2014-12-16 Di</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
</tr>


<tr>
<td class="left">2014-12-23 Di</td>
<td class="right">5</td>
<td class="right">6.25</td>
<td class="right">8.75</td>
<td class="right">8.75</td>
<td class="right">6.25</td>
<td class="right">5</td>
</tr>


<tr>
<td class="left">2014-12-28 So</td>
<td class="right">6.25</td>
<td class="right">7.5</td>
<td class="right">8.75</td>
<td class="right">8.75</td>
<td class="right">6.25</td>
<td class="right">5</td>
</tr>
</tbody>
</table>

![img](img/uprightrow-r.png)

### Alt. Front Raise<a id="sec-2-5-4" name="sec-2-5-4"></a>

    (make-table "+bulk:shoulders" "Alt. Front Raise" "singleset")

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="right" />

<col  class="right" />

<col  class="right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Date</th>
<th scope="col" class="right">15 Reps</th>
<th scope="col" class="right">12 Reps</th>
<th scope="col" class="right">8 Reps</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">2014-12-16 Di</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
</tr>


<tr>
<td class="left">2014-12-23 Di</td>
<td class="right">4</td>
<td class="right">5</td>
<td class="right">7.5</td>
</tr>


<tr>
<td class="left">2014-12-28 So</td>
<td class="right">4</td>
<td class="right">5</td>
<td class="right">7.5</td>
</tr>
</tbody>
</table>

![img](img/altfrontraise-r.png)

### Plate Twist-Twist<a id="sec-2-5-5" name="sec-2-5-5"></a>

    (make-table "+bulk:shoulders" "Plate Twist-Twist" "singleset10")

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="right" />

<col  class="right" />

<col  class="right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Date</th>
<th scope="col" class="right">10 Reps</th>
<th scope="col" class="right">10 Reps</th>
<th scope="col" class="right">10 Reps</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">2014-12-16 Di</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
</tr>


<tr>
<td class="left">2014-12-23 Di</td>
<td class="right">5</td>
<td class="right">5</td>
<td class="right">5</td>
</tr>


<tr>
<td class="left">2014-12-28 So</td>
<td class="right">5</td>
<td class="right">5</td>
<td class="right">10</td>
</tr>
</tbody>
</table>

![img](img/platetwisttwist-r.png)

### Reverse Fly<a id="sec-2-5-6" name="sec-2-5-6"></a>

    (make-table "+bulk:shoulders" "Reverse Fly" "progressiveset")

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />

<col  class="right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Date</th>
<th scope="col" class="right">15 Reps</th>
<th scope="col" class="right">12 Reps</th>
<th scope="col" class="right">8 Reps</th>
<th scope="col" class="right">8 Reps</th>
<th scope="col" class="right">12 Reps</th>
<th scope="col" class="right">15 Reps</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">2014-12-16 Di</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
<td class="right">0</td>
</tr>


<tr>
<td class="left">2014-12-23 Di</td>
<td class="right">4</td>
<td class="right">5</td>
<td class="right">5</td>
<td class="right">7.5</td>
<td class="right">4</td>
<td class="right">3</td>
</tr>


<tr>
<td class="left">2014-12-28 So</td>
<td class="right">4</td>
<td class="right">5</td>
<td class="right">5</td>
<td class="right">5</td>
<td class="right">4</td>
<td class="right">3</td>
</tr>
</tbody>
</table>

![img](img/reversefly2-r.png)

# Running<a id="sec-3" name="sec-3"></a>

    (run-table)

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="left" />

<col  class="right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="left">Date</th>
<th scope="col" class="right">Time</th>
</tr>
</thead>

<tbody>
<tr>
<td class="left">2014-07-20 So</td>
<td class="right">51:53</td>
</tr>


<tr>
<td class="left">2014-08-06 Mi</td>
<td class="right">50:02</td>
</tr>


<tr>
<td class="left">2014-12-23 Di</td>
<td class="right">48:08</td>
</tr>
</tbody>
</table>

![img](img/rungraph-r.png)