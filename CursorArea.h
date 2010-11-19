#ifndef CURSORAREA_H
#define CURSORAREA_H

#include <QDeclarativeItem>

class CursorArea : public QDeclarativeItem
{
    Q_OBJECT
    Q_PROPERTY(int cursor READ cursor WRITE setCursor NOTIFY cursorChanged)

public:
    explicit CursorArea(QDeclarativeItem *parent = 0) : QDeclarativeItem(parent) {}

    int cursor() const
    {
        return m_cursor.shape();
    }

    void setCursor(const int &cursor)
    {
        m_cursor.setShape((Qt::CursorShape) cursor);
        QGraphicsItem::setCursor(m_cursor);
        emit cursorChanged();
    }

signals:
    void cursorChanged();
private:
    QCursor m_cursor;
};

#endif // CURSORAREA_H
