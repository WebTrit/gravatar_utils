enum DefaultImage {
  fileNotFound('404'),
  mp('mp'),
  identicon('identicon'),
  monsterid('monsterid'),
  wavatar('wavatar'),
  retro('retro'),
  robohash('robohash'),
  blank('blank');

  const DefaultImage(this.value);

  final String value;
}
