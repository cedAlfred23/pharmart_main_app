import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
 Future<Widget> login () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('user').toString();
    String? phoneNumber = prefs.getString('phoneNumber').toString();
                await ZIMKit().connectUser(
                  id: phoneNumber,
                  name: username);
                return const Text("data");
              }

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    login();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: login(),
        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return
            Scaffold(
              backgroundColor: Colors.white70,
          appBar: AppBar(
          actions: [
          IconButton(onPressed: ()=> ZIMKit().showDefaultNewPeerChatDialog(context), 
                    icon: const Icon(CupertinoIcons.person_crop_circle_fill_badge_plus, 
                    color: Colors.black, size: 30,))
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ZIMKitConversationListView(
        onPressed: ((context, conversation, defaultAction) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ZIMKitMessageListPage(
            conversationID: conversation.id, conversationType: conversation.type,)
          ));
        }),
      ),
    );
          } else {
            return const Scaffold(
              body: 
                  Center(child: CupertinoActivityIndicator(radius: 15,)),
            );
          }
        },
      ),
    );
}

}
