part of shudhta;

class OTPPage extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();
  final TextEditingController _otpController = TextEditingController();
  final String type;
  OTPPage(this.type);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Stack(
                      children: <Widget>[
                        WaveHeader(
                          title: 'Welcome to shudhta',
                        ),
                        Theme(
                          data: ThemeData(
                            appBarTheme: AppBarTheme(
                              iconTheme: IconThemeData(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          child: AppBar(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                              height: 20,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 38),
                            child: Center(
                              child: Text(
                                'Enter OTP to continue',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 20),
                            child: TextFormField(
                              decoration: InputDecoration(hintText: 'OTP'),
                              controller: _otpController,
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 38),
                            child: Obx(() => _authController._isLoading.isFalse
                                ? ElevatedButton(
                                    style: buttonStyle,
                                    onPressed: () {},
                                    child: Container(
                                        width: Get.width * 0.8,
                                        child: Center(child: Text("Get OTP"))))
                                : Center(child: CircularProgressIndicator())),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 20,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
