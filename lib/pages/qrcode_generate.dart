import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrcode_reader/services/image_service.dart';
import 'dart:typed_data';

class GeneratorPageView extends StatefulWidget {
  const GeneratorPageView({super.key});
  @override
  State<GeneratorPageView> createState() => _GeneratorPageViewState();
}

class _GeneratorPageViewState extends State<GeneratorPageView> {
  final TextEditingController _controller = TextEditingController();
  String _qrCodeData = '';
  late final ImageService _imageService;
  final GlobalKey _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _imageService = ImageService();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _generateQRcode() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _qrCodeData = _controller.text;
      });
    } else {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text('エラー'),
          content: Text('文字または数字を入力してください'),
          actions: [
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }
  }

  Future<Uint8List?> _captureQRcode() async {
    try {
      // QRコードが生成されるまで少し待つ
      await Future.delayed(Duration(milliseconds: 100));

      RenderRepaintBoundary boundary =
          _globalKey.currentContext!.findRenderObject()
              as RenderRepaintBoundary;
      final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      final ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      return byteData?.buffer.asUint8List();
    } catch (e) {
      print('キャプチャエラー: $e');
      return null;
    }
  }

  void _saveQRcode() async {
    if (_qrCodeData.isEmpty) {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text('エラー'),
          content: Text('QRコードを生成してください'),
          actions: [
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
      return;
    }

    // ローディング表示
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: CupertinoColors.systemBackground,
            borderRadius: BorderRadius.circular(10),
          ),
          child: CupertinoActivityIndicator(radius: 20),
        ),
      ),
    );

    try {
      // QRコード画像をキャプチャ
      final imageBytes = await _captureQRcode();

      if (imageBytes == null || imageBytes.isEmpty) {
        Navigator.pop(context); // ローディングを閉じる
        throw Exception('画像のキャプチャに失敗しました');
      }

      // 画像を保存
      final success = await _imageService.saveQRCode(
        context,
        imageBytes,
        'qrcode_${DateTime.now().millisecondsSinceEpoch}.png',
      );

      Navigator.pop(context); // ローディングを閉じる

      // 結果を表示
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text(success ? '成功' : 'エラー'),
          content: Text(
            success ? 'QRコードを写真ライブラリに保存しました' : '保存に失敗しました。写真へのアクセス権限を確認してください。',
          ),
          actions: [
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    } catch (e) {
      Navigator.pop(context); // ローディングを閉じる
      // エラーダイアログを表示
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text('エラー'),
          content: Text('保存に失敗しました: ${e.toString()}'),
          actions: [
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('QRコードを生成する')),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 30,
              children: [
                const Text("生成したい文字または数字を入力してください"),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: CupertinoTextField(
                    controller: _controller,
                    placeholder: 'テキストを入力',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    decoration: BoxDecoration(
                      border: Border.all(color: CupertinoColors.activeBlue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                CupertinoButton.filled(
                  onPressed: _generateQRcode,
                  color: CupertinoColors.activeBlue,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    "生成する",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                RepaintBoundary(
                  key: _globalKey,
                  child: Container(
                    width: 300,
                    height: 300,
                    color: CupertinoColors.white,
                    child: _qrCodeData.isNotEmpty
                        ? QrImageView(
                            data: _qrCodeData,
                            version: QrVersions.auto,
                            size: 300.0,
                            backgroundColor: CupertinoColors.white,
                          )
                        : SizedBox.shrink(),
                  ),
                ),
                CupertinoButton.filled(
                  onPressed: _qrCodeData.isNotEmpty ? _saveQRcode : null,
                  color: _qrCodeData.isNotEmpty
                      ? CupertinoColors.activeBlue
                      : CupertinoColors.systemGrey,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'QRコードを保存',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
