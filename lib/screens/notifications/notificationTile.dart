part of shudhta;

class NotificationTile extends StatefulWidget {
  const NotificationTile({Key? key}) : super(key: key);

  @override
  _NotificationTileState createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(Icons.notifications),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Notifications'),
              Text('2'),
            ],
          ),
        ],
      ),
    );
  }
}
