import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'app_text.dart';



class SizeSelection extends StatefulWidget {

  @override
  _SizeSelectionState createState() => _SizeSelectionState();
}

class _SizeSelectionState extends State<SizeSelection> {
  String selectedSize = "L";

  final List<String> sizes = ["XS", "S", "M", "L", "XL"];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: sizes.map((size) {
        bool isSelected = selectedSize == size;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedSize = size;
            });
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: isSelected ? Colors.black : Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color:isSelected?Colors.black: Colors.grey),
            ),
            child: Center(
              child: CustomTextWidget(
                title:size,
                fontSize: 5.w,
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: isSelected? FontWeight.w600:FontWeight.w400,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
