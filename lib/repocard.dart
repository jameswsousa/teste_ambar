import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RepoCard extends StatelessWidget {
  final String name;
  final String owner;
  final String repUrl;
  final String avatar;

  const RepoCard(
      {@required this.name,
      @required this.owner,
      @required this.repUrl,
      @required this.avatar});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xff88e7d4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        onTap: () async {
          final url = repUrl;

          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch';
          }
        },
        title: Text(
          name,
        ),
        subtitle: Text(owner),
        leading: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xff187764), width: 2),
              borderRadius: BorderRadius.circular(40)),
          child: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
              avatar,
            ),
          ),
        ),
      ),
    );
  }
}
