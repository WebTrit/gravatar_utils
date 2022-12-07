enum Rating {
  /// Suitable for display on all websites with any audience type.
  g('g'),

  /// May contain rude gestures, provocatively dressed individuals, the lesser swear words, or mild violence.
  pg('pg'),

  /// May contain such things as harsh profanity, intense violence, nudity, or hard drug use.
  r('r'),

  /// May contain hardcore sexual imagery or extremely disturbing violence.
  x('x');

  const Rating(this.value);

  final String value;
}
