#ifndef CURSORAREA_H
#define CURSORAREA_H

#include <QDeclarativeItem>

class CursorArea : public QDeclarativeItem
{
    Q_OBJECT
    Q_PROPERTY(int cursor READ cursor WRITE setCursor)
public:
    explicit CursorArea(QDeclarativeItem *parent = 0);
    int cursor() const;
    void setCursor(const int &cursor);
protected:
    void hoverEnterEvent(QGraphicsSceneHoverEvent *event);
    void hoverLeaveEvent(QGraphicsSceneHoverEvent *event);
private:
    QCursor m_cursor;
};

#endif // CURSORAREA_H
