# QR コードリーダー 📱

備品管理用の QR コード読み取り・生成アプリケーション

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.9.2-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.9.2-0175C2?logo=dart)
![iOS](https://img.shields.io/badge/iOS-13.0+-000000?logo=apple)
![Android](https://img.shields.io/badge/Android-5.0+-3DDC84?logo=android)

</div>

## 📖 概要

備品管理を効率化するための QR コード読み取り・生成アプリケーション。  
iOS 風の Cupertino デザインを採用し、直感的で使いやすい UI を提供します。

### ✨ 主な機能

| 機能                          | 説明                           | 状態        |
| ----------------------------- | ------------------------------ | ----------- |
| 🔍 **QR コード読み取り**      | カメラで QR コードをスキャン   | ✅ 実装済み |
| ➕ **QR コード生成**          | テキストから QR コードを作成   | ✅ 実装済み |
| 💾 **QR コード保存**          | 生成した QR コードを写真に保存 | ✅ 実装済み |
| 📱 **Cupertino デザイン**     | iOS 風の美しい UI              | ✅ 実装済み |
| 🌐 **マルチプラットフォーム** | iOS/Android/Web 対応           | ✅ 対応済み |

## 🎨 スクリーンショット

### ホーム画面

- QR コード読み取りボタン（青色の大きなボタン）
- QR コード生成ボタン（青色の大きなボタン）

### QR コード読み取り画面

- リアルタイムカメラプレビュー
- スキャンエリアのガイド表示
- 検出カウンター表示

### QR コード生成画面

- テキスト入力フィールド
- QR コードプレビュー（白背景）
- 写真ライブラリへの保存機能

## 🛠️ 技術スタック

### フレームワーク

- **Flutter** 3.9.2+
- **Dart** 3.9.2+

### 主要パッケージ

```yaml
dependencies:
  mobile_scanner: ^7.1.4 # QRコードスキャン
  qr_flutter: ^4.0.0 # QRコード生成
  photo_manager: ^3.8.3 # 写真ライブラリ管理
  path_provider: ^2.1.5 # ファイルパス取得
  cupertino_icons: ^1.0.8 # iOS風アイコン
```

### デザインシステム

- **Cupertino Design** - iOS ネイティブライクな UI/UX
- **カラースキーム** - Active Blue（システムブルー）

## 📁 プロジェクト構造

```
lib/
├── main.dart                    # アプリケーションエントリーポイント
├── pages/
│   ├── qrcode_reader.dart      # QRコード読み取り画面
│   └── qrcode_generate.dart    # QRコード生成画面
└── services/
    └── image_service.dart      # 画像保存サービス
```

## 🚀 セットアップ

### 前提条件

| 項目         | バージョン                   |
| ------------ | ---------------------------- |
| Flutter SDK  | 3.9.2 以上                   |
| Dart SDK     | 3.9.2 以上                   |
| iOS 開発     | Xcode + iOS 13.0 以上        |
| Android 開発 | Android Studio + API 21 以上 |

### インストール手順

```bash
# 1. リポジトリのクローン
git clone <repository-url>
cd qrcode_reader

# 2. 依存関係のインストール
flutter pub get

# 3. デバイスの確認
flutter devices

# 4. アプリの実行
flutter run

# または特定のデバイスで実行
flutter run -d <device-id>
```

### ⚙️ プラットフォーム別設定

#### iOS 設定

**必須の権限設定** - `ios/Runner/Info.plist`

```xml
<!-- カメラ権限 -->
<key>NSCameraUsageDescription</key>
<string>QRコードをスキャンするためにカメラを使用します</string>

<!-- 写真ライブラリ追加権限 -->
<key>NSPhotoLibraryAddUsageDescription</key>
<string>QRコードを写真ライブラリに保存するために、アクセス許可が必要です</string>

<!-- 写真ライブラリアクセス権限 -->
<key>NSPhotoLibraryUsageDescription</key>
<string>QRコードを保存するために、写真ライブラリへのアクセスが必要です</string>
```

**最低バージョン**: iOS 13.0 以上  
**対応デバイス**: iPhone、iPad

#### Android 設定

**必須の権限設定** - `android/app/src/main/AndroidManifest.xml`

```xml
<!-- カメラ権限 -->
<uses-permission android:name="android.permission.CAMERA"/>
<uses-feature android:name="android.hardware.camera" android:required="false"/>

<!-- ストレージ権限（写真保存用） -->
<uses-permission android:name="android.permission.READ_MEDIA_IMAGES"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" android:maxSdkVersion="32"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" android:maxSdkVersion="32"/>
```

**最低 SDK バージョン**: Android 5.0 (API 21)以上  
**推奨バージョン**: Android 13 (API 33)以上

## 🎯 使い方

### 📷 QR コードの読み取り

1. ホーム画面で「**QR コードを読み取る**」ボタンをタップ
2. カメラが起動（初回は権限許可が必要）
3. QR コードを白い枠内に合わせる
4. 自動的にスキャンされ、結果がダイアログで表示される
5. 「再スキャン」または「閉じる」を選択

**ポイント:**

- 📱 実機での使用を推奨（シミュレーターではカメラが使えない）
- 💡 暗い場所では画面右上のライトボタン（⚡）を使用
- 🎯 検出カウンターで読み取り動作を確認可能

### ✏️ QR コードの生成

1. ホーム画面で「**QR コードを生成する**」ボタンをタップ
2. テキスト入力欄に内容を入力（URL、テキストなど）
3. 「**生成する**」ボタンをタップ
4. QR コードが白い背景で表示される
5. 「**QR コードを保存**」ボタンで写真ライブラリに保存

**ポイント:**

- 💾 保存には写真ライブラリへのアクセス権限が必要
- ⏱️ 保存中はローディング表示
- ✅ 保存成功/失敗のフィードバックあり

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

### ✅ 完了済み

- [x] プロジェクトセットアップ
- [x] Cupertino デザインの実装
- [x] ホーム画面の UI
- [x] ページ遷移機能（CupertinoPageRoute）
- [x] QR コードスキャナーの統合（mobile_scanner）
- [x] QR コード読み取り機能（実機対応）
- [x] QR コード生成機能（qr_flutter）
- [x] QR コード保存機能（photo_manager）
- [x] カメラ権限管理
- [x] 写真ライブラリ権限管理
- [x] エラーハンドリング
- [x] ローディング表示

### 🚧 既知の制限事項

- iOS シミュレーターではカメラが使用不可（実機必須）
- Web 版では QR コード検出精度が低い（実機推奨）
- ダークモード未対応
- 多言語対応未実装（現在は日本語のみ）

### 🔮 今後の予定

- [ ] API 連携

## 🐛 トラブルシューティング

### よくある問題と解決策

#### ❌ アプリが異常終了する

**原因**: 権限設定が不足している  
**解決策**:

1. `ios/Runner/Info.plist`にカメラと写真の権限を追加
2. `android/app/src/main/AndroidManifest.xml`にカメラとストレージの権限を追加
3. アプリを完全に終了して再起動

```bash
flutter clean
flutter pub get
flutter run
```

#### 📷 カメラが起動しない

**原因**: シミュレーターで実行している  
**解決策**: 実機で実行してください

```bash
# 接続されたデバイスを確認
flutter devices

# 実機で実行
flutter run -d <device-id>
```

#### 🔍 QR コードが読み取れない

**原因**: Web 版またはカメラの初期化待ち  
**解決策**:

- 実機で実行（Web 版は検出精度が低い）
- QR コードをゆっくり動かす
- 明るい場所でテストする
- 検出カウンターが増えているか確認

#### 💾 QR コードが保存できない

**原因**: 写真ライブラリの権限が不足  
**解決策**:

1. 権限設定を確認（上記参照）
2. 設定アプリで写真へのアクセスを許可
3. アプリを再起動

#### 🏗️ ビルドエラー

**iOS**:

```bash
flutter clean
cd ios
pod deintegrate
pod install
cd ..
flutter run
```

**Android**:

```bash
flutter clean
cd android
./gradlew clean
cd ..
flutter run
```

#### 🔌 デバイスが見つからない

```bash
# Flutter環境の確認
flutter doctor -v

# iOSデバイスの確認
xcrun simctl list devices available

# Androidデバイスの確認
adb devices
```

## 📚 参考リソース

### 公式ドキュメント

- [Flutter 公式ドキュメント](https://docs.flutter.dev/)
- [Dart 言語ガイド](https://dart.dev/guides)
- [Cupertino Design Guidelines](https://docs.flutter.dev/ui/widgets/cupertino)

### 使用パッケージ

- [mobile_scanner](https://pub.dev/packages/mobile_scanner) - QR コードスキャン
- [qr_flutter](https://pub.dev/packages/qr_flutter) - QR コード生成
- [photo_manager](https://pub.dev/packages/photo_manager) - 写真管理
- [path_provider](https://pub.dev/packages/path_provider) - パス取得

### プロジェクト関連

- [PROJECT_GUIDE.md](PROJECT_GUIDE.md) - 詳細な開発指示書
- [BLoC パターンガイド](PROJECT_GUIDE.md#bloc) - 状態管理の参考

## 🤝 コントリビューション

このプロジェクトは現在プライベート開発中です。

### 開発に参加する場合

1. issue を作成して提案
2. フィーチャーブランチを作成
3. 変更をコミット
4. プルリクエストを作成

## 👤 作成者

**開発者**: 前田  
**作成日**: 2026 年 1 月  
**連絡先**: [リポジトリの issue](../../issues)

## 📝 変更履歴

### v1.0.0 (2026-01-13)

- ✅ 初回リリース
- ✅ Cupertino デザインの実装
- ✅ QR コードスキャン機能
- ✅ QR コード生成機能
- ✅ 写真ライブラリへの保存機能
- ✅ カメラ・写真権限管理
- ✅ エラーハンドリング実装

---

<div align="center">

**備品管理専用 QR コードアプリケーション**

Made with ❤️ using Flutter

</div>
