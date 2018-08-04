import 'dart:math';

import 'package:flutter/material.dart';
List name=['A','n','a','n','d'];
void main() => runApp(new MyApp());
String a='Anand';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class animatedContainer extends AnimatedWidget{
  animatedContainer({Key key,Animation<double> animation})
  :super(key:key, listenable:animation,);

  static final _fontSize=Tween<double>(begin: 0.0,end:200.0);
  static final _opacity=Tween<double>(begin: 0.1,end:1.0);
  static final Tween _color=ColorTween(begin: Colors.transparent,end:Colors.black);
  @override
  Widget build(BuildContext context) {
    final Animation<double> animat=listenable;
    return Opacity(
      child: Text(
        name[0],
        style: TextStyle(
          fontSize: _fontSize.evaluate(animat),
          color: _color.evaluate(animat)
          ),
        ),
      opacity: animat.value,
      );
  }

}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  AnimationController controler;
  Animation<double> animation;
  //Animation<double> animationW;
  int changeData=Random().nextInt(200);
bool _st=false;
  void ChangeNumber(){
    changeData=Random().nextInt(200);
    _st=!_st;
    setState(() {
          
        });
  }

  @override
  void initState() {
      // TODO: implement initState
      super.initState();
      controler=new AnimationController(
        duration: const Duration(milliseconds: 4000),
        vsync: this
      );
      animation=CurvedAnimation(parent: controler, curve: Curves.easeIn)
      //animation=Tween(begin: 0.0,end:1.0).animate(controler)
      //animationH=Tween(begin: 1.0,end:100.0).animate(controler)
      ..addStatusListener((status){
        if(status==AnimationStatus.completed){
          //controler.reverse();
        }
      });
      controler.forward();
    }
 @override
  dispose() {
    controler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('My School'),
      ),
      body: new Center(
        child:
         Container(
           height: 800.0,
           width:800.0,
           child: Column(
             children: <Widget>[
               new AnimatedCrossFade(
  duration: const Duration(seconds: 1),
  firstChild: const FlutterLogo(style: FlutterLogoStyle.horizontal, size: 100.0),
  secondChild: const FlutterLogo(style: FlutterLogoStyle.stacked, size: 100.0),
  crossFadeState: _st ? CrossFadeState.showFirst : CrossFadeState.showSecond,
),
               Center(child: animatedContainer(animation: animation,)),
             ],
           ),
           color: Colors.pink,
           )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:ChangeNumber ,
          ),
      );
  }
}