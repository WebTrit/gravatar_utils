enum QueryParameter {
  size('size', 's'),
  defaultImage('default', 'd'),
  forceDefault('forcedefault', 'f'),
  rating('rating', 'r'),
  callback('callback', 'callback');

  const QueryParameter(this.valueFull, this.valueShort);

  final String valueFull;
  final String valueShort;

  String value([bool full = false]) => full ? valueFull : valueShort;
}
