// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:liberal_international/animation/fade_page_route.dart';
// import 'package:liberal_international/api/API.dart';
// import 'package:liberal_international/common/util/colors.dart';
// import 'package:liberal_international/common/util/keepPageAlive.dart';
// import 'package:liberal_international/common/widgets/ShowAlertDialog.dart';
// import 'package:liberal_international/common/widgets/appBar.dart';
// import 'package:liberal_international/common/widgets/circular_progress_indicator.dart';
// import 'package:liberal_international/common/widgets/contact_bar_yellow.dart';
// import 'package:liberal_international/common/widgets/custom_toast.dart';
// import 'package:liberal_international/common/widgets/icon_tile.dart';
// import 'package:liberal_international/common/widgets/party_container.dart';
// import 'package:liberal_international/models/authorization/model_login.dart';
// import 'package:liberal_international/models/directory/model_directory.dart';
// import 'package:liberal_international/models/directory/model_userProfile.dart';
// import 'package:liberal_international/models/hub/model_myHubs.dart';
// import 'package:liberal_international/navigation/Naviagation.dart';
// import 'package:liberal_international/providers/authorization_provider.dart';
// import 'package:liberal_international/providers/directory_provider.dart';
// import 'package:liberal_international/providers/hubs_provider.dart';
// import 'package:liberal_international/screens/Directory/components/AllPartyInfo.dart';
// import 'package:liberal_international/screens/Home/Profile/EditProfile/editProfile.dart';
// import 'package:liberal_international/screens/Home/Profile/viewProfileImage.dart';
// import 'package:provider/provider.dart';
// import 'package:liberal_international/common/util/extension.dart';
// import 'package:liberal_international/screens/Home/ReadPost/allPost.dart';
// import 'package:liberal_international/providers/home_provider.dart';
// import '../feedScreen.dart';
//
// class ProfileSelf extends StatefulWidget {
//   const ProfileSelf({Key? key, required this.userID}) : super(key: key);
//   final String userID;
//
//   @override
//   _ProfileSelfState createState() => _ProfileSelfState();
// }
//
// class _ProfileSelfState extends State<ProfileSelf>
//     with SingleTickerProviderStateMixin {
//   TabController? tabController;
//   UserData? data;
//   bool isFabVisible = false;
//
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       Provider.of<HomeProvider>(context, listen: false)
//           .resetFeeds(context, screenType: ScreenType.specific);
//     });
//     super.initState();
//     data = Provider.of<Authorization>(context, listen: false).userData;
//     tabController = TabController(vsync: this, length: 2);
//     // Provider.of<Authorization>(context, listen: false)
//     //     .getProfile(context, userID: widget.userID);
//
//     Provider.of<HomeProvider>(context, listen: false).feedData(context,
//         screenType: ScreenType.specific, userID: widget.userID);
//     tabController!.addListener(() {
//       if (tabController!.index == 1)
//         setState(() => isFabVisible = true);
//       else
//         setState(() => isFabVisible = false);
//     });
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     tabController!.dispose();
//     // Provider.of<HomeProvider>(context, listen: false).specificList!.clear();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         backgroundColor: bgLightColor,
//         appBar: AppBarMethod.appBarMethod(
//             context: context, appUserID: widget.userID, isBack: true),
//         body: Consumer<Authorization>(
//           builder: (BuildContext context, value, Widget? child) {
//             var profile = value.profileData;
//             if (value.isProfileLoading) {
//               return Container(
//                 child: Center(
//                   child: progressIndicator(),
//                 ),
//               );
//             } else if (value.profileData != null) {
//               return SafeArea(
//                   child: Column(
//                     children: [
//                       Stack(
//                         children: [
//                           Column(
//                             children: [
//                               Container(
//                                 height: 50,
//                                 color: primaryColor,
//                               ),
//                               Container(
//                                 height: 37,
//                               ),
//                             ],
//                           ),
//                           //banner profile pic
//                           Center(
//                             child: Stack(children: [
//                               CircleAvatar(
//                                 radius: 45,
//                                 backgroundColor: bgLightColor,
//                                 child: InkWell(
//                                   onTap: () {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             fullscreenDialog: true,
//                                             builder: (context) => ViewProfileImage(
//                                               url: API.imageUrl(profile!.id),
//                                               appUserID: widget.userID,
//                                             )));
//                                   },
//                                   child: Hero(
//                                     tag: "profile",
//                                     child: CircleAvatar(
//                                       radius: 40,
//                                       child: ClipOval(
//                                         child: CachedNetworkImage(
//                                           cacheKey: profile!.id,
//                                           imageUrl: API.imageUrl(profile.id),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                 right: -10,
//                                 bottom: 2.0,
//                                 child: Container(
//                                   height: 25,
//                                   child: new FloatingActionButton(
//                                     elevation: 2,
//                                     child: const Icon(
//                                       Icons.edit,
//                                       size: 14,
//                                       color: Colors.black,
//                                     ),
//                                     backgroundColor: secondaryColor,
//                                     onPressed: () {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               fullscreenDialog: true,
//                                               builder: (context) {
//                                                 return EditProfile(
//                                                     userID: widget.userID);
//                                               }));
//                                     },
//                                   ),
//                                 ),
//                               ),
//                             ]),
//                           ),
//                         ],
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Text(
//                           profile.name!,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 28,
//                             color: primaryColor,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 25),
//                         child: Text(
//                           profile.designation!,
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: searchTextColor,
//                             fontSize: 17,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 5, top: 5),
//                         child: Container(
//                           margin: EdgeInsets.only(left: 100, right: 100),
//                           color: Colors.grey[300],
//                           height: 1,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 25),
//                         child: Text(
//                           "${profile.country}, ${profile.region}".toTitleCase(),
//                           textAlign: TextAlign.center,
//                           style: TextStyle(fontSize: 13, color: searchHintColor),
//                         ),
//                       ),
//                       // Padding(
//                       //   padding: const EdgeInsets.only(top: 20.0),
//                       //   child: YellowBtn(title: "Edit Profile", press: () {}),
//                       // ),
//                       SizedBox(height: 40),
//                       SizedBox(
//                         height: 48,
//                         child: AppBar(
//                           elevation: 0,
//                           backgroundColor: aboutColor,
//                           bottom: TabBar(
//                             controller: tabController,
//                             indicator: BoxDecoration(
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey.withOpacity(0.5),
//                                   spreadRadius: 2,
//                                   blurRadius: 15,
//                                 ),
//                               ],
//                             ),
//                             tabs: [
//                               Tab(
//                                 icon: Image.asset(
//                                   "assets/images/Group 506@3x.png",
//                                   width: 24,
//                                   height: 24,
//                                   color: primaryColor,
//                                 ),
//                               ),
//                               Tab(
//                                 icon: Image.asset(
//                                   "assets/images/Group 502@3x.png",
//                                   width: 24,
//                                   height: 24,
//                                   color: primaryColor,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: TabBarView(
//                           controller: tabController,
//                           children: [
//                             KeepAlivePage(
//                               key: ValueKey("details"),
//                               child: profileData(profile),
//                             ),
//                             KeepAlivePage(
//                               key: ValueKey("post"),
//                               child: RefreshIndicator(
//                                 color: primaryColor,
//                                 onRefresh: () async {
//                                   Provider.of<HomeProvider>(context, listen: false)
//                                       .resetFeeds(context,
//                                       screenType: ScreenType.specific);
//                                   await Provider.of<HomeProvider>(context,
//                                       listen: false)
//                                       .feedData(context,
//                                       screenType: ScreenType.specific,
//                                       userID: widget.userID);
//                                 },
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 20.0, right: 20, top: 20),
//                                   child: Consumer<HomeProvider>(
//                                     builder: (BuildContext context, value,
//                                         Widget? child) {
//                                       return allFeeds(context,
//                                           value: value,
//                                           appUserID: data,
//                                           screenType: ScreenType.specific);
//                                     },
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Visibility(
//                         visible: isFabVisible,
//                         child: ContactBarYellow(
//                           email: profile.email!,
//                         ),
//                       )
//                     ],
//                   ));
//             } else
//               return SizedBox.shrink();
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget profileData(Profile profile) {
//
//     return RefreshIndicator(
//       color: primaryColor,
//       onRefresh: () async {
//         await Provider.of<Authorization>(context, listen: false)
//             .getProfile(context, userID: widget.userID);
//       },
//       child: Container(
//         margin: EdgeInsets.only(left: 20, right: 20, top: 20),
//         child: Scrollbar(
//           child: ListView(
//             children: [
//               profileHeadingMethod(
//                   title: profile.partyCategory == 1
//                       ? "Party"
//                       : (profile.partyCategory == 2
//                       ? "Organization"
//                       : "ThinkTank")),
//               GestureDetector(
//                 onTap: () {
//                   var provider =
//                   Provider.of<DirectoryProvider>(context, listen: false)
//                       .directoryData!
//                       .data!;
//                   Party party;
//                   if (profile.partyCategory == 1) {
//                     party = provider.party!.singleWhere((element) =>
//                     element.id!.trim() == profile.partyId!.trim());
//                   } else if (profile.partyCategory == 2)
//                     party = provider.organization!.singleWhere((element) =>
//                     element.id!.trim() == profile.partyId!.trim());
//                   else
//                     party = provider.thinktank!.singleWhere((element) =>
//                     element.id!.trim() == profile.partyId!.trim());
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (_) => AllPartyInfo(
//                               party: party, users: provider.users!,img:API.postImageBaseUrl(profile.partyImage) ?? API.dummyAvatar)));
//                 },
//                 child: PartyContainer(
//                   imgSrc: profile.partyImage,
//                   name: profile.party,
//                 ),
//               ),
//               SizedBox(height: 40),
//               profileHeadingMethod(
//                 title: "Badge",
//               ),
//               Container(
//                 height: 120,
//                 child: ListView.builder(
//                   itemBuilder: (context, index) {
//                     return Container(
//                       color: Colors.white,
//                       width: 110,
//                       margin: EdgeInsets.only(right: 10),
//                       padding: EdgeInsets.all(5),
//                       child: InkWell(
//                         onTap: () {
//                           List<ValidHub> hubs =
//                           Provider.of<HubsProvider>(context, listen: false)
//                               .myGroups!
//                               .where((element) =>
//                           element.id.toString().trim() ==
//                               profile.badge![index].id
//                                   .toString()
//                                   .trim())
//                               .toList();
//                           Navigator.of(context, rootNavigator: true).push(
//                             MaterialPageRoute(
//                                 fullscreenDialog: true,
//                                 builder: (context) {
//                                   return FeedsScreen(
//                                     screenType: ScreenType.hub,
//                                     hub: hubs.first,
//                                   );
//                                 }),
//                           );
//                         },
//                         child: Column(
//                           children: [
//                             CachedNetworkImage(
//                               imageUrl: API.postImageBaseUrl(profile.badge![index].logo!),
//                               height: 90,
//                               width: 90,
//                             ),
//                             Text(
//                               profile.badge![index].abbreviation!.isNotEmpty
//                                   ? profile.badge![index].abbreviation!
//                                   : profile.badge![index].name!,
//                               style: TextStyle(
//                                 fontSize: 13,
//                                 color: searchTextColor,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                   itemCount: profile.badge!.length,
//                   scrollDirection: Axis.horizontal,
//                 ),
//               ),
//               SizedBox(height: 40),
//               profileHeadingMethod(
//                 title: "Expertise",
//               ),
//               Container(
//                 height: 40,
//                 child: ListView.builder(
//                   itemBuilder: (context, index) {
//                     return Container(
//                       margin: EdgeInsets.only(right: 10),
//                       child:
//                       PartyContainer(name: profile.expertise![index].area),
//                     );
//                   },
//                   itemCount: profile.expertise!.length,
//                   scrollDirection: Axis.horizontal,
//                 ),
//               ),
//               SizedBox(height: 40),
//               profileHeadingMethod(
//                 title: "Bio",
//               ),
//               Text(
//                 profile.bio ?? '',
//                 style: TextStyle(
//                   color: searchTextColor,
//                   fontSize: 12,
//                   height: 1.5,
//                 ),
//               ),
//               SizedBox(height: 22),
//               Row(
//                 children: [
//                   IconTile().iconMethod(
//                       img: "assets/images/Group 460@3x.png",
//                       url: "https://twitter.com/${profile.twitter}"),
//                   SizedBox(width: 20),
//                   IconTile().iconMethod(
//                       img: "assets/images/Group 462@3x.png",
//                       url: profile.facebook),
//                   SizedBox(width: 20),
//                   IconTile().iconMethod(
//                       img: "assets/images/Group 463@3x.png",
//                       url: "https://instagram.com/${profile.instagram}"),
//                   SizedBox(width: 20),
//                   IconTile().iconMethod(
//                       img: "assets/images/Group 468@3x.png",
//                       url: profile.linkedin),
//                 ],
//               ),
//               SizedBox(height: 40),
//               Center(
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     elevation: 0,
//                     primary: secondaryColor,
//                     shadowColor: Colors.transparent,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(0),
//                     ),
//                     minimumSize: Size(
//                       100,
//                       40,
//                     ),
//                   ),
//                   onPressed: () {
//                     showAlertDialog(
//                       context,
//                       title: "Confirm sign out",
//                       content: "Are you sure you want to sign out?",
//                       defaultActionText: "Sign out",
//                       cancelActionText: "Cancel",
//                     ).then((value) async {
//                       if (value) {
//                         await Provider.of<Authorization>(context, listen: false)
//                             .logOut(context);
//                         Navigation.moveToLandingScreenAndRemoveAllTheRoutes(context);
//                         CustomToast.showToast(context, title: "Sign out successfully",isError: false);
//
//                       }
//                     });
//                   },
//                   child: Text(
//                     "Sign Out".toUpperCase(),
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: primaryColor,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20,),
//               Center(
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     elevation: 0,
//                     primary: partyNameColor,
//                     shadowColor: Colors.transparent,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(0),
//                     ),
//                     minimumSize: Size(
//                       100,
//                       40,
//                     ),
//                   ),
//                   onPressed: () {
//                     showAlertDialog(
//                       context,
//                       title: "Confirm Delete",
//                       content: "Are you sure you want to Delete?",
//                       defaultActionText: "Delete",
//                       cancelActionText: "Cancel",
//                     ).then((value) async {
//                       if (value) {
//                         Dio _dio = Dio();
//                         final accessToken = await Provider.of<Authorization>(context, listen: false).getAccessToken(context);
//                         var response = await _dio.post(
//                           API.deleteProfile(widget.userID),
//                           options: Options(
//                             headers: {
//                               "Authorization": "Bearer $accessToken"
//                             },
//                           ),
//                         );
//                         Navigation.signinscreen(context);
//                         CustomToast.showToast(context, title: "Account Delete successfully",isError: true);
//
//                       }
//                     });
//                   },
//                   child: Text(
//                     "Delete Account".toUpperCase(),
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: bgLightColor,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 22),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Padding profileHeadingMethod({
//     required String title,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10),
//       child: Text(
//         title,
//         style: TextStyle(
//           fontSize: 17,
//           color: primaryColor,
//           fontWeight: FontWeight.bold,
//           letterSpacing: 0.08,
//         ),
//       ),
//     );
//   }
// }