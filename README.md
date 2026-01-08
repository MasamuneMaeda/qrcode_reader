# QR コードリーダー 📱

備品管理用の QR コード読み取り・生成アプリケーション

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.9.2-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.9.2-0175C2?logo=dart)
![License](https://img.shields.io/badge/license-Private-red)

</div>

## 📖 概要

このアプリケーションは、備品管理を効率化するための QR コードリーダー・ジェネレーターです。
iOS 風の Cupertino デザインを採用し、直感的で使いやすい UI を提供します。

### 主な機能

- 🔍 **QR コード読み取り** - カメラを使用して QR コードをスキャン
- ➕ **QR コード生成** - テキストから QR コードを作成
- 📱 **iOS 風デザイン** - Cupertino ウィジェットによる統一感のある UI
- 🚀 **クロスプラットフォーム** - iOS、Android、Web、デスクトップ対応

## 🎨 スクリーンショット

### ホーム画面

- QR コード読み取りボタン
- QR コード生成ボタン

## 🛠️ 技術スタック

### フレームワーク

- **Flutter** 3.9.2+
- **Dart** 3.9.2+

### 主要パッケージ

- `mobile_scanner` ^7.1.4 - QR コードスキャン機能
- `cupertino_icons` ^1.0.8 - iOS 風アイコン

### デザインシステム

- **Cupertino Design** - iOS ネイティブライクな UI/UX

## 📁 プロジェクト構造

```
lib/
├── main.dart                        # アプリケーションエントリーポイント
└── pages/
    ├── qrcode_reader.dart          # QRコード読み取り画面
    └── qrcode_generate.dart        # QRコード生成画面
```

## 🚀 セットアップ

### 前提条件

- Flutter SDK 3.9.2 以上
- Dart SDK 3.9.2 以上
- iOS 開発の場合: Xcode（最低 iOS 13.0 対応）
- Android 開発の場合: Android Studio

### インストール手順

1. **リポジトリのクローン**

```bash
git clone <repository-url>
cd qrcode_reader
```

2. **依存関係のインストール**

```bash
flutter pub get
```

3. **デバイスの確認**

```bash
flutter devices
```

4. **アプリの実行**

```bash
flutter run
```

### プラットフォーム別設定

#### iOS

**権限設定**: `ios/Runner/Info.plist`にカメラ権限を追加する必要があります：

```xml
<key>NSCameraUsageDescription</key>
<string>QRコードをスキャンするためにカメラへのアクセスが必要です</string>
```

**最低バージョン**: iOS 13.0 以上

#### Android

**権限設定**: `android/app/src/main/AndroidManifest.xml`にカメラ権限を追加する必要があります：

```xml
<uses-permission android:name="android.permission.CAMERA"/>
<uses-feature android:name="android.hardware.camera" android:required="false"/>
```

**最低 SDK バージョン**: Android 5.0 (API 21)以上

## 🎯 使い方

### QR コードの読み取り

1. ホーム画面で「QR コードを読み取る」ボタンをタップ
2. カメラが起動するので QR コードにかざす
3. 自動的にスキャンされ、結果が表示されます

### QR コードの生成

1. ホーム画面で「QR コードを生成する」ボタンをタップ
2. テキストを入力
3. QR コードが生成されます
4. 生成された QR コードを保存または共有できます

## 🧪 テスト

```bash
# すべてのテストを実行
flutter test

# カバレッジ付きでテスト実行
flutter test --coverage
```

## 🏗️ ビルド

### デバッグビルド

```bash
flutter run
```

### リリースビルド

**iOS**

```bash
flutter build ios --release
```

**Android APK**

```bash
flutter build apk --release
```

**Android App Bundle (Google Play 用)**

```bash
flutter build appbundle --release
```

**Web**

```bash
flutter build web --release
```

## 📋 開発ステータス

### 完了済み

- [x] プロジェクトセットアップ
- [x] Cupertino デザインの実装
- [x] ホーム画面の UI
- [x] ページ遷移機能
- [x] QR コードスキャナーの統合

### 進行中

- [ ] QR コード読み取り機能の実装
- [ ] QR コード生成機能の実装
- [ ] スキャン履歴機能
- [ ] データ永続化

### 今後の予定

- [ ] ダークモード対応
- [ ] 多言語対応（日本語・英語）
- [ ] QR コードの保存・共有機能
- [ ] 履歴検索・フィルタリング
- [ ] ユニットテスト・ウィジェットテスト

## 🐛 トラブルシューティング

### よくある問題

**問題**: カメラが起動しない

- **解決策**: プラットフォーム別の権限設定を確認してください

**問題**: iOS シミュレーターでビルドエラー

- **解決策**:
  ```bash
  flutter clean
  flutter pub get
  cd ios && pod install
  ```

**問題**: デバイスが見つからない

- **解決策**:
  ```bash
  flutter doctor -v
  xcrun simctl list devices available
  ```

## 📚 参考ドキュメント

- [Flutter 公式ドキュメント](https://docs.flutter.dev/)
- [Cupertino Design Guidelines](https://docs.flutter.dev/ui/widgets/cupertino)
- [mobile_scanner パッケージ](https://pub.dev/packages/mobile_scanner)
- [プロジェクト指示書](PROJECT_GUIDE.md)

## 🤝 貢献

このプロジェクトは現在プライベートです。

## 📄 ライセンス

このプロジェクトはプライベートライセンスです。

## 👤 作成者

開発者: 社内開発チーム  
作成日: 2026 年 1 月

## 📝 変更履歴

### v1.0.0 (2026-01-08)

- 初回リリース
- Cupertino デザインの実装
- 基本的なナビゲーション機能
- mobile_scanner の統合

---

**注意**: このアプリケーションは備品管理専用に開発されています。
