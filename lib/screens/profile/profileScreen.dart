part of shudhta;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    size: 25,
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox()
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 70,
                  ),
                  Text(
                    'Keshav suman',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            Divider(),
            ProfileItem(
              leading: Icon(Icons.person),
              title: 'Edit profile',
              onTap: () {},
            ),
            ProfileItem(
              leading: Icon(Icons.location_city),
              title: 'Shopping address',
              onTap: () {},
            ),
            ProfileItem(
              leading: Icon(Icons.shopping_bag_outlined),
              title: 'My orders',
              onTap: () {},
            ),
            ProfileItem(
              leading: Icon(Icons.favorite),
              title: 'Wishlist',
              onTap: () {},
            ),
            ProfileItem(
              leading: Icon(Icons.person),
              title: 'About us',
              onTap: () {},
            ),
            ProfileItem(
              leading: Icon(Icons.person),
              title: 'Contact us',
              onTap: () {},
            ),
            ProfileItem(
              leading: Icon(Icons.person),
              title: 'Rate us',
              onTap: () {},
            ),
            ProfileItem(
              leading: Icon(Icons.person),
              title: 'Logout',
              onTap: () {},
            )
          ],
        ),
      ),
    ));
  }
}

class ProfileItem extends StatelessWidget {
  final String title;
  final Icon leading;
  final void Function() onTap;

  const ProfileItem(
      {Key? key,
      required this.title,
      required this.leading,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: leading,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 16, color: PRIMARY_COLOR),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
      ),
    );
  }
}
