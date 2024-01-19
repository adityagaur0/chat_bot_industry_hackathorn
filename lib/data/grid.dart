
import 'package:chat_bot_industry_hackathorn/models/gribbuttonmodel.dart';
import 'package:flutter/material.dart';

const grid = [
  GridButtonModel(
      title: "Voice",
      text: "Try Voice \nRecognition",
      icon: Icon(
        Icons.mic_none_sharp,
        color: Colors.black,
      ),
      color: Color.fromARGB(255, 224, 238, 239)),
  GridButtonModel(
      title: "Image",
      text: "Search By \nImage",
      icon: Icon(
        Icons.image_outlined,
        color: Colors.black,
      ),
      color: Color.fromARGB(255, 246, 232, 253)),
  GridButtonModel(
      title: "View All",
      text: "Recently \nChat",
      icon: Icon(
        Icons.history,
        color: Colors.black,
      ),
      color: Color.fromARGB(255, 246, 232, 253)),
  GridButtonModel(
      title: "View All",
      text: "View All Our \nFeatures",
      icon: Icon(
        Icons.featured_play_list_outlined,
        color: Colors.black,
      ),
      color: Color.fromARGB(255, 224, 238, 239)),
];
