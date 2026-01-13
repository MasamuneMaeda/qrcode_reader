import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/widgets.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';

class ImageService {
  ImageService._privateConstructor();

  static final ImageService _instance = ImageService._privateConstructor();

  factory ImageService() {
    return _instance;
  }

  /// QRコード画像をギャラリーに保存
  Future<bool> saveQRCode(
    BuildContext context,
    Uint8List imageBytes,
    String fileName,
  ) async {
    try {
      // 権限のリクエスト
      final PermissionState status =
          await PhotoManager.requestPermissionExtend();

      if (!status.isAuth) {
        showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: Text('エラー'),
            content: Text('写真ライブラリへのアクセスが拒否されました'),
            actions: [
              CupertinoDialogAction(
                child: Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
        return false;
      }

      // 一時ディレクトリに保存
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/$fileName');
      await file.writeAsBytes(imageBytes);
      // ギャラリーに保存
      await PhotoManager.editor.saveImageWithPath(file.path, title: fileName);
      // 一時ファイルを削除
      await file.delete();

      return true;
    } catch (e) {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text('エラー'),
          content: Text('画像保存に失敗しました: ${e.toString()}'),
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
      return false;
    }
  }

  /// 権限チェック
  Future<bool> checkPermission() async {
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    return ps.isAuth;
  }
}
