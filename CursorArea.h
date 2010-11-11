#ifndef CURSORAREA_H
#define CURSORAREA_H

#include <QDeclarativeItem>

class CursorArea : public QDeclarativeItem
{
    Q_OBJECT
    Q_PROPERTY(int cursor READ cursor WRITE setCursor NOTIFY cursorChanged)
public:
    explicit CursorArea(QDeclarativeItem *parent = 0);
    int cursor() const;
    void setCursor(const int &cursor);
signals:
    void cursorChanged();
private:
    QCursor m_cursor;
};

#endif // CURSORAREA_H
