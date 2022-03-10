part of shudhta;

class BookDiagnostics extends StatefulWidget {
  BookDiagnostics({Key? key}) : super(key: key);
  final BeautyParlourController beautyParlourController =
      Get.find<BeautyParlourController>();
  @override
  _BookDiagnosticsState createState() => _BookDiagnosticsState();
}

class _BookDiagnosticsState extends State<BookDiagnostics> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'Book Diagnosis',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
                "Book your diagnosis time slot, our executive will come to your office and Collect your sample",
                style: TextStyle(
                  fontSize: 18,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Selected Date: ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700)),
                    Text('${DateFormat('yMMMEd').format(selectedDate)}',
                        style: TextStyle(fontSize: 16)),
                  ],
                ),
                OutlinedButton(
                    onPressed: () async {
                      DateTime? date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 30)));
                      if (date != null) {
                        setState(() {
                          selectedDate = date;
                        });
                      }
                    },
                    child: Text('Change'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Selected Time: ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700)),
                    Text('${selectedTime.format(context)}',
                        style: TextStyle(fontSize: 16)),
                  ],
                ),
                OutlinedButton(
                    onPressed: () async {
                      TimeOfDay? time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (time != null) {
                        setState(() {
                          selectedTime = time;
                        });
                      }
                    },
                    child: Text('Change'))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              "Select your location for sample collection",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.grey.shade200),
              child: Center(child: Text('unable to load map'))),
          SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  widget.beautyParlourController
                      .bookDiagnosis(selectedDate, selectedTime, 0, 0);
                },
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Center(
                        child: Text(
                      "Pay and Book (Rs ${widget.beautyParlourController.totalPrice})",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )))),
          )
        ],
      ),
    ));
  }
}
