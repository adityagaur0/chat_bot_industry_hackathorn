import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget(
      {super.key,
      required this.imagePath,
      required this.content,
      required this.who});
  final String imagePath;
  final String content;
  final String who;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        Positioned(
          top: 20,
          bottom: 20,
          child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.transparent,
              child: who == "ai"
                  ? Lottie.asset(imagePath)
                  : CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(imagePath),
                    )),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Container(
            // height: ,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.black)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                content,
                textAlign: TextAlign.left,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
