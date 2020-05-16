import 'package:flutter/material.dart';
import 'palette.dart';

class Themes {

  static final ThemeData lightTheme = ThemeData(
    //fontFamily: 'Lato',
    brightness: Brightness.light,
    accentColor: PaletteBittube.primary,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: PaletteBittube.light,
    hintColor: Palette.lightBlue,
    focusColor: Palette.lightGrey, // focused and enabled border color for text fields
    primaryTextTheme: TextTheme(
      title: TextStyle(
        color: PaletteBittube.dark,
      ),
      caption: TextStyle(
        color: PaletteBittube.dark,
      ),
      button: TextStyle(
        color: Colors.white,
        backgroundColor: PaletteBittube.primary, // button primary background color
        decorationColor: PaletteBittube.primary // button primary color
      ),
      headline: TextStyle(
        color: PaletteBittube.dark, // account list tile, contact page
      ),
      subtitle: TextStyle(
        color: Palette.wildDarkBlue // filters
      ),
      subhead: TextStyle(
        color: PaletteBittube.dark, // transaction raw, trade raw
      ),
      overline: TextStyle(
        color: PaletteDark.darkThemeCloseButton // standart list row, transaction details
      )
    ),
    toggleButtonsTheme: ToggleButtonsThemeData(
      selectedColor: Palette.cakeGreen,
      disabledColor: Palette.wildDarkBlue,
      color: Palette.switchBackground,
      borderColor: Palette.switchBorder
    ),
    selectedRowColor: PaletteBittube.primary,
    dividerColor: Palette.lightGrey,
    dividerTheme: DividerThemeData(
      color: Palette.lightGrey
    ),
    accentTextTheme: TextTheme(
      title: TextStyle(
        color: Colors.grey,
        backgroundColor: Palette.creamyGrey // pin button color
      ),
      caption: TextStyle(
        color: Palette.wildDarkBlue, // clear button color, exchange page
        backgroundColor: PaletteBittube.primary, // button blue background color
        decorationColor: PaletteBittube.primary // button blue border color
      ),
      button: TextStyle(
        backgroundColor: PaletteBittube.primary, // button indigo background color
        decorationColor: PaletteBittube.primary // button indigo border color
      ),
      subtitle: TextStyle(
        color: PaletteBittube.dark,
        backgroundColor: Palette.lightLavender // send page border color
      ),
      headline: TextStyle(
        color: Palette.lightGrey2, // receive page
        backgroundColor: Colors.white, // restore button background color
        decorationColor: Palette.darkGrey, // restore button border color
      ),
      subhead: TextStyle(
        color: Palette.lightBlue, // restore button description
        backgroundColor: Palette.lightGrey2 // change language background color
      ),
      overline: TextStyle(
        color: Palette.nightBlue, // send page text
        backgroundColor: Palette.nightBlue, // send page text
        decorationColor: Palette.manatee // send page text
      )
    ),
    cardColor: Palette.lavender,
    cardTheme: CardTheme(
      color: Palette.cadetBlue
    ),
    buttonColor: Palette.darkGrey,
    primaryIconTheme: IconThemeData(
      color: Colors.white
    ),
    accentIconTheme: IconThemeData(
      color: Colors.white
    )
  );


  static final ThemeData darkTheme = ThemeData(
    //fontFamily: 'Lato',
    brightness: Brightness.dark,
    accentColor: PaletteBittube.primary,
    backgroundColor: PaletteBittube.dark,
    scaffoldBackgroundColor: PaletteDark.darkThemeBlack,
    hintColor: PaletteDark.darkThemeGrey,
    focusColor: PaletteDark.darkThemeGreyWithOpacity, // focused and enabled border color for text fields
    primaryTextTheme: TextTheme(
      title: TextStyle(
        color: PaletteDark.darkThemeTitle
      ),
      caption: TextStyle(
        color: Colors.white
      ),
      button: TextStyle(
        color: Colors.white,
        backgroundColor: PaletteBittube.primary, // button purple background color
        decorationColor: PaletteBittube.primary,// button pink border color
      ),
      headline: TextStyle(
        color: PaletteBittube.light, // account list tile, contact page
      ),
      subtitle: TextStyle(
        color: PaletteDark.darkThemeGrey // filters
      ),
      subhead: TextStyle(
        color: Palette.blueGrey // transaction raw, trade raw
      ),
      overline: TextStyle(
        color: PaletteDark.darkThemeGrey // standart list row, transaction details
      )
    ),
    toggleButtonsTheme: ToggleButtonsThemeData(
      selectedColor: Palette.cakeGreen,
      disabledColor: Palette.wildDarkBlue,
      color: PaletteDark.switchBackground,
      borderColor: PaletteDark.darkThemeMidGrey
    ),
    selectedRowColor: PaletteBittube.primary,
    dividerColor: PaletteDark.darkThemeDarkGrey,
    dividerTheme: DividerThemeData(
      color: PaletteDark.darkThemeGreyWithOpacity
    ),
    accentTextTheme: TextTheme(
      title: TextStyle(
        color: PaletteDark.darkThemeTitle,
        backgroundColor: PaletteDark.darkThemePinDigitButton // pin button color
      ),
      caption: TextStyle(
        color: Colors.white, // clear button color, exchange page
        backgroundColor: PaletteBittube.primary, // button blue background color
        decorationColor: PaletteBittube.primary,// button blue border color
      ),
      button: TextStyle(
        backgroundColor: PaletteBittube.primary, // button indigo background color
        decorationColor: PaletteBittube.primary // button indigo border color
      ),
      subtitle: TextStyle(
        color: PaletteDark.wildDarkBlueWithOpacity,
        backgroundColor: PaletteDark.darkThemeDarkGrey // send page border color
      ),
      headline: TextStyle(
        color: PaletteDark.darkThemeBlack, // receive page
        backgroundColor: PaletteDark.darkThemeMidGrey, // restore button background color
        decorationColor: PaletteDark.darkThemeDarkGrey, // restore button border color
      ),
      subhead: TextStyle(
        color: Palette.wildDarkBlue, // restore button description
        backgroundColor: PaletteDark.darkThemeMidGrey // change language background color
      ),
      overline: TextStyle(
        color: PaletteDark.darkThemeTitle, // send page text
        backgroundColor: PaletteDark.darkThemeGrey, // send page text
        decorationColor: PaletteDark.darkThemeTitle // send page text
      )
    ),
    cardColor: PaletteDark.darkThemeMidGrey,
    cardTheme: CardTheme(
      color: PaletteDark.darkThemeGrey
    ),
    buttonColor: PaletteDark.darkThemePinButton,
    primaryIconTheme: IconThemeData(
      color: PaletteDark.darkThemeViolet
    ),
    accentIconTheme: IconThemeData(
      color: PaletteDark.darkThemeIndigoButtonBorder
    )
  );

}