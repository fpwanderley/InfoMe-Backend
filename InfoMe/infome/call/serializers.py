# -*- coding: utf-8 -*-

from rest_framework import serializers
from django.db import transaction

from infome.models import Call, Location
from infome.location.serializers import LocationSerializer


class CallSerializer(serializers.ModelSerializer):
    location = LocationSerializer(many=False)

    class Meta:
        model = Call
        fields = ('id', 'description', 'location')

    @transaction.atomic
    def create(self, validated_data):

        # Create Location.
        location_data = validated_data.pop('location')
        location = Location.objects.create(**location_data)

        call = Call.objects.create(**validated_data)
        call.location = location
        call.save()

        return call

    # @transaction.atomic
    def update(self, instance, validated_data):
        # Create Location.
        location_data = validated_data.pop('location')
        location = Location.objects.update(**location_data)
        import pdb;
        pdb.set_trace()

        call = Call.objects.create(**validated_data)
        call.location = location
        call.save()

        return call

