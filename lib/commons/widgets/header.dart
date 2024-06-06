import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

header(String text, [double? padLeft]) => Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: padLeft ?? 10.0,
          vertical: 10,
        ),
        child: Text(
          text,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
