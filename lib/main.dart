import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String output="0";
  String _output="0";
  double num1=0.0;
  double num2=0.0;
  String operand="";


  buttonPressed(String val){
    if(val=="Clear"){
      _output="0";
      num1=0.0;
      num2=0.0;
      operand="";
    }else if(val=="+"||val=="-"||val=="x"||val=="/"){
      num1=double.parse(output);
      operand=val;
      _output='0';
    }else if(val=='.'){
      if(_output.contains('.')){
        return;
      }else{
       _output=_output+".";
      }
    }else if(val=="="){
      num2=double.parse(output);
      if(operand=="+"){
        _output=(num1+num2).toString();
      }
      if(operand=="-"){
        _output=(num1-num2).toString();
      }
      if(operand=="x"){
        _output=(num1*num2).toString();
      }
      if(operand=="/"){
        _output=(num1/num2).toString();
      }
      num1=0.0;
      num2=0.0;
      operand="";

    }else{
      _output=_output+val;
    }
  setState(() {
    output=double.parse(_output).toStringAsFixed(2);
  });
  }

  Widget biuldButton(String num){
 return Expanded(

   child: OutlineButton(
     padding: EdgeInsets.all(24.0),
    onPressed: (){
      buttonPressed(num);
    } ,
    child:
    Text(num,
    style: TextStyle(fontSize: 18),),
    
    ),
 );

}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(horizontal: 40,vertical: 40),
                child: Text(output,style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),)),
            Expanded(child: Divider()),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    biuldButton("7"),
                    biuldButton("8"),
                    biuldButton("9"),
                    biuldButton("/"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    biuldButton("4"),
                    biuldButton("5"),
                    biuldButton("6"),
                    biuldButton("x"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    biuldButton("1"),
                    biuldButton("2"),
                    biuldButton("3"),
                    biuldButton("-"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    biuldButton("."),
                    biuldButton("0"),
                    biuldButton("00"),
                    biuldButton("+"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    biuldButton("Clear"),
                    biuldButton("="),
                  ],
                ),
              ],
            )

          ],
        ),
      ),


    );
  }
}
