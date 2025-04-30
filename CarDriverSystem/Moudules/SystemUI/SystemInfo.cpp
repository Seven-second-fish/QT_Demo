#include <QObject>

class SystemInfo : public QObject {
    Q_OBJECT
public:
    SystemInfo() {}

    Q_INVOKABLE QString getSystemInfo() {
        return "System is running smoothly!";
    }
};

