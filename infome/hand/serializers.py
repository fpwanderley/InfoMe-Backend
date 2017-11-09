# -*- coding: utf-8 -*-

from rest_framework import serializers

from infome.models import Hand


class HandSerializer(serializers.ModelSerializer):

    call = serializers.PrimaryKeyRelatedField(many=True, read_only=True)

    class Meta:
        model = Hand
        fields = ('id', 'call')

