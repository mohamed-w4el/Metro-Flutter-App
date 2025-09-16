// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class DetailsPage extends StatelessWidget {
//   const DetailsPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final List<String> stations = Get.arguments;
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(),
//         body: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Column(
//                   children: [
//                     Text(
//                       'Tickets:',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue[700],
//                       ),
//                     ),
//                     Text(
//                       '${ticketsPrice(stations.length)} LE',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.green[700],
//                       ),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Text(
//                       'Number of Stations:',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue[700],
//                       ),
//                     ),
//                     Text(
//                       '${stations.length}',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.orange[700],
//                       ),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Text(
//                       'Estimated Time Arrival:',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue[700],
//                       ),
//                     ),
//                     Text(
//                       '~${stations.length * 2} mins.',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.purple[700],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Text('$stations'),
//           ],
//         ),
//       ),
//     );
//   }
//
//   int ticketsPrice(int numOfStations) {
//     if (numOfStations <= 9) {
//       return 8;
//     } else if (numOfStations <= 16) {
//       return 10;
//     } else if (numOfStations <= 23) {
//       return 15;
//     } else {
//       return 20;
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetDetailsPage extends StatelessWidget {
  const GetDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the list of stations passed from TravelPage
    final List<String> route = List<String>.from(Get.arguments);

    // Calculate number of stations
    final int numberOfStations = route.length;

    // Calculate ticket price (example rules — adjust as needed)
    double ticketPrice;
    if (numberOfStations <= 9) {
      ticketPrice = 8.0;
    } else if (numberOfStations <= 16) {
      ticketPrice = 10.0;
    } else if (numberOfStations <= 23) {
      ticketPrice = 15.0;
    } else {
      ticketPrice = 20.0;
    }

    final int avgTimeMinutes = numberOfStations * 2;

    return Scaffold(
      appBar: AppBar(title: const Text('Trip Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 8,
              children: [
                Column(
                  children: [
                    Text(
                      'Number of Stations',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$numberOfStations',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Ticket Price',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' $ticketPrice EGP',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Estimated Time',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '~$avgTimeMinutes minutes',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Route:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: route.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(child: Text('${index + 1}')),
                    title: Text(route[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
