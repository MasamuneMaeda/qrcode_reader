import 'package:flutter/cupertino.dart';

class GeneratorPageView extends StatelessWidget {
  const GeneratorPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('QRコードを生成する')),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('QRコードを生成する')],
        ),
      ),
    );
  }
}
