import 'package:example_ui_2/fakedata/fakecategories.dart';
import 'package:flutter/material.dart';

import 'fakedata/fakedata.dart';
import 'model/categories.dart';
import 'model/model.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Center(
            child: Text(
              "Flutter Ebook App",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontFamily: "TimesNewRoman",
                  fontSize: 25),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      Books book = data[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          book.bookimage!,
                          height: 150,
                        ),
                      );
                    }),
                    itemCount: data.length,
                  )),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Categories",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      fontFamily: "TimesNewRoman"),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    Categories categoryOptions = categorydata[index];

                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(
                                3.0,
                                3.0,
                              ),
                              blurRadius: 3.0,
                              spreadRadius: 2.0,
                            ), //BoxShadow
                          ],
                        ),
                        height: 70,
                        width: 100,
                        child: Center(
                          child: Text(
                            categoryOptions.category,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                  itemCount: categorydata.length,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Recently Added",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 100,
                height: 500,
                child: ListView.builder(
                  itemBuilder: ((context, index) {
                    Books book1 = data[index];

                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: RecentlyAddedBook(
                        image: book1.bookimage!,
                        title: book1.title,
                        description: book1.desc,
                      ),
                    );
                  }),
                  itemCount: data.length,
                  scrollDirection: Axis.vertical,
                ),
              )
            ],
          ),
        ));
  }
}

class RecentlyAddedBook extends StatelessWidget {
  const RecentlyAddedBook(
      {Key? key,
      required this.image,
      required this.title,
      required this.description})
      : super(key: key);

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
        ),
        height: 150,
        width: 200,
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(image),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 5),
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    description,
                    style: const TextStyle(
                        fontFamily: "TimesNewRoman",
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
