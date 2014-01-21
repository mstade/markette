Profiles
========

Document Profiles
-----------------

For example, the document may link to a profile describing book semantics. This profile might tell us that if the book includes a section named `Preface` before the first chapter, then that section is the book's introduction. The profile might also define that any section that starts with the text `Chapter` followed by a numeral of some sort, denotes the start of a new chapter.

Another example is a screenplay profile; it might define that any section name that starts with `INT` or `EXT` defines a new scene.


```
- Sugar
- Butter
- Eggs
- Flour
- Milk
- Cream
- Strawberry jam
- Strawberries
- Vanilla
- Baking soda
```

This looks an awful lot like a list of ingredients, but could just as well be a shopping list, or any other kind of list for that matter. The document doesn't contain enough information to explain the meaning of the list – it's just a list of items.

Now, let's say the list is preceeded by a [definition]:

```
Ingredients:
```

The two elements together forms a semantic structure – it's a list of ingredients! We still don't know what the ingredients are for, however. Let's add a [header] before the definition:

```
Strawberry Cake
===============
```

Now we know the name of the document [section] that includes the list of ingredients, and from that we can tell that the ingredients are for a strawberry cake. This is what the full document looks like:

```
Strawberry Cake
===============

Ingredients:

  - Sugar
  - Butter
  - Eggs
  - Flour
  - Milk
  - Cream
  - Strawberry jam
  - Strawberries
  - Vanilla
  - Baking soda
```

Using only three elements ([header], [definition] and [list]) we're able to describe the ingredients of a strawberry cake. A human reader with an understanding of english and baking will be able to infer a lot from this simple structure.

Because these elements have well defined semantics, the document may be used in ways the author hadn't imagined. For example, a text-to-speech program that understands the syntax might not understand what a cake is, but it will still happily read the ingredients out loud.

Let's say someone invents a cake baking machine that understands documents that have the following structure:

- Section
  + `Ingredients` definition
    * List

Now let's say you feed it this document:

```
Martinez Cocktail
=================

Ingredients:

  - Gin
  - Sweet Vermouth
  - Maraschino Liqueur
  - Bitters
  - Lemon Twist
```

It might be a really well built cake baking machine, but it's doubtful that it's going to make a very good cake from those ingredients. To solve this, the document could link to a [profile]; a kind of meta document that explains how to read the document that links to it. This way, based on the profiles a document links to, the cake baking machine can decide on its own whether it can understand a document or not.

Authors aren't required to link documents to profiles, but it is recommended. Profiles are a great way to explain the structural semantics of a document and how to read it. However, they can't redefine any of the elements or the semantics described in this specification. So regardless of what profiles a document might link to, that text-to-speech program will still be able to read it.

Microdata
---------

Vocabularies
------------