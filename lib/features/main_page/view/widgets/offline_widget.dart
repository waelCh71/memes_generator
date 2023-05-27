import 'package:flutter/material.dart';
import '../../../../global/utils/constants.dart';

class OfllineWidget extends StatefulWidget {
  final bool booltheme;

  const OfllineWidget({super.key, required this.booltheme});

  @override
  State<OfllineWidget> createState() => _OfllineWidgetState();
}

class _OfllineWidgetState extends State<OfllineWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 29),
        // width: double.infinity,
        // height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.booltheme
                ? Image.asset(
                    noInternetDark,
                  )
                : Image.asset(
                    noInternetLight,
                  ),
            const Text(
              "\nNo Internet",
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
