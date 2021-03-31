import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header(this.heading);
  final String heading;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      heading,
      style: TextStyle(fontSize: 20),
    ),
  );
}

class Paragraph extends StatelessWidget {
  const Paragraph(this.content);
  final String content;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
    child: Text(
      content,
      style: TextStyle(
          fontSize: 18,
          color: Colors.black,
      ),
    ),
  );
}

class IconAndDetail extends StatelessWidget {
  const IconAndDetail(this.icon, this.detail);
  final IconData icon;
  final String detail;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Icon(icon),
        SizedBox(width: 8),
        Text(
          detail,
          style: TextStyle(fontSize: 20),
        )
      ],
    ),
  );
}

class StyledButton extends StatelessWidget {
  const StyledButton({@required this.child, @required this.onPressed});
  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => OutlinedButton(
    style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.black)),
    onPressed: onPressed,
    child: child,
  );
}