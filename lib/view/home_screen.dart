import 'package:bmi_calculator/controller/bmi_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  Bmicontroller bmi = Get.put(
    Bmicontroller(),
  );
  AnimationController? animationController;
  Animation? genderanimation;
  Animation? ageanimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3),);
    genderanimation = Tween<Alignment>(begin: Alignment(-40,0), end: Alignment(0,0))
        .animate(animationController!);
    ageanimation = Tween<Alignment>(begin: Alignment(40,0), end: Alignment(0,0))
        .animate(animationController!);
    animationController!.forward();
    animationController!.addListener(() {setState(() {

    });});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "BMI CALCULATOR",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp),
                  ),
                  InkWell(
                      onTap: () {
                        bmi.weight.value = 0;
                        bmi.age.value = 0;
                        bmi.height.value = 0;
                        bmi.male.value = false;
                        bmi.female.value = false;
                      },
                      child: Icon(Icons.refresh,
                          size: 20.sp, color: Colors.white)),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Align(alignment: genderanimation!.value,
                      child: InkWell(
                        onTap: () {
                          if (bmi.male == false) {
                            bmi.male.value = true;
                            bmi.female.value = false;
                          }
                        },
                        child: gender(
                            "Male",
                            Obx(
                              () => Icon(Icons.male,
                                  color: bmi.male.value == true
                                      ? Colors.pink
                                      : Colors.white,
                                  size: 30.sp),
                            ),
                            bmi.male),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: ageanimation!.value,
                      child: InkWell(
                        onTap: () {
                          if (bmi.female == false) {
                            bmi.male.value = false;
                            bmi.female.value = true;
                          }
                        },
                        child: gender(
                            "Female",
                            Obx(
                              () => Icon(Icons.female,
                                  color: bmi.female == true
                                      ? Colors.pink
                                      : Colors.white,
                                  size: 30.sp),
                            ),
                            bmi.female),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Align(
                alignment: genderanimation!.value,
                child: Container(
                  height: 20.h,
                  width: 100.w,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.indigo.shade400,
                      borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("HEIGHT",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp)),
                      SizedBox(height: 10),
                      Obx(
                        () => Text(
                          "${bmi.height.value.toInt()}cm",
                          style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                      Spacer(),
                      Obx(
                        () => Slider(
                          value: bmi.height.value,
                          max: 200,
                          onChanged: (value) {
                            bmi.height.value = value;
                          },
                          thumbColor: Colors.pink,
                          activeColor: Colors.pink.shade200,
                          inactiveColor: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Align(alignment: genderanimation!.value,child: add_remove("WEIGHT", bmi.weight))),
                  Expanded(child: Align(alignment: ageanimation!.value,child: add_remove("AGE", bmi.age))),
                ],
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  bmi.bmi_cal.value = (bmi.weight.value /
                          (bmi.height.value * bmi.height.value)) *
                      10000;
                  Navigator.pushReplacementNamed(context, 'calculate');
                  bmi.bmi_category();
                },
                child: Container(
                  height: 7.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "CALCULATE YOUR BMI",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container add_remove(String title, RxInt no) {
    return Container(
      alignment: Alignment.center,
      width: 45.w,
      height: 40.w,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.indigo.shade400,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$title",
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
          Obx(
            () => Text(
              "${no.value}",
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    no.value++;
                  },
                  child: addbutton(
                      Icon(Icons.add, color: Colors.white, size: 20.sp))),
              InkWell(
                  onTap: () {
                    if (no.value > 0) {
                      no.value--;
                    }
                  },
                  child: addbutton(
                      Icon(Icons.remove, color: Colors.white, size: 20.sp))),
            ],
          ),
        ],
      ),
    );
  }

  CircleAvatar addbutton(Icon i) {
    return CircleAvatar(
        child: i, radius: 22.sp, backgroundColor: Colors.indigo.shade900);
  }

  Container gender(String title, Obx i, RxBool male) {
    return Container(
      alignment: Alignment.center,
      width: 45.w,
      height: 40.w,
      decoration: BoxDecoration(
          color: Colors.indigo.shade400,
          borderRadius: BorderRadius.circular(20)),
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            i,
            SizedBox(height: 10),
            Text(
              "$title",
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: male.value == true ? Colors.pink : Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
