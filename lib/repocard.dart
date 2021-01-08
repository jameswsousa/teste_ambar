import 'package:flutter/material.dart';

class RepoCard extends StatelessWidget {
  final String name;
  final String owner;
  final String url;
  final String avatar;

  const RepoCard(
      {@required this.name,
      @required this.owner,
      // @required
      this.url,
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
        onTap: () {},
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
