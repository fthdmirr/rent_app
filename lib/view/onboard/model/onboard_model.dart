class OnboardingModel {
  final String lottieFile;
  final String title;
  final String subtitle;

  OnboardingModel(this.lottieFile, this.title, this.subtitle);
}

List<OnboardingModel> tabs = [
 
  OnboardingModel(
      
     'assets/conversationlottie.json',
     'Welcome to the Altorent',
    'AltoRent allows you to rent these items for \na few hours to meet your \nneeds. ',
  //'Some of the stuff not necessarily to own and tools such as drills, waterproof cameras, drones, mechanical tools are usually left aside after purchase and used only once.\n Renting these items for few hours to fix the problems will be a good opportunity.\nAltoRent allows you to rent these items for \na few hours to meet your \nneeds. ',
  
  ),
  OnboardingModel(
    'assets/promotional.json',
    'Rent Out',
    'You can also create advertisements for \nthe technological devices you do not need \nand rent them.',
  ),
  OnboardingModel(
    'assets/hired.json',
    'Easy to use',
    'You can easily create an account \nwith your email or github account \nto use AltoRent.',
  ),
];
