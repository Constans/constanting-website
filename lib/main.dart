import 'package:constanting/utils/constanting_icons_icons.dart';
import 'package:constanting/utils/constanting_logo.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

void main() {
  runApp(Website());
}

class Website extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CONSTANTING',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        inputDecorationTheme: InputDecorationTheme(
          hoverColor: WebsiteColors.formBackground,
          fillColor: WebsiteColors.formBackground,
          focusColor: WebsiteColors.white,
          filled: true,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue[800], width: 2.0),
          ),
          hintStyle: TextStyle( color: WebsiteColors.lightGrey, fontSize: 13)
        ),
      ),
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.jpg"), 
              fit: BoxFit.fill
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/overlay.png"), 
                repeat: ImageRepeat.repeat,
              ),
            ),
            child: HomePage(title: 'CONSTANTING'),
          ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedPage=0;

  TextEditingController name;
  FocusNode nameFocus;
  TextEditingController email;
  FocusNode emailFocus;
  TextEditingController subject;
  FocusNode subjectFocus;
  TextEditingController message;
  FocusNode messageFocus;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    name = TextEditingController(text:'');
    nameFocus = FocusNode();
    email = TextEditingController(text:'');
    emailFocus = FocusNode();
    subject = TextEditingController(text:'');
    subjectFocus = FocusNode();
    message = TextEditingController(text:'');
    messageFocus = FocusNode();
    super.initState();
  }
  @override
  void dispose() {
    name.dispose();
    nameFocus.dispose();
    email.dispose();
    emailFocus.dispose();
    subject.dispose();
    subjectFocus.dispose();
    message.dispose();
    messageFocus.dispose();
    super.dispose();
  }

  void contact() {
    // check if any input field is empty
    // if so focus on that input field
    List target = [name, email, subject, message];
    List targetFocus = [nameFocus, emailFocus, subjectFocus, messageFocus];
    for(int i=0; i<target.length; i++) {
      if(target[i].text.isEmpty) {
        FocusScope.of(context).requestFocus(targetFocus[i]);
        return;
      }
    }
    html.window.open('mailto:a.flutter.dev@gmail.com?subject=${subject.text}&body=${message.text}&cc=${name.text}<${email.text}>', '_self');
    _formKey.currentState.reset();
  }

  List<Widget> get mobileVersion {
    return [
      Card(
        margin: EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        child: Padding(
          padding: EdgeInsets.only(left:16.0, top:16.0, right: 16.0),
          child: Column(
            children: [
              SelectableText('CONSTANTING', style: TextStyle(color: WebsiteColors.darkGrey, fontSize: 34, fontWeight: FontWeight.w400)),
              SelectableText('IT CONSULTING\nSOFTWARE DEVELOPMENT', style: TextStyle(color: WebsiteColors.lightGrey, fontSize: 20, fontWeight: FontWeight.w300), textAlign: TextAlign.center,),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: Stack(
                  fit: StackFit.loose,
                  alignment: AlignmentDirectional.center,
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: Padding(
                        padding: EdgeInsets.all(25.0),
                          child: CustomPaint(
                          painter: ConstantingLogo(),
                        ),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("images/overlay.png"), 
                            repeat: ImageRepeat.repeat,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Card(
        margin: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 20.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText('Contact', style: TextStyle(color: WebsiteColors.darkGrey, fontSize: 26, fontWeight: FontWeight.w400)),
              SizedBox(height: 25.0,),
              SelectableText('Get in touch with me using the email form below.', style: TextStyle(color: WebsiteColors.grey, fontSize: 14, fontWeight: FontWeight.w300), textAlign: TextAlign.center,),
              SizedBox(height: 25.0,),
              Divider(
                color: WebsiteColors.grey,
                thickness: 1.0,
              ),
              SizedBox(height: 15.0,),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: name,
                      focusNode: nameFocus,
                      decoration: InputDecoration(
                        hintText: 'Name',
                      ),
                    ),
                    SizedBox(height: 15.0,),
                    TextFormField(
                      controller: email,
                      focusNode: emailFocus,
                      decoration: InputDecoration(
                        hintText: 'Email',
                      ),
                    ),
                    SizedBox(height: 15.0,),
                    TextFormField(
                      controller: subject,
                      focusNode: subjectFocus,
                      decoration: InputDecoration(
                        hintText: 'Subject',
                      ),
                    ),
                    SizedBox(height: 15.0,),
                    TextFormField(
                      controller: message,
                      focusNode: messageFocus,
                      maxLines: 8,
                      decoration: InputDecoration(
                        hintText: 'Message'
                      ),
                    ),
                    SizedBox(height: 25.0,),
                    TextButton(
                      onPressed: () {

                      }, 
                      child: Container(
                        color: WebsiteColors.black,
                        alignment: Alignment.center,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(minWidth: double.infinity, minHeight:44),
                          child: Center(
                            child: Text('Send', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,)
                          ),
                        )
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    ];
  }

  List<Widget> get nonMobileVersion {
    return [
      Center(
        child: IndexedStack(
          sizing: StackFit.loose,
          index: selectedPage,
          alignment: AlignmentDirectional.topCenter,
          children: [
            Card(
              margin: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 20.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
              child: SizedBox(
                width: 900,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SelectableText('CONSTANTING', style: TextStyle(color: WebsiteColors.darkGrey, fontSize: 36, fontWeight: FontWeight.w400)),
                            SizedBox(height: 15.0,),
                            SelectableText('IT CONSULTING\nSOFTWARE DEVELOPMENT', style: TextStyle(color: WebsiteColors.lightGrey, fontSize: 24, fontWeight: FontWeight.w300), textAlign: TextAlign.left,),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 400,
                      height: 400,
                      child: Stack(
                        fit: StackFit.loose,
                        alignment: AlignmentDirectional.center,
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: Padding(
                              padding: EdgeInsets.all(25.0),
                                child: CustomPaint(
                                painter: ConstantingLogo(),
                              ),
                            ),
                          ),
                          AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/overlay.png"), 
                                  repeat: ImageRepeat.repeat,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 160,
                            child: Container(
                              height: 80, 
                              width: 80, 
                              color: Colors.black54,
                              child: IconButton(icon: Icon(Icons.arrow_forward_ios, color: Colors.white,), iconSize: 40, onPressed: () {
                                setState(() {
                                  selectedPage = 1;
                                });
                              }, tooltip: 'Contact', splashColor: Colors.transparent, hoverColor: Colors.transparent, highlightColor: Colors.transparent,),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 20.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 860,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText('Contact', style: TextStyle(color: WebsiteColors.darkGrey, fontSize: 26, fontWeight: FontWeight.w400)),
                      SizedBox(height: 25.0,),
                      SelectableText('Get in touch with me using the email form below.', style: TextStyle(color: WebsiteColors.grey, fontSize: 14, fontWeight: FontWeight.w300), textAlign: TextAlign.center,),
                      SizedBox(height: 25.0,),
                      Divider(
                        color: WebsiteColors.grey,
                        thickness: 1.0,
                      ),
                      SizedBox(height: 15.0,),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: TextFormField(
                                    controller: name,
                                    focusNode: nameFocus,
                                    decoration: InputDecoration(
                                      hintText: 'Name',
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15.0,),
                                Flexible(
                                  flex: 1,
                                  child: TextFormField(
                                    controller: email,
                                    focusNode: emailFocus,
                                    decoration: InputDecoration(
                                      hintText: 'Email',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15.0,),
                            TextFormField(
                              controller: subject,
                              focusNode: subjectFocus,
                              decoration: InputDecoration(
                                hintText: 'Subject',
                              ),
                            ),
                            SizedBox(height: 15.0,),
                            TextFormField(
                              controller: message,
                              focusNode: messageFocus,
                              maxLines: 8,
                              decoration: InputDecoration(
                                hintText: 'Message'
                              ),
                            ),
                            SizedBox(height: 25.0,),
                            TextButton(
                              onPressed: () {
                                contact();
                              }, 
                              child: Container(
                                color: WebsiteColors.black,
                                alignment: Alignment.center,
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints(minWidth: 200, minHeight:44),
                                  child: Center(
                                    child: Text('Send', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,)
                                  ),
                                )
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ]
        ),
      ),
    ];
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MediaQuery.of(context).size.width<736?null:SizedBox(height: 200,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(icon: Icon(ConstantingIcons.logo, color: selectedPage==1?WebsiteColors.white:Colors.white,), iconSize: 40, onPressed: () {
                    setState(() {
                      selectedPage = 0;
                    });
                  }, tooltip: 'Home', splashColor: Colors.transparent, hoverColor: Colors.transparent, highlightColor: Colors.transparent,),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(icon: Icon(ConstantingIcons.envelope, color: selectedPage==0?WebsiteColors.white:Colors.white,), iconSize: 50, onPressed: () {
                    setState(() {
                      selectedPage = 1;
                    });
                  }, tooltip: 'Contact', splashColor: Colors.transparent, hoverColor: Colors.transparent, highlightColor: Colors.transparent,),
                ],
              ),
              //...((MediaQuery.of(context).size.width<736) ? mobileVersion : [Container()]),
              if(MediaQuery.of(context).size.width<736)
                ...mobileVersion
              else
                ...nonMobileVersion,
              SizedBox(
                height: 10,
              ),
              SelectableText('© CONSTANTING, ${DateTime.now().year}', 
                style: TextStyle(color: WebsiteColors.white, fontSize: 11),
              ),
              SizedBox(
                height: 40,
              ),
            ].where(Utils.notNull).toList(),
          ),
        ),
      ),
    );
  }
}

class WebsiteColors {
  static const white = const Color(0xaaffffff);
  static const darkGrey = const Color(0xff363636);
  static const grey = const Color(0xff777777);
  static const lightGrey = const Color(0xffaaaaaa);
  static const black = const Color(0xff222222);
  static const greyBackground = const Color(0xfffafafa);
  static const formBackground = const Color(0xfff4f4f4);
}

class Utils {
  static bool notNull(Object o) => o != null;
}