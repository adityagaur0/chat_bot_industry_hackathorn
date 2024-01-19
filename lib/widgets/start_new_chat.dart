import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartNewChatButton extends StatelessWidget {
  const StartNewChatButton({super.key, required this.func});
  final void Function() func;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 5.5,
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Colors.black),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const CircleAvatar(
            backgroundColor: Color.fromARGB(255, 173, 230, 187),
            child: Icon(
              Icons.chat_outlined,
              color: Colors.black,
            ),
          ),
          Text(
            "Start New Chat",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          SizedBox(
            width: 350,
            height: 50,
            child: ElevatedButton(
              onPressed: func,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                    255, 173, 230, 187), // Set your desired background color
                alignment: Alignment.center,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
                child: Row(
                  children: [
                    Text(
                      "Start New Chat",
                      style: GoogleFonts.poppins(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_forward_sharp,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
