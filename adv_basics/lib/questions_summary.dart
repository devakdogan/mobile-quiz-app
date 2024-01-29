import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key,required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
         
        children: summaryData.map((data) {
          return Row( children: [
            Container(width:25, height:25, decoration: BoxDecoration(shape: BoxShape.circle,color: (data['user_answer'] == data['correct_answer']) ? Colors.greenAccent : Colors.red), child: Center(child: Text(((data['question_index'] as int) +1).toString()))),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                Text(data['question'] as String, style: GoogleFonts.lato(
                  fontSize: 15,
                  color: Colors.white,
                ),),
                const SizedBox(height: 5,),
                Text(data['user_answer'] as String, style: GoogleFonts.lato(
                  fontSize: 10,
                  color: (data['user_answer'] == data['correct_answer']) ? Colors.greenAccent : Colors.red,
                ),),
                Text(data['correct_answer'] as String,style: GoogleFonts.lato(
                  fontSize: 15,
                  color: Colors.greenAccent,
                ),),
                SizedBox(height: 10,)],),
              ),
            ),
          ],);
        }).toList(),),
      ),
    );
  }
}