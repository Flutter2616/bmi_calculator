import 'package:bmi_calculator/controller/bmi_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Calculatescreen extends StatefulWidget {
  const Calculatescreen({super.key});

  @override
  State<Calculatescreen> createState() => _CalculatescreenState();
}

class _CalculatescreenState extends State<Calculatescreen> {

  Bmicontroller bmi = Get.put(
    Bmicontroller(),
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    "Your BMI Result",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  )
                ]),
              ),
              Spacer(),
              Text(
                "${bmi.category}",
                style: TextStyle(
                    color: Colors.green.shade500,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp),
              ),
              SizedBox(height: 30),
              Text("${bmi.bmi_cal.toInt()}",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 30.sp)),
              SizedBox(height: 30),
              SizedBox(height: 10.h,width: 50.w,
                child: Text(
                  "You have normal body weight Good job",
                  style: TextStyle(
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp),textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, 'home');
                  bmi.weight.value = 0;
                  bmi.age.value = 0;
                  bmi.height.value = 0;
                  bmi.male.value = false;
                  bmi.female.value = false;
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
                    "RECALCULATE BMI",
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
}
