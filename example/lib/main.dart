import 'dart:math';

import 'package:flutter/material.dart';
import 'package:admanager_web/admanager_web.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the AdManager package
  AdManagerWeb.init();

  // Run the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AdManager Web Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'AdManager Web Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> content = [
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Click + button to add content and AD example"),
        ),
      ],
    )
  ];

  void _addMoreContent() {
    List<Widget> newContent = [];

    // Texts to randomize the content
    List<String> lorem = [
      "Nisi meatball commodo in lorem frankfurter.  Salami brisket nulla chuck bacon excepteur cupidatat elit quis.  Est dolore ut turducken.  Picanha ut salami in commodo labore tenderloin shank in pancetta tri-tip do ball tip nostrud ut.  Sed ullamco turducken, swine alcatra flank irure hamburger sint fugiat qui corned beef.  Andouille qui ball tip sed.",
      "Cow cupim cillum, short ribs anim prosciutto proident leberkas.  Laborum bresaola commodo sed doner dolore, non ground round adipisicing frankfurter.  Ad prosciutto ribeye, meatball burgdoggen adipisicing ut cow porchetta shank pariatur sunt ham hock.  Beef ribs cow deserunt cillum ut in landjaeger cupidatat prosciutto pork.  In tenderloin short ribs ipsum sunt, t-bone tail jerky pork landjaeger venison sirloin cupidatat aliqua.  Elit tri-tip duis jowl doner salami culpa sint short loin commodo sunt ground round.  Nulla est mollit esse dolore, kevin ipsum meatloaf short ribs dolore beef ribs short loin culpa landjaeger venison.",
      "Ex cow laboris hamburger, chislic ullamco occaecat eiusmod doner commodo tongue in cillum irure.  Occaecat swine excepteur chicken in culpa, in corned beef pork chop anim dolore.  Do ham hock salami minim sint.  Shank pastrami bacon elit esse.",
      "Beef ribs dolor biltong burgdoggen, sunt esse pork.  Kielbasa ullamco alcatra short ribs consectetur swine.  Capicola ham hock chuck cupim, burgdoggen incididunt rump sint exercitation brisket flank boudin shoulder jowl et.  Sunt biltong ground round buffalo magna ball tip fugiat pariatur alcatra lorem cow pork aliqua eiusmod t-bone.  Drumstick pork ea, officia ipsum spare ribs dolor lorem kevin velit bacon swine shankle boudin occaecat.  Adipisicing swine ground round officia dolore lorem.  Duis laboris hamburger exercitation, alcatra voluptate jowl mollit occaecat corned beef short ribs qui pancetta.",
      "Prosciutto occaecat laborum flank nisi pork loin est tongue officia lorem jerky andouille drumstick cow do.  Quis boudin pastrami tail nostrud cow ball tip buffalo pork salami shoulder enim rump nisi.  Sunt ut pork belly anim, et ut meatball do fatback ad nostrud porchetta.  Prosciutto meatball chislic excepteur nisi salami fatback lorem capicola cillum.  Aute biltong alcatra, minim do non andouille ad tail occaecat ham hock mollit beef ribs.  Voluptate sausage cupim do jerky id.  Ball tip tempor pork belly, nisi esse cupidatat fatback dolor quis prosciutto occaecat porchetta pig reprehenderit."
    ];

    // Add lorem text
    newContent.add(
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(lorem[Random().nextInt(lorem.length)]),
      ),
    );

    // Add Ad from AdManager using the AdManager package
    newContent.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: AdBlock(
        size: AdBlockSize.mediumRectangle,
        adUnitId: "/6355419/Travel/Europe",
      ),
    ));

    setState(() {
      content.addAll(newContent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: content,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addMoreContent,
        tooltip: 'Add Content',
        child: const Icon(Icons.add),
      ),
    );
  }
}
