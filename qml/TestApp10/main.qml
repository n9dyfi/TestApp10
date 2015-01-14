import QtQuick 1.1
import com.nokia.meego 1.0

PageStackWindow {
    id: appWindow

    platformStyle: defaultStyle;

    PageStackWindowStyle {
        id: defaultStyle;
        background: "portraitBg.jpg"
        landscapeBackground: "landscapeBg.jpg"
    }

    initialPage: mainPage

    MainPage {
        id: mainPage
     }

    Component.onCompleted: {
        // Use the dark theme.
        theme.inverted = true;
    }
}
