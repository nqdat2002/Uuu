import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuu/src/commonWidget/customWidget.dart';
import 'package:uuu/src/theme/bloc/bloc.dart';
import 'package:uuu/src/theme/theme.dart';
import 'package:uuu/src/models/user.dart';
import '../authentication/bloc/authenticationBloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  late User user;
  Widget _headerWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: <Widget>[
          SizedBox(height: 30),
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: customAdvanceNetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png?20200919003010'),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Builder(
                    builder: (context) {
                      final userId = context.select(
                            (AuthenticationBloc bloc) => bloc.state.user.email,
                      );
                      var displayName = userId.substring(0, 4);
                      return Text('UserName: $displayName', style: AppTheme.h2Style
                          .copyWith(fontWeight: FontWeight.bold));
                    },
                  ),
                  // Text('The Alphamerc',
                  //     style: AppTheme.h2Style
                  //         .copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Text('The Reader', style: AppTheme.h5Style),
                ],
              )
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: <Widget>[
              _estimateWidget('Followers', '826'),
              _estimateWidget('Following', '251'),
              _estimateWidget('News Read', '81K'),
            ],
          ),
          SizedBox(height: 30),
          Divider()
        ],
      ),
    );
  }

  Widget _estimateWidget(String text, String count) {
    return Expanded(
      child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(count,
                  style: AppTheme.h4Style.copyWith(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(text, style: AppTheme.h5Style),
            ],
          )),
    );
  }

  Widget _settingRow(
      BuildContext context, IconData icon1, String text, bool isEnable,
      {Color color = Colors.black, int index = 0}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: isEnable
          ? Theme.of(context).primaryColor.withAlpha(100)
          : Theme.of(context).colorScheme.background,
      child: Row(
        children: <Widget>[
          Icon(
            icon1,
          ),
          const SizedBox(width: 10),
          Text(text,
              style: AppTheme.h4Style.copyWith(
                fontWeight: FontWeight.bold,
              )),
          const Expanded(child: SizedBox()),
          isEnable == null
              ? Container()
              : Switch(
            activeColor: Theme.of(context).primaryColor,
            inactiveTrackColor: Theme.of(context).disabledColor,
            onChanged: (value) {
              if (index == 1) {
                BlocProvider.of<ThemeBloc>(context)
                    .add(isEnable ? DarkMode() : LightMode());
              }
            },
            value: isEnable,
          )
        ],
      ),
    );
  }

  Widget _logout(BuildContext context, IconData icon1, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: <Widget>[
          Icon(
            icon1,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(width: 10),
          GestureDetector(
            child: Text(text, style: AppTheme.h3Style.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.error)),
            onTap: () {
              context
                  .read<AuthenticationBloc>()
                  .add(AuthenticationLogoutRequested());
            },
          ),
          // Text(text,
          //     style: AppTheme.h3Style.copyWith(
          //         fontWeight: FontWeight.bold,
          //         color: Theme.of(context).colorScheme.error)),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            bool val = false;
            if (state is SelectedTheme) {
              val = state.themeType == ThemeType.Light ? true : false;
            }
            return SafeArea(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: _headerWidget(context),
                  ),
                  SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _settingRow(
                                context, Icons.lightbulb_outline, 'Night', val,
                                index: 1),
                            _settingRow(context, Icons.notifications,
                                'Notification', false),
                            // SizedBox(height: 10),
                            _settingRow(
                                context, Icons.share, 'Social Media', false),
                            SizedBox(height: 5),
                            Divider(
                              indent: 20,
                              endIndent: 20,
                              height: 0,
                            ),
                            SizedBox(height: 5),
                            _logout(context, Icons.exit_to_app, 'Logout'),
                          ],
                        ),
                      ))
                ],
              ),
            );
          },
        ));
  }
}