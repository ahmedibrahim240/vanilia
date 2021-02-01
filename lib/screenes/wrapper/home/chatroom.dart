import 'package:flutter/material.dart';
import 'package:vanillia/constants/constans.dart';
import 'package:vanillia/constants/themes.dart';
import 'package:vanillia/model/user.dart';
import 'package:vanillia/services/database.dart';

class ChatRoom extends StatefulWidget {
  final String title;
  final String chatRoomId;
  final String userImage;

  const ChatRoom(
      {Key key,
      @required this.title,
      @required this.chatRoomId,
      @required this.userImage})
      : super(key: key);
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  TextEditingController messageController = TextEditingController();
  DatabaseServices _databaseServices = DatabaseServices();

  Stream chatMessage;
  Widget chatMessageList() {
    return StreamBuilder(
      stream: chatMessage,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return MessageTile(
                message: snapshot.data.documents[index].data['message'],
                isSendByme: snapshot.data.documents[index].data['sendBy'] ==
                    UserData.name,
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }

  sendMessage() {
    if (messageController.text.isNotEmpty) {
      Map<String, dynamic> messageMap = {
        'message': messageController.text,
        'sendBy': UserData.name,
        'time': DateTime.now(),
      };
      _databaseServices.addConversationMessages(widget.chatRoomId, messageMap);
      messageController.text = '';
    }
  }

  @override
  void initState() {
    _databaseServices.getConversationMessages(widget.chatRoomId).then((val) {
      if (val != null) {
        setState(() {
          chatMessage = val;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: customAppBar(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: AppTheme.heading.copyWith(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(width: 5),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    widget.userImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        80,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: chatMessageList(),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: customColor,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: messageController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        errorStyle: AppTheme.subHeading.copyWith(
                          color: Colors.white,
                        ),
                        hintStyle: AppTheme.heading.copyWith(
                          fontSize: 10,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        isDense: true,
                        contentPadding: EdgeInsets.all(10),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: customColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: customColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      sendMessage();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black38,
                            Color(0x36ffffff),
                          ],
                        ),
                      ),
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageTile extends StatefulWidget {
  final String message;
  final bool isSendByme;

  const MessageTile({Key key, this.message, this.isSendByme}) : super(key: key);
  @override
  _MessageTileState createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      alignment:
          (widget.isSendByme) ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: (widget.isSendByme) ? customColor : Color(0xffff1f1f1),
            borderRadius: (widget.isSendByme)
                ? BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )
                : BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
        child: Text(
          widget.message,
          style: AppTheme.heading.copyWith(
            color: (widget.isSendByme) ? Colors.white : customColor,
          ),
        ),
      ),
    );
  }
}
