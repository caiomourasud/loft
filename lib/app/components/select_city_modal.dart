import 'package:flutter/material.dart';
import 'package:loft/app/components/loft_button.dart';
import 'package:loft/app/models/city.dart';
import 'package:loft/app/themes/loft_theme.dart';

class SelectCityModal {
  static int selectedItem = 0;

  static const cities = [
    City(id: 0, name: 'São Paulo'),
    City(id: 1, name: 'Porto Alegre'),
    City(id: 2, name: 'Rio de Janeiro'),
    City(id: 3, name: 'Belo Horizonte'),
    City(id: 4, name: 'São Bernardo do Campo'),
    City(id: 5, name: 'Santo André'),
    City(id: 6, name: 'Canoas'),
    City(id: 7, name: 'Novo Hamburgo'),
    City(id: 8, name: 'Campinas'),
    City(id: 9, name: 'São Leopoldo'),
    City(id: 10, name: 'São Caetano do Sul'),
    City(id: 11, name: 'Caxias do Sul'),
    City(id: 12, name: 'Guaíba'),
    City(id: 13, name: 'Niterói'),
    City(id: 14, name: 'Lageado'),
    City(id: 15, name: 'Gravataí'),
    City(id: 16, name: 'Torres'),
    City(id: 17, name: 'Capão de Canoa'),
    City(id: 18, name: 'Cachoeirinha'),
    City(id: 19, name: 'Gramado'),
    City(id: 20, name: 'Canela'),
    City(id: 21, name: 'Nova Lima'),
    City(id: 22, name: 'Santa Maria'),
    City(id: 23, name: 'Esteio'),
    City(id: 24, name: 'Diadema'),
    City(id: 25, name: 'Bento Gonçalves'),
    City(id: 26, name: 'Sapucaia do Sul'),
    City(id: 27, name: 'Mauá'),
    City(id: 28, name: 'Mairiporā'),
  ];

  static show(
    BuildContext context, {
    City? selectedCity,
    Function(City?)? onCitySelected,
  }) =>
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          constraints: BoxConstraints(
            minWidth: double.infinity,
            maxHeight: (MediaQuery.of(context).size.height -
                    MediaQuery.of(context).viewPadding.top) -
                36.0,
          ),
          builder: (context) {
            return StatefulBuilder(builder: (context, setState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
                    child: Text(
                      'Onde você quer morar?',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 1.0,
                  ),
                  Expanded(
                      child: ListView(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    children: cities.map((item) {
                      bool isSelected() => selectedCity?.id == item.id;
                      return GestureDetector(
                        onTap: () {
                          setState(() => selectedCity =
                              cities.where((city) => city.id == item.id).first);
                        },
                        child: ListTile(
                          title: Row(
                            children: [
                              AnimatedOpacity(
                                opacity: isSelected() ? 1.0 : 0.0,
                                duration: const Duration(milliseconds: 200),
                                child: Icon(
                                  Icons.location_on_outlined,
                                  color: LoftTheme.colorCustom,
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: AnimatedDefaultTextStyle(
                                  duration: const Duration(milliseconds: 200),
                                  style: isSelected()
                                      ? Theme.of(context)
                                              .textTheme
                                              .headlineMedium
                                              ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      LoftTheme.colorCustom) ??
                                          const TextStyle()
                                      : Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                color: Colors.grey[600],
                                                fontWeight: FontWeight.bold,
                                              ) ??
                                          const TextStyle(),
                                  child: Text(item.name),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Divider(color: Colors.grey, height: 1.0),
                      const SizedBox(height: 12.0),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                          ),
                          child: LoftButton(
                            label: 'Selecionar cidade',
                            onPressed: () {
                              onCitySelected?.call(selectedCity);
                            },
                          )),
                      const SizedBox(height: 12.0),
                      SizedBox(
                          height: MediaQuery.of(context).viewPadding.bottom),
                    ],
                  )
                ],
              );
            });
          });
}
