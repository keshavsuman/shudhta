part of shudhta;

class ShudhtaAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  const ShudhtaAppBar({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1.0,
      leading: Container(),
      backgroundColor: Colors.white,
      title: Text(
        title ?? '',
        style: TextStyle(fontSize: 20, color: Colors.amber),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.shopping_cart,
            color: Colors.amber,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
