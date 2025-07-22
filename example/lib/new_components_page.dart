import 'package:cirrus/cirrus.dart';
import 'package:flutter/material.dart';

class NewComponentsPage extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const NewComponentsPage({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<NewComponentsPage> createState() => _NewComponentsPageState();
}

class _NewComponentsPageState extends State<NewComponentsPage> {
  int _navRailIndex = 0;
  String _selectedSegment = 'discover';
  bool _showBanner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          CirrusNavigationRail(
            selectedIndex: _navRailIndex,
            onDestinationSelected: (index) {
              setState(() {
                _navRailIndex = index;
              });
            },
            leading: CirrusIconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
              tooltip: '菜单',
            ),
            destinations: const [
              CirrusNavigationRailDestination(
                icon: Icons.explore_outlined,
                selectedIcon: Icons.explore,
                label: '发现',
              ),
              CirrusNavigationRailDestination(
                icon: Icons.favorite_border,
                selectedIcon: Icons.favorite,
                label: '主页',
              ),
              CirrusNavigationRailDestination(
                icon: Icons.settings_outlined,
                selectedIcon: Icons.settings,
                label: '设置',
              ),
            ],
          ),
          Expanded(
            child: Scaffold(
              appBar: CirrusAppBar(
                title: const Text('新组件展示'),
                actions: [
                  CirrusIconButton(
                    tooltip: '切换主题',
                    icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
                    onPressed: () => widget.onThemeChanged(!widget.isDarkMode),
                  ),
                ],
              ),
              body: ListView(
                padding: const EdgeInsets.all(24.0),
                children: [
                  if (_showBanner)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: CirrusBanner(
                        content: const Text('这是一条重要消息，请在下方采取行动。'),
                        leading: const Icon(Icons.info_outline),
                        actions: [
                          TextButton(
                            onPressed: () => setState(() => _showBanner = false),
                            child: const Text('忽略'),
                          ),
                          TextButton(
                            onPressed: () => setState(() => _showBanner = false),
                            child: const Text('操作'),
                          ),
                        ],
                      ),
                    ),
                  _buildSectionTitle('横幅'),
                  Center(
                    child: CirrusButton(
                      child: Text(_showBanner ? '隐藏横幅' : '显示横幅'),
                      onPressed: () => setState(() => _showBanner = !_showBanner),
                    ),
                  ),
                  const SizedBox(height: 32),
                  _buildSectionTitle('分段控件'),
                  CirrusSegmentedControl<String>(
                    selectedValue: _selectedSegment,
                    onValueChanged: (value) => setState(() => _selectedSegment = value),
                    options: const [
                      SegmentedControlOption(label: '发现', value: 'discover'),
                      SegmentedControlOption(label: '关注', value: 'following'),
                      SegmentedControlOption(label: '为你推荐', value: 'foryou'),
                    ],
                  ),
                  const SizedBox(height: 32),
                  _buildSectionTitle('底部动作条'),
                  Center(
                    child: CirrusButton(
                      child: const Text('显示底部动作条'),
                      onPressed: () {
                        showCirrusBottomSheet(
                          context: context,
                          children: [
                            CirrusListTile(
                              leading: const Icon(Icons.share),
                              title: const Text('分享'),
                              onTap: () => Navigator.pop(context),
                            ),
                            CirrusListTile(
                              leading: const Icon(Icons.copy),
                              title: const Text('复制链接'),
                              onTap: () => Navigator.pop(context),
                            ),
                            CirrusListTile(
                              leading: const Icon(Icons.edit),
                              title: const Text('编辑'),
                              onTap: () => Navigator.pop(context),
                            ),
                            CirrusListTile(
                              leading: const Icon(Icons.delete, color: Colors.red),
                              title: const Text('删除', style: TextStyle(color: Colors.red)),
                              onTap: () => Navigator.pop(context),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 32),
                  _buildSectionTitle('可展开列表'),
                  const CirrusExpansionTile(
                    leading: Text('01'),
                    title: Text('第一项'),
                    children: [
                      CirrusListTile(title: Text('子项目 A')),
                      CirrusListTile(title: Text('子项目 B')),
                    ],
                  ),
                  const Divider(),
                  const CirrusExpansionTile(
                    leading: Icon(Icons.analytics_outlined),
                    title: Text('第二项'),
                    initiallyExpanded: true,
                    children: [
                      CirrusListTile(title: Text('子项目 C')),
                      CirrusListTile(title: Text('子项目 D')),
                      CirrusListTile(title: Text('子项目 E')),
                    ],
                  ),
                  const Divider(),
                  const CirrusExpansionTile(
                    title: Text('第三项（无前缀）'),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('这里可以放置任何自定义内容。'),
                      )
                    ],
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
