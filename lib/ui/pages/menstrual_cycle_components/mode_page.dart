import 'package:flutter/material.dart';
import 'package:reglfit/widgets/custom_text.dart';

import '../../../constant/constants.dart';
import '../../../widgets/custom_elevation_button.dart';

class ModePage extends StatefulWidget {
  const ModePage({super.key});

  @override
  State<ModePage> createState() => _ModePageState();
}

class _ModePageState extends State<ModePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: RadioButtonExample(),
      ),
    );
  }
}

class RadioButtonExample extends StatefulWidget {
  @override
  _RadioButtonExampleState createState() => _RadioButtonExampleState();
}

class _RadioButtonExampleState extends State<RadioButtonExample> {
  String? _selectedOption;
  final List<String> _options = [
    'Adet ve Döngü deneyimlerini takip et. Tahminlerini\nplanla ve döngündeki düzeni keşfet',
    'Hamile Kalmaya Çalışırken, seks yapmak veya evde\n döllenme için en iyi zaman hakkında tahminler, artı\ndoğurganlık uzmanlarından ipuçları al',
    'Deneyimlerini takip ederek hamileliğini ile ve vücut\n değişikliklerini ve cenin gelişimi hakkında rehberli\n içerik al.',
    'Bedenim menopoza geçerken değişiklikleri anla.',
  ];
  final List<String> basliklar = [
    'Clue Adet Takibi',
    'Clue Hamile Kal',
    'Clue Hamilelik',
    'Clue Perimenopoz',
  ];
  final List<Color> _colors = [Colors.red, Colors.blueAccent, Colors.lightBlueAccent, Colors.deepOrangeAccent];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                const TextSpan(
                    text: 'Modun\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
                WidgetSpan(child: heightSpace35),
                const TextSpan(
                    text: 'Şimdisana en iyi uyan modu seç:Daha sonra bunu\n istediğin zaman değiştirebilirsin',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    )),
              ]),
            ),
          ),
        ),
        ..._options.asMap().entries.map((entry) {
          int index = entry.key;
          String optionValue = entry.value;
          String baslik = basliklar[index];

          return Padding(
            padding: EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedOption = optionValue;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: _selectedOption == optionValue ? _colors[index] : null,
                  border: Border.all(
                    color: Colors.black.withOpacity(0.5),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 100,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            baslik,
                            style: TextStyle(fontWeight: FontWeight.bold, color: _selectedOption == optionValue ? Colors.white : Colors.black, fontSize: 15),
                          ),
                        ),
                      ),
                      ListTile(
                        subtitle: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedOption = optionValue;
                            });
                          },
                          child: Icon(
                            _selectedOption == optionValue ? Icons.check_circle : Icons.radio_button_unchecked,
                            color: _selectedOption == optionValue ? Colors.white : Colors.black,
                          ),
                        ),
                        leading: Text(
                          optionValue,
                          style: TextStyle(
                            fontSize: 12,
                            color: _selectedOption == optionValue ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Mod Değiştir',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: _selectedOption != null ? MaterialStateProperty.all<Color>(_colors[_options.indexOf(_selectedOption!)]) : MaterialStateProperty.all<Color>(Colors.grey),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
