{
  function node(type, value, opts) {
    var n = { type: type }

    if (n.value !== value) {
      n.value = value
    }

    if (n.opts !== opts) {
       n.opts = opts
    }

    return n
  }

  function P(value) {
    return node('Paragraph', value)
  }

  function EM(value) {
    return node('Emphasis', value)
  }

  function WS(value) {
    return node('Whitespace', value)
  }

  function H(priority, value) {
    return node('H' + priority, value)
  }
}

Document
  = !Heading Blocks+ Section*
  / Section*

Section
  = Heading Blocks+

Heading
  = Setext
  / Atx

Setext
  = s:Phrasing+ EOL p:$('='+ / '-'+) EOL
    { return p.charAt(0) === '=' ? H(1, s) : H(2, s) }

Atx
  = p:$'#'+ NbSp* s:Phrasing EOL
    {
      var s = s.replace(/\s*#+$/, '')
        , p = Math.min(p.length, 6)

      return H(p, s)
    }

Blocks
  = Paragraph

Paragraph
  = s:(Phrasing+ EOL)+ EOL
    { return P(s.reduce(function(p, d) { return p.concat(d) }, [])) }

Phrasing
  = PhrasingElements
  / Text

PhrasingElements
  = Verbatim
  / Emphasis

Verbatim
  = '`' s:$((Esc '`' / !'`') Sp* Char)+ '`'
    { return node('Verbatim', s) }

Emphasis
  = '*' !Sp s:(Emphasis / $(!'*' Sp* Char)+) !Sp '*'
    { return EM(s) }
  / '_' !Sp s:(Emphasis / $(!'_' Sp* Char)+) !Sp '_'
    { return EM(s) }

Text
  = s:($NbSp* (PhrasingElements / Char))+
  {
    return s.reduce(function(s, c) {
      return s.concat(c)
    }, [])
  }

Char
  = $(!NbSp !Nl c:.)

Esc
  = '\\'

Bl
  = $(NbSp* Nl)

Sp
  = NbSp
  / Nl

NbSp
  = [ \t]

Nl
  = '\n'
  / '\r\n'

EOL
  = Bl
  / Nl
  / EOF

EOF
  = !.
    { return node('EOF') }