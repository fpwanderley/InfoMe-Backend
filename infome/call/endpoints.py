# -*- coding: utf-8 -*-
"""Call Endpoints."""

from rest_framework import permissions, viewsets, status

from infome.models import Call
from infome.call.serializers import CallSerializer


class CallViewSet(viewsets.ModelViewSet):
    """
    A simple ViewSet for viewing creating and editing Calls.

    Filter fields such as default, name and group are available for search.
    """

    permission_classes = (permissions.AllowAny,)

    queryset = Call.objects.all()
    serializer_class = CallSerializer
