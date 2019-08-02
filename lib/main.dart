import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "flutter demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "secondRoute": (context) => SecondRoute(),
        "CountWidgetPage": (context) => CountWidget(),
        "ParentWidget": (context) => ParentWidget(),
        "ParentWidgetMulti": (context) => ParentWidgetMulti(),
        "TextFiledWidget": (context) => TextFiledWidget(),
      },
      home: MyHomePage(title: "homePageTitle12"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    debugDumpApp();
  }

  void _jumpSencondPage() {
    //导航到新路由（方式1）
    Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) {
            return SecondRoute();
          },
          settings: RouteSettings(
              name: "secondRoute",
              isInitialRoute: true,
              arguments: "i am flutter"),
          maintainState: false,
          fullscreenDialog: false,
        ));
    //方式2通过路由名称
    // Navigator.pushNamed(context, "secondRoute",arguments: "凉凉");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //checkBox和switch
            SwitchAndSelectWidget(
              switchState: true,
              checkBoxState: false,
            ),
            //icon
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.accessible, color: Colors.blueAccent, size: 50),
                Icon(Icons.error, color: Colors.red, size: 50),
                Icon(Icons.fingerprint, color: Colors.grey, size: 50),
//                Icon(MyIcons.book,color: Colors.lightGreen,size: 50),
//                Icon(MyIcons.wechat,color: Colors.lightGreen,size: 50),
              ],
            ),

            Text.rich(
              TextSpan(children: [
                TextSpan(text: "You have pushed"),
                TextSpan(
                  text: "the button this many times:",
                  style: TextStyle(
                    color: Colors.red,
                  ),
//                  recognizer: recognizer(),
                ),
//                  Text(""),
              ]),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              textColor: Colors.lightBlue,
              child: Text("点击跳转第二页"),
              onPressed: _jumpSencondPage,
            ),
            FlatButton(
              textColor: Colors.lightBlue,
              child: Text("点击跳转countWidgetPage"),
              onPressed: () {
                Navigator.pushNamed(context, "CountWidgetPage");
              },
            ),
            FlatButton(
              textColor: Colors.lightBlue,
              child: Text("父widget管理子widget 状态"),
              onPressed: () {
                Navigator.pushNamed(context, "ParentWidget");
              },
            ),
            FlatButton(
              textColor: Colors.lightBlue,
              child: Text("父widget和子widget混合管理state"),
              onPressed: () {
                Navigator.pushNamed(context, "ParentWidgetMulti",
                    arguments: "父widget和子widget混合管理state");
              },
            ),
            FlatButton(
              textColor: Colors.lightBlue,
              child: Text("输入框和表单"),
              onPressed: () {
                Navigator.pushNamed(context, "TextFiledWidget",
                    arguments: "输入框和表单示例");
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

//  recognizer() {
//    showTimePicker(context:context, initialTime: TimeOfDay.now());
////  print("recognizer");
//  }

}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("second Route Page"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text("HEELO"), Text("$args")],
        ),
      ),
    );
  }
}

//创建一个倒计时新路由
class CountWidget extends StatefulWidget {
  final int initValue;

  const CountWidget({Key key, this.initValue: 0});

  @override
  _CountWidgetState createState() => new _CountWidgetState();
}

class _CountWidgetState extends State<CountWidget> {
  int _countValue;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("build");
    return new Scaffold(
      appBar: new AppBar(
        title: Text("countWidgetPage"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("$_countValue"),
//          FlatButton(
//            child: Text("$_countValue"),
//            onPressed: ()=>setState(
//                ()=>_countValue++
//            ),
//          ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    //初始化状态
    _countValue = widget.initValue;
    print("initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didUpdateWidget(CountWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }
}

/**
 * 父类管理之类state
 */
class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleWidgetChanged(bool value) {
//    showTimePicker(context: context, initialTime:TimeOfDay.now());
    setState(() {
      _active = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("sssss"),
      ),
      body: new Center(
        child: new Container(
          child:
              new ChildWidget(active: _active, onChanged: _handleWidgetChanged),
        ),
      ),
    );
  }
}

/*
父类管理状态之子类
 */
class ChildWidget extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  const ChildWidget({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? "Active" : "InActive",
            style: new TextStyle(fontSize: 32.0, color: Colors.red),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(18),
            color: active ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
    );
  }

  void _handleTap() {
    onChanged(!active);
  }
}

/**
 * 混合管理(父类子类混合管理状态)
 */
class ParentWidgetMulti extends StatefulWidget {
  @override
  _ParentWidgetMulti createState() {
    // TODO: implement createState
    return new _ParentWidgetMulti();
  }
}

class _ParentWidgetMulti extends State<ParentWidgetMulti> {
  bool _activi = false;

  @override
  Widget build(BuildContext context) {
    var _title = ModalRoute.of(context).settings.arguments;
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("$_title"),
      ),
      body: new Center(
        child: new Container(
            child: new Column(
          children: <Widget>[
            new ChildWidgetMulti(activi: _activi, onchanged: activiChanged),
            new Image(
              image: AssetImage("images/test.png"),
              width: 160,
              height: 160,
            ),
            Image(
              image: NetworkImage(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
              width: 100,
              height: 200,
              fit: BoxFit.contain,
              color: Colors.blueAccent,
              colorBlendMode: BlendMode.plus,
              repeat: ImageRepeat.repeatY,
            ),
//            Image.network("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",width: 300,)
          ],
        )
//
            ),
      ),
    );
  }

//管理矩形填充色
  void activiChanged(bool value) {
    setState(() {
      _activi = value;
    });
  }
}

//子类
class ChildWidgetMulti extends StatefulWidget {
  bool activi = false;
  ValueChanged<bool> onchanged;

  ChildWidgetMulti({Key key, this.activi, @required this.onchanged})
      : super(key: key);

  @override
  _ChildWidgetMulti createState() {
    // TODO: implement createState
    return new _ChildWidgetMulti();
  }
}

class _ChildWidgetMulti extends State<ChildWidgetMulti> {
  bool _hightLine = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      //点击
      onTap: _handleActiviChanged,
      onTapDown: _handleOnTapDown,
      onTapUp: _handleOnTapUp,
      onTapCancel: _handleOnTapCancel,
      child: Container(
        child: new Center(
          child: new Text(
            widget.activi ? "激活" : "未激活",
            style: new TextStyle(
              color: widget.activi ? Colors.blue : Colors.grey,
              fontSize: 32.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        width: 200,
        height: 200,
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(18),
          color: widget.activi ? Colors.lightGreen[700] : Colors.grey[600],
          border: _hightLine
              ? new Border.all(
                  color: Colors.red,
                  width: 10,
                )
              : null,
        ),
      ),
    );
  }

//点击
  void _handleActiviChanged() {
    widget.onchanged(!widget.activi);
  }

  //按下
  void _handleOnTapDown(TapDownDetails details) {
    setState(() {
      _hightLine = true;
    });
  }

//抬起
  void _handleOnTapUp(TapUpDetails details) {
    setState(() {
      _hightLine = false;
    });
  }

//取消
  void _handleOnTapCancel() {
    setState(() {
      _hightLine = false;
    });
  }
}

class MyIcons {
  static const IconData book =
      const IconData(0xe614, fontFamily: "myicon", matchTextDirection: true);
  static const IconData wechat =
      const IconData(0xec7d, fontFamily: "myicon", matchTextDirection: true);
}

/*
复选框和switch按钮组合
 */
class SwitchAndSelectWidget extends StatefulWidget {
  bool switchState = false;
  bool checkBoxState = false;

  SwitchAndSelectWidget({Key key, this.switchState, this.checkBoxState})
      : super(key: key);

  @override
  _SwitchAndSelectWidgetState createState() =>
      new _SwitchAndSelectWidgetState();
}

class _SwitchAndSelectWidgetState extends State<SwitchAndSelectWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Switch(
            value: widget.switchState,
            onChanged: _switchHandle,
            activeColor: Colors.green,
            activeTrackColor: Colors.red,
          ),
          Checkbox(
            value: widget.checkBoxState,
            onChanged: _checkBoxHandle,
            activeColor: Colors.green,
            checkColor: Colors.red,
          ),
        ],
      ),
    );
  }

  void _switchHandle(bool value) {
    setState(() {
      widget.switchState = value;
    });
  }

  void _checkBoxHandle(bool value) {
    setState(() {
      widget.checkBoxState = value;
    });
  }
}

/**
 * 输入框和表单
 */
class TextFiledWidget extends StatefulWidget {
  @override
  _TextFiledWidgetState createState() => new _TextFiledWidgetState();
}

class _TextFiledWidgetState extends State<TextFiledWidget> {
  var info1 = "";
  var info2 = "";
  var info1_info2 = "";
  var _info = "";
  var control1 = new TextEditingController();
  var control2 = new TextEditingController();
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    control1.text="13858353493";
//    control1.selection=TextSelection(baseOffset: 5, extentOffset: control1.text.length);
//监听输入框
//  control1.addListener((){
//    print(control1.text);
//  });
    focusNode1.addListener(() {
      print(focusNode1.hasFocus);
    });
    focusNode2.addListener(() {
      print(focusNode2.hasFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;

    // TODO: implement build
    return Theme(
      data: Theme.of(context).copyWith(
//              hintColor: Colors.red, //定义下划线颜色
          inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.grey),
        //定义label字体样式
        hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0),
        //通过定义enableBorder来修改下划线颜色,
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1)),
      )),
      child: new Scaffold(
        appBar: new AppBar(
          title: Text("$args"),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: new Column(
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.phone,
                maxLength: 11,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "请输入用户名",
                  prefixIcon: new Icon(
                    Icons.person,
                    size: 24,
                    color: Colors.blueAccent,
                  ),
                ),
                onChanged: (value) {
                  info1 = value;
                },
                controller: control1,
                focusNode: focusNode1,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "请输入密码",
                  prefixIcon: Icon(
                    Icons.lock,
                    size: 24,
                    color: Colors.blueAccent,
                  ),
                ),
                obscureText: true,
                controller: control2,
                onChanged: (value) {
                  info2 = value;
                },
                focusNode: focusNode2,
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    _info = "账号：" + control1.text + "密码：" + control2.text;
                    info1_info2 = "账号：$info1,密码:$info2";
                  });
                },
                color: Colors.blueAccent,
                child: Text("登录"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                materialTapTargetSize: MaterialTapTargetSize.padded,
              ),
              Text("$_info"),
              Text("$info1_info2"),
              RaisedButton(
                onPressed: () {
                  //方式2（切换焦点）
                  FocusScope.of(context).requestFocus(focusNode2);
                },
                color: Colors.blueAccent,
                child: Text("切换焦点"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                materialTapTargetSize: MaterialTapTargetSize.padded,
              )
            ],
          ),
        ),
      ),
    );
  }
}
