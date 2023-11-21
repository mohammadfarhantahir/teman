

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../bottom-nav-bar/screen/bottom-nav-bar.dart';

class AssistantScreen extends StatefulWidget{
  State<AssistantScreen> createState()=> AssistantScreenState();
}
class AssistantScreenState extends State<AssistantScreen>{


  List<String> _data = [
    'Alice',
    'Bob',
    'Charlie',
    'David',
    'Ella',
    'Frank',
    'Grace',
    'Henry',
    'Ivy',
    'Jack',
    'Katherine',
    'Leo',
  ];

  List<String> _filteredData = [];

  @override
  void initState() {
    _filteredData = _data;
    super.initState();
  }

  void _filterData(String query) {
    setState(() {
      _filteredData = _data.where((element) {
        return element.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child:Scaffold(
          appBar: AppBar(
            elevation: 0,
             backgroundColor: Colors.white,
            // automaticallyImplyLeading: false,
            iconTheme: IconThemeData(color: Colors.black), // Set the leading icon color

          ),
          body: CachedNetworkImage(
              imageUrl: "https://raptorassistant.com/teman/assets/assistant-information/assitant-background.png",
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    //  colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                  ),
                ),
                child:  Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        onChanged: _filterData,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _filteredData.length,
                        itemBuilder: (context, index) {
                          return CardWidgetAssistant(name: _filteredData[index]);
                        },
                      ),
                    ),
                  ],
                ),

              ),
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),


          bottomNavigationBar: BottomNavbar(),
        )
    );
  }
  
}


class CardWidgetAssistant extends StatelessWidget {
  final String name;

  CardWidgetAssistant({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(12),
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white38
        ),
        child: Center(
          child: ListTile(
            leading: CircleAvatar(
              child: Text(name[0]),
            ),
            title: Text(name),
          ),
        )
    );
  }
}




