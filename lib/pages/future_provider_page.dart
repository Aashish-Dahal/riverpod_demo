import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/services/api_service.dart';

final activityProvider = FutureProvider((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getActivity();
});

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activityRef = ref.watch(activityProvider);
    return Scaffold(
        backgroundColor: Colors.blue.withOpacity(.3),
        appBar: AppBar(
          title: const Text('Future Providere'),
        ),
        body: RefreshIndicator(
          onRefresh: () => ref.refresh(activityProvider.future),
          child: ListView(children: [
            activityRef.when(
              data: (data) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    tileColor: Colors.white,
                    title: Text(data.activity!),
                    subtitle: Text(data.type!),
                  ),
                );
              },
              error: (error, stackTrace) {
                return Center(child: Text(error.toString()));
              },
              loading: () {
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ]),
        ));
  }
}
