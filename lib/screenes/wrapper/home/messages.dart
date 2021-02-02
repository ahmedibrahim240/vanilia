import 'package:flutter/material.dart';
import 'package:vanillia/constants/constans.dart';
import 'package:vanillia/constants/themes.dart';
import 'package:vanillia/localization/language_constants.dart';
import 'package:vanillia/model/user.dart';
import 'package:vanillia/screenes/search.dart';
import 'package:vanillia/screenes/wrapper/home/chatroom.dart';
import 'package:vanillia/services/database.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  DatabaseServices _databaseServices = DatabaseServices();

  Stream chatRooms;
  Widget chatRoomsList() {
    return StreamBuilder(
      stream: chatRooms,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return RomosTile(
                chatRomId: snapshot.data.documents[index].data['chatroomId'],
                userName: snapshot.data.documents[index].data['chatroomId']
                    .toString()
                    .replaceAll('_', '')
                    .replaceAll(UserData.name, ''),
                userImage: snapshot.data.documents[index].data['userImage'],
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }

  @override
  void initState() {
    _databaseServices.getChatRome(UserData.name).then((val) {
      if (val != null) {
        setState(() {
          chatRooms = val;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: customColor,
        onPressed: () {
          showSearch(
            context: context,
            delegate: DataSearchUsers(),
          );
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (_) => UserSearch(),
          //   ),
          // );
        },
        child: Icon(Icons.search),
      ),
      appBar: customAppBar(
        Text(
          getTranslated(context, 'messages'),
          style: AppTheme.heading.copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: width,
        height: height,
        child: chatRoomsList(),
      ),
    );
  }
}

class RomosTile extends StatefulWidget {
  final String userName;
  final String chatRomId;
  final String userImage;

  const RomosTile(
      {Key key, this.userName, this.chatRomId, @required this.userImage})
      : super(key: key);
  @override
  _RomosTileState createState() => _RomosTileState();
}

class _RomosTileState extends State<RomosTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ChatRoom(
              title: widget.userName,
              chatRoomId: widget.chatRomId,
              userImage: widget.userImage,
            ),
          ),
        );
      },
      child: Card(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                widget.userName,
              ),
              SizedBox(width: 8),
              CircleAvatar(
                backgroundColor: customColor,
                maxRadius: 30,
                backgroundImage: NetworkImage(
                  widget.userImage,
                ),
              ),
              // Container(
              //   width: 40,
              //   height: 40,
              //   decoration: BoxDecoration(
              //     color: customColor,
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              //   child: Center(
              //     child: Text(
              //       widget.userName.substring(0, 1).toUpperCase(),
              //       style: AppTheme.heading.copyWith(
              //         color: Colors.white,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
// class Messages extends StatefulWidget {
//   @override
//   _MessagesState createState() => _MessagesState();
// }

// class _MessagesState extends State<Messages> {
//   List<Chat> items = List.of(Data.chats);
//   String _date = '12:55';

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: customAppBar(
//         Text(
//           getTranslated(context, 'messages'),
//           style: AppTheme.heading.copyWith(
//             color: Colors.white,
//           ),
//         ),
//         80,
//       ),
//       body: ListView(
//         shrinkWrap: true,
//         children: [
//           Column(
//             children: [
//               // CustomAppbar(
//               //   height: 50,
//               //   title: getTranslated(context, 'messages'),
//               //   width: 120,
//               // ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 5,
//                 ),
//                 child: Container(
//                   height: height,
//                   child: ListView.separated(
//                     itemCount: items.length,
//                     separatorBuilder: (context, index) => Divider(),
//                     itemBuilder: (context, index) {
//                       final item = items[index];

//                       return DismissibleWidget(
//                         item: item,
//                         child: buildListTile(item),
//                         onDismissed: (direction) =>
//                             dismissItem(context, index, direction),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   void dismissItem(
//       BuildContext context, int index, DismissDirection direction) {
//     setState(() {
//       items.removeAt(index);
//     });

//     switch (direction) {
//       case DismissDirection.endToStart:
//         Utils.showSnackBar(context, 'Chat has been deleted');
//         break;
//       default:
//         break;
//     }
//   }

//   Widget buildListTile(Chat item) => ListTile(
//         onTap: () {},
//         leading: CircleAvatar(
//           maxRadius: 30,
//           backgroundImage: AssetImage(item.imgUrl),
//         ),
//         title: Text(
//           'لوريم ايبسوم',
//           style: AppTheme.heading,
//         ),
//         subtitle: RichText(
//           text: TextSpan(
//             children: [
//               TextSpan(
//                 text: _date,
//                 style: AppTheme.heading.copyWith(fontSize: 10),
//               ),
//               TextSpan(
//                 text: 'pm',
//                 style: AppTheme.heading.copyWith(fontSize: 10),
//               ),
//               TextSpan(
//                 text: ' ',
//               ),
//               TextSpan(
//                 text: item.message,
//                 style: AppTheme.subHeading,
//               ),
//             ],
//           ),
//         ),
//       );
// }
