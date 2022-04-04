import 'package:flutter/widgets.dart';

class TextoAnimado extends StatefulWidget {
  final double begin, end;
  final Duration duration;
  const TextoAnimado({
    required this.end,
    this.begin = 0,
    this.duration = const Duration(milliseconds: 500),
    Key? key,
  }) : super(key: key);

  @override
  State<TextoAnimado> createState() => _TextoAnimadoState();
}

class _TextoAnimadoState extends State<TextoAnimado> {
  late double begin = widget.begin;
  late double end = widget.end;

  @override
  void didUpdateWidget(TextoAnimado oldWidget) {
    begin = oldWidget.end;
    end = widget.end;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: begin, end: end),
      duration: widget.duration,
      builder: (context, valor, child) {
        return Text(
          valor.toStringAsFixed(2),
          style: const TextStyle(fontSize: 32),
        );
      },
    );
  }
}
