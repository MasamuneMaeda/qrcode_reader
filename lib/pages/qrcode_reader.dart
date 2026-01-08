import 'package:flutter/cupertino.dart';

class ReaderPageView extends StatelessWidget {
  const ReaderPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('QRコードを読み取る')),
      child: Center(child: Text('QRコードを読み取る')),
    );
  }
}
