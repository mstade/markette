Syntax
======

Whitespace
----------

Whitespace plays a central role in documents and element syntax. Whenever this specification uses the term `non-breaking whitespace` (NBSP), characters that affect the [Unicode Bidirectional (BiDi) Algorithm][BiDi] as well as other zero-width non-breaking whitespace characters should be excluded from the set. Zero-width non-breaking whitespace (ZWNBSP) should only be included if explicitly noted.

[BiDi]: http://unicode.org/standard/reports/tr9/

### Line Breaks

There are two kinds of line breaks: hard and soft. Hard line breaks define a position in the text where one line ends and the next one starts, unequivocally. Soft line breaks define a position where there is an opportunity to introduce a line break, according to some predefined rules.

PHML does *not* define any soft break rules or syntax, and it is recommended that processors use the [Unicode line breaking algorithm][UAX14] as reference for implementing soft breaks.

Processors should recognize the following characters, or character sequences, as hard breaks:

- LF   (Line Feed)           : U+000A
- CR   (Carriage Return)     : U+000D
- CRLF                       : U+000D U+000A
- NEL  (Next Line)           : U+0085
- VT   (Vertical Tab)        : U+000B
- FF   (Form Feed)           : U+000C
- LS   (Line Separator)      : U+2028
- PS   (Paragraph Separator) : U+2029

[UAX14]: http://www.unicode.org/reports/tr14/

### Newline

The `LF`, `CR`, `CRLF`, `NEL`, `VT`, `FF` and `LS` characters are all line separators; that is, they indicate where hard line breaks should occur. These characters are commonly referred to as newlines (NL) in this specification.

### Blank Line

A sequence of two or more newlines, with optional whitespace in-between, should be interpreted as a single blank line (BL).

The `PS` character is a paragraph separator; that is in addition to being a hard line break, it also indicates the end of a paragraph and the beginning of the next. `PS` should be interpreted as semantically equivalent to blank lines.

Processors should follow the [Unicode recommendations][UAX14] when deciding whether to preserve LS or PS in serialized documents.

[block]: elements.md#block-elements
[inline]: elements.md#inline-elements

### Indenting

Indenting in PHML should be done using `SPACE U+0020` characters, and an indent level should be two `SPACE U+0020` characters. All non-breaking whitespace characters at the start of a line should be converted into `SPACE U+0020` characters; except for `HORIZONTAL TABULATION U+0009` characters which should be converted into two `SPACE U+0020` characters.

The indentation level is determined by counting all non-breaking whitespace characters at the start of a line; dividing the count by two; and rounding the result downwards to the nearest integer.

Serializing
-----------

Parsing
-------

### Grammar

### AST

An AST, short for `Abstract Syntax Tree` and sometimes known just as `syntax tree`, is a tree representation of the syntactical structure of text.