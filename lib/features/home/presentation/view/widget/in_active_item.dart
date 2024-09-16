part of 'navigation_bar_item.dart';

class _InActiveItem extends StatelessWidget {
  final BottomNavigationBarEntity item;
  const _InActiveItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(item.inActiveImage);
  }
}
