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
            color: Color.fromARGB(255, 0, 42, 255),
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

  DateTime _getDateTimeForWeekday(
      DateTime weekStart, int dayOfWeek, TimeOfDay timeOfDay) {
    DateTime dateTime = weekStart;
    while (dateTime.weekday != dayOfWeek) {
      dateTime = dateTime.add(Duration(days: 1));
    }
    return DateTime(dateTime.year, dateTime.month, dateTime.day, timeOfDay.hour,
        timeOfDay.minute);
  }

  // Hàm để tạo data source cho lịch trình
  _AppointmentDataSource _getDataSource(List<Course> courses) {
    List<Appointment> appointments = <Appointment>[];
    DateTime now = DateTime.now();
    DateTime threeMonthsLater = now.add(Duration(days: 30 * 3));

    // Tạo một map để lưu các khóa học trong từng ngày cụ thể để kiểm tra trùng lặp
    Map<DateTime, List<Course>> schedule = {};

    for (DateTime weekStart = now;
        weekStart.isBefore(threeMonthsLater);
        weekStart = weekStart.add(Duration(days: 7))) {
      for (var course in courses) {
        for (var dayOfWeek in course.daysOfWeek) {
          DateTime startTime =
              _getDateTimeForWeekday(weekStart, dayOfWeek, course.startTime);
          DateTime endTime =
              _getDateTimeForWeekday(weekStart, dayOfWeek, course.endTime);

          bool hasConflict = false;
          schedule[startTime] ??= [];
          for (var scheduledCourse in schedule[startTime]!) {
            DateTime scheduledStartTime = _getDateTimeForWeekday(
                weekStart, dayOfWeek, scheduledCourse.startTime);
            DateTime scheduledEndTime = _getDateTimeForWeekday(
                weekStart, dayOfWeek, scheduledCourse.endTime);

            if (startTime.isBefore(scheduledEndTime) &&
                endTime.isAfter(scheduledStartTime)) {
              hasConflict = true;
              break;
            }
          }

          // Tạo một Appointment và thêm vào danh sách
          Appointment appointment = Appointment(
            startTime: startTime,
            endTime: endTime,
            subject: course.title,
            color: hasConflict ? Colors.red : Colors.blue,
          );

          schedule[startTime]!.add(course);
          appointments.add(appointment);
        }
      }
    }
    return _AppointmentDataSource(appointments);
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
