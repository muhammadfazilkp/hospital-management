
import 'package:flutter/material.dart';

import '../../core/core.dart';

class ListileCustome extends StatelessWidget {
  final name;
  
  const ListileCustome({
    super.key,required this.name,

  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white38,
      child: ListTile(
        visualDensity:  const VisualDensity(vertical: 3),
        leading: const CircleAvatar(
          backgroundColor: Colors.grey,
        ),
        title: Text(
         name,
          style: homep,
        ),
        subtitle: Text(
          'Skin specilist',
          style: fonts,
        ),
        trailing: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            
            Flexible(
              flex: 1,
              child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.payments_outlined,
                    color: Colors.green,
                  ),
                  label: const Text('300')),
            ),
            Flexible(
              flex: 1,
              child: TextButton.icon(
                  onPressed: () {},
                  icon: Text(
                    'book the slot',
                    style: textbutton,
                  ),
                  label: const Icon(
                    Icons.book_online_outlined,
                    color: Colors.green,
                  )),
            ),
            
            
            
          ],
        ),
      ),
    );
  }
}
