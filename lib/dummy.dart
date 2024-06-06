final iconList = [
  "bank.png",
  "coding.png",
  "design.png",
  "education.png",
  "health.png",
  "it.png",
  "restaurant.png"
];
final jobs = ["450", "125", "377", "549", "458", "667", "846"];
final jobNames = ["bank", "coding", "design", "education", "health", "it", "restaurant"];
final featuredJobsName = [
  "Product Designer",
  "Assistant Manager",
  "Systems Engineer",
  "Product Team Lead"
];
final featuredJobsPrice = [
  "40,000",
  "1,00,000",
  "64,000",
  "1 - 2,00,000",
];

final employerImage = [
  "facebook.png",
  "flipkart.png",
  "globe.png",
  "info.png",
  "linkedin.png",
];
final employerName = [
  "Facebook",
  "Flipkart",
  "CyberPark",
  "InfoSys Technologies",
  "LinkedIn",
];
final companies = [
  "amazon-logo.png",
  "instagram.png",
  "google-logo.png",
  "microsoft.png",
];
final companyCategory = ["Description", "Company", "Reviews", "Gallery", "Amenities"];
final gender = ["male", "female", "others"];

final qualification = [
  "below 10th",
  "10th pass",
  "12th pass",
  "Pursuing Graduation",
  "Graduate",
  "Post Graduate",
];
final wordExp = [
  "Fresher",
  "1-6 months",
  "6 months - 1 year",
  "1-2 years",
  "2-3 years",
  "3-4 years",
  "4-5 years",
  "5+ years",
];

final alljobs = [
  "Aaya / Caretaker",
  "Air Hostes / Cabin Crew",
  "Bartender",
  "Carpenter",
  "civil Engineer",
  "Computer Operator",
  "Cook / Chef",
  "TeleSales / Telemarketing",
  "Bank Office Executive",
  "Sales / Business Development",
  "Delivery Boy /Girl",
  "Customer Care",
  "Human Resource (HR)",
  "Admin Executive",
  "Accoutant",
];

final allJobsImg = [
  "caretaker.png",
  "air-hostes.png",
  "bartender.png",
  "carpenter.png",
  "civil-engineer.png",
  "chef.png",
  "salesman.png",
  "banker.png",
  "salesman.png",
  "delivery-boy.png",
  "customer-service.png",
  "hr.png",
  "businessman.png",
  "manager.png",
  "accountant.png",
];

final skills = [
  "The following wireframe and brand guidelines are used in our design projects.",
  "Dipa Inhouse is a creative digital design and development agency. We provide high-quality services and help you to find solutions in UI/UX designs that are intuitive and represent your business goal.",
  "We're ready to solve your problems and collaborate with your product. Let us know and say hello",
  "I’m excited to share the latest mobile app design exploration called Jobhunt.",
];

final requirements = [
  "Any Degree",
  "1 year minimum experience",
  "knowledge in figma or adobe xd",
  "English speaking",
  "dedicated",
];

final shiftTimings = [
  "full time",
  "part time",
  "remote",
  "flexible shift",
];

final companyGallery = [
  "friends.jpg",
  "meeting.jpg",
  "my-lap.jpg",
  "my-resume.jpg",
  "work-place.jpg",
];

final jobShift = [
  "Remote",
  "Full Time",
  "Part Time",
  "Internship",
];
final jobExperience = [
  "0 - 6 months",
  "6 months - 1 year",
  "1 - 2 year",
  "2 - 3 year",
  "3 - 4 year",
  "5+ years",
];

final jobRates = [
  "40,000",
  "64,000",
  "40-45,000",
  "32,000",
];

final jobSalary = [
  "upto 5000",
  "10,000 - 20,000",
  "20,000- 30,000",
  "30,000 - 50,000",
  "50,000 - 70,000",
  "70,000 - 90,000",
  "90,000 and above",
];

final filterEducation = [
  "10th pass",
  "12th pass",
  "Diploma",
  "Graduate",
  "Post Graduate",
];

final forumDescriptions = [
  "The following wireframe and brand guidelines are used in our design projects. https://dribbble.com Here's my latest exploration of a community mobile app called PeopleHub. What do you guys think? Let me know in the feedback section!",
  "Dipa Inhouse is a creative digital design and development agency. We provide high-quality services and help you to find solutions in UI/UX designs that are intuitive and represent your business goal. Here's my latest exploration of a community mobile app called PeopleHub. What do you guys think? Let me know in the feedback section!",
  "We're ready to solve your problems and collaborate with your product. Let us know and say hello. Here's my latest exploration of a community mobile app called PeopleHub. What do you guys think? Let me know in the feedback section!",
  "I’m excited to share the latest mobile app design exploration called Jobhunt. Here's my latest exploration of a community mobile app called PeopleHub. What do you guys think? Let me know in the feedback section!",
];

final faqQ = [
  "How do I get a job?",
  "Does this app take money for service?",
  "Do we take any personal information and provide to third parties?",
  "How do I ask for help if I'm stuck while using the app?"
];

// List<Messages> messages = [
//   Messages(
//     isme: true,
//     text: "I am interested in this job.",
//   ),
//   Messages(
//     isme: false,
//     text: "hello mr.Aravind",
//   ),
//   Messages(
//     isme: false,
//     text: "we are happy to have you as a senior flutter dev.",
//   ),
//   Messages(
//     isme: true,
//     text: "I'm glad to hear that.",
//   ),
// ].reversed.toList();

class Messages {
  String? text;
  bool? isme;
  String? filePath;

  Messages({
    this.text,
    this.isme,
    this.filePath,
  });
}

class Company {
  String? companyName;
  String? jobRole;

  Company({this.companyName, this.jobRole});
}

final personalSkills = [
  "Content typing",
  "Web Designing",
  "App Development",
  "HTML",
  "Type Writing",
  "Driving Skills",
  "English Speaking",
];

class ForumPostClass {
  final String? image;
  final String? companyIcon;
  final String? title;
  final String? companyName;

  ForumPostClass({
    this.image,
    this.title,
    this.companyIcon,
    this.companyName,
  });
}
