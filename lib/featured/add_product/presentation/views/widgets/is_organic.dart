import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/widgets/custom_check_box.dart';

class IsOrganic extends StatefulWidget {
  const IsOrganic({required this.onChanged, super.key});

  final ValueChanged<bool> onChanged;

  @override
  State<IsOrganic> createState() => _IsFeaturedCheckBoxState();
}

class _IsFeaturedCheckBoxState extends State<IsOrganic> {
  bool isOrganic = false;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(3, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCheckBox(
            isChecked: isOrganic,
            onChecked: (value) {
              isOrganic = value;
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
                    text: 'Is Organic ',
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
