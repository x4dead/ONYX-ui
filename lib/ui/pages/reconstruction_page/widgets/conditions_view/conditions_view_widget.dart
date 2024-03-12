part of '../../reconstruction_page.dart';

class ConditionsViewWidget extends StatelessWidget {
  const ConditionsViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kSBH10,
        CurrentDebtCard(),
        kSBH11,
      ],
    );
  }
}
