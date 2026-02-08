import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Txt extends StatelessWidget {
  String content;
  Color? color;
  double? size;
  double? spacing, wordSpacing;
  List<Shadow>? shadowList;
  FontWeight? weight;
  TextOverflow? overflow;
  int? maxLines;
  TextAlign? align;
  FontStyle? fontStyle;

  Txt(
    this.content, {
    super.key,
    this.color,
    this.size,
    this.spacing,
    this.wordSpacing,
    this.shadowList,
    this.weight,
    this.overflow,
    this.maxLines,
    this.align,
    this.fontStyle,
  }) {
    color ??= Colors.black;
    size ??= 16;
    spacing ??= 0;
    wordSpacing ??= 0;
    shadowList ??= [];
    weight ??= FontWeight.normal;
    overflow ??= TextOverflow.clip;
    maxLines ??= null;
    align ??= null;
    fontStyle ??= null;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      textAlign: align,
      maxLines: maxLines,
      style: GoogleFonts.comicNeue(
        // textStyle: TextStyle(overflow: overflow),
        color: color,
        fontSize: size,
        fontStyle: fontStyle,
        letterSpacing: spacing,
        wordSpacing: wordSpacing,
        shadows: shadowList,
        fontWeight: weight,
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  MyTextField({
    required this.controller,
    required this.label,
    super.key,
    this.obscureText,
    this.hint,
    this.maxLength,
    this.maxLines,
    this.height,
  }) {
    obscureText ??= false;
    maxLines ??= 1;
  }
  TextEditingController controller;
  String label;
  String? hint;
  bool? obscureText = false;
  int? maxLength, maxLines, height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (height != null) ? height!.toDouble() : 70,
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: TextField(
          maxLength: (maxLength != null) ? maxLength : null,
          maxLines: (maxLines != null) ? maxLines : null,
          controller: controller,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            letterSpacing: 2,
          ),
          obscureText: obscureText!,

          // decoration
          decoration: InputDecoration(
            hintText: ' $hint',
            hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
            label: Txt(
              ' $label ',
              size: 14,
              spacing: 2,
              color: const Color(0xFFf3f4ee),
              weight: FontWeight.bold,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFf3f4ee), width: 1),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFf3f4ee), width: 1),
            ),
          ),
        ),
      ),
    );
  }
}
