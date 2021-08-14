import 'package:podcast_app/presentation/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class ChannelDetailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( 
        color: Colors.black, 
        child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: IconButton(onPressed: (){context.router.pop();}, icon: Icon(Icons.arrow_back_ios)),
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Channel"),
              background: FlutterLogo(),
              stretchModes: [StretchMode.zoomBackground, StretchMode.fadeTitle],
              collapseMode: CollapseMode.parallax
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(
              child: Column(children: [
                Row(
                  children: [
                    Expanded(child: 
                      Padding( 
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top:5.0, bottom: 5.0),
                              child: Text("1,227,453 monthly listeners", style: TextStyle(fontSize: 14.0, color: Colors.grey),),
                            ),
                            ElevatedButton(
                              onPressed: (){}, 
                              child: Text("Unsubscribe"),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black),
                                shape: 
                                  MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                  ),
                                
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: (){}, 
                      child: Icon(Icons.play_arrow, color: Colors.white,),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue),
                        shape: 
                          MaterialStateProperty.all(
                            CircleBorder(),
                          ),
                        minimumSize: MaterialStateProperty.all(Size.fromRadius(24.0)),
                        ),
                      )
                  ],
                )
              ],),
              ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              child: Text("Podcasts", style: TextStyle(fontSize: 21),),
              ),
          ),
          SliverFixedExtentList(
              
              itemExtent: 90.0,
              
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {context.router.push(CreateChannelRoute());},
                    child: Card(
                      color: Colors.black,
                      child: Row(
                      
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0), 
                            child: Text("$index"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 17.0),
                            child: FlutterLogo(size: 35.0,),
                          ),
                          Expanded(child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Awake", style: TextStyle(fontSize: 19.0),),
                              Padding(padding: EdgeInsets.only(bottom: 4.0)),
                              Text("23,342,322", style: TextStyle(fontSize: 10.0, color: Colors.grey),),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          )),
                          PopupMenuButton(
                            itemBuilder: (c) => <PopupMenuEntry<Object?>>[],)
                        ],
                    )
                    )
                  );
                },
                childCount: 20,
              ),
            ),

        ],
      )
    ));
  }
  
}