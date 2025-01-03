import 'package:excelapp/Services/Database/hive_operations.dart';
import 'package:excelapp/UI/Components/LoadingUI/loadingAnimation.dart';
import 'package:excelapp/UI/Themes/colors.dart';
import 'package:excelapp/UI/constants.dart';
import 'package:flutter/material.dart';
import 'package:excelapp/UI/Screens/HomePage/Widgets/Notifications/notificationCard.dart';
import 'package:clear_all_notifications/clear_all_notifications.dart';

class NotificationsPage extends StatelessWidget {
  Future<Map> notifications() async {
    await ClearAllNotifications.clear();

    List noti = await HiveDB.retrieveData(valueName: 'notifications');
    var count = await HiveDB.retrieveData(valueName: 'unread_notifications');
    await HiveDB.storeData(valueName: 'unread_notifications', value: 0);
    // return {
    //   'notifications': [
    //     {'title': 'Hey', 'body': 'body is here'},
    //     {
    //       'title': 'Hey',
    //       'body':
    //           'body is efsfegsefeffesfewfasfefwefefafefegfsegsegsegsGEGSEFEFhere'
    //     },
    //     {'title': 'Hey', 'body': 'body is here'},
    //     {
    //       'title': 'Hey',
    //       'body':
    //           'body is efsfegsefeffesfewfasfefwefefafefegfsegsegsegsGEGSEFEFhere'
    //     },
    //     {'title': 'Hey', 'body': 'body is here'},
    //     {
    //       'title': 'Hey',
    //       'body':
    //           'body is efsfegsefeffesfewfasfefwefefafefegfsegsegsegsGEGSEFEFhere'
    //     }
    //   ],
    //   'count': 3
    // };
    // print(noti);
    return {'notifications': noti ?? [], 'count': count ?? noti.length};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundBlue,
      appBar: AppBar(
        backgroundColor: backgroundBlue,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: secondaryColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleTextStyle: TextStyle(
          color: secondaryColor,
          fontFamily: pfontFamily,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        title: Text("Notifications"),
        actions: [],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: backgroundBlue,
        ),
        child: FutureBuilder(
            future: notifications(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final notificationMappedData =
                    Map<String, dynamic>.from(snapshot.data as Map);
                List notificationData = notificationMappedData['notifications'];
                int unread = notificationMappedData['count'];
                notificationData = notificationData.reversed.toList();
                if (notificationData.length == 0) {
                  return Center(
                      child: Text(
                    "Seems like you have no new notifications",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ));
                }
                return SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      notificationData.length,
                      (index) {
                        // return FlutterLogo();
                        // notificationData[index]['data'] =
                        //     notificationData[index]['data'] ?? {};
                        return NotificationCard(
                          title: notificationData[index]['title'],
                          time: notificationData[index]['time'] ?? "error",
                          description: notificationData[index]['body'],
                          //link: "https://www.google.com",
                          link: "",
                          outline: (index < unread) ? true : false,
                          icon: "",
                          id: 14,
                        );
                      },
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                {
                  return Center(
                      child: Text(
                    "Seems like you have no new notifications",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ));
                }
              }

              return Center(child: LoadingAnimation());
            }),
      ),
    );
  }
}

// List<Map<String, dynamic>> notificationData = [
//   {
//     "id": 1,
//     "title": "Lorem Ipsum",
//     "time": "2023-02-02T00:00:00",
//     "content":
//         "Lorem ipsum dolor sit amet, consectetur adip is cing elit. Netus platea quis malesu",
//     "button": "Read more",
//     "link": "https://www.google.com"
//   },
//   {
//     "id": 2,
//     "title": "Lorem Ipsum",
//     "time": "2020-01-04T00:00:00",
//     "content":
//         "Lorem ipsum dolor sit amet, consectetur adip is cing elit. Netus platea quis malesu",
//     "button": "Read more",
//     "link": "https://www.google.com"
//   },
//   {
//     "id": 3,
//     "title": "Lorem Ipsum",
//     "time": "2023-01-15T00:00:00",
//     "content":
//         "Lorem ipsum dolor sit amet, consectetur adip is cing elit. Netus platea quis malesu",
//     "button": "Read more",
//     "link": "https://www.google.com"
//   }
// ];
