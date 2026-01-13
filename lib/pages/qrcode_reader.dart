import 'package:flutter/cupertino.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ReaderPageView extends StatefulWidget {
  const ReaderPageView({super.key});

  @override
  State<ReaderPageView> createState() => _ReaderPageViewState();
}

class _ReaderPageViewState extends State<ReaderPageView> {
  final MobileScannerController controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates, // 重複検出を防ぐ
    facing: CameraFacing.back, // 背面カメラを使用
    torchEnabled: false,
  );

  String? scannedData;
  bool hasScanned = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    if (hasScanned) return; // 一度だけ検出

    final List<Barcode> barcodes = capture.barcodes;
    if (barcodes.isEmpty) return;

    final String? code = barcodes.first.rawValue;
    if (code == null) return;

    setState(() {
      scannedData = code;
      hasScanned = true;
    });

    debugPrint('QRコード検出: $code');

    // 結果を表示
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text('スキャン成功'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10),
            Text(code, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          CupertinoDialogAction(
            child: Text('コピー'),
            onPressed: () {
              // TODO: クリップボードにコピー
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            child: Text('再スキャン'),
            onPressed: () {
              setState(() {
                hasScanned = false;
                scannedData = null;
              });
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            child: Text('閉じる'),
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context); // スキャン画面も閉じる
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('QRコードを読み取る'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(
            controller.torchEnabled
                ? CupertinoIcons.bolt_fill
                : CupertinoIcons.bolt,
          ),
          onPressed: () {
            controller.toggleTorch();
            setState(() {});
          },
        ),
      ),
      child: Stack(
        children: [
          // カメラプレビュー
          MobileScanner(controller: controller, onDetect: _onDetect),

          // スキャンエリアのオーバーレイ
          Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: CupertinoColors.white, width: 3),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          // ガイドテキスト
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              margin: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: CupertinoColors.black.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                scannedData == null
                    ? 'QRコードを枠内に合わせてください'
                    : 'スキャン完了: $scannedData',
                style: TextStyle(color: CupertinoColors.white, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
