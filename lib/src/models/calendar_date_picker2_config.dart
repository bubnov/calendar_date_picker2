import 'package:flutter/material.dart';

enum CalendarDatePicker2Type {
  single,
  multi,

  /// Allows selecting a range of two dates.
  ///
  /// See also [CalendarDatePicker2Config.rangeBidirectional].
  range,
}

typedef CalendarDayTextStylePredicate = TextStyle? Function({
  required DateTime date,
});

typedef CalendarDayBuilder = Widget? Function({
  required DateTime date,
  TextStyle? textStyle,
  BoxDecoration? decoration,
  bool? isSelected,
  bool? isDisabled,
  bool? isToday,
});

typedef CalendarDayButtonBuilder = Widget? Function(
  Widget child,
  VoidCallback? handler,
);

typedef CalendarYearBuilder = Widget? Function({
  required int year,
  TextStyle? textStyle,
  BoxDecoration? decoration,
  bool? isSelected,
  bool? isDisabled,
  bool? isCurrentYear,
});

typedef CalendarModePickerTextHandler = String? Function({
  required DateTime monthDate,
});

class CalendarDatePicker2Config {
  CalendarDatePicker2Config({
    CalendarDatePicker2Type? calendarType,
    DateTime? firstDate,
    DateTime? lastDate,
    DateTime? currentDate,
    DatePickerMode? calendarViewMode,
    this.weekdayLabels,
    this.weekdayLabelTextStyle,
    this.firstDayOfWeek,
    this.controlsHeight,
    this.lastMonthIcon,
    this.nextMonthIcon,
    this.lastMonthButtonBuilder,
    this.nextMonthButtonBuilder,
    this.controlsTextStyle,
    this.dayTextStyle,
    this.selectedDayTextStyle,
    this.selectedDayHighlightColor,
    this.selectedRangeHighlightColor,
    this.disabledDayTextStyle,
    this.todayTextStyle,
    this.yearTextStyle,
    this.selectedYearTextStyle,
    this.dayBorderRadius,
    this.yearBorderRadius,
    this.selectableDayPredicate,
    this.dayTextStylePredicate,
    this.dayBuilder,
    this.dayButtonBuilder,
    this.dayButtonRadius,
    this.dayButtonContainsInkWell,
    this.yearBuilder,
    this.disableModePicker,
    this.centerAlignModePicker,
    this.customModePickerIcon,
    this.modePickerTextHandler,
    this.selectedRangeDayTextStyle,
    this.rangeBidirectional = false,
    this.weekdayLabelTextStyleProvider,
    this.showHeaderDivider = false,
    this.headerDividerColor,
    this.headerPadding = EdgeInsets.zero,
    this.contentPadding = EdgeInsets.zero,
  })  : calendarType = calendarType ?? CalendarDatePicker2Type.single,
        firstDate = DateUtils.dateOnly(firstDate ?? DateTime(1970)),
        lastDate = DateUtils.dateOnly(lastDate ?? DateTime(DateTime.now().year + 50)),
        currentDate = currentDate ?? DateUtils.dateOnly(DateTime.now()),
        calendarViewMode = calendarViewMode ?? DatePickerMode.day;

  /// The enabled date picker mode
  final CalendarDatePicker2Type calendarType;

  /// The earliest allowable [DateTime] that the user can select.
  final DateTime firstDate;

  /// The latest allowable [DateTime] that the user can select.
  final DateTime lastDate;

  /// The [DateTime] representing today. It will be highlighted in the day grid.
  final DateTime currentDate;

  /// The initially displayed view of the calendar picker.
  final DatePickerMode calendarViewMode;

  /// Custom weekday labels for the current locale, MUST starts from Sunday
  /// Examples:
  ///
  /// - US English: S, M, T, W, T, F, S
  /// - Russian: вс, пн, вт, ср, чт, пт, сб - notice that the list begins with
  ///   вс (Sunday) even though the first day of week for Russian is Monday.
  final List<String>? weekdayLabels;

  /// Custom text style for weekday labels
  final TextStyle? weekdayLabelTextStyle;

  /// Custom text style provider for weekday labels
  final TextStyle? Function(String label, int dayIndex)? weekdayLabelTextStyleProvider;

  /// Index of the first day of week, where 0 points to Sunday, and 6 points to Saturday.
  final int? firstDayOfWeek;

  /// Custom height for calendar control toggle's height
  final double? controlsHeight;

  /// Custom icon for last month button control
  final Widget? lastMonthIcon;
  
  /// Custom icon for next month button control
  final Widget? nextMonthIcon;
  
  /// Custom last month button builder
  final Widget? Function(VoidCallback? handler)? lastMonthButtonBuilder;

  /// Custom next month button builder
  final Widget? Function(VoidCallback? handler)? nextMonthButtonBuilder;

  /// Custom text style for calendar mode toggle control
  final TextStyle? controlsTextStyle;

  /// Custom text style for all calendar days
  final TextStyle? dayTextStyle;

  /// Custom text style for selected calendar day(s)
  final TextStyle? selectedDayTextStyle;

  /// Custom text style for selected range calendar day(s)
  final TextStyle? selectedRangeDayTextStyle;

  /// The highlight color for selected day(s)
  final Color? selectedDayHighlightColor;

  /// The highlight color for day(s) included in the selected range
  /// Only applicable when [calendarType] is [CalendarDatePicker2Type.range]
  final Color? selectedRangeHighlightColor;

  /// Custom text style for disabled calendar day(s)
  final TextStyle? disabledDayTextStyle;

  /// Custom text style for today
  final TextStyle? todayTextStyle;

  // Custom text style for years list
  final TextStyle? yearTextStyle;

  // Custom text style for selected year(s)
  final TextStyle? selectedYearTextStyle;

  /// Custom border radius for day indicator
  final BorderRadius? dayBorderRadius;

  /// Custom border radius for year indicator
  final BorderRadius? yearBorderRadius;

  /// Function to provide full control over which dates in the calendar can be selected.
  final SelectableDayPredicate? selectableDayPredicate;

  /// Function to provide full control over calendar days text style
  final CalendarDayTextStylePredicate? dayTextStylePredicate;

  /// Function to provide full control over day widget UI
  final CalendarDayBuilder? dayBuilder;

  /// Function to build day widget button
  final CalendarDayButtonBuilder? dayButtonBuilder;

  /// Custom day button radius
  final double? dayButtonRadius;
  
  /// Whether the button contains the ink well
  final bool? dayButtonContainsInkWell;

  /// Function to provide full control over year widget UI
  final CalendarYearBuilder? yearBuilder;

  /// Flag to disable mode picker and hide the mode toggle button icon
  final bool? disableModePicker;

  /// Flag to centralize year and month text label in controls
  final bool? centerAlignModePicker;

  /// Custom icon for the mode picker button icon
  final Widget? customModePickerIcon;

  /// Function to control mode picker displayed text
  final CalendarModePickerTextHandler? modePickerTextHandler;

  /// Whether the range selection can be also made in reverse-chronological
  /// order.
  /// Only applicable when [calendarType] is [CalendarDatePicker2Type.range].
  final bool rangeBidirectional;

  /// Whether to show a divider between the header and the days picker.
  /// False by default.
  final bool showHeaderDivider;

  /// A custom color for the divider
  final Color? headerDividerColor;

  /// The header padding
  final EdgeInsets headerPadding;
  
  /// The content padding
  final EdgeInsets contentPadding;

  CalendarDatePicker2Config copyWith({
    CalendarDatePicker2Type? calendarType,
    DateTime? firstDate,
    DateTime? lastDate,
    DateTime? currentDate,
    DatePickerMode? calendarViewMode,
    List<String>? weekdayLabels,
    TextStyle? weekdayLabelTextStyle,
    int? firstDayOfWeek,
    double? controlsHeight,
    Widget? lastMonthIcon,
    Widget? nextMonthIcon,
    Widget? Function(VoidCallback? handler)? Function()? lastMonthButtonBuilder,
    Widget? Function(VoidCallback? handler)? Function()? nextMonthButtonBuilder,
    TextStyle? controlsTextStyle,
    TextStyle? dayTextStyle,
    TextStyle? selectedDayTextStyle,
    Color? selectedDayHighlightColor,
    Color? selectedRangeHighlightColor,
    TextStyle? disabledDayTextStyle,
    TextStyle? todayTextStyle,
    TextStyle? yearTextStyle,
    TextStyle? selectedYearTextStyle,
    TextStyle? selectedRangeDayTextStyle,
    BorderRadius? dayBorderRadius,
    BorderRadius? yearBorderRadius,
    SelectableDayPredicate? selectableDayPredicate,
    CalendarDayTextStylePredicate? dayTextStylePredicate,
    CalendarDayBuilder? dayBuilder,
    CalendarDayButtonBuilder? Function()? dayButtonBuilder,
    double? Function()? dayButtonRadius,
    bool? Function()? dayButtonContainsInkWell,
    CalendarYearBuilder? yearBuilder,
    bool? disableModePicker,
    bool? centerAlignModePicker,
    Widget? customModePickerIcon,
    CalendarModePickerTextHandler? modePickerTextHandler,
    bool? rangeBidirectional,
    TextStyle? Function(String, int) Function()? weekdayLabelTextStyleProvider,
    bool? showHeaderDivider,
    Color? Function()? headerDividerColor,
    EdgeInsets? headerPadding,
    EdgeInsets? contentPadding,
  }) {
    return CalendarDatePicker2Config(
      calendarType: calendarType ?? this.calendarType,
      firstDate: DateUtils.dateOnly(firstDate ?? this.firstDate),
      lastDate: DateUtils.dateOnly(lastDate ?? this.lastDate),
      currentDate: currentDate ?? this.currentDate,
      calendarViewMode: calendarViewMode ?? this.calendarViewMode,
      weekdayLabels: weekdayLabels ?? this.weekdayLabels,
      weekdayLabelTextStyle: weekdayLabelTextStyle ?? this.weekdayLabelTextStyle,
      firstDayOfWeek: firstDayOfWeek ?? this.firstDayOfWeek,
      controlsHeight: controlsHeight ?? this.controlsHeight,
      lastMonthIcon: lastMonthIcon ?? this.lastMonthIcon,
      nextMonthIcon: nextMonthIcon ?? this.nextMonthIcon,
      lastMonthButtonBuilder: lastMonthButtonBuilder == null ? this.lastMonthButtonBuilder : lastMonthButtonBuilder(),
      nextMonthButtonBuilder: nextMonthButtonBuilder == null ? this.nextMonthButtonBuilder : nextMonthButtonBuilder(),
      controlsTextStyle: controlsTextStyle ?? this.controlsTextStyle,
      dayTextStyle: dayTextStyle ?? this.dayTextStyle,
      selectedDayTextStyle: selectedDayTextStyle ?? this.selectedDayTextStyle,
      selectedDayHighlightColor: selectedDayHighlightColor ?? this.selectedDayHighlightColor,
      selectedRangeHighlightColor: selectedRangeHighlightColor ?? this.selectedRangeHighlightColor,
      disabledDayTextStyle: disabledDayTextStyle ?? this.disabledDayTextStyle,
      todayTextStyle: todayTextStyle ?? this.todayTextStyle,
      yearTextStyle: yearTextStyle ?? this.yearTextStyle,
      selectedYearTextStyle: selectedYearTextStyle ?? this.selectedYearTextStyle,
      selectedRangeDayTextStyle: selectedRangeDayTextStyle ?? this.selectedRangeDayTextStyle,
      dayBorderRadius: dayBorderRadius ?? this.dayBorderRadius,
      yearBorderRadius: yearBorderRadius ?? this.yearBorderRadius,
      selectableDayPredicate: selectableDayPredicate ?? this.selectableDayPredicate,
      dayTextStylePredicate: dayTextStylePredicate ?? this.dayTextStylePredicate,
      dayBuilder: dayBuilder ?? this.dayBuilder,
      dayButtonBuilder: dayButtonBuilder == null ? this.dayButtonBuilder : dayButtonBuilder(),
      dayButtonRadius: dayButtonRadius == null ? this.dayButtonRadius : dayButtonRadius(),
      dayButtonContainsInkWell: dayButtonContainsInkWell == null ? this.dayButtonContainsInkWell : dayButtonContainsInkWell(),
      yearBuilder: yearBuilder ?? this.yearBuilder,
      disableModePicker: disableModePicker ?? this.disableModePicker,
      centerAlignModePicker: centerAlignModePicker ?? this.centerAlignModePicker,
      customModePickerIcon: customModePickerIcon ?? this.customModePickerIcon,
      modePickerTextHandler: modePickerTextHandler ?? this.modePickerTextHandler,
      rangeBidirectional: rangeBidirectional ?? this.rangeBidirectional,
      weekdayLabelTextStyleProvider:
          weekdayLabelTextStyleProvider == null ? this.weekdayLabelTextStyleProvider : weekdayLabelTextStyleProvider(),
      showHeaderDivider: showHeaderDivider ?? this.showHeaderDivider,
      headerDividerColor: headerDividerColor == null ? this.headerDividerColor : headerDividerColor(),
      headerPadding: headerPadding ?? this.headerPadding,
      contentPadding: contentPadding ?? this.contentPadding,
    );
  }
}

class CalendarDatePicker2WithActionButtonsConfig extends CalendarDatePicker2Config {
  CalendarDatePicker2WithActionButtonsConfig({
    CalendarDatePicker2Type? calendarType,
    DateTime? firstDate,
    DateTime? lastDate,
    DateTime? currentDate,
    DatePickerMode? calendarViewMode,
    List<String>? weekdayLabels,
    TextStyle? weekdayLabelTextStyle,
    int? firstDayOfWeek,
    double? controlsHeight,
    Widget? lastMonthIcon,
    Widget? nextMonthIcon,
    Widget? Function(VoidCallback? handler)? lastMonthButtonBuilder,
    Widget? Function(VoidCallback? handler)? nextMonthButtonBuilder,
    TextStyle? controlsTextStyle,
    TextStyle? dayTextStyle,
    TextStyle? selectedDayTextStyle,
    Color? selectedDayHighlightColor,
    Color? selectedRangeHighlightColor,
    TextStyle? disabledDayTextStyle,
    TextStyle? todayTextStyle,
    TextStyle? yearTextStyle,
    TextStyle? selectedYearTextStyle,
    TextStyle? selectedRangeDayTextStyle,
    BorderRadius? dayBorderRadius,
    BorderRadius? yearBorderRadius,
    SelectableDayPredicate? selectableDayPredicate,
    CalendarDayTextStylePredicate? dayTextStylePredicate,
    CalendarDayBuilder? dayBuilder,
    CalendarYearBuilder? yearBuilder,
    bool? disableModePicker,
    bool? centerAlignModePicker,
    Widget? customModePickerIcon,
    CalendarModePickerTextHandler? modePickerTextHandler,
    bool rangeBidirectional = false,
    this.gapBetweenCalendarAndButtons,
    this.cancelButtonTextStyle,
    this.cancelButton,
    this.okButtonTextStyle,
    this.okButton,
    this.openedFromDialog,
    this.closeDialogOnCancelTapped,
    this.closeDialogOnOkTapped,
    this.buttonPadding,
    TextStyle? Function(String, int)? weekdayLabelTextStyleProvider,
    bool showHeaderDivider = false,
    Color? headerDividerColor,
    EdgeInsets headerPadding = EdgeInsets.zero,
    EdgeInsets contentPadding = EdgeInsets.zero,
    CalendarDayButtonBuilder? dayButtonBuilder,
    double? dayButtonRadius,
    bool? dayButtonContainsInkWell,
  }) : super(
          calendarType: calendarType,
          firstDate: firstDate,
          lastDate: lastDate,
          currentDate: currentDate,
          calendarViewMode: calendarViewMode,
          weekdayLabels: weekdayLabels,
          weekdayLabelTextStyle: weekdayLabelTextStyle,
          firstDayOfWeek: firstDayOfWeek,
          controlsHeight: controlsHeight,
          lastMonthIcon: lastMonthIcon,
          nextMonthIcon: nextMonthIcon,
          lastMonthButtonBuilder: lastMonthButtonBuilder,
          nextMonthButtonBuilder: nextMonthButtonBuilder,
          controlsTextStyle: controlsTextStyle,
          dayTextStyle: dayTextStyle,
          selectedDayTextStyle: selectedDayTextStyle,
          selectedRangeDayTextStyle: selectedRangeDayTextStyle,
          selectedDayHighlightColor: selectedDayHighlightColor,
          selectedRangeHighlightColor: selectedRangeHighlightColor,
          disabledDayTextStyle: disabledDayTextStyle,
          todayTextStyle: todayTextStyle,
          yearTextStyle: yearTextStyle,
          selectedYearTextStyle: selectedYearTextStyle,
          dayBorderRadius: dayBorderRadius,
          yearBorderRadius: yearBorderRadius,
          selectableDayPredicate: selectableDayPredicate,
          dayTextStylePredicate: dayTextStylePredicate,
          dayBuilder: dayBuilder,
          dayButtonBuilder: dayButtonBuilder,
          yearBuilder: yearBuilder,
          disableModePicker: disableModePicker,
          centerAlignModePicker: centerAlignModePicker,
          customModePickerIcon: customModePickerIcon,
          modePickerTextHandler: modePickerTextHandler,
          rangeBidirectional: rangeBidirectional,
          weekdayLabelTextStyleProvider: weekdayLabelTextStyleProvider,
          showHeaderDivider: showHeaderDivider,
          headerDividerColor: headerDividerColor,
          headerPadding: headerPadding,
          contentPadding: contentPadding,
        );

  /// The gap between calendar and action buttons
  final double? gapBetweenCalendarAndButtons;

  /// Text style for cancel button
  final TextStyle? cancelButtonTextStyle;

  /// Custom cancel button
  final Widget? cancelButton;

  /// Text style for ok button
  final TextStyle? okButtonTextStyle;

  /// Custom ok button
  final Widget? okButton;

  /// Is the calendar opened from dialog
  final bool? openedFromDialog;

  /// If the dialog should be closed when user taps the CANCEL button
  final bool? closeDialogOnCancelTapped;

  /// If the dialog should be closed when user taps the OK button
  final bool? closeDialogOnOkTapped;

  /// Custom wrapping padding for Ok & Cancel buttons
  final EdgeInsets? buttonPadding;

  @override
  CalendarDatePicker2WithActionButtonsConfig copyWith({
    CalendarDatePicker2Type? calendarType,
    DateTime? firstDate,
    DateTime? lastDate,
    DateTime? currentDate,
    DatePickerMode? calendarViewMode,
    List<String>? weekdayLabels,
    TextStyle? weekdayLabelTextStyle,
    int? firstDayOfWeek,
    double? controlsHeight,
    Widget? lastMonthIcon,
    Widget? nextMonthIcon,
    Widget? Function(VoidCallback? handler)? Function()? lastMonthButtonBuilder,
    Widget? Function(VoidCallback? handler)? Function()? nextMonthButtonBuilder,
    TextStyle? controlsTextStyle,
    TextStyle? dayTextStyle,
    TextStyle? selectedDayTextStyle,
    TextStyle? selectedRangeDayTextStyle,
    Color? selectedDayHighlightColor,
    Color? selectedRangeHighlightColor,
    TextStyle? disabledDayTextStyle,
    TextStyle? todayTextStyle,
    TextStyle? yearTextStyle,
    TextStyle? selectedYearTextStyle,
    BorderRadius? dayBorderRadius,
    BorderRadius? yearBorderRadius,
    SelectableDayPredicate? selectableDayPredicate,
    CalendarDayTextStylePredicate? dayTextStylePredicate,
    CalendarDayBuilder? dayBuilder,
    CalendarDayButtonBuilder? Function()? dayButtonBuilder,
    double? Function()? dayButtonRadius,
    bool? Function()? dayButtonContainsInkWell,
    CalendarYearBuilder? yearBuilder,
    bool? disableModePicker,
    bool? centerAlignModePicker,
    Widget? customModePickerIcon,
    CalendarModePickerTextHandler? modePickerTextHandler,
    double? gapBetweenCalendarAndButtons,
    TextStyle? cancelButtonTextStyle,
    Widget? cancelButton,
    TextStyle? okButtonTextStyle,
    Widget? okButton,
    bool? openedFromDialog,
    bool? closeDialogOnCancelTapped,
    bool? closeDialogOnOkTapped,
    EdgeInsets? buttonPadding,
    bool? rangeBidirectional,
    TextStyle? Function(String, int) Function()? weekdayLabelTextStyleProvider,
    bool? showHeaderDivider,
    Color? Function()? headerDividerColor,
    EdgeInsets? headerPadding,
    EdgeInsets? contentPadding,
  }) {
    return CalendarDatePicker2WithActionButtonsConfig(
      calendarType: calendarType ?? this.calendarType,
      firstDate: DateUtils.dateOnly(firstDate ?? this.firstDate),
      lastDate: DateUtils.dateOnly(lastDate ?? this.lastDate),
      currentDate: currentDate ?? this.currentDate,
      calendarViewMode: calendarViewMode ?? this.calendarViewMode,
      weekdayLabels: weekdayLabels ?? this.weekdayLabels,
      weekdayLabelTextStyle: weekdayLabelTextStyle ?? this.weekdayLabelTextStyle,
      firstDayOfWeek: firstDayOfWeek ?? this.firstDayOfWeek,
      controlsHeight: controlsHeight ?? this.controlsHeight,
      lastMonthIcon: lastMonthIcon ?? this.lastMonthIcon,
      nextMonthIcon: nextMonthIcon ?? this.nextMonthIcon,
      lastMonthButtonBuilder: lastMonthButtonBuilder == null ? this.lastMonthButtonBuilder : lastMonthButtonBuilder(),
      nextMonthButtonBuilder: nextMonthButtonBuilder == null ? this.nextMonthButtonBuilder : nextMonthButtonBuilder(),
      controlsTextStyle: controlsTextStyle ?? this.controlsTextStyle,
      dayTextStyle: dayTextStyle ?? this.dayTextStyle,
      selectedDayTextStyle: selectedDayTextStyle ?? this.selectedDayTextStyle,
      selectedRangeDayTextStyle: selectedRangeDayTextStyle ?? this.selectedRangeDayTextStyle,
      selectedDayHighlightColor: selectedDayHighlightColor ?? this.selectedDayHighlightColor,
      selectedRangeHighlightColor: selectedRangeHighlightColor ?? this.selectedRangeHighlightColor,
      disabledDayTextStyle: disabledDayTextStyle ?? this.disabledDayTextStyle,
      todayTextStyle: todayTextStyle ?? this.todayTextStyle,
      yearTextStyle: yearTextStyle ?? this.yearTextStyle,
      selectedYearTextStyle: selectedYearTextStyle ?? this.selectedYearTextStyle,
      dayBorderRadius: dayBorderRadius ?? this.dayBorderRadius,
      yearBorderRadius: yearBorderRadius ?? this.yearBorderRadius,
      selectableDayPredicate: selectableDayPredicate ?? this.selectableDayPredicate,
      dayTextStylePredicate: dayTextStylePredicate ?? this.dayTextStylePredicate,
      dayBuilder: dayBuilder ?? this.dayBuilder,
      dayButtonBuilder: dayButtonBuilder == null ? this.dayButtonBuilder : dayButtonBuilder(),
      dayButtonRadius: dayButtonRadius == null ? this.dayButtonRadius : dayButtonRadius(),
      dayButtonContainsInkWell: dayButtonContainsInkWell == null ? this.dayButtonContainsInkWell : dayButtonContainsInkWell(),
      yearBuilder: yearBuilder ?? this.yearBuilder,
      disableModePicker: disableModePicker ?? this.disableModePicker,
      centerAlignModePicker: centerAlignModePicker ?? this.centerAlignModePicker,
      customModePickerIcon: customModePickerIcon ?? this.customModePickerIcon,
      modePickerTextHandler: modePickerTextHandler ?? this.modePickerTextHandler,
      rangeBidirectional: rangeBidirectional ?? this.rangeBidirectional,
      gapBetweenCalendarAndButtons: gapBetweenCalendarAndButtons ?? this.gapBetweenCalendarAndButtons,
      cancelButtonTextStyle: cancelButtonTextStyle ?? this.cancelButtonTextStyle,
      cancelButton: cancelButton ?? this.cancelButton,
      okButtonTextStyle: okButtonTextStyle ?? this.okButtonTextStyle,
      okButton: okButton ?? this.okButton,
      openedFromDialog: openedFromDialog ?? this.openedFromDialog,
      closeDialogOnCancelTapped: closeDialogOnCancelTapped ?? this.closeDialogOnCancelTapped,
      closeDialogOnOkTapped: closeDialogOnOkTapped ?? this.closeDialogOnOkTapped,
      buttonPadding: buttonPadding ?? this.buttonPadding,
      weekdayLabelTextStyleProvider:
          weekdayLabelTextStyleProvider == null ? this.weekdayLabelTextStyleProvider : weekdayLabelTextStyleProvider(),
      showHeaderDivider: showHeaderDivider ?? this.showHeaderDivider,
      headerDividerColor: headerDividerColor == null ? this.headerDividerColor : headerDividerColor(),
      headerPadding: headerPadding ?? this.headerPadding,
      contentPadding: contentPadding ?? this.contentPadding,
    );
  }
}
