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
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xff4bdbbd),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(
            name,
          ),
          subtitle: Text(owner),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(avatar),
          ),
        ),
      ),
    );
  }
}
