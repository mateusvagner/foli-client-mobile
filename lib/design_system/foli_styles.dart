import 'package:flutter/material.dart';

import 'foli_colors.dart';

// Text Styles

const TextStyle foliHeading1Style = TextStyle(
  fontSize: 34,
  fontWeight: FontWeight.w300
);

const TextStyle foliHeading2Style = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600
);

const TextStyle foliHeading3Style = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600
);

const TextStyle foliHeadlineStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700
);

const TextStyle foliBodyStyle = TextStyle(
fontSize: 16,
fontWeight: FontWeight.w400,
);

const TextStyle foliSubheadingStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w400,
);

const TextStyle foliCaptionStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,
);

// Decorations

InputDecoration foliInputDecoration(String label) {
  return InputDecoration(
    labelText: label,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ).copyWith(
      borderSide: const BorderSide(color: foliGreyLightColor),
    ),
  );
}
