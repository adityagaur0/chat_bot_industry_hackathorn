import 'package:chat_bot_industry_hackathorn/data/chat_dummy_data.dart';
import 'package:chat_bot_industry_hackathorn/data/profile_data.dart';
import 'package:chat_bot_industry_hackathorn/models/chat.dart';
import 'package:chat_bot_industry_hackathorn/widgets/chat_widget.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isLoading = false;
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
  }

  @override
  void dispose() {
    dialogFlowtter.dispose();
    super.dispose();
  }

  void MicPressed() {
    setState(() {
      _isPressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 80,
                width: 450,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    color: Colors.black),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 2, 10),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 37,
                        backgroundImage: AssetImage(pro[0].imagePath),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "${pro[0].name}\nWelcome",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.ios_share_rounded,
                          color: Colors.white,
                          size: 35,
                        ),
                        onPressed: () {
                          setState(() {
                            messages.clear();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 550,
              child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ChatWidget(
                      imagePath: messages[index]['isUserMessage']
                          ? "assets/image/profile.jpeg"
                          : "assets/animations/Animation - 1705269725767.json",
                      content: messages[index]['message'].text.text[0],
                      who: messages[index]['isUserMessage'] ? 'You' : 'ai',
                    );
                  }),
            ),
            _isPressed
                ? TextButton(
                    onPressed: () => {
                      setState(() {
                        _isPressed = false;
                      })
                    },
                    child: Lottie.asset(
                      "assets/animations/mic1.json",
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(40)),
                              border: Border.all(color: Colors.black)),
                          height: 60,
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _controller,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Enter Your Text... ",
                                  suffixIcon: IconButton(
                                    onPressed: () => {
                                      sendMessage(_controller.text),
                                      _controller.clear(),
                                    },
                                    icon: const Icon(
                                      Icons.send_sharp,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: MicPressed,
                        icon: const Icon(
                          Icons.mic,
                          color: Colors.black,
                          size: 40,
                        ),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
        isLoading = true;
      });

      try {
        DetectIntentResponse response = await dialogFlowtter.detectIntent(
            queryInput: QueryInput(text: TextInput(text: text)));

        if (response.message != null) {
          setState(() {
            addMessage(response.message!);
          });
        }
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}
