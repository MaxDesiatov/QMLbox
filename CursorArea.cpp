#include "CursorArea.h"

CursorArea::CursorArea(QDeclarativeItem *parent) :
    QDeclarativeItem(parent)
{
}

int CursorArea::cursor() const {
    return m_cursor.shape();
}

void CursorArea::setCursor(const int &cursor) {
    m_cursor.setShape((Qt::CursorShape) cursor);
    QGraphicsItem::setCursor(m_cursor);
    emit cursorChanged();
}
