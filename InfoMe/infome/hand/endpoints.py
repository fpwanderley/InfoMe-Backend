# -*- coding: utf-8 -*-
"""Call Endpoints."""

from rest_framework import permissions, viewsets, status

from infome.models import Hand
from infome.hand.serializers import HandSerializer


class HandViewSet(viewsets.ModelViewSet):
    """
    A simple ViewSet for viewing creating and editing Hands.

    Filter fields such as default, name and group are available for search.
    """

    permission_classes = (permissions.AllowAny,)

    queryset = Hand.objects.all()
    serializer_class = HandSerializer
