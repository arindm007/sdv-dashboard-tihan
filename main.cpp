#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtWebView/QtWebView>


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_UseOpenGLES);
    QGuiApplication app(argc, argv);

    QtWebView::initialize();  // <== Required for WebView

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/Tesla/Main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
