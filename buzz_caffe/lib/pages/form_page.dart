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
import 'package:buzzkill/pages/results_page.dart';
import 'package:buzzkill/ui_components/digits_text_field.dart';
import 'package:buzzkill/ui_components/drink_form_radio_list_tile.dart';
import 'package:flutter/material.dart';

/// Form for inputting the information needed to calculate the lethal and safe
/// dosages of caffeinated drinks.
class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _weightTextController = TextEditingController();
  final _servingSizeTextController = TextEditingController();
  final _caffeineTextController = TextEditingController();

  /// The currently selected [Drink] option from the radio list.
  Drink _selectedDrinkSuggestion;

  /// Tells if the form is in a valid state. Useful for enabling/disabling the
  /// action button.
  bool get _isValidInput =>
      _weightTextController.intValue > 0 &&
      (_selectedDrinkSuggestion != null ||
          (_servingSizeTextController.intValue > 0 &&
              _caffeineTextController.intValue > 0));

  final _drinkSuggestions = const [
    Drink(
      name: 'Drip Coffee (Cup)',
      caffeineAmount: 145,
      servingSize: 8,
    ),
    Drink(
      name: 'Espresso (Shot)',
      caffeineAmount: 77,
      servingSize: 1.5,
    ),
    Drink(
      name: 'Latte (Mug)',
      caffeineAmount: 154,
      servingSize: 16,
    ),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Death by Caffeine Calculator',
          ),
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          // Dismisses the keyboard when a tap occurs outside of the form.
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 16,
                ),
                Image.asset('assets/danger.png'),
                _ListItemPadding(
                  child: DigitsTextField(
                    controller: _weightTextController,
                    labelText: 'Body Weight',
                    suffixText: 'pounds',
                    onChanged: (_) {
                      // The setState call enables/disables the action button if
                      // the serving size or caffeine amount input changes.
                      setState(() {});
                    },
                  ),
                ),
                ListTile(
                  title: Text(
                    'Choose a drink',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                ..._drinkSuggestions
                    .map(
                      (suggestion) => RadioListTile<Drink>(
                        dense: true,
                        groupValue: _selectedDrinkSuggestion,
                        value: suggestion,
                        onChanged: _changeSelectedSuggestion,
                        title: Text(suggestion.name),
                      ),
                    )
                    .toList(),
                // Adds the custom drink radio.
                DrinkFormRadioListTile(
                  caffeineInputController: _caffeineTextController,
                  servingSizeInputController: _servingSizeTextController,
                  selectedSuggestion: _selectedDrinkSuggestion,
                  // If the custom drink radio is selected, we set the
                  // _selectedDrinkSuggestion to null, as it isn't one of
                  // the suggestions.
                  onSelected: () => _changeSelectedSuggestion(null),
                  // Important for enabling/disabling the action button if the
                  // serving size or caffeine amount input changes.
                  onInputChanged: () => setState(() {}),
                  titleText: 'Other',
                  servingSizeLabelText: 'Serving Size',
                  servingSizeSuffixText: 'fl. oz',
                  caffeineAmountLabelText: 'Caffeine',
                  caffeineAmountSuffixText: 'mg',
                ),
                _ListItemPadding(
                  child: SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: _isValidInput
                          ? () => _pushResultsPage(context)
                          : null,
                      child: Text(
                        'CALCULATE',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  void _pushResultsPage(BuildContext context) {
    final weight = _weightTextController.intValue;

    // If there's no selected suggestion, we create a new [Drink] with
    // the inputted data.
    final drink = _selectedDrinkSuggestion ??
        Drink(
          caffeineAmount: _caffeineTextController.intValue,
          servingSize: _servingSizeTextController.intValue.toDouble(),
        );

    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => ResultsPage(
          bodyWeight: weight,
          drink: drink,
        ),
      ),
    );
  }

  void _changeSelectedSuggestion(Drink drink) {
    setState(() {
      _selectedDrinkSuggestion = drink;
    });
  }

  @override
  void dispose() {
    _weightTextController.dispose();
    _servingSizeTextController.dispose();
    _caffeineTextController.dispose();
    super.dispose();
  }
}

class _ListItemPadding extends StatelessWidget {
  const _ListItemPadding({
    @required this.child,
    Key key,
  })  : assert(child != null),
        super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        child: child,
      );
}

/// Parses the content of a TextEditingController as an int.
extension _NumberInput on TextEditingController {
  int get intValue {
    try {
      return int.parse(text);
    } catch (_) {
      return 0;
    }
  }
}
