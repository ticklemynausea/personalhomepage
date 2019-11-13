---
layout: post
title: The Little Tree
date: '2014-04-16 15:31:42 +0100'
gallery:
    arvorezinhas:
    - title: N=4
      file: arvorezinha-n4.png
    - title: N=5
      file: arvorezinha-n5.png
    - title: N=9
      file: arvorezinha-n9.png
    - title: N=15
      file: arvorezinha-n15.png
    - title: N=30
      file: arvorezinha-n30.png
    - title: N=100
      file: arvorezinha-n100.png
    - title: N=500
      file: arvorezinha-n500.png
---

*Arvorezinha* (meaning little tree in Portuguese) is a *hello world*-like trivial program which goal is to print a sequence of the same character (usually **\***) in each line in increasing length. It can be used as an introduction to looping constructs in arbitrary programming languages. For example, for n = 5 an *Arvorezinha* program would print out:

```
*
**
***
****
*****
```

Yes, trivially boring. But still, it gets mildly interesting when you try to implement this in every language you can think of. This is what the guys at <a href="http://blol.org">blol.org</a> have been doing for the past few years, implementing <a href="http://blol.org/category/arvorezinha">*little trees* in almost every language</a> you can think of, from several assembly languages to SQL. Here's one that runs on the <a href="http://blol.org/544-arvorezinha-em-x86-20-boot-sector">boot sector of a x86 machine</a>.

The limited challenge this provides led to the creation of *Arvorezinha 2.0*, where the little tree is a bit more like a proper tree, with a trunk and everything. So, for n = 5, an *Arvorezinha 2.0* would look like:

```
    *
   ***
  *****
 *******
*********
  #####
  #####
```

My contribution is an *Arvorezinha 2.0* written in Oracle SQL:

```sql
select * from (
 select 'a'||lpad(level, 5,'0') as linha,
   rpad(' ', &height-level, ' ')||rpad('*', 2*level-1, '*')
     as arvorezinha
 from dual
 connect by level <= &height
 union
 select 't'||lpad(level, 5,'0') as linha,
   rpad(' ', ((2*&height-1)/4)+1, ' ')||rpad('#', (2*&height-1)/2, '#')
     as arvorezinha
 from dual
 where mod(&height, 2) = 0
 connect by level <= (&height/2)
 union
 select 't'||lpad(level, 5,'0') as linha,
   rpad(' ', ((2*&height-1)/4), ' '||rpad('#', (2*&height-1)/2+1, '#'))
     as arvorezinha
 from dual
 where mod(&height, 2) > 0
 connect by level <= (&height/2)
) order by linha asc;
```

This implementation uses 3 queries. One outputs the upper part (* character) and two others output the trunk (# character), each for when *height* is even and when it's odd. Basically it's a SQL version of the formulas present in the <a href="http://blol.org/1782-nova-arvorezinhas-1-0-e-2-0-em-perl">reference implementation</a>. Unfortunately, it depends on the *connect by level* clause which isn't part of MySQL or PostgreSQL. Here are some examples, for different values of the *height* parameter.

{% gallery arvorezinhas %}

Hope you enjoyed our little trees ;-)
