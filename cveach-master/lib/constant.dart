import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kPurple = Color(0xFF6F51FF);
const kYellow = Color(0xFFFFAD03);
const kGreen = Color(0xFF22B274);
const kPink = Color(0xFFEB1E79);
const kIndigo = Color(0xFF000A45);
const kBlack = Color(0xFF4C4C4C);
const kGrey = Color(0xFFACACAC);

var kTitleStyle = GoogleFonts.roboto(
  color: kBlack,
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
);
var kTitleStyle2 = GoogleFonts.pacifico(
  color: Colors.red,
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
);
var kSubtitleStyle = GoogleFonts.roboto(
  color: kGrey,
  fontSize: 14.0,
);
var kTitleItem = GoogleFonts.roboto(
  color: kBlack,
  fontSize: 15.0,
  fontWeight: FontWeight.bold,
);
var kSubtitleItem = GoogleFonts.roboto(
  color: kGrey,
  fontSize: 12.0,
);
var kHintStyle = GoogleFonts.roboto(
  color: kGrey,
  fontSize: 12.0,
);
const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);
const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
