#ifndef MYTIMER_H
#define MYTIMER_H

#include <QObject>
#include <QTimer>
#include <QString>

class MyTimer : public QObject
{
    Q_OBJECT
public:
    MyTimer();

signals:
    void valueChanged(QString minAndSec);
    void timerMessage(QString myMessage);

public slots:
    void set(int min,int sec);
    void start();
    void stop();
    void reset();
    void decrement();

private:
    int min, sec;
    QTimer *timer;
    static const int ONE_SECOND = 1000;
};

#endif // MYTIMER_H
