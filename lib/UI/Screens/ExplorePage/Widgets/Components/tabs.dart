import 'package:excelapp/UI/Themes/colors.dart';
import 'package:excelapp/UI/Themes/profile_themes.dart';
import 'package:flutter/material.dart';

class FilterTab extends StatefulWidget {
  final String text;
  final Function() onPressed;
  final bool isSelected;
  const FilterTab(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.isSelected = false})
      : super(key: key);

  @override
  State<FilterTab> createState() => _FilterTabState();
}

class _FilterTabState extends State<FilterTab> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: widget.isSelected ? primaryPink : Color(0xFF1C1F20),
            border: Border.all(color: ExcelTheme.aevaDark.withOpacity(0.1))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              widget.text,
              style: TextStyle(
                  fontFamily: "mulish",
                  fontSize: 12,
                  color: widget.isSelected ? Colors.black : Colors.white,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
