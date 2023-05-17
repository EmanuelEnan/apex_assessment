import 'package:apex_assessment/constants/constant.dart';

import 'package:flutter/material.dart';

import '../services/company_create_service.dart';

final CompanyCreateService companyCreateService = CompanyCreateService();

entryDialog(BuildContext context) {
  showDialog<void>(
    context: context,
    // barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const LinearBorder(),
        title: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.cancel_outlined),
                ),
              ),
            ),
            const Text('Create a New Company'),
          ],
        ),
        content: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(11),
            child: Column(
              children: [
                fieldDesign('Company Name'),
                const SizedBox(
                  height: 15,
                ),
                fieldDesign('Work Email'),
                const SizedBox(
                  height: 15,
                ),
                fieldDesign('Password'),
                const SizedBox(
                  height: 15,
                ),
                fieldDesign('Phone'),
                const SizedBox(
                  height: 27,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                    ),
                    onPressed: () {
                      // FutureBuilder(
                      //   future: companyCreateService.postApi(),
                      //   builder: (context, AsyncSnapshot<CompanyPostModel> snapshot) {
                      //     // return ListView.builder(
                      //     //   itemBuilder: (context, index) {
                      //         if (snapshot.hasData && snapshot.data!.statusCode == '1') {
                      //           print('111');
                      //           Navigator.of(context).pop();
                      //           var snackBar = SnackBar(
                      //             content: Text(
                      //                 snapshot.data!.statusMessage!),
                      //             duration: const Duration(milliseconds: 500),
                      //           );

                      //           ScaffoldMessenger.of(context)
                      //               .showSnackBar(snackBar);
                      //         } else {
                      //           const Text('There are some errors!');
                      //         }
                      //         return const Text('loading..');
                      //     //   },
                      //     // );
                      //   },
                      // );
                      companyCreateService.postApi();
                      Navigator.of(context).pop();
                      const snackBar = SnackBar(
                        content: Text('Company created successfully'),
                        duration: Duration(milliseconds: 500),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: buttonText('Create a New Company'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget fieldDesign(String text) {
  return TextField(
    decoration: InputDecoration(
      hintText: text,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: textFieldColor,
        ),
      ),
    ),
  );
}

Widget buttonText(String data) {
  return Text(
    data,
    style: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
  );
}

Widget title(String data) {
  return Text(
    data,
    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
  );
}

Widget subTitle(String data) {
  return Text(
    data,
    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
  );
}
