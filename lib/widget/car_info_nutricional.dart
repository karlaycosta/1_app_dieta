import 'package:app_dieta/models/info_nutricional.dart';
import 'package:flutter/material.dart';

import 'texto_animado.dart';

class CardInfoNutricional extends StatelessWidget {
  const CardInfoNutricional({
    Key? key,
    required this.infoNutricional,
  }) : super(key: key);

  final InfoNutricional infoNutricional;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.maxFinite,
        child: Column(
          children: [
            TextoAnimado(
              end: infoNutricional.calorias,
              pontuacao: ',',
              sufix: ' Kcal',
              style: const TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                    bottom: 8,
                  ),
                  child: Column(
                    children: [
                      const Text('Proteínas'),
                      TextoAnimado(
                        pontuacao: ',',
                        end: infoNutricional.proteinas,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 28,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                    bottom: 8,
                  ),
                  child: Column(
                    children: [
                      const Text('Carboidratos'),
                      TextoAnimado(
                        pontuacao: ',',
                        end: infoNutricional.carboidratos,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 28,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                    bottom: 8,
                  ),
                  child: Column(
                    children: [
                      const Text('Gorduras'),
                      TextoAnimado(
                        pontuacao: ',',
                        end: infoNutricional.gorduras,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 28,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
