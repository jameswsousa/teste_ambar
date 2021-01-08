import 'package:flutter/material.dart';
import 'package:teste_ambar/custom_loading_widget.dart';
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
        borderRadius: BorderRadius.circular(40),
      ),
      child: InkWell(
        onTap: () async {
          {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Container(
                      height: 300,
                      width: 300,
                      child: CustomLoadingWidget(),
                    ),
                  );
                });
            final url = repUrl;

            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch';
            }
            Navigator.pop(context);
          }
        },
        child: Row(
          children: <Widget>[
            Container(
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
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Text('Autor: $owner')
              ],
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(right: 5),
              alignment: Alignment.centerRight,
              child: Icon(Icons.arrow_forward_ios),
            ))
          ],
        ),
      ),
    );
  }
}
