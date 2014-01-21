Common Infrastructure
=====================

PHML as a specification relies upon other technologies. This section discussed them, in no particular order.

Unicode
-------

At the very heart of PHML is the [Unicode] standard – it defines a universal character encoding standard for written characters and text. Of particular importance to PHML is UTF-8, a variable-width encoding that can represent every character in the Unicode character set.

UTF-8 is the default encoding for PHML; this means that unless otherwise specified, tooling should assume UTF-8 when reading documents. Please refer to the [Encoding Standard] for more information on encoding and decoding byte streams.

[Unicode]: http://www.unicode.org/versions/latest/
[Encoding Standard]: http://encoding.spec.whatwg.org/

### Newlines

There are two kinds of line breaks: hard and soft. Hard line breaks define a position in the text where one line ends and the next one starts, unequivocally. Soft line breaks also define a position in the text where one line ends and the next one starts, but such a break may be ignored when certain circumstances apply.

PHML does not recognize any soft break characters in its syntax, and only specifies behavior for hard break characters. It is recommended that processors consider the [Unicode line breaking algorithm][UAX14] when processing soft break characters.

The following characters, or character sequences, should be recognized in PHML documents as hard breaks:

- LF, Line Feed           : U+000A
- CR, Carriage Return     : U+000D
- CR+LF                   : U+000D U+000A
- NEL, Next Line          : U+0085
- VT, Vertical Tab        : U+000B
- FF, Form Feed           : U+000C
- LS, Line Separator      : U+2028
- PS, Paragraph Separator : U+2029

The last character, PS, should be interpreted as a blank line. All others should be 

Except for PS, all breaks should be considered a line break, not a paragraph break.

[UAX14]: http://www.unicode.org/reports/tr14/

URL
---

PHML is designed to be a full featured hypermedia format. A key technology to support this is [URL], which is used to identify and locate resources.

[URL]: http://url.spec.whatwg.org/

URI Templates
-------------

In addition to [URL] technology, PHML supports the use of [URI templates] in some hypermedia controls. [URI templates] are a way to compactly describe a range of URLs, and can be used to implement some forms.

[URI templates]: http://tools.ietf.org/html/rfc6570

Markdown
--------

Because [Markdown] is essentially a subset of PHML, *almost* any content written in [Markdown] is compatible with PHML without modification. However, there exist some cases where [Markdown] content may not align fully with the PHML specification. This is more fully explored in the [compatibility] section of this specification.

[Markdown]:       daringfireball.net/projects/markdown/
[compatibility]:  compatibility.md