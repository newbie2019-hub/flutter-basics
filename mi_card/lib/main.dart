import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/profile.jpg')
                ),
                Text(
                  'Yvan Sabay',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 40.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'FLUTTER DEVELOPER',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.teal[100],
                    letterSpacing: 2.2,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 135.0,
                  child: Divider(
                    color: Colors.teal[200],
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal[900],
                      ),
                      title: Text(
                        '+63 935 531 0166',
                          style: TextStyle(
                            color: Colors.teal[900],
                            fontSize: 18.0,
                          )
                      ),
                      subtitle: Text(
                          'PHONE NUMBER',
                          style: TextStyle(
                            color: Colors.teal[900],
                            fontSize: 13.0,
                          )
                      ),
                    ),
                ),
                Card(
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.email,
                          color: Colors.teal[900],
                        ),
                        title: Text(
                            'sabayyvan2018@gmail.com',
                            style: TextStyle(
                              color: Colors.teal[900],
                              fontSize: 18.0,
                            )
                        ),
                        subtitle: Text(
                            'EMAIL ADDRESS',
                            style: TextStyle(
                              color: Colors.teal[900],
                              fontSize: 13.0,
                            )
                        ),
                      ),
                    )
                ),

              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
