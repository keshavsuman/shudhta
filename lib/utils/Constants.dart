part of ecommerce;

const String ROOT_URL = "http://localhost:8000/api/";
const Color PRIMARY_COLOR = Color(0xFF7694C6);
const Color SECONDARY_COLOR = Color(0xFFFFC107);
const Color ACCENT_COLOR = Color(0xFFFFC107);
final TextStyle PRIMARY_TEXT_STYLE = TextStyle(
  // color: Colors.white,
  fontSize: 20.0,
  fontWeight: FontWeight.w600,
);

final TextStyle SECONDARY_TEXT_STYLE = TextStyle(
  fontSize: 18.0,
  // fontWeight: FontWeight.w600,
);
final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
  primary: PRIMARY_COLOR,
  elevation: 5.0,
  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
  ),
);
