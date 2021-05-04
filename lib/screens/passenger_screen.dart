import 'package:flutter/material.dart';
import 'package:bus_flutter/models/passenger_model.dart';
import 'package:bus_flutter/widgets/bottom_sheet_button.dart';
import 'package:bus_flutter/widgets/listview_element.dart';
import 'package:bus_flutter/widgets/text_field_card.dart';

class PassengerScreen extends StatefulWidget {
  @override
  _PassengerScreenState createState() => _PassengerScreenState();
}

class _PassengerScreenState extends State<PassengerScreen> {
  List<Passenger> passengers = [
    Passenger(
      name: 'AIGERIM',
      placeNumber: '0 A',
      placeType: PlaceType.up,
      buyType: BuyType.offline,
    ),
    Passenger(
      name: 'ARLAN',
      placeNumber: '0 B',
      placeType: PlaceType.up,
      buyType: BuyType.offline,
    ),
    Passenger(
      name: 'ASSEL',
      placeNumber: '1',
      placeType: PlaceType.down,
      buyType: BuyType.online,
    ),
    Passenger(
      name: 'TEMIRLAN',
      placeNumber: '1',
      placeType: PlaceType.up,
      buyType: BuyType.online,
    ),
  ];

  List<Passenger> emptyPlaces = [
    Passenger(
      name: 'Нет Имени',
      placeNumber: '0 A',
      placeType: PlaceType.down,
      buyType: BuyType.noType,
    ),
    Passenger(
      name: 'Нет Имени',
      placeNumber: '0 B',
      placeType: PlaceType.down,
      buyType: BuyType.noType,
    ),
    Passenger(
      name: 'Нет Имени',
      placeNumber: '2',
      placeType: PlaceType.down,
      buyType: BuyType.noType,
    ),
    Passenger(
      name: 'Нет Имени',
      placeNumber: '2',
      placeType: PlaceType.down,
      buyType: BuyType.noType,
    ),
  ];

  Widget childWidget(context, name, placeNumber, placeType, passenger) {
    double mWidth = MediaQuery.of(context).size.width;
    double mHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: SizedBox(
        width: mWidth,
        height: mHeight * 0.75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'Информация о пассажире',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            TextFieldCard(
              text: name,
              color: Colors.black,
            ),
            TextFieldCard(
              text: '87012345678',
              color: Colors.black,
            ),
            TextFieldCard(
              text: 'Почта',
              color: Colors.green,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Место',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'Цена',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  flex: 3,
                  child: TextFieldCard(
                    text: placeType == PlaceType.up
                        ? '$placeNumber верхний'
                        : '$placeNumber нижний',
                    color: Colors.black26,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: TextFieldCard(
                    text: '3000',
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  child: SheetButton(
                    title: 'ИЗМЕНИТЬ',
                    onTap: () {},
                  ),
                ),
                Container(
                  height: 50,
                  child: SheetButton(
                    title: 'ОТПРАВИТЬ ЧЕК',
                    onTap: () {},
                  ),
                ),
              ],
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: SheetButton(
                title: 'ОТМЕНИТЬ ПОКУПКУ БИЛЕТА',
                onTap: () {
                  Navigator.pop(context);
                  Widget cancelButton = FlatButton(
                      child: Text(
                        "НЕТ",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      });
                  Widget continueButton = FlatButton(
                      child: Text(
                        "ДА",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          passengers.remove(passenger);
                          emptyPlaces.insert(
                            0,
                            Passenger(
                              name: 'Нет Имени',
                              placeNumber: placeNumber,
                              placeType: placeType,
                              buyType: BuyType.noType,
                            ),
                          );
                        });
                        Navigator.pop(context);
                      });

                  AlertDialog alert = AlertDialog(
                      content: Text(
                        "Вы хотите отменить покупку билета?",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 21.0),
                      ),
                      actions: [cancelButton, continueButton]);
                  showDialog(context: context, builder: (context) => alert);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65.0,
        title: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Пассажиры',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25.0,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Имя',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'Место',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'Тип',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  children: passengers
                      .map(
                        (passenger) => listElement(passenger, () {
                      showModalBottomSheet(
                        context: context,
                        builder: (builder) {
                          return childWidget(
                            context,
                            passenger.name,
                            passenger.placeNumber,
                            passenger.placeType,
                            passenger,
                          );
                        },
                      );
                    }),
                  )
                      .toList(),
                ),
                Text(
                  'Свободные места',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
                ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  children: emptyPlaces
                      .map(
                        (emptyPlace) => listElement(emptyPlace, () {}),
                  )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}