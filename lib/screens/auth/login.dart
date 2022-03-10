part of shudhta;

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);
  final AuthController authController = Get.put(AuthController());
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                                'Login to continue',
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
                            SafeArea(
                              child: Center(
                                child: Wrap(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        'don\'t have an account',
                                        style: TextStyle(
                                          color: Color(0xffbcbcbc),
                                          fontSize: 12,
                                          fontFamily: 'NunitoSans',
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      borderRadius: BorderRadius.circular(2),
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamed('/signup');
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Text(
                                          'Register now',
                                          style: Theme.of(context)
                                              .textTheme
                                              .button!
                                              .copyWith(fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
