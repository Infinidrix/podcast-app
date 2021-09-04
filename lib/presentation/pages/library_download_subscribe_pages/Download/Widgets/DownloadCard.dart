import 'package:flutter/material.dart';

import '../../Constants.dart';

class DownloadCard extends StatefulWidget {
  const DownloadCard({Key? key}) : super(key: key);

  @override
  _DownloadCardState createState() => _DownloadCardState();
}

class _DownloadCardState extends State<DownloadCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[ Card(
        margin: EdgeInsets.all(0),
        child: Container(

          color: mainBackGroundColor,
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage:AssetImage('assets/images/placeholder.jpg'),
            ),
            title: Text('The thing Im getting over',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
            subtitle: Text('This American life',style: TextStyle(color:Color(0xffb3b3b3),fontSize:11,fontWeight: FontWeight.bold ),),
            trailing: CircularProgressIndicator(),
          ),
        ),
      ),],
    );
  }
}
