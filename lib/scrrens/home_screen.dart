import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 10),
          Container(
            height: 300,
            width: 200,
            child: Image.asset('assets/Anmited.png'),
          ),
          SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Let\'s play Quiz',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Enter your data below',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      focusColor: Colors.green,
                      fillColor: Colors.lightBlueAccent,
                      hintText: 'Enter your information',
                      border: OutlineInputBorder(

                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(18),
            child: SizedBox(
              
              width: 25,
              child: ShaderMask(
                
                shaderCallback: (Rect bounds){
                  return LinearGradient(
                    colors: [Colors.green, Colors.lightBlueAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds);
            
                },
                  child:ElevatedButton(
                    
                    onPressed: () {},
                    child: Text('Let\'s play',style: TextStyle(
                      color: Colors.red
                    ),),
                    style:ElevatedButton.styleFrom(
                      // backgroundColor: Colors.transparent, // Set the button background to transparent
                      // shadowColor: Colors.transparent,
                    )
                  ),
            
              ),
            ),
          ),
        ],
      ),
    );


  }
}
