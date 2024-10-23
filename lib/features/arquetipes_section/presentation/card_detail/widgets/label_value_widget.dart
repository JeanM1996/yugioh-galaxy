import 'package:flutter/material.dart';
import 'package:yugiohgalaxy/core/presentation/design/atoms/custom_text.dart';

//LabelValueWidget: class to show the label value widget of the arquetipe detail page
class LabelValueWidget extends StatelessWidget {
  const LabelValueWidget({
    required this.label,
    required this.value,
    super.key,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: CustomText(
              label,
              fontWeight: FontWeight.bold,
              textColor: Colors.black,
            ),
          ),
          Expanded(
            child: CustomText(
              value,
              textColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
