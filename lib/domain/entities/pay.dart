// // ignore_for_file: unnecessary_null_comparison, avoid_print

// import 'package:mercadopago_sdk/mercadopago_sdk.dart';

// class PayWithMercadoPago {
//   Future<void> EjecutarMercadoPago() async {
//     armarPreference().then((result) {
//       if (result != null) {
//         // var preferenceId = result['response']['id'];
//         // print('preferenceId: $preferenceId');
//         // print('result: $result');
//         print(
//             'Pago: https://sandbox.mercadopago.com.mx/checkout/v1/redirect?pref_id=${result['response']['id']}');
//       }
//     });
//   }

//   Future<void> EjecutarGetPreference() async {
//     getPreference().then((result) {
//       if (result != null) {
//         print('result_Get: $result');
//       }
//     });
//   }

//   Future<Map<String, dynamic>> getPreference() async {
//     var mp = MP("5259746445237097", "rdMhDrBJK73uXY36oExmWNLJPWKQghp2");
//     // var result = await armarPreference();
//     // var result_get = await mp.getPreference(result['response']['id']);
//     var result_get = await mp
//         .getPreference('1007441274-f2b96760-13a0-45a9-916e-2dbf0a3d29e3');
//     return result_get;
//   }

//   Future<Map<String, dynamic>> armarPreference() async {
//     var mp = MP("5259746445237097", "rdMhDrBJK73uXY36oExmWNLJPWKQghp2");

//     var preference = {
//       "items": [
//         {
//           "title": "Test",
//           "quantity": 1,
//           "currency_id": "MX",
//           "unit_price": 100.00
//         }
//       ]
//     };
//     var result = await mp.createPreference(preference);
//     var result_get = await mp.getPreference(result['response']['id']);
//     print('result_get: $result_get');

//     return result;
//   }
// // https://sandbox.mercadopago.com.mx/checkout/v1/redirect?pref_id=1007441274-9d0a84f4-46ad-431f-b299-46b4abbd55b5
// }
