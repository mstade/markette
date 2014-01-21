Introduction
============

[Markdown] has grown to be a de facto standard of [lightweight markup languages][lightmarkup]. However as a specification it is lacking in clarity, which leads to misinterpretations or ambiguities that can't be resolved. There is a reference implementation, but there is no comprehensive test suite meaning there are numerous conflicting implementations of [Markdown] tooling in the wild.

Markette aims to solve this by providing a (mostly) backwards compatible syntax, while removing ambiguities and providing comprehensive tests to ensure consistent interpretation of content.

[Markdown]: http://daringfireball.net/projects/markdown/
[lightmarkup]: http://en.wikipedia.org/wiki/Lightweight_markup_language

Goals
-----

- Obsolete the informal [Markdown] specification by providing a more comprehensive and formal specification based on popular contemporary implementations (e.g. [GFM].)

- Add additional syntactical primitives to the language to add support for commonly implemented features not included in [Markdown].

- Provide more comprehensive hypermedia support, ideally covering all the [H-factors].

- Do all this while not sacrificing readability and ease of authoring.

- Define a comprehensive test suite for implementors of parsers, authoring tools or other relevant software.

[gfm]: https://help.github.com/articles/github-flavored-markdown
[H-factors]: http://amundsen.com/hypermedia/hfactor/

Status of This Document
-----------------------

This is an unofficial draft and work in progress. There is no standards body behind this work, and as such is a fiat standard. It is the author's hope that it will prove valuable enough to eventually see widespread adoption and become a formal standard.

Conformance
-----------

All diagrams, examples, and notes in this specification are non-normative, as are all sections explicitly marked non-normative. Everything else in this specification is normative.

The key words "MUST", "MUST NOT", "REQUIRED", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in the normative parts of this specification are to be interpreted as described in [RFC2119]. For readability, these words do not appear in all uppercase letters in this specification.

Conformance requirements phrased as algorithms or specific steps may be implemented in any manner, so long as the end result is equivalent. (In particular, the algorithms defined in this specification are intended to be easy to follow, and not intended to be performant.)

[RFC2119]: http://tools.ietf.org/html/rfc2119

Terminology
-----------

Some terms used in this specification are defined in the [Encoding Standard].

Unicode code points are represented as a four-to-six digit hexadecimal number, typically prefixed with `U+`. In some instances, such as indexing, code points are prefixed with `0x`. Sequences of code points are separated by whitespace.

Whitespace plays a central role in documents and element syntax. Whenever this specification uses the term `non-breaking whitespace` (NBSP), characters that affect the [Unicode Bidirectional (BiDi) Algorithm][BiDi] as well as other zero-width non-breaking whitespace characters should be excluded from the set. Zero-width non-breaking whitespace (ZWNBSP) should only be included if explicitly noted.

Reader:

  Anyone reading Markette documents. The reader may be human or machine; a distinction isn't made in this specification unless explicity noted.

Writer:

  Anyone writing Markette documents. Like readers, a writer may be human or machine.

Processor:

  Software designed to work with Markette documents in some way; e.g. parsers and serializers.

[BiDi]: http://unicode.org/standard/reports/tr9/
[Encoding Standard]: http://encoding.spec.whatwg.org/