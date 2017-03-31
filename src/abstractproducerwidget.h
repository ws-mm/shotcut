﻿/*
 * Copyright (c) 2012-2017 Meltytech, LLC
 * Author: Dan Dennedy <dan@dennedy.org>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef ABSTRACTPRODUCERWIDGET_H
#define ABSTRACTPRODUCERWIDGET_H

#include <mlt++/MltProducer.h>
#include <QScopedPointer>

class AbstractProducerWidget
{
public:
    AbstractProducerWidget();
    virtual ~AbstractProducerWidget();
    virtual Mlt::Producer* newProducer(Mlt::Profile&) = 0;
    virtual void setProducer(Mlt::Producer*);
    virtual Mlt::Properties* getPreset() const
        { return new Mlt::Properties; }
    virtual void loadPreset(Mlt::Properties&) {}
    Mlt::Producer* producer() const { return m_producer.data(); }

protected:
    QScopedPointer<Mlt::Producer> m_producer;
};

#endif // ABSTRACTPRODUCERWIDGET_H
