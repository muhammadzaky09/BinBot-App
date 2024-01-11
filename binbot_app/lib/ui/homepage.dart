import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static PreferredSizeWidget appBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: const Color.fromARGB(225, 219, 243, 246),
      title: Text(
          'Hello, ${(FirebaseAuth.instance.currentUser?.email)?.split('@')[0]}',
          style: const TextStyle(color: Color.fromARGB(255, 44, 75, 112))),
      actions: [
        IconButton(
          icon: const Icon(
            CupertinoIcons.bell_fill,
            color: Color.fromARGB(255, 44, 75, 112),
          ),
          onPressed: () {
            // handle the press
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.more_vert,
            color: Color.fromARGB(255, 44, 75, 112),
          ),
          onPressed: () {
            // handle the press
          },
        ),
      ],
    );
  }

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Stack(children: [
          // ignore: sized_box_for_whitespace
          Container(
            width: screenWidth,
            child: Image.asset(
              'assets/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18, 25, 0, 0),
            child: SortedWaste(sortedWaste: 9.42),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(18, 55, 0, 0),
            child: Text('of waste has been sorted',
                style: TextStyle(
                  color: Color.fromARGB(255, 44, 75, 112),
                  fontFamily: 'Bricolage Grotesque',
                  fontSize: 18.0,
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 120, 0, 0),
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF5E4C1)),
                child: const Text(
                  'Recycle and Get Rewards',
                  style: TextStyle(
                      color: Color(0xFF573C04),
                      fontFamily: 'RobotoBold',
                      fontSize: 15.0),
                )),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.fromLTRB(18, 20, 0, 0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Linked devices',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'RobotoBold',
                  fontSize: 22.0,
                )),
            const SizedBox(height: 10),
            Device(deviceName: '2023 BinBot Smart Trash Can')
          ]),
        )
      ],
    );
  }
}

class SortedWaste extends StatelessWidget {
  double sortedWaste;
  SortedWaste({
    super.key,
    required this.sortedWaste,
  });

  @override
  Widget build(BuildContext context) {
    return Text(sortedWaste.toString() + ' kg',
        style: TextStyle(
          color: Color.fromARGB(255, 44, 75, 112),
          fontFamily: 'Bricolage Grotesque',
          fontSize: 28.0,
        ));
  }
}

class Device extends StatefulWidget {
  final String deviceName;

  Device({
    Key? key,
    required this.deviceName,
  });

  @override
  State<Device> createState() => _DeviceState();
}

class _DeviceState extends State<Device> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset('assets/bin.png', width: 70, height: 70),
        const SizedBox(width: 15),
        Text(widget.deviceName,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'RobotoBold',
              fontSize: 18.0,
            )),
      ],
    );
  }
}
