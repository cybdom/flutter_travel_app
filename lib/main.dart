import 'package:flutter/material.dart';
import 'package:travel_app/signin.dart';

void main() => runApp(MyApp());

bool flightSelected = false, hotelSelected = false;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Raleway'),
      home: SignIn(),
      routes: {
        '/signin': (context) => SignIn(),
        '/home': (context) => Home(),
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu,
                      color: Color(0xff999999),
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Color(0xff999999),
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "http://cybdom.tech/wp-content/uploads/2019/02/0.jpg"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 11),
              MySpecialSelector(),
              Expanded(
                child: MySpecialCard(),
              ),
              Builder(
                builder: (context) {
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        if (!flightSelected && !hotelSelected) {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Please select at least Hotel or Flight',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 19.0),
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                          color: Color(0xffe6eef0),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Center(
                          child: Text(
                            "Search",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MySpecialCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25.0),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(21.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Colors.grey[300],
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          TripSelector(),
          Spacer(),
          SizedBox(
            height: 11,
          ),
          AppointmentContainer(text: "Where from ?"),
          Row(
            children: <Widget>[
              Spacer(),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200], shape: BoxShape.circle),
                child: IconButton(
                  icon: Icon(Icons.swap_vert, color: Colors.grey[600]),
                  onPressed: () {},
                ),
              )
            ],
          ),
          SizedBox(
            height: 9.0,
          ),
          AppointmentContainer(text: "Where to ?"),
          SizedBox(
            height: 9.0,
          ),
          Row(
            children: <Widget>[
              Spacer(),
              Icon(
                Icons.person,
                color: Colors.grey[600],
              ),
              SizedBox(
                width: 11,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xfff6f6f6),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                      hintText: "1 Person"),
                ),
              ),
              Spacer(),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}

class MySpecialSelector extends StatefulWidget {
  @override
  _MySpecialSelectorState createState() => _MySpecialSelectorState();
}

class _MySpecialSelectorState extends State<MySpecialSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              flightSelected = !flightSelected;
              print(flightSelected);
            });
          },
          child: Text(
            "Flight",
            style: TextStyle(
              color: flightSelected ? Color(0xff48808d) : Colors.grey[600],
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[600]),
              shape: BoxShape.circle),
          child: Icon(
            Icons.add,
            color: Colors.grey[600],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              hotelSelected = !hotelSelected;
            });
          },
          child: Text(
            "Hotel",
            style: TextStyle(
              color: hotelSelected ? Color(0xff48808d) : Colors.grey[600],
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
        ),
      ],
    );
  }
}

class AppointmentContainer extends StatelessWidget {
  final String text;

  const AppointmentContainer({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xfff6f6f6),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none),
              hintText: text),
        ),
        SizedBox(
          height: 9,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xfff6f6f6),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                  hintText: "MM/DD/YYYY",
                ),
              ),
            ),
            SizedBox(width: 21),
            Icon(Icons.today, color: Colors.grey[600]),
            Spacer(),
          ],
        ),
      ],
    );
  }
}

class TripSelector extends StatefulWidget {
  @override
  _TripSelectorState createState() => _TripSelectorState();
}

class _TripSelectorState extends State<TripSelector> {
  int selectedId = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              selectedId = 0;
            });
          },
          child: Text(
            "Round",
            style: TextStyle(
                decoration: selectedId == 0
                    ? TextDecoration.underline
                    : TextDecoration.none),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedId = 1;
            });
          },
          child: Text(
            "One-Way",
            style: TextStyle(
                decoration: selectedId == 1
                    ? TextDecoration.underline
                    : TextDecoration.none),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedId = 2;
            });
          },
          child: Text(
            "Multi-City",
            style: TextStyle(
                decoration: selectedId == 2
                    ? TextDecoration.underline
                    : TextDecoration.none),
          ),
        ),
      ],
    );
  }
}
