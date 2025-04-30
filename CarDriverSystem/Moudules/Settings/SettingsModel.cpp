#include <QObject>

class SettingsModel : public QObject {
    Q_OBJECT
public:
    SettingsModel() {}

    Q_INVOKABLE QString getCurrentSetting() {
        return "Volume: 50%";
    }
};

