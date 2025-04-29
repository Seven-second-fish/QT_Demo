#ifndef MUSICPLAYER_H
#define MUSICPLAYER_H

#include <QAbstractListModel>

class MusicPlayer : public QObject
{
public:
    // MusicPlayer();
    explicit MusicPlayer(QObject *parent = nullptr);
};

#endif // MUSICPLAYER_H
