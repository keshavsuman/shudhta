part of shudhta;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: ShudhtaAppBar(
        title: 'My Profile',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 60,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Keshav suman',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            '+91 9602514096',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ],
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(boxShadow: []),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.location_on_outlined),
                                Text('Default Address'),
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Change address'),
                              Text('Add address')
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Divider(),
            ProfileItem(
              // leading: Icon(Icons.person),
              title: 'Edit profile',
              onTap: () {},
            ),
            ProfileItem(
              title: 'Shopping address',
              onTap: () {},
            ),
            ProfileItem(
              title: 'My orders',
              onTap: () {},
            ),
            ProfileItem(
              title: 'Wishlist',
              onTap: () {},
            ),
            ProfileItem(
              title: 'About us',
              onTap: () {},
            ),
            ProfileItem(
              title: 'Contact us',
              onTap: () {},
            ),
            ProfileItem(
              title: 'Rate us',
              onTap: () {},
            ),
            ProfileItem(
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
  final Icon? leading;
  final void Function() onTap;

  const ProfileItem(
      {Key? key, required this.title, this.leading, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
              color: PRIMARY_COLOR,
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
