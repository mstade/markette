Compatibility
============

One of the goals of Markette is to obsolete [Markdown], by providing backwards compatibility with [Markdown] wherever possible. There exists some situations however, where ambiguities or flaws of [Markdown] cause problems. In this case, Markette draws a line in the sand, adhering to the [principle of least surprise][POLS]. This means issues are resolved in an unambiguous and intuitive manner.

This section is dedicated to documenting these issues and how Markette resolves them.

[Markdown]: daringfireball.net/projects/markdown/
[POLS]: http://en.wikipedia.org/wiki/Principle_of_least_astonishment

Newlines
--------

[Markdown] declares that in order to force a line break, a line must end with two or more [whitespace characters] and a single line feed (U+000a). This means that any line that just ends with a single line feed (U+000a) should not be considered a hard line break. This is unintuitive since in the original plain text source is in fact a hard line break, but a parser should ignore it.

For example, the following text in [Markdown] should be considered a single run of text with no line breaks:

```
Roses are red,   
Violets are blue.
```

In Markette, the line break is recognized as intentional and tooling must respect it.

Emphasis
--------

[Markdown] defines emphasis as text surrounded by asterisks (U+002a) or underscores (U+005f), as shown in this example:

```
They were talking *during* the movie.
They were talking _during_ the movie.
```

[Markdown] also supports strong emphasis by using double asterisks or double underscores:

```
It is **very important** to not talk during the movie.
It is __very important__ to not talk during the movie.
```

Additionally, [Markdown] supports intra-word emphasis; i.e. emphasis in the middle of a word. The following is an example of this:

```
They were talking during the movie? Un*frigging* believable.
They were talking during the movie? Un_frigging_ believable.
```

There may well exist reasons why one would like to put emphasis in the middle of a word – dramatic effect in prose, for instance. However, it doesn't read well and it introduces ambiguities when dealing with text that makes legitimate use of these characters. Therefore, Markette does *not* support intra-word emphasis. For more information, please refer to the documentation on [emphasis].

[emphasis]: elements.md#emphasis

Verbatim Text
-------------

[Markdown] has syntax for pre-formatted code blocks, which is indented by four space (U+0020) characters or one tab (U+0009) character. It also has support for pre-formatted code inline, which is defined as text wrapped by backtick (U+0060) characters.

However, this syntax introduces some awkward ambiguities. For instance, consider a list with a code sample:

```
1. Squaring numbers in JavaScript:

    [1, 2, 3, 4].map(function(n) { return n * n })

2. Some other list item.
```

In this example, [Markdown] would correctly consider the code block to be part of the first list item. However, it wouldn't recognize it as code, but rather as normal text. In order to be correctly recognized as code, it would have to be indented *twice*.

Markette resolves this by only recognizing [Markdown] pre-formatted code blocks at a non-indented level. This means that any block of text that is considered part of a list or other non-sectioning content, should not be considered verbatim. The aforementioned example will actually be parsed just as in [Markdown] – as a regular paragraph. Markette supports verbatim blocks just like [Markdown], by prefixing four space (U+0020) characters or one tab (U+0009) character; however, that syntax is not recommended. Instead, Markette supports the use of a "fenced" block using three backtick (U+0060) characters.

Another important distinction between Markette and [Markdown] is that Markette does not automatically assume that text is code. For more information, please refer to the [verbatim] documentation.

[verbatim]: elements.md#verbatim

HTML
----

[Markdown] supports HTML, in that any HTML blocks should be preserved as-is. Markette does *not* support the use of HTML.