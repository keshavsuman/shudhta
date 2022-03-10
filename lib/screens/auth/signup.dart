part of shudhta;

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);
  final AuthController authController = Get.find<AuthController>();
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _contactNoController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    WaveHeader(
                      title: "Welcome to Shudhta",
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 38),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: SizedBox(
                                height: 20,
                              ),
                            ),
                            Center(
                              child: Text(
                                'Signup to continue',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Column(
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Mobile Number"),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Mobile Number"),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Mobile Number"),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Mobile Number"),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Obx(() => widget.authController._isLoading.isTrue
                                ? Center(child: CircularProgressIndicator())
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                        style: buttonStyle,
                                        onPressed: () {
                                          Navigator.pushNamed(context, '/otp',
                                              arguments: "login");
                                        },
                                        child: Container(
                                            width: Get.width * 0.8,
                                            child: Center(
                                                child: Text("Get OTP")))),
                                  )),
                            SizedBox(
                              height: 20,
                            ),
                            // SocialLoginWidget(),
                            Expanded(
                              child: SizedBox(
                                height: 20,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ));
  }
}
