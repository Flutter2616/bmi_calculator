import 'package:get/get.dart';

class Bmicontroller extends GetxController
{
  RxDouble height=50.0.obs;
  RxInt weight=0.obs;
  RxInt age=0.obs;
  RxBool male=false.obs;
  RxBool female=false.obs;
  RxDouble bmi_cal=0.0.obs;
  RxString category="".obs;


  void  bmi_category()
  {
    if(bmi_cal.value<16)
      {
        category.value="Severe Thinness";
      }
    else if(bmi_cal.value<17&&bmi_cal.value>=16)
      {
        category.value="Moderate Thinness";
      }
    else if(bmi_cal.value < 18.5 && bmi_cal.value >= 17)
      {
        category.value="Mild Thinness";
      }
    else if(bmi_cal.value < 25 && bmi_cal.value >= 18.5)
      {
        category.value="Normal";
      }
    else if(bmi_cal.value < 30 && bmi_cal.value >= 25)
      {
        category.value="OverWeight";
      }
    else
      {
        category.value="Obese Class";
      }
  }
}