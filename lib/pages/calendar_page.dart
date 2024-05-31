import 'package:flutter/material.dart';
import 'package:learning_app/models/course.dart';
import 'package:learning_app/ui/courses/courses_manager.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarController _calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    final coursesManager = CoursesManager();
    return Scaffold(
      body: SfCalendar(
        view: CalendarView.month,
        allowedViews: [
          CalendarView.week,
        ],
        firstDayOfWeek: 1, // chọn ngày bắt đầu để hiển thị
        showNavigationArrow: true, // nút điều hướng
        monthViewSettings: MonthViewSettings(
          dayFormat: 'EEE', // hiển thị tên ngày với 3 chữ cái
          showTrailingAndLeadingDates: false, // xoá ngày của tháng trước và sau
          // showAgenda: true, // hiển thị lịch trình ở dưới
        ),
        allowViewNavigation: true, // chọn vào showAgenda sẽ hiển thị ngày
        // showDatePickerButton: true, // chọn ngày, tháng, năm
        timeSlotViewSettings: TimeSlotViewSettings(
          timeIntervalHeight: -1,
        ),
        headerStyle: CalendarHeaderStyle(
          textAlign: TextAlign.center,
          backgroundColor: Color.fromARGB(255, 198, 167, 251),
          textStyle: TextStyle(
            color: Colors.black,
          ),
        ),
        headerDateFormat: 'd / MMMM / y',
        controller: _calendarController,
        onTap: handleTap,
        dataSource: _getDataSource(coursesManager.items),
      ),
    );
  }

  void handleTap(CalendarTapDetails calendarTapDetails) {
    monthToDayTapped(calendarTapDetails);
    toMonthView(calendarTapDetails);
  }

  void monthToDayTapped(CalendarTapDetails calendarTapDetails) {
    if (_calendarController.view == CalendarView.month &&
        calendarTapDetails.targetElement == CalendarElement.calendarCell) {
      _calendarController.view = CalendarView.day;
    }
  }

  void toMonthView(CalendarTapDetails calendarTapDetails) {
    if (calendarTapDetails.targetElement == CalendarElement.header) {
      _calendarController.view = CalendarView.month;
    }
  }

  // _AppointmentDataSource _getDataSource() {
  //   List<Appointment> appointments = <Appointment>[];
  //   appointments.add(Appointment(
  //     startTime: DateTime.now(),
  //     endTime: DateTime.now().add(Duration(minutes: 10)),
  //     subject: 'Meeting',
  //     color: Colors.blue,
  //     startTimeZone: '',
  //     endTimeZone: '',
  //   ));

  //   return _AppointmentDataSource(appointments);
  // }

  // void initState() {
  //   super.initState();
  //   _fetchAndSortCourses();
  // }

  // void _fetchAndSortCourses() {
  //   List<Course> fetchedCourses = [];

  //   _courses = geneticAlgorithn(fetchedCourses);

  //   setState(() {

  //   });
  // }

  // // Hàm để tạo data source cho lịch trình
  _AppointmentDataSource _getDataSource(List<Course> courses) {
    List<Appointment> appointments = <Appointment>[];
    for (var course in courses) {
      Duration startTimeDuration = Duration(
          hours: course.startTime.hour, minutes: course.startTime.minute);
      Duration endTimeDuration =
          Duration(hours: course.endTime.hour, minutes: course.endTime.minute);
      // Tạo một Appointment từ thông tin của mỗi Course
      Appointment appointment = Appointment(
        startTime: DateTime.now()
            .subtract(Duration(
                days: DateTime.now().weekday - course.daysOfWeek.first))
            .add(startTimeDuration), // Thời gian bắt đầu
        endTime: DateTime.now()
            .subtract(Duration(
                days: DateTime.now().weekday - course.daysOfWeek.first))
            .add(endTimeDuration), // Thời gian kết thúc
        subject: course.title, // Tên môn học làm tiêu đề
        color: Colors.blue, // Màu sắc của appointment
      );
      appointments.add(appointment);
    }
    return _AppointmentDataSource(appointments);
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
