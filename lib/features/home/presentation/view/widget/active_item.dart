part of 'navigation_bar_item.dart';

class _ActiveItem extends StatelessWidget {
  final BottomNavigationBarEntity item;
  const _ActiveItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(child: SvgPicture.asset(item.activeImage)),
            ),
            const SizedBox(width: 4),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 11),
              child: Text(
                item.name,
                style: TextStyles.semiBold11.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
