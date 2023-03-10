import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ViewModel/Providers/provider_theme.dart';
import '../../ViewModel/size_vm.dart';

enum DialogType { cubertino, normal }

enum PopTheme { light, dark }

class ActionsTeam {
  final String text;
  final Function? func;
  final bool isPopEnable;
  ActionsTeam({this.text = "", this.func, this.isPopEnable = true});
}

class PopUpWidget {
  final bool centerTitle;
  final Color bgColor;
  final bool isPopEnable;
  final String title;
  final Color textColor;
  final PopTheme theme;
  final Widget content;
  final List<ActionsTeam>? actionsTeam;
  PopUpWidget(
      {this.centerTitle = false,
      this.textColor = Colors.white,
      this.bgColor = Colors.grey,
      this.theme = PopTheme.dark,
      this.isPopEnable = true,
      this.actionsTeam,
      required this.content,
      this.title = "PopUp Title"});

  popUpCupertino(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return ShowingDialog(
          textColor: textColor,
          theme: theme,
          type: DialogType.cubertino,
          title: title,
          actionsTeam: actionsTeam,
          content: content,
          isPopEnable: isPopEnable,
        );
      },
    );
  }

    popUpAutoSize(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return ShowingDialog(
          textColor: textColor,
          theme: theme,
          type: DialogType.cubertino,
          title: title,
          actionsTeam: actionsTeam,
          content: content,
          isPopEnable: isPopEnable,
        );
      },
    );
  }
}

class ShowingDialog extends StatefulWidget {
  final bool centerTitle;
  final Color bgColor;
  final Color textColor;
  final DialogType type;
  final bool isPopEnable;
  final PopTheme theme;
  final String title;
  final Widget content;
  final List<ActionsTeam>? actionsTeam;
  const ShowingDialog(
      {super.key,
      this.centerTitle = true,
      this.textColor = Colors.white,
      this.bgColor = Colors.grey,
      this.type = DialogType.normal,
      this.isPopEnable = true,
      this.actionsTeam,
      required this.content,
      this.title = "",
      this.theme = PopTheme.dark});

  @override
  State<ShowingDialog> createState() => _ShowingDialogState();
}

class _ShowingDialogState extends State<ShowingDialog> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data:
          widget.theme == PopTheme.light ? ThemeData.light() : ThemeData.dark(),
      child: widget.type == DialogType.cubertino
          ? CupertinoAlertDialog(
              actions: widget.actionsTeam != null
                  ? widget.actionsTeam!
                      .map(
                        (e) => TextButton(
                            onPressed: () {
                              setState(() {
                                if (e.func != null) {
                                  e.func!();
                                }
                                if (widget.isPopEnable && e.isPopEnable) {
                                  Navigator.pop(context);
                                }
                              });
                            },
                            child: Text(
                              e.text,
                              style: TextStyle(
                                  color:
                                      widget.textColor /*Color(0xff42069A)*/),
                            )),
                      )
                      .toList()
                  : [],
              title: Text(
                widget.title,
                style: TextStyle(
                    fontSize: MySize.arentir * 0.05, color: widget.textColor),
              ),
              content: Card(
                shadowColor: Colors.transparent,
                color: Colors.transparent,
                child: SingleChildScrollView(
                  child: Column(
                    children: [widget.content],
                  ),
                ),
              ),
            )
          : widget.type == DialogType.normal
              ? AlertDialog(
                  title: Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: MySize.arentir * 0.05,
                        color: widget.textColor),
                    textAlign:
                        widget.centerTitle == true ? TextAlign.center : null,
                  ),
                  backgroundColor: widget.bgColor,
                  actions: widget.actionsTeam != null
                      ? widget.actionsTeam
                          ?.map(
                            (e) => TextButton(
                                onPressed: () {
                                  setState(() {
                                    if (e.func != null) {
                                      e.func!();
                                    }
                                    if (widget.isPopEnable && e.isPopEnable) {
                                      Navigator.pop(context);
                                    }
                                  });
                                },
                                child: Text(
                                  e.text,
                                  style: TextStyle(
                                      color: DistributorTheme(context).colors.appBarIcon /*Color(0xff42069A)*/),
                                )),
                          )
                          .toList()
                      : [],
                  content: Card(
                    shadowColor: Colors.transparent,
                    color: Colors.transparent,
                    child: SingleChildScrollView(
                      physics:const BouncingScrollPhysics(),
                      child: Column(
                        children: [widget.content],
                      ),
                    ),
                  ),
                )
              : Container(),
    );
  }
}


