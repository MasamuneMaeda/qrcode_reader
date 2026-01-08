# QR コードリーダー プロジェクト指示書

## 📋 プロジェクト概要

**プロジェクト名**: qrcode_reader  
**バージョン**: 1.0.0+1  
**説明**: QR コード読み取り機能を持つ Flutter アプリケーション（開発初期段階）  
**作成日**: 2026 年 1 月  
**Flutter SDK**: ^3.9.2

---

## 🎯 プロジェクトの目的

カメラを使用して QR コードを読み取り、その情報を処理・表示するクロスプラットフォームアプリケーションを開発する。

---

## 📁 現在のプロジェクト構造

```
qrcode_reader/
├── lib/
│   └── main.dart                 # メインアプリケーション（デフォルトのカウンターアプリ）
├── android/                      # Androidプラットフォーム設定
├── ios/                          # iOSプラットフォーム設定
├── web/                          # Webプラットフォーム設定
├── windows/                      # Windowsプラットフォーム設定
├── linux/                        # Linuxプラットフォーム設定
├── macos/                        # macOSプラットフォーム設定
├── test/                         # テストファイル
├── pubspec.yaml                  # 依存関係管理
└── README.md                     # プロジェクト説明
```

---

## 🔧 現在の技術スタック

### フレームワーク・言語

- **Flutter**: ^3.9.2
- **Dart**: ^3.9.2

### 依存パッケージ

- `cupertino_icons: ^1.0.8` - iOS スタイルのアイコン
- `flutter_lints: ^5.0.0` - Dart/Flutter のリントルール

### プラットフォーム対応

- ✅ Android
- ✅ iOS (最低バージョン: 13.0)
- ✅ Web
- ✅ Windows
- ✅ Linux
- ✅ macOS

---

## 🚀 開発ステータス

### 完了している項目

- [x] Flutter プロジェクトの初期セットアップ
- [x] マルチプラットフォーム設定（Android/iOS/Web/Desktop）
- [x] 基本的な Material Design テーマ設定

### 未実装の項目

- [ ] QR コードスキャン機能
- [ ] カメラ権限の取得
- [ ] スキャン結果の表示 UI
- [ ] スキャン履歴機能
- [ ] QR コード生成機能
- [ ] 状態管理の実装
- [ ] データ永続化
- [ ] エラーハンドリング
- [ ] ローカライゼーション（多言語対応）
- [ ] ユニットテスト・ウィジェットテスト

---

## 📝 推奨される実装計画

### フェーズ 1: 基本機能の実装

1. **QR コードスキャン機能**

   - 推奨パッケージ: `qr_code_scanner` または `mobile_scanner`
   - カメラプレビュー画面の実装
   - リアルタイムスキャン機能

2. **権限管理**

   - カメラ権限の要求と処理
   - 権限拒否時のエラーハンドリング
   - プラットフォーム別の権限設定
     - Android: `AndroidManifest.xml`に`CAMERA`権限追加
     - iOS: `Info.plist`に`NSCameraUsageDescription`追加

3. **結果表示 UI**
   - スキャン結果の表示画面
   - URL の場合はブラウザで開く機能
   - テキストのコピー機能

### フェーズ 2: 機能拡張

1. **状態管理の導入**

   - 推奨: Riverpod または BLoC パターン
   - スキャン状態の管理
   - エラー状態の管理

2. **データ永続化**

   - 推奨パッケージ: `shared_preferences` または `hive`
   - スキャン履歴の保存
   - 設定の保存

3. **スキャン履歴機能**
   - 履歴一覧画面
   - 履歴の検索・フィルタリング
   - 履歴の削除機能

### フェーズ 3: UX 改善

1. **QR コード生成機能**

   - 推奨パッケージ: `qr_flutter`
   - テキストから QR コード生成
   - 生成した QR コードの保存・共有

2. **UI/UX の向上**

   - ダークモード対応
   - アニメーション追加
   - スプラッシュ画面のカスタマイズ
   - アプリアイコンのカスタマイズ

3. **多言語対応**
   - 日本語・英語対応
   - `flutter_localizations`の導入

### フェーズ 4: テストとデプロイ

1. **テストの実装**

   - ユニットテスト
   - ウィジェットテスト
   - インテグレーションテスト

2. **デプロイ準備**
   - アプリアイコンの設定
   - スプラッシュ画面の設定
   - バンドル ID の設定
   - リリースビルドの最適化

---

## 🏗️ 推奨プロジェクト構造（リファクタリング後）

```
lib/
├── main.dart                     # アプリケーションエントリーポイント
├── core/                         # 共通機能
│   ├── constants/                # 定数定義
│   ├── themes/                   # テーマ設定
│   ├── utils/                    # ユーティリティ関数
│   └── extensions/               # 拡張メソッド
├── features/                     # 機能別ディレクトリ
│   ├── scanner/                  # QRコードスキャン機能
│   │   ├── presentation/
│   │   │   ├── pages/
│   │   │   │   └── scanner_page.dart
│   │   │   ├── widgets/
│   │   │   │   ├── camera_preview_widget.dart
│   │   │   │   └── scan_overlay_widget.dart
│   │   │   └── providers/       # Riverpodの場合
│   │   │       └── scanner_provider.dart
│   │   ├── domain/
│   │   │   ├── models/
│   │   │   │   └── scan_result.dart
│   │   │   └── repositories/
│   │   └── data/
│   │       └── repositories/
│   ├── history/                  # スキャン履歴機能
│   │   ├── presentation/
│   │   ├── domain/
│   │   └── data/
│   └── generator/                # QRコード生成機能
│       ├── presentation/
│       ├── domain/
│       └── data/
├── shared/                       # 共有ウィジェット
│   └── widgets/
└── l10n/                         # ローカライゼーション
```

---

## 🔑 必要な依存パッケージ（提案）

### QR コード関連

```yaml
dependencies:
  # QRコードスキャン
  mobile_scanner: ^5.0.0 # 最新のQRスキャナー（推奨）
  # または
  qr_code_scanner: ^1.0.1 # 代替案

  # QRコード生成
  qr_flutter: ^4.1.0
```

### 状態管理

```yaml
dependencies:
  # Riverpod（推奨）
  flutter_riverpod: ^2.5.0
  riverpod_annotation: ^2.3.0

  # または BLoC
  flutter_bloc: ^8.1.0
```

### データ永続化

```yaml
dependencies:
  shared_preferences: ^2.2.0 # 簡単なキー・バリュー保存
  hive: ^2.2.3 # より高度なローカルDB
  hive_flutter: ^1.1.0
```

### UI/UX

```yaml
dependencies:
  go_router: ^14.0.0 # ルーティング
  url_launcher: ^6.2.0 # URL起動
  share_plus: ^7.2.0 # 共有機能
  permission_handler: ^11.0.0 # 権限管理
```

### その他

```yaml
dependencies:
  intl: ^0.19.0 # 国際化
  flutter_localizations:
    sdk: flutter
```

---

## ⚙️ プラットフォーム別設定

### Android 設定

**ファイル**: `android/app/src/main/AndroidManifest.xml`

追加が必要な権限:

```xml
<uses-permission android:name="android.permission.CAMERA"/>
<uses-feature android:name="android.hardware.camera" android:required="false"/>
<uses-feature android:name="android.hardware.camera.autofocus" android:required="false"/>
```

**最低 SDK バージョン**: Android 5.0 (API 21)以上を推奨

### iOS 設定

**ファイル**: `ios/Runner/Info.plist`

追加が必要な権限:

```xml
<key>NSCameraUsageDescription</key>
<string>QRコードをスキャンするためにカメラへのアクセスが必要です</string>
```

**最低 iOS バージョン**: 13.0（現在設定済み）

### Web 設定

- カメラ API の使用には HTTPS が必要
- ブラウザの互換性を考慮

---

## 🎨 デザインガイドライン

### カラースキーム

- **プライマリーカラー**: Deep Purple（現在設定）
- **セカンダリーカラー**: 未設定（要検討）
- **ダークモード**: 未実装（実装推奨）

### UI コンポーネント

- Material Design 3 を使用（`useMaterial3: true`が推奨）
- iOS 風デザインが必要な場合は Cupertino Widget を活用

---

## 🧪 テスト戦略

### ユニットテスト

- ビジネスロジックのテスト
- モデルクラスのテスト
- ユーティリティ関数のテスト

### ウィジェットテスト

- 各ウィジェットの表示テスト
- ユーザーインタラクションのテスト

### インテグレーションテスト

- 画面遷移のテスト
- エンドツーエンドのシナリオテスト

---

## 📱 実行・ビルド手順

### 開発環境での実行

```bash
# 依存関係のインストール
flutter pub get

# デバイスの確認
flutter devices

# アプリの実行
flutter run

# 特定のデバイスで実行
flutter run -d <device-id>
```

### リリースビルド

```bash
# Android
flutter build apk --release         # APK
flutter build appbundle --release   # AAB（Google Play用）

# iOS
flutter build ios --release

# Web
flutter build web --release
```

### クリーンビルド

```bash
flutter clean
flutter pub get
flutter run
```

---

## 🐛 既知の問題

### シミュレーター関連

- **問題**: iOS シミュレーターが見つからない
- **解決策**:
  1. `xcrun simctl list devices available`で利用可能なデバイスを確認
  2. Xcode > Settings > Platforms から必要な iOS ランタイムをインストール
  3. `flutter doctor -v`で Flutter 環境を確認

---

## 📚 参考リソース

### Flutter 公式ドキュメント

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Language](https://dart.dev/)
- [Flutter Cookbook](https://docs.flutter.dev/cookbook)

### QR コード関連

- [mobile_scanner package](https://pub.dev/packages/mobile_scanner)
- [qr_flutter package](https://pub.dev/packages/qr_flutter)

### 状態管理

- [Riverpod Documentation](https://riverpod.dev/)
- [BLoC Documentation](https://bloclibrary.dev/)

---

## 🔄 開発ワークフロー

### Git ブランチ戦略（推奨）

```
main (production)
├── develop (開発)
    ├── feature/qr-scanner      # 機能開発
    ├── feature/history
    ├── feature/generator
    └── bugfix/camera-permission # バグ修正
```

### コミットメッセージ規約（推奨）

```
feat: 新機能追加
fix: バグ修正
docs: ドキュメント更新
style: コードフォーマット
refactor: リファクタリング
test: テスト追加・修正
chore: ビルド、設定ファイルの変更
```

---

## 👥 チーム開発時の注意事項

1. **コード規約**

   - `flutter_lints`のルールに従う
   - `analysis_options.yaml`でカスタムルールを設定可能

2. **コードレビュー**

   - プルリクエストベースの開発
   - 最低 1 人のレビューを必須とする

3. **ドキュメント**
   - コードコメントは日本語で OK
   - API ドキュメントは DartDoc で記述

---

## 🎯 次のステップ（優先順位順）

1. **QR スキャン機能の実装**

   - `mobile_scanner`パッケージの追加
   - スキャン画面の作成
   - カメラ権限の設定

2. **状態管理の導入**

   - Riverpod のセットアップ
   - プロバイダーの作成

3. **結果表示 UI の作成**

   - スキャン結果表示画面
   - URL 起動機能

4. **データ永続化**

   - スキャン履歴の保存
   - 履歴画面の作成

5. **テストの実装**
   - 基本的なテストケースの作成

---

## 📞 サポート・問い合わせ

### 開発環境の問題

- `flutter doctor -v`でシステム状態を確認
- 公式ドキュメントを参照
- Stack Overflow や GitHub Issues を検索

### プロジェクト固有の問題

- このドキュメントを参照
- チーム内で共有・相談

---

## 📝 変更履歴

| 日付       | バージョン | 変更内容                     |
| ---------- | ---------- | ---------------------------- |
| 2026-01-08 | 1.0.0      | プロジェクト指示書の初版作成 |

---

**最終更新**: 2026 年 1 月 8 日  
**作成者**: AI Assistant  
**プロジェクトステータス**: 開発初期段階
