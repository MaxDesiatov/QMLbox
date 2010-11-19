#include <QtGui/QApplication>
#include <QDeclarativeContext>
#include "qmlapplicationviewer.h"
#include "CursorArea.h"
#include "WheelArea.h"
#include "PushButton.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<CursorArea>("CursorArea", 0, 1, "CursorArea");
    qmlRegisterType<WheelArea>("WheelArea", 0, 1, "WheelArea");
    qmlRegisterType<PushButton>("PushButton", 0, 1, "PushButton");

    QmlApplicationViewer viewer;
    viewer.setMainQmlFile(QLatin1String("qml/QMLbox/main.qml"));
    viewer.show();

    return app.exec();
}
