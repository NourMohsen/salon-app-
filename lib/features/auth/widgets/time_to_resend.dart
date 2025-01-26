part of '../auth.dart';

class TimerToResend extends StatefulWidget {
  final Function(bool) canSend;

  const TimerToResend({super.key, required this.canSend});

  @override
  State<TimerToResend> createState() => _TimerToResendState();
}

class _TimerToResendState extends State<TimerToResend> {
  int _secondsRemaining = 60;

  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    const duration = Duration(seconds: 1); // Change the duration as needed
    _timer = Timer.periodic(duration, (timer) {
      if (_secondsRemaining == 0) {
        _timer!.cancel();
        setState(() {
          widget.canSend(true);
        });
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }


  @override
  Widget build(BuildContext context) {
    return Text(
      ' $_secondsRemaining',
      style: AppTextStyle().w700.bodyMedium14.copyWith(
        color: context.watch<GlobalCubit>().isDarkTheme()? AppColors.white : AppColors.textColor,
      ),
    );
  }
}