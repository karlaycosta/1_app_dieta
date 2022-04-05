import 'package:flutter/widgets.dart';

class TextoAnimado extends StatefulWidget {
  final double begin, end;
  final Duration duration;
  final int casasDecimais;
  final String pontuacao, prefix, sufix;
  final TextStyle? style;
  const TextoAnimado({
    required this.end,
    this.begin = 0,
    this.duration = const Duration(milliseconds: 500),
    this.casasDecimais = 2,
    this.pontuacao = '.',
    this.style,
    this.prefix = '',
    this.sufix = '',
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
          '${widget.prefix}${valor.toStringAsFixed(widget.casasDecimais).replaceFirst('.', widget.pontuacao)}${widget.sufix}',
          style: widget.style,
        );
      },
    );
  }
}
