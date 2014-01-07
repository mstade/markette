Features
========

Readability; ease of authoring.

Intuitive syntax.

Subset compatible with GitHub Flavored Markdown ([GFM]). Some features, such as extended link attributes, will likely not work together with GFM.

[gfm]: https://help.github.com/articles/github-flavored-markdown

Small set of content primitives:
- Sectioning
 - Headers
- Paragraphs
  - Phrasing content; e.g. emphasis, strong emphasis
- Verbatim
  - Inline and block (e.g. code fences)
- Metadata
  - Profiles (macro and micro data; must be a URL or IANA registered profile)
  - Custom metadata; key-value pairs
- Hypermedia affordances, a.k.a. [H-factors][]
  - Links
    - Out-bound navigational (i.e. anchors; LO)
    - Embedded (e.g. images or scripts; LE)
  - Forms
    - Templated queries (i.e. URL templates; LT)
  - Control data (CR, CL)

Consider supporting non-GET hypermedia affordances, such as:
  - Non-idempotent links/forms (implies POST)
  - Idempotent links/forms (implies PUT, DELETE)
  - Additional control data (CU, CM)

[H-factors]: http://amundsen.com/hypermedia/hfactor/

Whitespace
==========

Whitespace is important in documents, and has different meaning depending on the type of whitespace. For instance, non-breaking spaces in paragraphs should collapse, such that in a parser only one non-breaking space is recognized even if multiple such characters are encountered consequtively.

Whitespace can also behave differently in different language constructs. For instance in list items, non-breaking spaces at the beginning of a line are ignored altogether.


Content Models
==============

The contents of a document can be categorized 

Metadata
--------

The first block of the document is considered metadata, if the first word is immediately followed by a colon character. Each line beginning with a word and a colon character is considered a new run of metadata. The text to the left of the colon is considered the metadata key, and must not contain spaces. the text to the right of the colon is considered the metadata value, and may contain spaces. If there are multiple words to the metadata value it's considered a list. The block ends with two or more consecutive new lines.

Example:

```ptml
Key: value
Key: list
     of
     values
Key:
  value
```

Sectioning
----------

Sectioning in a document is implicitly defined by top level headers. Any content following a top level heading should be considered a single section, until the end of the document or another top level heading is encountered. A top level heading is defined as the first heading encountered that is equal to or stronger than the current heading level; if no such heading level is defined (i.e. no headers encountered yet) then the first heading encountered will create a new section, regardless of level.

Examples:

```
Section-less content is defined as content that has not been preceded by any headers at all.

Section 1
=========

This paragraph belongs to section 1.

Section 2
=========

This paragraph is preceded by a header of the same level as [Section 1]; thus, this content belongs to a new and independent section.

Not a section
-------------

Because this paragraph is preceded by a heading that has a lower level than [Section 2], it does not create a new section.
```


Document outline
================

```ptml
Profiles: http://github.com/mstade/ptml-man-profile
Key: value
Key: value1
     value2

Header
======

This is a paragraph. Lorem ipsum dolor sit amet.

This is another paragraph. A paragraph is a block of text. Blocks are
separated by newline characters.

- This is a bullet list
- It is prepended with a dash (a.k.a. minus) character
- It must be dash, asterisk or plus used for each item
+ Consistency is recommended, but not required
```

