
import 'package:chat_bot_industry_hackathorn/data/grid.dart';
import 'package:chat_bot_industry_hackathorn/data/profile_data.dart';
import 'package:chat_bot_industry_hackathorn/screens%20/chat_screen.dart';
import 'package:chat_bot_industry_hackathorn/widgets/grid_buttons.dart';
import 'package:chat_bot_industry_hackathorn/widgets/start_new_chat.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(6.5),
            child: CircleAvatar(
              radius: 22,
              backgroundColor: Colors.black,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 20,
                backgroundImage: AssetImage(pro[0].imagePath),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              pro[0].name,
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(7.0),
            child: CircleAvatar(
              radius: 21,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Center(
                  child: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.menu_rounded,
                        color: Colors.black,
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(children: [
        Lottie.asset('assets/animations/Animation - 1705269725767.json'),
        // Replace with your Lottie animation path

        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // end  of menu button  code-------------------------------------------------------------------------

              //------------------------------------------------------------------------------------------------------

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "What can i do to help you?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 40, fontWeight: FontWeight.w700),
                ),
              ),
              //------------------------------------------------------------------------------------------------------
              // start  of Grid View   code-------------------------------------------------------------------------

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2.0,
                    children: List.generate(grid.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridButton(obj: grid[index]),
                      );
                    }),
                  ),
                ),
              ),
              StartNewChatButton(func: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatScreen()),
                );
              }),
              const SizedBox(
                height: 80,
              )
            ],
          ),
        ),
      ]),
    );
  }
}
