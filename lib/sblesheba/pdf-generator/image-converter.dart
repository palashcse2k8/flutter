
import 'dart:convert';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Widget getImageBase64(String image) {
  var imageBase64 = image;
  const Base64Codec base64 = Base64Codec();
  if (imageBase64 == null) {
    return  SizedBox(
    width: 120,
    height: 100,
    child: Text("No Photo"),
  );
  }
  var bytes = base64.decode(imageBase64);
  return Image(
    MemoryImage(bytes),
    width: 120,
    height: 100,
    fit: BoxFit.contain,
  );
}