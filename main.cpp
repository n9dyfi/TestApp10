#include <QtGui/QApplication>
#include <QtDeclarative/QDeclarativeContext>
#include "qmlapplicationviewer.h"
#include "mytimer.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));
    MyTimer *mytimer;

    QmlApplicationViewer viewer;

    mytimer = new MyTimer;
    viewer.rootContext()->setContextProperty("mytimer",mytimer);

    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/TestApp10/main.qml"));
    viewer.showExpanded();

    mytimer->set(0,0);  //display the value
    return app->exec();
}
