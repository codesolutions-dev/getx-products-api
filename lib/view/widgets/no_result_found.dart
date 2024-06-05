import 'package:flutter/cupertino.dart';

class NoResultFound extends StatelessWidget {
  const NoResultFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset('assets/images/no_result_found.png'),
          ),
          const Text(
            'No Result Found',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Text(
            'We cant\'t find any item matching your search',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Color.fromARGB(150, 0, 0, 0),
            ),
          ),
        ],
      ),
    );
  }
}
