import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

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
        "TextFormFieldWidget": (context) => TextFormFieldWidget(),
        "CustomScrollViewWidget": (context) => CustomScrollViewWidget(),
        "SingleChildScrollViewWidget": (context) =>
            SingleChildScrollViewWidget(),
        "ListViewWidget": (context) => ListViewWidget(),
        "InfiniteListViewWidget": (context) => InfiniteListViewWidget(),
        "GridViewWidget": (context) => GridViewWidget(),
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
      body: SingleChildScrollView(
        child: Center(
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
              FlatButton(
                textColor: Colors.lightBlue,
                child: Text("TextFormField示例"),
                onPressed: () {
                  Navigator.pushNamed(context, "TextFormFieldWidget",
                      arguments: "TextFormField示例");
                },
              ),
              FlatButton(
                textColor: Colors.lightBlue,
                child: Text("SingleChildScrollView示例"),
                onPressed: () {
                  Navigator.pushNamed(context, "SingleChildScrollViewWidget",
                      arguments: "SingleChildScrollView示例");
                },
              ),
              FlatButton(
                textColor: Colors.lightBlue,
                child: Text("CustomScrollView示例"),
                onPressed: () {
                  Navigator.pushNamed(context, "CustomScrollViewWidget",
                      arguments: "CustomScrollView示例");
                },
              ),

              FlatButton(
                textColor: Colors.lightBlue,
                child: Text("ListView示例"),
                onPressed: () {
                  Navigator.pushNamed(context, "ListViewWidget",
                      arguments: "ListView示例");
                },
              ),
              FlatButton(
                textColor: Colors.lightBlue,
                child: Text("InfiniteListView无限列表示例"),
                onPressed: () {
                  Navigator.pushNamed(context, "InfiniteListViewWidget",
                      arguments: "InfiniteListView无限列表示例");
                },
              ),
              FlatButton(
                textColor: Colors.lightBlue,
                child: Text("GridView示例"),
                onPressed: () {
                  Navigator.pushNamed(context, "GridViewWidget",
                      arguments: "GridView示例");
                },
              ),
            ],
          ),
        ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/**
 * TextFormField示例
 */
class TextFormFieldWidget extends StatefulWidget {
  @override
  _TextFormFieldWidgetState createState() => new _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  GlobalKey _formKey = new GlobalKey<FormState>();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("TextFormField示例"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
            key: _formKey, //用于后面获取FormState
            autovalidate: true, //开启自动校验
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  controller: _nameController,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    labelText: "用户名",
                    hintText: "请输入用户名",
                    icon: Icon(
                      Icons.person,
                      size: 25,
                      color: Colors.lightBlue,
                    ),
                  ),
                  //校验用户名合法性
                  validator: (v) {
                    return v.trim().length > 0 ? null : "用户名不能为空";
                  },
                ),
                TextFormField(
                  controller: _pwdController,
                  decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "请输入密码",
                    icon: Icon(
                      Icons.lock,
                      size: 25,
                      color: Colors.lightBlue,
                    ),
                  ),
                  validator: (v) {
                    return v.trim().length > 5 ? null : "密码不能少于6位";
                  },
                ),
                //登录按钮
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                            padding: EdgeInsets.all(10),
                            child: Text("登录"),
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.red,
                            onPressed: () {
                              //通过form的key获取formState
                              if ((_formKey.currentState as FormState)
                                  .validate()) {
                                //验证通过提交
                                print("登录成功");
                              }
                            }),
                      ),
                    ],
                  ),
                ),
                //水平进度条
                SizedBox(
                  height: 20,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                    value: 0.5,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: SizedBox(
                      height: 100,
                      width: 100,
                      child: CircularProgressIndicator(
                        strokeWidth: 5,
                        value: 0.8,
                        backgroundColor: Colors.grey,
                        valueColor: AlwaysStoppedAnimation(Colors.blue),
                      )),
                )
              ],
            )),
      ),
      bottomNavigationBar: BottomNavigationBar(items: null),
    );
  }
}

/**
 * CustomScrollView示例
 */
class CustomScrollViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var title = ModalRoute.of(context).settings.arguments;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("$title"),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          //标题
          SliverAppBar(
            automaticallyImplyLeading:false,
            pinned: false,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("我是标题"),
              background: Image.network(
                "https://static.coindesk.com/wp-content/uploads/2013/10/baidu-accepts-bitcoin.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          //grideView
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  alignment: Alignment.center,
                  color: Colors.cyan[100 * (index % 9)],
                  child: Text("grid item $index"),
                ),
                childCount: 20,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 4,
              ),
            ),
          ),
          SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                        alignment: Alignment.center,
                        color: Colors.lightBlue[100 * (index % 9)],
                        child: Text("list item $index"),
                      ),
                  childCount: 100),
              itemExtent: 50)
        ],
      ),
    );
  }
}

/**
 * singleChildScrollView示例
 */
class SingleChildScrollViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var str = "ABCDEFGHIJKMNOPQRSTUVWXYZ";
    var title = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("${title}"),
      ),
      body: Scrollbar(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: str
                .split("")
                .map((e) => Text(
                      e,
                      textScaleFactor: 2,
                      style: TextStyle(color: Colors.lightBlue),
                    ))
                .toList(),
          ),
        ),
      )),
    );
  }
}

/**
 * ListView示例
 */
class ListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var title = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("${title}"),
      ),
      /*body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(20),
        children: <Widget>[
          Text("我是数据源1"),
          Text("我是数据源2"),
          Text("我是数据源3"),
          Text("我是数据源4"),
          Text("我是数据源5"),
          Text("我是数据源6"),
        ],
      ),*/
      /* body: ListView.builder(
        itemBuilder: (context, index) => Center(
            child: ListTile(
          title: Text(
            "${index}",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.lightBlue,
            ),
          ),
          onTap: () {
            print("${index}click");
          },
        )),
        itemExtent: 100,
        itemCount: 25,
      ),*/
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                title: Text("${index}"),
              ),
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: index % 2 == 0 ? Colors.red : Colors.green,
            );
          },
          itemCount: 50),
    );
  }
}

/**
 * 无限listView列表示例
 *
 */
class InfiniteListViewWidget extends StatefulWidget {
  @override
  _InfiniteListViewWidgetState createState() =>
      new _InfiniteListViewWidgetState();
}

class _InfiniteListViewWidgetState extends State<InfiniteListViewWidget> {
  static const loadingTag = "%%laoding%%";
  var list = <String>[loadingTag];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //初始化列表数据
    _updateListData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var title = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text("$title"),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
              child: Center(
                child: Text(
                  "我是标题",
                  textScaleFactor: 3,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    //如果滑动到了底部
                    if (index == list.length - 1) {
                      //判断现在列表的数量是否小于100
                      if (list.length - 1 < 100) {
                        //则底部展示loading
                        _updateListData();
                        return Container(
                            padding: EdgeInsets.all(16),
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 25,
                              height: 25,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            ));
                      } else {
                        return Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "没有更多数据",
                            style: TextStyle(color: Colors.grey),
                          ),
                        );
                      }
                    }
                    return ListTile(
                      title: Text(list[index]),
                    );
                  },
                  separatorBuilder: (context, index) => new Divider(
                        color: index % 2 == 0 ? Colors.green : Colors.red,
                      ),
                  itemCount: list.length),
            )
          ],
        ));
  }

  void _updateListData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      list.insertAll(list.length - 1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {
        //重新构建列表
      });
    });
  }
}

/**
 * gridView示例
 */
class GridViewWidget extends StatefulWidget {
  @override
  _GridViewWidgetState createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  List<IconData> _icons = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateIconsData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var title = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("${title}"),
      ),
      /*body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 20, childAspectRatio: 2),
        children: <Widget>[
          Icon(Icons.settings),
          Icon(Icons.accessible),
          Icon(Icons.ac_unit),
          Icon(Icons.access_alarm),
          Icon(Icons.account_balance),
          Icon(Icons.account_balance_wallet),
          Icon(Icons.adb),
        ],
      ),*/
      /*body: GridView.count(
          crossAxisCount: 4,
        childAspectRatio:1 ,
        children: <Widget>[
          Icon(Icons.settings),
          Icon(Icons.accessible),
          Icon(Icons.ac_unit),
          Icon(Icons.access_alarm),
          Icon(Icons.account_balance),
          Icon(Icons.account_balance_wallet),
          Icon(Icons.adb),
        ],
      ),*/
      //根据子元素宽度定义摆放的数量
      /* body: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150,
              crossAxisSpacing: 50,
              mainAxisSpacing: 20),
          children: <Widget>[
            Icon(Icons.settings),
            Icon(Icons.accessible),
            Icon(Icons.ac_unit),
            Icon(Icons.access_alarm),
            Icon(Icons.account_balance),
            Icon(Icons.account_balance_wallet),
            Icon(Icons.adb),
          ],
        )*/
      /*body: GridView.extent(
        maxCrossAxisExtent: 50,
        crossAxisSpacing: 25,
        children: <Widget>[
          Icon(Icons.settings),
          Icon(Icons.accessible),
          Icon(Icons.ac_unit),
          Icon(Icons.access_alarm),
          Icon(Icons.account_balance),
          Icon(Icons.account_balance_wallet),
          Icon(Icons.adb),
        ],
      ),*/
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 20,
          mainAxisSpacing: 40,
          childAspectRatio: 2,
        ),
        itemBuilder: (context, index) {
          //当滑动到当前列表的最后一个条目的时候触发检测数据机制
          if (index == _icons.length - 1 && _icons.length < 200) {
            updateIconsData();
          }
          return Icon(_icons[index]);
        },
        itemCount: _icons.length,
      ),
    );
  }

  void updateIconsData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.book,
          Icons.backspace,
          Icons.backup,
          Icons.battery_alert,
          Icons.beach_access,
          Icons.beenhere,
          Icons.bluetooth,
          Icons.blur_circular,
        ]);
      });
    });
  }
}
