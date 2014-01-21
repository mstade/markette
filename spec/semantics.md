wSemantics & Structure
=====================

All elements have some sort of predefined meaning. A list for example, describes the semantics of a sequence of items; an ordered list expands on this concept by stating that the sequence order matters. This kind of semantics is called lexical semantics; it is the study of what the words (i.e. elements) of a language mean.

Another kind of semantics is structural semantics. It is the study of how meaning can be composed from smaller elements. That is to say, the structure formed by the combination of elements also has meaning.

This specification only defines element semantics; however, it is recommended that authors use [profiles] to describe the semantics of their documents.

[profiles]: profiles.md


Internationalization & Bidirectional Content
--------------------------------------------

The Markette syntax is designed to be language neutral. This means that it should be possible to author documents in any language, and processors should still be able to parse them. Documents where the character encoding is unicode should conform to the [Unicode BiDi Algorithm][BiDi].

[BiDi]: http://unicode.org/standard/reports/tr9/

Documents
---------

Any stream of bytes that can be interpreted as text is a valid Markette document.

Processors may choose any method they see fit to internally represent a document, such as a [DOM], but are required to preserve all of the document's semantics. As well, processors may use whatever valid Markette syntax they like when [serializing] documents, but must preserve the semantics when doing so.

[DOM]: http://dom.spec.whatwg.org/
[serializing]: syntax.md#serializing

Content Models
--------------

All elements has a content model that describes what it is. The content model also defines what, if any, content it may contain. This provides readers with an expectation of what the content is and what may come next.

Elements has at least one content model, but may have more.

### Metadata

Metadata content provides information about other content. It may describe structural semantics, i.e. [profiles] are a kind of metadata; provide information on the relationship between elements or documents; or provide other useful information.

All metadata is optional. The absence or presence of metadata will in most (if not all) cases alter the semantics of the document, but has no effect on whether the document is syntactically valid.

Readers should always take care to inspect the metadata of a document.

### Flow

All content in a document, except pure metadata, is considered flow content. That is, the content contributes to the flow of the document.

### Whitespace

Whitespace content is a special category of content, in that they are characters that are invisible to human readers, but may define additional semantics useful to processors. [Unicode BiDi control characters][BiDi] for instance are invisible to human readers but very important to processors; they help determine how text should be rendered.

### Sectioning

Sectioning content defines the scope of other content. The scope typically groups together thematically related content, but the exact scope semantics is defined by the element. Sectioning content determines the [document outline].

### Sectioning Root

Some sections are sectioning roots, meaning they define their own outline without adding to the parent outline. The default sectioning root of all elements is the document.

[document outline]: #document-outline

### Heading

Heading content is used to name sections. In case a header element is the first element in a sectioning root, it defines the name of the root itself. Otherwise, it implicitly defines the start of a new section.

Heading content affect the [document outline]. [Profiles] may take advantage of section names in order to define additional semantics.

### Phrasing

Phrasing content are runs of text, that together form the contents of flow elements. Phrasing content that isn't recognized as an element is just plain text with undefined semantics. [Profiles] may be used to define the semantics of such text.

### Hypermedia

Hypermedia content define links between content. Hypermedia elements support one or more [H Factors], which helps describe the capabilities of an element.

Hypermedia is very useful. It can be used to link to footnotes, embed images in documents, or provide important clues to document processors.

[H Factors]: http://amundsen.com/hypermedia/hfactor/

Document Outline
----------------

All documents form an outline. The outline is a representation of a document's sectioning structure; not unlike a table of contents.

TBD: Describe outlining algorithm.