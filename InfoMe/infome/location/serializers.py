# -*- coding: utf-8 -*-

from rest_framework import serializers

from infome.models import Location


class LocationSerializer(serializers.ModelSerializer):

    class Meta:
        model = Location
        fields = ('id', 'latitude', 'longitude')
