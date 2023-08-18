import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'join.dart';

String searchText = '';

List<String> items = ['티니핑', '티니핑'];
List<String> itemContents = ['Item 1 Contents', 'Item 2 Contents'];

class CharacterSearch extends StatefulWidget {
  const CharacterSearch({super.key});

  @override
  State<CharacterSearch> createState() => _CharacterSearchState();
}

class _CharacterSearchState extends State<CharacterSearch> {
  void cardClickEvent(BuildContext context, int index) {
    String content = itemContents[index];
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ContentPage(content: content),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            '캐릭터 검색',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            //icon: Icon(Icons.navigate_before),
            icon: SvgPicture.asset('assets/icon/appbar_prev_icon.svg'),
            color: Colors.black,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Join()));
            },
          ),
          actions: [
            TextButton(
                onPressed: () {},
                child: Text(
                  '완료',
                  style: TextStyle(color: Color(0xff52c6d8), fontSize: 14, fontWeight: FontWeight.w500),
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                      elevation: 4.0,
                      /*decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xffeeeeee)),
                        boxShadow: [BoxShadow(
                          blurRadius: 8,
                          offset: Offset(0, 4),
                          color: Color(0xffeeeeee).withOpacity(0.3)
                        )]
                      ),*/
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Stack(
                              alignment: AlignmentDirectional.centerEnd,
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: '캐릭터 또는 애니메이션을 입력해 주세요.',
                                    hintStyle: TextStyle(color: Color(0xffbbbbbb), fontSize: 14, fontWeight: FontWeight.w400),
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xffeeeeee)), borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff52c6d8)), borderRadius: BorderRadius.all(Radius.circular(12.0))),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      searchText = value;
                                    });
                                  },
                                ),
                                IconButton(
                                    onPressed: (){},
                                    icon: SvgPicture.asset('assets/icon/search_icon.svg'))
                              ],
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  Column(
                    children: [
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (searchText.isNotEmpty && !items[index].toLowerCase().contains(searchText.toLowerCase())) {
                              return SizedBox.shrink();
                            } else {
                              return Card(
                                elevation: 0,
                                shape: Border(
                                    bottom: BorderSide(
                                  color: Color(0xffeeeeee),
                                )),
                                child: ListTile(
                                  trailing: TextButton(
                                    child: Text(
                                      '등록',
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xff52c6d8)),
                                    ),
                                    onPressed: () {},
                                  ),
                                  title: Text(items[index]),
                                  onTap: () => cardClickEvent(context, index),
                                ),
                                /*Divider(
                                      height: 15.0,
                                      thickness: 2.0,
                                      color: Color(0xffeeeeee),
                                    )*/
                              );
                            }
                          })
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class ContentPage extends StatelessWidget {
  final String content;

  const ContentPage({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Content'),
      ),
      body: Center(
        child: Text(content),
      ),
    );
  }
}
