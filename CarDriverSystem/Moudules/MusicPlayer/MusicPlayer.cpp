#include <QObject>

class MusicPlayer : public QObject {
    Q_OBJECT
public:
    MusicPlayer() {}

    Q_INVOKABLE void play() {
        // 播放音乐的逻辑
    }

    Q_INVOKABLE void pause() {
        // 暂停音乐的逻辑
    }
};

