# -*- coding: utf-8 -*-

from rest_framework import routers

from infome.call.endpoints import CallViewSet


call_router = routers.SimpleRouter(trailing_slash=False)
call_router.register(r'calls', CallViewSet)
