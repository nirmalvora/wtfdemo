class Utils {
  static getTitleByDay(int day) {
    switch (day) {
      case 30:
        return "Monthly";
      case 90:
        return "Quaterly";
      case 120:
        return "Halfyearly";
      case 360:
        return "Yearly";
      default:
        return "";
    }
  }
}
