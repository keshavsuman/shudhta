part of shudhta;

class Addresses extends StatefulWidget {
  const Addresses({Key? key}) : super(key: key);

  @override
  _AddressesState createState() => _AddressesState();
}

class _AddressesState extends State<Addresses> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: ShudhtaAppBar(),
      body: Column(),
    ));
  }
}
