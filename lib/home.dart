import 'package:flutter/material.dart';
import 'package:riverpod_demo/constant.dart';
import 'package:riverpod_demo/pages/change_notifier_provider_page.dart';
import 'package:riverpod_demo/pages/future_provider_page.dart';
import 'package:riverpod_demo/pages/provider_page.dart';
import 'package:riverpod_demo/pages/state_notifier_provider_page.dart';
import 'package:riverpod_demo/pages/state_provider_page.dart';
import 'package:riverpod_demo/pages/stream_provider_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.withOpacity(.3),
      appBar: AppBar(
        title: const Text("Riverpod practice"),
      ),
      body: Column(
          children: List.generate(
              Constant.providerList.length,
              (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => switchPage(index)));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      tileColor: Colors.white,
                      title: Text(Constant.providerList[index]),
                    ),
                  ))),
    );
  }

  Widget switchPage(int index) {
    switch (index) {
      case 0:
        return const ProviderPage();
      case 1:
        return const StateProviderPage();
      case 2:
        return const FutureProviderPage();
      case 3:
        return const StreamProviderPage();
      case 4:
        return const ChangeNotifierProviderPage();
      case 5:
        return const StateNotifierProviderPage();

      default:
        return const SizedBox();
    }
  }
}
