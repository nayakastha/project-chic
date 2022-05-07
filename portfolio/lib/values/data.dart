part of 'values.dart';

class MenuData {
  MenuData({
    required this.title,
    required this.routeName,
  });

  final String title;
  final String routeName;
}

class CertificationData {
  CertificationData({
    required this.title,
    required this.image,
    required this.imageSize,
    required this.url,
    required this.awardedBy,
  });

  final String image;
  final double imageSize;
  final String url;
  final String title;
  final String awardedBy;
}

class ProjectDetails {
  ProjectDetails({
    required this.projectImage,
    required this.projectName,
    required this.projectDescription,
    this.technologyUsed,
    this.isPublic,
    this.isLive,
    this.isOnPlayStore,
    this.playStoreUrl,
    this.webUrl,
    this.hasBeenReleased,
    this.gitHubUrl,
  });

  final String projectImage;
  final String projectName;
  final String projectDescription;
  final bool? isPublic;
  final bool? isOnPlayStore;
  final bool? isLive;
  final bool? hasBeenReleased;
  final String? playStoreUrl;
  final String? gitHubUrl;
  final String? webUrl;
  final String? technologyUsed;
}

class PortfolioData {
  PortfolioData({
    required this.title,
    required this.image,
    required this.imageSize,
    required this.subtitle,
    required this.portfolioDescription,
    this.technologyUsed,
    this.isPublic = false,
    this.isOnPlayStore = false,
    this.isLive = false,
    this.gitHubUrl = "",
    this.hasBeenReleased = true,
    this.playStoreUrl = "",
    this.webUrl = "",
  });

  final String image;
  final String portfolioDescription;
  final double imageSize;
  final String title;
  final String subtitle;
  final bool isPublic;
  final bool hasBeenReleased;
  final String gitHubUrl;
  final bool isOnPlayStore;
  final String playStoreUrl;
  final bool isLive;
  final String webUrl;
  final String? technologyUsed;
}

class ExperienceData {
  ExperienceData({
    required this.position,
    required this.roles,
    required this.location,
    required this.duration,
    this.company,
    this.companyUrl,
  });

  final String? company;
  final String? companyUrl;
  final String location;
  final String duration;
  final String position;
  final List<String> roles;
}

class SkillData {
  SkillData({
    required this.skillName,
    required this.skillLevel,
  });

  final String skillName;
  final double skillLevel;
}

class SubMenuData {
  SubMenuData({
    required this.title,
    this.isSelected,
    this.content,
    this.skillData,
    this.isAnimation = false,
  });

  final String title;
  final String? content;
  final List<SkillData>? skillData;
  bool isAnimation;
  bool? isSelected;
}

class Data {
  static List<MenuData> menuList = [
    MenuData(title: StringConst.HOME, routeName: HomePage.homePageRoute),
    MenuData(title: StringConst.ABOUT_ME, routeName: AboutPage.aboutPageRoute),
    MenuData(
      title: StringConst.PORTFOLIO,
      routeName: PortfolioPage.portfolioPageRoute,
    ),
    MenuData(
      title: StringConst.EXPERIENCE,
      routeName: ExperiencePage.experiencePageRoute,
    ),
    MenuData(title: StringConst.RESUME, routeName: StringConst.RESUME),
  ];

  static List<SkillData> skillData = [
    SkillData(skillLevel: 85, skillName: StringConst.DART),
    SkillData(skillLevel: 70, skillName: StringConst.KOTLIN),
    SkillData(skillLevel: 85, skillName: StringConst.C),
    SkillData(skillLevel: 90, skillName: StringConst.CPP),
    SkillData(skillLevel: 70, skillName: StringConst.JAVA),
    SkillData(skillLevel: 80, skillName: StringConst.PYTHON),
    SkillData(skillLevel: 70, skillName: StringConst.TYPESCRIPT),
    SkillData(skillLevel: 80, skillName: StringConst.JAVASCRIPT),
    SkillData(skillLevel: 80, skillName: StringConst.SQL),
    SkillData(skillLevel: 90, skillName: StringConst.MARKDOWN),
    SkillData(skillLevel: 90, skillName: StringConst.FLUTTER),
    SkillData(skillLevel: 78, skillName: StringConst.ANDROID),
    SkillData(skillLevel: 75, skillName: StringConst.NODEJS),
    SkillData(skillLevel: 65, skillName: StringConst.MONGODB),
    SkillData(skillLevel: 80, skillName: StringConst.FIREBASE),
    SkillData(skillLevel: 85, skillName: StringConst.GIT),
    SkillData(skillLevel: 70, skillName: StringConst.GCP),
    SkillData(skillLevel: 70, skillName: StringConst.AWS),
  ];

  static List<SubMenuData> subMenuData = [
    SubMenuData(
      title: StringConst.KEY_SKILLS,
      isSelected: true,
      isAnimation: true,
      skillData: skillData,
    ),
    SubMenuData(
      title: StringConst.EDUCATION,
      isSelected: false,
      isAnimation: false,
      content: StringConst.EDUCATION_TEXT,
    ),
  ];
  static List<PortfolioData> portfolioData = [
    //Avenue
    PortfolioData(
      title: StringConst.PROJECT_3,
      subtitle: StringConst.PROJECT_3_SUBTITLE,
      image: ImagePath.PROJECT_3,
      portfolioDescription: StringConst.PROJECT_3_DETAIL,
      imageSize: 0.2,
      isPublic: true,
      isLive: false,
      gitHubUrl: StringConst.PROJECT_3_GITHUB_URL,
      technologyUsed: StringConst.PROJECT_3_TECHNOLOGIES,
    ),

    //Applocker
    PortfolioData(
      title: StringConst.PROJECT_4,
      subtitle: StringConst.PROJECT_4_SUBTITLE,
      image: ImagePath.PROJECT_4,
      portfolioDescription: StringConst.PROJECT_4_DETAIL,
      imageSize: 0.2,
      isPublic: true,
      gitHubUrl: StringConst.PROJECT_4_GITHUB_URL,
      technologyUsed: StringConst.PROJECT_4_TECHNOLOGIES,
    ),

    //Aptiche
    PortfolioData(
      title: StringConst.PROJECT_5,
      subtitle: StringConst.PROJECT_5_SUBTITLE,
      image: ImagePath.PROJECT_5,
      portfolioDescription: StringConst.PROJECT_5_DETAIL,
      imageSize: 0.2,
      isPublic: true,
      isOnPlayStore: true,
      gitHubUrl: StringConst.PROJECT_5_GITHUB_URL,
      technologyUsed: StringConst.PROJECT_5_TECHNOLOGIES,
      playStoreUrl: StringConst.PROJECT_5_PLAYSTORE,
    ),

    //ICS App
    PortfolioData(
      title: StringConst.PROJECT_1,
      subtitle: StringConst.PROJECT_1_SUBTITLE,
      image: ImagePath.PROJECT_1,
      portfolioDescription: StringConst.PROJECT_1_DETAIL,
      imageSize: 0.2,
      isPublic: true,
      hasBeenReleased: true,
      isOnPlayStore: true,
      technologyUsed: StringConst.PROJECT_1_TECHNOLOGIES,
      gitHubUrl: StringConst.PROJECT_1_GITHUB_URL,
    ),

    //Portfolio Website
    PortfolioData(
      title: StringConst.PROJECT_2,
      subtitle: StringConst.PROJECT_2_SUBTITLE,
      image: ImagePath.PROJECT_2,
      portfolioDescription: StringConst.PROJECT_2_DETAIL,
      imageSize: 0.41,
      isPublic: true,
      hasBeenReleased: true,
      isLive: true,
      technologyUsed: StringConst.PROJECT_2_TECHNOLOGIES,
      gitHubUrl: StringConst.PROJECT_2_GITHUB_URL,
      webUrl: StringConst.PROJECT_2_DEMO,
    ),

    //pallisadoes
    PortfolioData(
      title: StringConst.PROJECT_6,
      subtitle: StringConst.PROJECT_6_SUBTITLE,
      image: ImagePath.PROJECT_6,
      portfolioDescription: StringConst.PROJECT_6_DETAIL,
      imageSize: 0.2,
      isPublic: true,
      isLive: true,
      webUrl: StringConst.PROJECT_6_DEMO_URL,
      technologyUsed: StringConst.PROJECT_6_TECHNOLOGIES,
      gitHubUrl: StringConst.PROJECT_6_GITHUB_URL,
    ),

    //khojbuy
    PortfolioData(
      title: StringConst.PROJECT_7,
      subtitle: StringConst.PROJECT_7_SUBTITLE,
      image: ImagePath.PROJECT_7,
      portfolioDescription: StringConst.PROJECT_7_DETAIL,
      imageSize: 0.2,
      isPublic: true,
      isLive: true,
      isOnPlayStore: true,
      playStoreUrl: StringConst.PROJECT_7_PLAYSTORE,
      webUrl: StringConst.PROJECT_7_DEMO_URL,
      technologyUsed: StringConst.PROJECT_7_TECHNOLOGIES,
      gitHubUrl: StringConst.PROJECT_7_GITHUB_URL,
    ),

    //qrscangen
    PortfolioData(
      title: StringConst.PROJECT_8,
      subtitle: StringConst.PROJECT_8_SUBTITLE,
      image: ImagePath.PROJECT_8,
      portfolioDescription: StringConst.PROJECT_8_DETAIL,
      imageSize: 0.2,
      isPublic: true,
      isOnPlayStore: true,
      playStoreUrl: StringConst.PROJECT_8_PLAYSTORE,
      gitHubUrl: StringConst.PROJECT_8_GITHUB_URL,
      technologyUsed: StringConst.PROJECT_8_TECHNOLOGIES,
    ),
  ];

  static List<ExperienceData> experienceData = [
    ExperienceData(
      company: StringConst.COMPANY_7,
      position: StringConst.POSITION_7,
      companyUrl: StringConst.COMPANY_7_URL,
      roles: [
        StringConst.COMPANY_7_ROLE_1,
        StringConst.COMPANY_7_ROLE_2,
      ],
      location: StringConst.LOCATION_7,
      duration: StringConst.DURATION_7,
    ),
    ExperienceData(
      company: StringConst.COMPANY_6,
      position: StringConst.POSITION_6,
      companyUrl: StringConst.COMPANY_6_URL,
      roles: [
        StringConst.COMPANY_6_ROLE_1,
        StringConst.COMPANY_6_ROLE_2,
      ],
      location: StringConst.LOCATION_6,
      duration: StringConst.DURATION_6,
    ),
    ExperienceData(
      company: StringConst.COMPANY_5,
      position: StringConst.POSITION_5,
      companyUrl: StringConst.COMPANY_5_URL,
      roles: [
        StringConst.COMPANY_5_ROLE_1,
        StringConst.COMPANY_5_ROLE_2,
      ],
      location: StringConst.LOCATION_5,
      duration: StringConst.DURATION_5,
    ),
    ExperienceData(
      company: StringConst.COMPANY_3,
      position: StringConst.POSITION_3,
      companyUrl: StringConst.COMPANY_3_URL,
      roles: [
        StringConst.COMPANY_3_ROLE_1,
        StringConst.COMPANY_3_ROLE_2,
      ],
      location: StringConst.LOCATION_3,
      duration: StringConst.DURATION_3,
    ),
    ExperienceData(
      company: StringConst.COMPANY_4,
      position: StringConst.POSITION_4,
      companyUrl: StringConst.COMPANY_4_URL,
      roles: [
        StringConst.COMPANY_4_ROLE_1,
        StringConst.COMPANY_4_ROLE_2,
      ],
      location: StringConst.LOCATION_4,
      duration: StringConst.DURATION_4,
    ),
    ExperienceData(
      company: StringConst.COMPANY_2,
      position: StringConst.POSITION_2,
      companyUrl: StringConst.COMPANY_2_URL,
      roles: [
        StringConst.COMPANY_2_ROLE_1,
        StringConst.COMPANY_2_ROLE_2,
      ],
      location: StringConst.LOCATION_2,
      duration: StringConst.DURATION_2,
    ),
    ExperienceData(
      company: StringConst.COMPANY_1,
      position: StringConst.POSITION_1,
      companyUrl: StringConst.COMPANY_1_URL,
      roles: [
        StringConst.COMPANY_1_ROLE_1,
        StringConst.COMPANY_1_ROLE_2,
      ],
      location: StringConst.LOCATION_1,
      duration: StringConst.DURATION_1,
    ),
  ];
}
