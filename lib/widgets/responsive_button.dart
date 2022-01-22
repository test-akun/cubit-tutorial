import 'package:flutter/cupertino.dart';
import 'package:flutter_cubit/misc/colors.dart';

class ResponsiveButton extends StatelessWidget {
  final bool isResponsice;
  final double? width;
  const ResponsiveButton({
    Key? key,
    this.isResponsice = false,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("img/button-one.png"),
        ],
      ),
    );
  }
}
