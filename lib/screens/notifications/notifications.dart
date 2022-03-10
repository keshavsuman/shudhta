part of shudhta;

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: ShudhtaDrawer(),
      appBar: ShudhtaAppBar(
        title: 'Notifications',
      ),
      body: Column(
        children: [NotificationTile()],
      ),
    ));
  }
}
