#include "CursorArea.h"
#include <QApplication>

CursorArea::CursorArea(QDeclarativeItem *parent) :
    QDeclarativeItem(parent)
{
    setAcceptHoverEvents(true);
}

int CursorArea::cursor() const {
    return m_cursor.shape();
}

void CursorArea::setCursor(const int &cursor) {
    m_cursor.setShape((Qt::CursorShape) cursor);
}

void CursorArea::hoverEnterEvent (QGraphicsSceneHoverEvent * /*event*/) {
    qApp->setOverrideCursor(m_cursor);
}

void CursorArea::hoverLeaveEvent(QGraphicsSceneHoverEvent * /*event*/) {
    qApp->restoreOverrideCursor();
}
