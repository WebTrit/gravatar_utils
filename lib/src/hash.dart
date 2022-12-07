import 'dart:convert';

import 'package:crypto/crypto.dart' as crypto;

String reduce(String value) => value.trim().toLowerCase();

String md5(String value) => crypto.md5.convert(utf8.encode(value)).toString();
