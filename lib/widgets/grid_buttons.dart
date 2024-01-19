
import 'package:chat_bot_industry_hackathorn/models/gribbuttonmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridButton extends StatelessWidget {
  const GridButton({super.key, required this.obj});

  final GridButtonModel obj;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 90,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          border: Border.all(color: Colors.black),
          color: obj.color),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.black87,
                  child: CircleAvatar(
                    backgroundColor: const Color(0xffE6E6E6),
                    child: IconButton(
                      onPressed: null,
                      icon: obj.icon,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  obj.title,
                  style: GoogleFonts.poppins(
                      fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  obj.text,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(
                      fontSize: 15, fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                const IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.arrow_circle_right_rounded,
                      color: Colors.black,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
