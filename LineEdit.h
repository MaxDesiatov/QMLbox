#ifndef LINEEDIT_H
#define LINEEDIT_H

#include <QGraphicsProxyWidget>
#include <QLineEdit>

class LineEdit : public QGraphicsProxyWidget
{
    Q_OBJECT
    Q_PROPERTY(QString text READ text WRITE setText NOTIFY textChanged)
public:
    LineEdit(QGraphicsItem* parent = 0)
        : QGraphicsProxyWidget(parent)
    {
        widget.setAttribute(Qt::WA_NoSystemBackground);
        setWidget(&widget);
    }

    QString text() const
    {
        return widget.text();
    }

    void setText(const QString& text)
    {
        if (text != widget.text()) {
            widget.setText(text);
            emit textChanged();
        }
    }

signals:
    void textChanged();

private:
    QLineEdit widget;
};

#endif // LINEEDIT_H
