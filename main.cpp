#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include "CursorArea.h"
#include "WheelArea.h"
#include <QDeclarativeContext>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<CursorArea>("CursorArea", 0, 1, "CursorArea");
    qmlRegisterType<WheelArea>("WheelArea", 0, 1, "WheelArea");

    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::Auto);
    viewer.setMainQmlFile(QLatin1String("qml/QMLbox/main.qml"));
    viewer.show();

    return app.exec();
}
