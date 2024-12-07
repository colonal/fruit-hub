part of 'navigation_bar_item.dart';

class _InActiveItem extends StatelessWidget {
  final BottomNavigationBarEntity item;
  const _InActiveItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SvgPicture.asset(item.inActiveImage),
      ),
    );
  }
}
