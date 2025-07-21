# Cirrus UI 系统

[![Pub Version](https://img.shields.io/pub/v/cirrus?style=flat-square)](https://pub.dev/packages/cirrus)
[![License](https://img.shields.io/github/license/your-username/cirrus?style=flat-square)](https://github.com/your-username/cirrus/blob/main/LICENSE)

---

[**English**](./README.md) | **中文**

Cirrus 是一套企业级的 Flutter UI 系统，其目标是成为标准 Material Design 库的强大替代品。我们以坚实的 Material 3 (M3) 为基础，但远不止于此——我们对其进行了大规模的重新设计、功能增强和组件扩展，旨在提供一套独特、自成体系且高度统一的设计语言，其灵感源于 EAuxiliary 应用的优雅风格。

我们的愿景是提供一个覆盖开发者所有需求的完整工具箱，带来开箱即用的卓越美学和更精致的开发体验。

## ✨ 核心哲学

- **超越 Material**: 我们不只是为 M3 设计主题，而是对其进行重构和升华。Cirrus 拥有自己独特的设计见解，并致力于覆盖所有常用组件。
- **设计驱动**: 每个组件都经过精心设计，注重细节、动画和交互，以实现优雅、现代的视觉效果。
- **开发者优先**: 提供简洁、直观且类型安全的 API，让构建复杂界面变得简单而愉悦。
- **开箱即用**: 内置统一的 `CirrusTheme`，默认启用 M3，无需任何额外配置即可获得最佳实践。

## 🚀 快速上手

### 安装

将以下依赖添加到您项目的 `pubspec.yaml` 文件中：

```yaml
dependencies:
  cirrus: ^0.0.1 # 请使用 pub.dev 上的最新版本
```

### 使用

首先，在您的 `MaterialApp` 中应用 `CirrusTheme`：

```dart
import 'package:cirrus/cirrus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 应用 Cirrus 统一主题
      theme: CirrusTheme.themeData,
      home: const HomePage(),
    );
  }
}
```

现在，您可以在应用的任何地方使用 Cirrus 组件了。

## 🤝 贡献

欢迎各种贡献、提交 issue 和功能请求！

## 📄 许可证

本项目采用 MIT 许可证。
