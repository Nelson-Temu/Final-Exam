import 'dart:async';
import 'dart:io';

void main() {
  print("Enter countdown time in seconds: ");
  int? countdownTime = int.tryParse(stdin.readLineSync()!);
  print('Press "s" to start.');
  String? select = stdin.readLineSync();
  if (select != null) {
    if (countdownTime == null || countdownTime <= 0) {
      print("Invalid input. Please enter a positive integer.");
      return;
    }
    if (select == 's') {
      startCountdown(countdownTime);
    } else {
      print('you take wrong selections');
    }
  }
}

void startCountdown(int seconds) {
  Timer.periodic(Duration(seconds: 1), (Timer timer) {
    if (seconds > 0) {
      stdout.write("\rTime left: $seconds seconds");
      seconds--;
    } else {
      timer.cancel();
      stdout.write("\rCountdown finished!\n");
    }
  });
}
