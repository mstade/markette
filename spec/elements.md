Elements
========

There are two types of elements: blocks and inline. An element is either a block or an inline element, never both at the same time.

Inline elements are spans of text; most often contained within a block element such as a paragraph or a list, but may also be contained within other inline elements (such as nested [emphasis].)

[emphasis]: elements.md#emphasis

Block elements represent a semantic structure, such as a paragraph or a list. They are delimeted by block boundaries, which is often one or more of the following:

BL:
  One or more blank lines.

SB:
  Sibling block elements; i.e. other block level elements at the same indent level.

BB:
  The parent block boundary; i.e. the element is the first or last child of the parent block. If the parent is a sectioning root, this is equivalent to SRB.

SRB:
  The parent sectioning root boudnary; i.e. the element is the first or last child of the parent sectioning root.

Block boundaries may also be determined by other means, such as the existence of another element. (See #[header].)

Document Metadata
-----------------

TBD

Sectioning Elements
-------------------

### Header

Headers mark the start of and represents the name of a section. Headers are ranked, H1-H6, where a lower number means higher rank. The rank, or level, determines whether or not the new section is a subsection. A lower rank means the new section is a subsection to the current one; an equal or higher rank means the current section ends and a new one begins. Sections also ends where the sectioning root ends (e.g. the end of a document.)

Type: Block

Boundaries:
  Start: BL – or – SRB
  End: Heading of equal or higher rank – or – SRB

Categories:
  - [Sectioning content]
  - [Heading content]
  - [Flow content]

Attributes:
  - Should be used in [sectioning roots]
  - Should contain [phrasing content]

Syntax:
  There are three styles of header syntax. Common to all is that they must be preceded by a blank line (BL), or be the first line of the [sectioning root]. The [phrasing content] should be trimmed when parsed (stripped of any leading and trailing non-breaking whitespace.)

  Setext style syntax:
    Used to declare H1-H2 headers.

    A single line of [phrasing content]; followed by a single line of one or more `EQUALS SIGN (U+003d)` or `HYPHEN-MINUS (U+002d)` characters for H1 and H2 levels respectively; followed by a blank line.

    Examples:
      
      ```
      Example H1
      ==========

      Example H2
      ----------
      ```

  Atx style syntax:
    Used to declare H1-H6 headers.

    A single line starting with 1-6 `NUMBER SIGN (U+0023)` characters, indicating the header level (one character indicates H1, two characters indicates H2, and so on); followed by [phrasing content]; optionally followed by zero or more `NUMBER SIGN (U+0023)` characters (should be ignored when parsing.)

    Examples:

      ```
      # Example H1 ######

      ## Example H2 #####

      ### Example H3 ####

      #### Example H4 ###

      ##### Example H5 ##

      ###### Example H6 #
      ```

  Wiki style syntax:
    Used to declare H1-H6 headers. Syntax rules are identical to atx style, except for using `EQUALS SIGN (U+003d)` instead of `NUMBER SIGN (U+0023)`.

    Examples:

      ```
      = Example H1 ======

      == Example H2 =====

      === Example H3 ====

      ==== Example H4 ===

      ===== Example H5 ==

      ====== Example H6 =
      ```

### Block Quote

Block quotes represent a section of quoted text. The quote may or may not be attributed, and the attribution may or may not link to a source.

Type: Block

Boundaries:
  Start: BL – or – BB
  End: BL – or – BB

Categories:
  - [Sectioning content]
  - [Sectioning root]
  - [Flow content]

Attributes:
  - Should be used where [flow content] is expected
  - Should contain [flow content]

Syntax:
  Each block quote line starts with one `GREATER-THAN SIGN U+003E` character followed by one `SPACE U+0020` character; followed by [flow content].

  An attribution may optionally be added to the quote, in the form of a single #[paragraph], must be placed on a new line immediately after the block quote. Parsers should strip any leading `U+002d` characters; characters in the range `U+8208 - U+8212`; and non-breaking whitespace. Any [links] in the attribution with the [link relation] `source` should be considered sources of the quote.

  Examples:

    > Quotes are lovely little things to get wrong.

    > I love deadlines. I love the whooshing noise they make as they go by.
    – Douglas Adams

    > A word to the wise ain't necessary - it's the stupid ones that need the advice.
    – [Bill Cosby] (http://www.brainyquote.com/quotes/quotes/b/billcosby136816.html#x1MBWJE4AHe2yvWG.99 rel=source)

    > When you are courting a nice girl an hour seems like a second.
    > When you sit on a red-hot cinder a second seems like an hour. That's relativity.
    – Albert Einstein

Flow
----

### Paragraph

Paragraphs represent runs of text.

Type: Block

Boundaries:
  Start: BL – or – BB
  End: BL – or – BB

Categories:
  - [Flow content]

Attributes:
  - Should be used where [flow content] is expected
  - Should contain [phrasing content]

Syntax:
  Paragraphs do not have any explicit syntax. They are any block of text the is surrounded by either blank lines or is at the boundary of the parent block. Essentially any block of text that isn't a more specific element, is a paragraph.

### Definition

Definitions represent the meaning of a term. As such, it's the most primitive element to define the semantics of a string of text. The term being defined is not a unique identifier, and consequently can have multiple definitions. The definitions may be ambiguous or even contradictory; this specification makes no attempt to resolve such issues.

Multiple definitions after one another may be considered a definition list. A single definition may also be considered a definition list, with exactly one definition. Definitions may be nested, so long as the appropriate indentation levels are used.

Type: Block

Boundaries:
  Start: BL – or – BB
  End: SB – or – BB

Categories:
  - [Flow content]

Attributes:
  - Should be used where [flow content] is expected
  - Should contain [flow content]

Syntax:
  One or more lines of [phrasing content]; followed by zero or one [newline]; followed by one `COLON U+003a` character; followed by non-breaking whitespace – or – one [newline] character – or – one blank line; followed by [flow content]. All [flow content] on new lines that are part of the definition must have an increased [indent level].

  Examples:

    Definitions: may be on a single line.

    Definitions:
      May span multiple lines, and be defined multiple times.

    Definitions: 

      May have blank lines before its contents. Subsequent content may be any [flow content], including blank lines, so long as it has an increased indent level. The definition ends when the indent level decreases, or the parent block ends.

    Definitions
    : May have the `COLON U+003a` character at the start of a new line. Any [flow content] on this line should not be indented.

      But subsequent [flow content] should.

### Unordered List
### Ordered List
### Task List
### Verbatim
#### Code
### Table

Phrasing
--------

### Emphasis
### Quotes
### Verbatim
#### Code
### Tables

Hypermedia
----------

### Embed
### Links
### Queries
### Forms

[indent level]: syntax.md#indenting
[newline]: syntax.md#newline
[flow content]: semantics.md#flow
[sectioning content]: semantics.md#sectioning
[sectioning content]: semantics.md#sectioning-root
[heading content]: semantics.md#heading
[phrasing content]: semantics.md#phrasing
[metadata content]: semantics.md#metadata
[parsing]: syntax.md#parsing
[profiles]: profiles.md