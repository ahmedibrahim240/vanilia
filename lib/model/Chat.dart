import 'package:meta/meta.dart';

class Chat {
  final String imgUrl;
  final String username;
  final String message;

  const Chat({
    @required this.imgUrl,
    @required this.username,
    @required this.message,
  });
}
