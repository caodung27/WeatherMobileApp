import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/apps/utils/const.dart';
import 'package:weather/models/weather.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({super.key, required this.listData});

  final List<WeatherDetail> listData;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(20.0),
        itemBuilder: (context, index) {
          DateTime dateTime = DateTime.parse(listData[index].dt_txt);
          String formatDay = DateFormat('dd-MM-yyyy').format(dateTime);
          String formatTime = DateFormat('HH:MM').format(dateTime);
          return Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              children: [
                 Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            createTemp(listData[index].main.temp, size: 25),
                            const SizedBox(width: 10),
                            Text(
                              listData[index].weather.main,
                              style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          formatDay,
                          style: const TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                        const SizedBox(height: 10),
                        Text(
                            formatTime,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                        ),
                      ],
                )),
                Container(
                  width: MediaQuery.sizeOf(context).width / 4,
                  child: Image.asset(
                      AssetCustom.getLinkImg(listData[index].weather.main),
                      fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, _) => const SizedBox(height: 15),
        itemCount: 5,
    );
  }
}