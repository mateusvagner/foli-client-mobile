import 'package:flutter/material.dart';
import 'package:foli_client_mobile/design_system/foli_colors.dart';
import 'package:foli_client_mobile/design_system/foli_styles.dart';

class FoliText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const FoliText.headingOne(this.text, {Key? key})
      : style = foliHeading1Style,
        super(key: key);

  const FoliText.headingTwo(this.text, {Key? key})
      : style = foliHeading2Style,
        super(key: key);

  const FoliText.headingThree(this.text, {Key? key})
      : style = foliHeading3Style,
        super(key: key);

  const FoliText.headline(this.text, {Key? key})
      : style = foliHeadlineStyle,
        super(key: key);

  const FoliText.subheading(this.text, {Key? key})
      : style = foliSubheadingStyle,
        super(key: key);

  const FoliText.caption(this.text, {Key? key})
      : style = foliCaptionStyle,
        super(key: key);

  FoliText.body(this.text, {Key? key, Color color = foliGreyMediumColor})
      : style = foliBodyStyle.copyWith(color: color),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
