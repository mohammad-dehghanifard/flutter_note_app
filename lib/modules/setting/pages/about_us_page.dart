import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: BackButton())),
              Text("گروه برنامه نویسی نُوا",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
              SizedBox(height: 16,),
              Text(
                "در دنیای امروز، حضور پررنگ در فضای آنلاین برای هر کسب و کاری ضروری است. آژانس دیجیتال مارکتینگ نوا دِو​ با ارائه طیف وسیعی از خدمات، به شما کمک می‌کند تا در این دنیای پرهیاهو، مسیریابی کنید و به اهدافتان برسید. ما یک تیم پویا و تخصصی در زمینه دیجیتال مارکتینگ هستیم که با ارائه خدمات متنوعی از جمله برنامه نویسی وب و موبایل، طراحی سایت، و برند سازی، به هدف شما از دیجیتالی شدن کمک می‌کنیم.",
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
