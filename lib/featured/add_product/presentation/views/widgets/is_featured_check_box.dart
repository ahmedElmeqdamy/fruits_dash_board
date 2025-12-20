import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/widgets/custom_check_box.dart';

class IsFeaturedCheckBox extends StatefulWidget {
  const IsFeaturedCheckBox({required this.onChanged, super.key});
  final ValueChanged<bool> onChanged;

  @override
  State<IsFeaturedCheckBox> createState() =>
      _IsFeaturedCheckBoxState();
}

class _IsFeaturedCheckBoxState extends State<IsFeaturedCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(3, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCheckBox(
            isChecked: isChecked,
            onChecked: (value) {
              isChecked = value;
              widget.onChanged(value);
              setState(() {});
            },
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Is Featured Item ',
                    style: AppStyles.regular13.copyWith(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
