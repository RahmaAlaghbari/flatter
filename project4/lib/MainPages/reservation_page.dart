import 'package:flutter/material.dart';

class ReservationPage extends StatefulWidget {
  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  DateTime fromDate = DateTime.now(); // Initialize with default value
  DateTime toDate = DateTime.now(); // Initialize with default value
  TimeOfDay selectedTime = TimeOfDay.now(); // Initialize with default value

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (pickedDate != null) {
      setState(() {
        if (isFromDate) {
          fromDate = pickedDate;
        } else {
          toDate = pickedDate;
        }
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date Range',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Select a date range for your reservation:',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 40.0),
            InkWell(
              onTap: () {
                _selectDate(context, true);
              },
              child: TextFormField(
                enabled: false,
                decoration: InputDecoration(
                  labelText: fromDate != null
                      ? 'From: ${fromDate.day}/${fromDate.month}/${fromDate.year}'
                      : 'Select From Date',
                  prefixIcon: Icon(Icons.calendar_today),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            InkWell(
              onTap: () {
                _selectDate(context, false);
              },
              child: TextFormField(
                enabled: false,
                decoration: InputDecoration(
                  labelText: toDate != null
                      ? 'To: ${toDate.day}/${toDate.month}/${toDate.year}'
                      : 'Select To Date',
                  prefixIcon: Icon(Icons.calendar_today),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.0),
            Text(
              'Time',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Select a time for your reservation:',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 40.0),
            InkWell(
              onTap: () {
                _selectTime(context);
              },
              child: TextFormField(
                enabled: false,
                decoration: InputDecoration(
                  labelText: selectedTime != null
                      ? '${selectedTime.hour}:${selectedTime.minute}'
                      : 'Select Time',
                  prefixIcon: Icon(Icons.access_time),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.0),
            Text(
              'Number of Guests',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Enter the number of guests for your reservation:',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 40.0),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Number of Guests',
                prefixIcon: Icon(Icons.group),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                // Add your number of guests logic here
                print('Number of guests: $value');
              },
            ),
            SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                // Add your reservation submission logic here
                print('Submit Reservation button pressed');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                minimumSize: Size(400, 40),
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: Text(
                'Submit Reservation',
                style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              ),

            ),

          ],
        ),
      ),
    );
  }
}