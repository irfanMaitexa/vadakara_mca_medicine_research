import 'package:flutter/material.dart';
import 'package:medicine_research/widgets/column_text.dart';


class PhyMedicineDetailsScreen extends StatefulWidget {
  const PhyMedicineDetailsScreen({super.key, required this.image});

  final String image;

  @override
  State<PhyMedicineDetailsScreen> createState() => _PhyMedicineDetailsScreenState();
}

class _PhyMedicineDetailsScreenState extends State<PhyMedicineDetailsScreen> {

  
  @override
  Widget build(BuildContext context) {
    const sizedBox = SizedBox(
      height: 10,
    );
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 30,
        ),
        child: Column(
          children: [
            Expanded(
              child: Card(
                elevation: 1,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          widget.image,
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    const Expanded(
                        flex: 2,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ColumnText(
                                  text1: 'Description',
                                  text2:
                                      'Paracetamol is available in various forms, including tablets, capsules, liquid, and effervescent tablets. It is often combined with other medications, such as codeine, to enhance its pain-relieving effects.',
                                ),
                                sizedBox,
                                ColumnText(
                                    text1: 'Purpose',
                                    text2: 'Pain relief, fever reduction'),
                                sizedBox,
                                ColumnText(
                                    text1: 'Common Uses:',
                                    text2:
                                        'Headaches, muscle aches, arthritis, fever, toothaches, colds'),
                                sizedBox,
                                ColumnText(
                                    text1: 'Dosage Form',
                                    text2:
                                        'Tablets, capsules, liquid, effervescent tablets'),
                                ColumnText(
                                    text1: 'Dosage Form',
                                    text2:
                                        'Tablets, capsules, liquid, effervescent tablets'),
                                ColumnText(
                                    text1: 'Dosage Form',
                                    text2:
                                        'Tablets, capsules, liquid, effervescent tablets')
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
