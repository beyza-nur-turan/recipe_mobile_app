// ignore_for_file: file_names

import 'package:flutter/material.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});
  final imageUrl =
      'https://images.pexels.com/photos/3338497/pexels-photo-3338497.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
  final login = "ÜYE OL";
  final signIn = "KAYIT OL";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(imageUrl), fit: BoxFit.cover)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: () {},
              child: ElevatedButton(
                  onPressed: () {},
                  child: SizedBox(
                      child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Text(login,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: Colors.black)),
                  ))), //go to loginPage
            ),
          ),
          Container(
            color: Colors.orange,
            margin: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: () {},
              child: ElevatedButton(
                  onPressed: () {},
                  child: SizedBox(
                      child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Text(signIn,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: Colors.black)),
                  ))), //go to SignInPage
            ),
          )
        ],
        // child: Row(

        //   children: [ ElevatedButton(onPressed: (){}, child: child)],
        //    ,
      ),
    );
  }
}

class PaddingUtility {
  final EdgeInsets normpadding = const EdgeInsets.all(8.0);
  final EdgeInsets normp2xadding = const EdgeInsets.all(16.0);
  final EdgeInsets ozelpadding = const EdgeInsets.all(10.0);
}

class MarginUtility {
  final EdgeInsets ozelmargin = const EdgeInsets.all(5.0);
}
