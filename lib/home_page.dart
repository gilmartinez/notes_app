import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var count = 0;
  var notes = <String>["Primeiro Item"];

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.purple,
    primary: Colors.grey[300],
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  void _addCards(String description) {
    notes.add(description);
    setState(() {
      count++;
    });
  }

  void _updateCards(String description, int index) {
    notes[index] = description;
    setState(() {});
  }

  void _deleteCards(int index) {
    notes.removeAt(index);
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("NOTES"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var i = 0; i < notes.length; ++i)
              Card(
                child: ListTile(
                  title: Text(notes[i]),
                  onTap: () async {
                    final response = await Navigator.pushNamed(
                        context, "/create-note",
                        arguments: notes[i]);

                    if (response != null) {
                      var description = response as String;
                      if (description.isEmpty) {
                        _deleteCards(i);
                      } else
                        _updateCards(description, i);
                    }
                  },
                ),
              ),
            SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      style: raisedButtonStyle,
                      onPressed: () async {
                        final description =
                            await Navigator.pushNamed(context, "/create-note");
                        if (description != null)
                          _addCards(description as String);
                      },
                      child: Icon(Icons.add),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     final description =
      //         await Navigator.pushNamed(context, "/create-note");
      //     if (description != null) _addCards(description as String);
      //   },
      //   backgroundColor: Colors.purpleAccent,
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
