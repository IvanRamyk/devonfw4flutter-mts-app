import 'package:flutter/material.dart';
import 'package:my_thai_star_flutter/ui/shared_widgets/crop_image.dart';

class BookingFrom extends StatelessWidget {
  static const imageLocation = "assets/images/slider-1.jpg";

  const BookingFrom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CropImage(imageLocation: imageLocation,)
      ],
    );
  }
}