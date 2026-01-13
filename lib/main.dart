import 'package:flutter/cupertino.dart';
import 'package:qrcode_reader/pages/qrcode_reader.dart';
import 'package:qrcode_reader/pages/qrcode_generate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'QRcode',
      theme: CupertinoThemeData(primaryColor: CupertinoColors.activeBlue),
      home: const MyHomePage(title: '備品管理_QRコードリーダー'),
    );
  }
}

void gotoReaderPage(BuildContext context) {
  Navigator.push(
    context,
    CupertinoPageRoute(builder: (context) => const ReaderPageView()),
  );
}

void gotoGeneratorPage(BuildContext context) {
  Navigator.push(
    context,
    CupertinoPageRoute(builder: (context) => GeneratorPageView()),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(widget.title)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 100,
          children: <Widget>[
            SizedBox(
              width: 350,
              height: 150,
              child: CupertinoButton(
                onPressed: () {
                  gotoReaderPage(context); // QRコードを読み取るページに遷移
                },
                color: CupertinoColors.activeBlue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    Icon(
                      CupertinoIcons.qrcode,
                      size: 80,
                      color: CupertinoColors.white,
                    ),
                    Text(
                      'QRコードを読み取る',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 350,
              height: 150,
              child: CupertinoButton(
                onPressed: () {
                  gotoGeneratorPage(context); // QRコードを生成するページに遷移
                },
                color: CupertinoColors.activeBlue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 1,
                  children: [
                    Icon(
                      CupertinoIcons.add_circled,
                      size: 80,
                      color: CupertinoColors.white,
                    ),
                    const Text(
                      'QRコードを生成する',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
