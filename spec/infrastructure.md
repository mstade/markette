Common Infrastructure
=====================

PHML as a specification relies upon other technologies. In no particular order, this section discusses them

Unicode
-------

At the very heart of PHML is the [Unicode] standard – it defines a universal character encoding standard for written characters and text. Of particular importance to PHML is UTF-8, a variable-width encoding that can represent every character in the Unicode character set.

UTF-8 is the default encoding for PHML, and any tooling must support this as the default. Please refer to the [Encoding Standard] for more information on encoding and decoding byte streams.

[Unicode]: http://www.unicode.org/versions/latest/
[Encoding Standard]: http://encoding.spec.whatwg.org/

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

Because [Markdown] is essentially a subset of PHML, *almost* any content written in [Markdown] is compatible with PHML without modification. However, there exist some cases where [Markdown] content may not align fully with the PHML specification. This is because providing full [Markdown] compatibility is nigh impossible, since no canonical and unambigious specification exists.

For more information, please refer to the [compatibility] section.

[Markdown]:       daringfireball.net/projects/markdown/
[compatibility]:  compatibility.md