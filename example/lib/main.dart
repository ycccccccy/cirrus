import 'package:cirrus/cirrus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cirrus 组件展示',
      theme: CirrusTheme.themeData,
      darkTheme: CirrusTheme.darkThemeData,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: HomePage(
        onThemeChanged: (isDark) {
          setState(() {
            _isDarkMode = isDark;
          });
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final Function(bool) onThemeChanged;

  const HomePage({super.key, required this.onThemeChanged});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool _switchValue2 = false;
  final _textController = TextEditingController();
  late TabController _tabController;
  int _chipSelectedIndex = 0;
  double _sliderValue = 0.5;
  bool _checkboxValue = false;
  String _radioValue = 'A';
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _textController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final divider = Divider(
        height: 1,
        thickness: 0.5,
        color: Colors.grey.shade300,
        indent: 16,
        endIndent: 16);

    return Scaffold(
      appBar: const CirrusAppBar(
        title: Text('Cirrus 组件展示'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle('卡片 (CirrusCard)'),
          const CirrusCard(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('这是一个卡片组件，用于承载内容。'),
            ),
          ),
          const SizedBox(height: 24),
          _buildSectionTitle('按钮 (CirrusButton)'),
          Center(
            child: CirrusButton(
              onPressed: () {},
              child: const Text('确认操作'),
            ),
          ),
          const SizedBox(height: 24),
          _buildSectionTitle('列表项 (CirrusListTile) 和开关 (CirrusSwitch)'),
          CirrusCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                CirrusListTile(
                  title: const Text('夜间模式'),
                  subtitle: const Text('开启后将切换到暗色主题'),
                  trailing: CirrusSwitch(
                    value: _isDarkMode,
                    onChanged: (value) {
                      setState(() {
                        _isDarkMode = value;
                      });
                      widget.onThemeChanged(value);
                    },
                  ),
                ),
                divider,
                CirrusListTile(
                  title: const Text('自动更新'),
                  subtitle: const Text('自动下载并安装新版本'),
                  trailing: CirrusSwitch(
                    value: _switchValue2,
                    onChanged: (value) => setState(() => _switchValue2 = value),
                  ),
                ),
                divider,
                const CirrusListTile(
                  title: Text('账户信息'),
                  subtitle: Text('管理您的账户详情'),
                  trailing: Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _buildSectionTitle('文本输入框 (CirrusTextField)'),
          CirrusTextField(
            controller: _textController,
            hintText: '请输入您的姓名...',
          ),
          const SizedBox(height: 24),
          _buildSectionTitle('对话框 (CirrusDialog)'),
          Center(
            child: CirrusButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => CirrusDialog(
                    title: const Text('确认操作'),
                    content: const Text('您确定要继续吗？此操作无法撤销。'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('取消'),
                      ),
                      CirrusButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('确认'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('显示对话框'),
            ),
          ),
          const SizedBox(height: 24),
          _buildSectionTitle('标签页 (CirrusTabBar)'),
          CirrusTabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: '邮件'),
              Tab(text: '日历'),
              Tab(text: '设置'),
            ],
          ),
          const SizedBox(height: 24),
          _buildSectionTitle('标签 (CirrusChip)'),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0, // 增加行间距
            children: List<Widget>.generate(3, (index) {
              return CirrusChip(
                label: Text('选项 ${index + 1}'),
                isSelected: _chipSelectedIndex == index,
                onSelected: (selected) {
                  if (selected) {
                    setState(() => _chipSelectedIndex = index);
                  }
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          _buildSectionTitle('滑块 (CirrusSlider)'),
          CirrusSlider(
            value: _sliderValue,
            onChanged: (value) => setState(() => _sliderValue = value),
          ),
          const SizedBox(height: 24),
          _buildSectionTitle('工具提示 (CirrusTooltip) 和轻量提示 (CirrusSnackBar)'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CirrusTooltip(
                message: '这是一个工具提示',
                child: CirrusButton(
                  onPressed: () {},
                  child: const Text('长按查看提示'),
                ),
              ),
              const SizedBox(width: 16),
              CirrusButton(
                onPressed: () {
                  CirrusSnackBar.show(context, content: '这是一个轻量级提示');
                },
                child: const Text('显示轻量提示'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildSectionTitle('分割线 (CirrusDivider)'),
          const CirrusDivider(indent: 16, endIndent: 16),
          const SizedBox(height: 24),
          _buildSectionTitle('头像 (CirrusAvatar) 和徽标 (CirrusBadge)'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CirrusAvatar(initials: 'C'),
              CirrusBadge(
                label: '99+',
                child: CirrusButton(
                  onPressed: () {},
                  child: const Icon(Icons.notifications),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildSectionTitle('可展开列表 (CirrusExpansionTile)'),
          const CirrusExpansionTile(
            title: Text('点击展开查看更多'),
            children: [
              ListTile(title: Text('子项目 1')),
              ListTile(title: Text('子项目 2')),
            ],
          ),
          const SizedBox(height: 24),
          _buildSectionTitle('弹出菜单 (CirrusPopupMenuButton)'),
          Center(
            child: CirrusPopupMenuButton<String>(
              onSelected: (value) {
                CirrusSnackBar.show(context, content: '选择了: $value');
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'A',
                  child: Text('选项 A',
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge?.color)),
                ),
                PopupMenuItem(
                  value: 'B',
                  child: Text('选项 B',
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge?.color)),
                ),
              ],
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('显示菜单', style: TextStyle(color: Colors.white)),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_drop_down, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          _buildSectionTitle('复选框 (CirrusCheckbox)'),
          CirrusCheckbox(
            value: _checkboxValue,
            onChanged: (value) =>
                setState(() => _checkboxValue = value ?? false),
            title: '同意用户协议',
          ),
          const SizedBox(height: 24),
          _buildSectionTitle('单选按钮 (CirrusRadio)'),
          Column(
            children: [
              CirrusRadio<String>(
                value: 'A',
                groupValue: _radioValue,
                onChanged: (value) =>
                    setState(() => _radioValue = value ?? 'A'),
                title: '选项 A',
              ),
              CirrusRadio<String>(
                value: 'B',
                groupValue: _radioValue,
                onChanged: (value) =>
                    setState(() => _radioValue = value ?? 'A'),
                title: '选项 B',
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildSectionTitle('图标按钮 (CirrusIconButton)'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CirrusIconButton(
                onPressed: () => CirrusSnackBar.show(context, content: '点击了收藏'),
                icon: const Icon(Icons.favorite),
                tooltip: '收藏',
              ),
              CirrusIconButton(
                onPressed: () => CirrusSnackBar.show(context, content: '点击了分享'),
                icon: const Icon(Icons.share),
                tooltip: '分享',
              ),
              CirrusIconButton(
                onPressed: () => CirrusSnackBar.show(context, content: '点击了设置'),
                icon: const Icon(Icons.settings),
                tooltip: '设置',
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildSectionTitle('进度条 (CirrusProgressBar)'),
          Column(
            children: [
              const Text('线性进度条'),
              const SizedBox(height: 8),
              const CirrusProgressBar(),
              const SizedBox(height: 8),
              CirrusProgressBar(value: _sliderValue),
              const SizedBox(height: 16),
              const Text('圆形进度条'),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CirrusCircularProgressBar(),
                  CirrusCircularProgressBar(value: _sliderValue),
                ],
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: CirrusFloatingActionButton(
        onPressed: () => CirrusSnackBar.show(context, content: '点击了浮动按钮'),
        tooltip: '添加',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
