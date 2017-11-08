# -*- coding: utf-8 -*-

from rest_framework import routers

from infome.hand.endpoints import HandViewSet


hand_router = routers.SimpleRouter(trailing_slash=False)
hand_router.register(r'hands', HandViewSet)
