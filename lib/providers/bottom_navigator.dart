import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_bottomnav/pages/achivements/third_page.dart';
import 'package:riverpod_bottomnav/pages/settings/second_page.dart';
import 'package:riverpod_bottomnav/pages/top/top_page.dart';
import 'package:riverpod_bottomnav/utils/util.dart';

final _bottomNavigatorProvider = StateNotifierProvider<_BottomNavigationProvider, PageType>(
  (ref) => _BottomNavigationProvider(),
);

enum PageType {
  top,
  second,
  third,
}

class _BottomNavigationProvider extends StateNotifier<PageType> {
  _BottomNavigationProvider() : super(PageType.top);

  void routePage(PageType pageType) {
    state = pageType;
  }
}

@immutable
class BottomNavigationBarView extends ConsumerWidget {
  BottomNavigationBarView({Key? key}) : super(key: key);

  static String routeName = '/';

  final List<Widget> _pageList = <Widget>[
    const TopPage(),
    const SecondPage(),
    const ThirdPage(),
  ];

  final _tabItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.one_k),
      label: 'TOP',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.two_k),
      label: 'SECOND',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.three_k),
      label: 'THIRD',
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(_bottomNavigatorProvider);
    final notifier = ref.read(_bottomNavigatorProvider.notifier);
    return Scaffold(
      body: _pageList[state.index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: _tabItems,
        onTap: (int selectIndex) {
          logger.info(selectIndex);
          notifier.routePage(PageType.values[selectIndex]);
        },
        currentIndex: state.index,
      ),
    );
  }
}
