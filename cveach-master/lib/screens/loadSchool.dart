
import 'package:cveach/data/teacher_data.dart';
import 'package:cveach/modules/teacher_presenter.dart';
import 'package:flutter/material.dart';



class LoadSchool extends StatefulWidget {
  final String textSearch;
  LoadSchool(this.textSearch);


  @override
  State<StatefulWidget> createState() {
    return _LoadSchoolState(this.textSearch);
  }
  //_LoadSchoolState createState() => new _LoadSchoolState();
}

class _LoadSchoolState extends State<LoadSchool> implements TeacherListViewContract {
  TeacherListPresenter _presenter;
  List<Teacher> _teachers;
  bool _isLoading;
  String txtSearch = '';

  final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];


  _LoadSchoolState(String textSearch) {
    _presenter = new TeacherListPresenter(this);
    txtSearch = textSearch;
  }


  @override
  void initState() {
    super.initState();
    _isLoading = true;

    _presenter.loadTeachers(txtSearch);
  }

  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text('AppBar');
  @override
  Widget build(BuildContext context) {
    return new Scaffold(


//        Container(
//          color: Colors.blueGrey.shade100,
//          child: SingleChildScrollView(
//            child: Column(
//              children: <Widget>[
//                ClipPath(
//                  clipper: OvalBottomBorderClipper(),
//                  child: Container(
//                    width: double.infinity,
//                    height: 250.0,
//                    padding: EdgeInsets.only(bottom: 50.0),
//                    decoration: BoxDecoration(
//                      color: kYellow,
//                      image: DecorationImage(
//                        image: AssetImage("assets/background/education.jpg"),
//                        fit: BoxFit.cover,
//                      ),
//                    ),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: [
//                        AppBar(
//                          backgroundColor: Colors.black12.withOpacity(.0),
//                          elevation: 0,
//                          leading: IconButton(
//                            icon: Icon(Icons.menu),
//                            onPressed: () {},
//                          ),
//                          actions: [
//                            IconButton(
//                              icon: Icon(Icons.notification_important),
//                              iconSize: 30,
//                              onPressed: () {},
//                            )
//                          ],
//                        ),
//                        Spacer(),
//                        Padding(
//                          padding: const EdgeInsets.only(left: 18.0),
//                          child: Text(
//                            "Find your teacher job",
//                            style: kTitleStyle2.copyWith(color: Colors.red, fontSize: 25),
//                          ),
//                        ),
//                        SizedBox(height: 15.0),
//                        Container(
//                          width: double.infinity,
//                          height: 50.0,
//                          margin: EdgeInsets.symmetric(horizontal: 18.0),
//                          padding: EdgeInsets.symmetric(horizontal: 15.0),
//                          decoration: BoxDecoration(
//                            borderRadius: BorderRadius.circular(12.0),
//                            color: Colors.white.withOpacity(.9),
//                          ),
//                          child: TextField(
//                            cursorColor: kBlack,
//                            decoration: InputDecoration(
//                              hintText: "Search",
//                              hintStyle: kHintStyle,
//                              border: InputBorder.none,
//                              icon: Icon(
//                                Icons.search,
//                                color: kGrey,
//                              ),
//                            ),
//                          ),
//
//                        ),
//
//                      ],
//                    ),
//
//                  ),
//                ),
//                //SizedBox(height: 20.0),
//              ],
//
//            ),
//
//          ),
//        ),


        appBar: new AppBar(
          leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.menu),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: (){
                setState(() {
                  if(this.cusIcon.icon == Icons.search){
                    this.cusIcon = Icon(Icons.cancel);
                    this.cusSearchBar = TextField(
                      textInputAction: TextInputAction.go,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search school',
                      ),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    );
                  }
                  else{
                    this.cusIcon = Icon(Icons.search);
                    this.cusSearchBar = Text('AppBar');
                  }
                });

              },
              icon: cusIcon,

            ),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.more_vert),
            )
          ],
          title: cusSearchBar,
        ),
        body: _isLoading
            ? new Center(
          child: new CircularProgressIndicator(),
        )
            :new ListView.builder(
          itemCount: _teachers.length,
          itemBuilder: (BuildContext context,int index)=>
              _getRowWithDivider(index),)
    );
  }

  Widget _getRowWithDivider(int i) {
    final Teacher teacher = _teachers[i];
    var children = <Widget>[
      new Padding(
          padding: new EdgeInsets.all(10.0),
          child: _getListItemUi(teacher)
      ),
      new Divider(height: 5.0),
    ];

    return new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  ListTile _getListItemUi(Teacher teacher) {
    return new ListTile(
      leading: new Image(image: AssetImage('assets/2.0x/stars.png')),
      title: new Text(teacher.Name,
          style: new TextStyle(fontWeight: FontWeight.bold)),
      //subtitle:
      //_getSubtitleText(teacher.id.toString(), teacher.id.toString()),
      //isThreeLine: true,
    );
  }

  Widget _getSubtitleText(String priceUSD, String percentageChange) {
    TextSpan priceTextWidget = new TextSpan(
        text: "\$$priceUSD\n", style: new TextStyle(color: Colors.black));
    String percentageChangeText = "1 hour: $percentageChange%";
    TextSpan percentageChangeTextWidget;

    if (double.parse(percentageChange) > 0) {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText,
          style: new TextStyle(color: Colors.green));
    } else {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText, style: new TextStyle(color: Colors.red));
    }

    return new RichText(
        text: new TextSpan(
            children: [priceTextWidget, percentageChangeTextWidget]));
  }

  @override
  void onLoadTeacherComplete(List<Teacher> items) {
    // TODO: implement onLoadCryptoComplete

    setState(() {
      _teachers = items;
      _isLoading = false;
    });
  }

  @override
  void onLoadTeacherError() {
    // TODO: implement onLoadCryptoError
  }
}
