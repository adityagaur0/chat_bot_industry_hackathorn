
import 'package:chat_bot_industry_hackathorn/models/profile.dart';

class ChatModel {
  const ChatModel(
      {required this.proModel, required this.content, required this.who});

  final Profile proModel;
  final String content;
  final String who;
}
