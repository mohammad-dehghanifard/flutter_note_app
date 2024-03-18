import 'package:flutter/material.dart';
import 'package:flutter_note_app/modules/note/controllers/note_controller.dart';
import 'package:flutter_note_app/modules/note/widgets/note_widget.dart';
import 'package:get/get.dart';

class AllNotePage extends StatelessWidget {
  const AllNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NoteController>(
      init: NoteController(),
      builder: (controller) {
        return ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
          return const NoteWidget(
            title: "عنوان نوشته",
            content: "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد کتابهای زیادی در شصت و سه درصد گذشته حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.",
          );
        },);
      }
    );
  }
}

