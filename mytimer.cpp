#include "mytimer.h"

MyTimer::MyTimer()
{
    min = -1;
    sec = -1;
    timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()), this, SLOT(decrement()));
}

void MyTimer::set(int m, int s)
{
    QString timeStr;
    if ((m==min) && (s==sec))
        return;

    min = m;
    sec = s;
    timeStr.sprintf("%02d:%02d",min,sec);
    emit valueChanged(timeStr);
}

void MyTimer::start()
{
    timer->start(ONE_SECOND);
    emit timerMessage("Timer started");
}

void MyTimer::stop()
{
    timer->stop();
    emit timerMessage("Timer stopped");
}

void MyTimer::reset()
{
    stop();
    set(0,0);
}

void MyTimer::decrement()
{
    int m=min;
    int s=sec;

    if (m==0&&s==0) {
        stop();
        return;
    }

    s--;

    if (m==0&&s==0) {
        stop();
    } else if (s==-1){
        m--;
        s=59;
    }

    set(m,s);

}
