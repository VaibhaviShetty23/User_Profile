import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:user_profile/HeaderCurvedContainer.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: UserPage(),
    theme: ThemeData(
      primarySwatch: Colors.lightBlue,
    ),
  ));
}

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage>
    with TickerProviderStateMixin {
  TabController _tabController;

  final List<Tab> myTabs = <Tab>[
    Tab(icon: Icon(Icons.book, color: Colors.pink[100])),
    Tab(
        icon: Icon(
      Icons.computer,
      color: Colors.black,
    )),
    Tab(icon: Icon(Icons.star, color: Colors.yellow[300], size: 20.0)),
  ];

  @override
  void initState() {
    super.initState();

    //initialize the tab controller
    _tabController =
        TabController(vsync: this, length: myTabs.length, initialIndex: 0);
       
        /*setState(() {
                  this.length = l;
                  this._controller = new TabController(length: _length, vsync: this);
                  this._index = _index;
                });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.lightBlue,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {},
            )),
        
        
        body: SingleChildScrollView(
          // child: Padding(
          // padding: const EdgeInsets.only(right: 8, left : 8),
          child: Column(
            children: <Widget>[
            Stack(children: [
              CustomPaint(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
                painter: HeaderCurvedContainer(), //paint
              ),
              Container(
               margin: EdgeInsets.only(top: 70),
               child: Align(alignment : Alignment.topLeft),
               width: 130, //MediaQuery.of(context).size.width/2
               height: 130, //MediaQuery.of(context).size.width/2
                
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/Myicon.jpg'), //iconimage
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 160, left: 95), //edit icon
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            // Text("Vaibhavi Shetty"), 

              Container(
                margin: EdgeInsets.only(top: 350),                
              child: TabBar(
                  labelColor: Colors.white,
                  controller: _tabController,
                  isScrollable: true,
                  indicatorColor: Colors.lightBlue,
                  labelPadding: EdgeInsets.symmetric(horizontal: 50.0),
                  tabs: myTabs,
                  onTap: (index) {},
                ),
              ),
/*
              Expanded(
            child: Container(
              child: TabBarView(
                controller: _tabController,
                children: [],
              ),

            ) 
            ),*/
            ]),
            //  Text("Vaibhavi Shetty"),       
            
            
             
          ]),
          
          
          // ),
        ));
  }
}

/*Text(
                      "Vaibhavi Shetty",
                      style: GoogleFonts.dancingScript(fontSize: 50.0),
                    ),
                    SizedBox(height: 40),*/
                     
