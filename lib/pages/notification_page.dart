import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  final String location = 'https://www.google.co.th/maps/place/VIVE+Rama+9/@13.739808,100.6686553,17z/data=!3m1!4b1!4m6!3m5!1s0x311d612c2d668d5d:0x9b0a791f784f97cd!8m2!3d13.739808!4d100.6686553!16s%2Fg%2F11kj6r412b?hl=th&entry=ttu';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Linkify(
          onOpen: _onOpen,
          text:
          "Made by https://cretezy.com\n\nMail: example@gmail.com\n\n${location}\n\nhttps://www.google.co.th/maps/place/VIVE+Rama+9/@13.739808,100.6686553,17z/data=!3m1!4b1!4m6!3m5!1s0x311d612c2d668d5d:0x9b0a791f784f97cd!8m2!3d13.739808!4d100.6686553!16s%2Fg%2F11kj6r412b?hl=th&entry=ttu",
        ),
      ],
    );
  }

  Future<void> _onOpen(LinkableElement link) async {
    if (!await launchUrl(Uri.parse(link.url))) {
      throw Exception('Could not launch ${link.url}');
    }
  }
}
