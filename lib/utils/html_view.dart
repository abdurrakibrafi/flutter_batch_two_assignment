import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class HTMLView extends StatelessWidget {
  final String htmlData;

  const HTMLView({super.key, required this.htmlData});

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      htmlData,
      textStyle: const TextStyle(fontSize: 14),
    );
  }
}
