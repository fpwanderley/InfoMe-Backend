# -*- coding: utf-8 -*-

import random

from infome.models import *

CALL_DESCRIPTIONS = [
    u'Preciso de um Eletricista',
    u'Preciso de um Encanador',
    u'Preciso de um bolo',
    u'Preciso de uma dedada',
    u'Preciso de um Tecnico em Informatica',
]

print ('Creating Test DB.')

for description in CALL_DESCRIPTIONS:

    new_location = Location.objects.create(latitude=random.uniform(1,2),
                                           longitude=random.uniform(1,2))
    Call.objects.create(description=description,
                        location=new_location)
