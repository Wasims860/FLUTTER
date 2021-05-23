/*
 * Copyright (c) 2020 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * This project and source code may use libraries or frameworks that are
 * released under various Open-Source licenses. Use of those libraries and
 * frameworks are governed by their own individual licenses.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import 'package:buzzkill/drink.dart';
import 'package:buzzkill/ui_components/informative_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Displays lethal and safe dosages for the specified [Drink].
class ResultsPage extends StatelessWidget {
  const ResultsPage({
    @required this.drink,
    @required this.bodyWeight,
    Key key,
  })  : assert(drink != null),
        assert(bodyWeight != null),
        super(key: key);

  final Drink drink;

  /// The individual's body weight (in pounds).
  final int bodyWeight;

  @override
  Widget build(BuildContext context) {
    final safeDosage = drink.safeDosage(bodyWeight);
    final lethalDosage = drink.lethalDosage(bodyWeight);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dosages',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InformativeCard(
              title: 'Lethal Dosage',
              leadingAssetName: 'assets/lethal.png',
              message: lethalDosage == 1
                  ? 'One serving.'
                  : '${lethalDosage.toStringAsFixed(1)} '
                      'servings in your system at one time.',
            ),
            const SizedBox(
              height: 12,
            ),
            InformativeCard(
              title: 'Daily Safe Maximum',
              leadingAssetName: 'assets/safe.png',
              message: safeDosage == 1
                  ? 'One serving per day.'
                  : '${safeDosage.toStringAsFixed(1)} '
                      'servings per day.',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
              child: Text(
                '*Based on ${drink.servingSize} fl. oz serving.',
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .apply(color: Theme.of(context).textTheme.caption.color),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                '*Applies to age 18 and over. This calculator '
                'does not replace professional medical advice.',
                style: Theme.of(context).textTheme.bodyText2.apply(
                      color: Theme.of(context).textTheme.caption.color,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
