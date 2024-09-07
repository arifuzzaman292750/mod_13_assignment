import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var myAppBar = AppBar(
  title: Padding(
    padding: const EdgeInsets.only(left: 20.0),
    child: Text(
      'My Bag',
      style: GoogleFonts.prompt(
        fontSize: 36,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  backgroundColor: Colors.transparent,
);