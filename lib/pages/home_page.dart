import 'package:apex_assessment/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/company_model.dart';

import '../services/company_list_service.dart';
import '../widgets/widget.dart';

final companyFutureProvider =
    FutureProvider.autoDispose<List<CompanyModel>>((ref) async {
  final apiService = ref.watch(apiProvider);
  return apiService.getApi();
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final companyRef = ref.watch(
      companyFutureProvider,
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Company List'),
      ),
      body: companyRef.when(data: (data) {
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListView.separated(
              shrinkWrap: true,
              itemCount: data[index].companyList!.data!.length,
              itemBuilder: (context, index1) {
                return Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(left: 27, top: 22, bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title(
                        data[index].companyList!.data![index1].companyName!,
                      ),
                      subTitle(
                        data[index].companyList!.data![index1].email!,
                      ),
                      subTitle(
                        data[index].companyList!.data![index1].phone!,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            );
          },
        );
      }, error: (error, _) {
        return Text(error.toString());
      }, loading: () {
        return const Center(child: CircularProgressIndicator());
      }),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: buttonColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
        onPressed: () {
          entryDialog(context);
        },
        label: const SizedBox(
          width: 129,
          height: 37,
          // padding: const EdgeInsets.all(8),
          child: Center(
            child: Text(
              'Create Company',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Manrope',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
