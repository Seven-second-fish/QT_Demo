#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <musicplayer.h>

static QObject* musicPlayer_singletontype_provider(QQmlEngine*, QJSEngine*) {
    return new MusicPlayer();
}

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    qmlRegisterSingletonType<MusicPlayer>("com.MusicPlayer", 1, 0, "MusicPlayer", musicPlayer_singletontype_provider);

    QQmlApplicationEngine engine;

    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
                         if (!obj && url == objUrl)
                             QCoreApplication::exit(-1);
                     }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
