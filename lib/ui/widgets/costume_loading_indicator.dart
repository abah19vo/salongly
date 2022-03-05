import 'package:flutter/material.dart';

class CostumeLoadingIndicator extends StatelessWidget {
  const CostumeLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(
          color: Color.fromARGB(179, 170, 175, 171),
        ),
        child: Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 212, 213, 214), borderRadius: BorderRadius.circular(10.0)),
          width: 300.0,
          height: 200.0,
          alignment: AlignmentDirectional.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: const SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child: CircularProgressIndicator(
                    color: Colors.green,
                    value: null,
                    strokeWidth: 7.0,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 25.0),
                child: const Center(
                  child: Text(
                    "loading.. wait...",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
