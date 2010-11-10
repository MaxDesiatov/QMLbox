#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include "CursorArea.h"
#include <QDeclarativeContext>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<CursorArea>("CursorArea", 1, 0, "CursorArea");

    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::Auto);
    viewer.setMainQmlFile(QLatin1String("qml/QMLTest/main.qml"));
    viewer.show();

    return app.exec();
}
